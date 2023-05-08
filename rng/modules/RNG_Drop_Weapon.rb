#==============================================================================
#
# ⌠ 
# │ Module:.... RNG_Drop_Weapon
# │ Author:.... MusicInTheTrees
# │ Created:... 28 April 2023
# │ Version:... 1.0
# ⌡
#
# -- Description
#  This class returns an arbitrary weapon given a few parameters.
#  These parameters are very specific to how the user places the weapons
#  in the database.
#==============================================================================

class RNG_Drop_Weapon
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :wpnDbInitIdx
  
  #--------------------------------------------------------------------------
  # * Constants
  #--------------------------------------------------------------------------
  IDX_ATK = 2
  
  #--------------------------------------------------------------------------
  # * Methods
  #--------------------------------------------------------------------------
  def initialize(wpnDbInitIdx = 0, wpnTypeCount = 1)
    
    @rng_weapon_atk   = RNG_Expo_Step.new
    @rng_weapon_asc   = RNG_Expo_Step.new
    @weapon_generator = RNG_Generate_Weapon.new
    
    # init 'wpnDbInitIdx'
    if wpnDbInitIdx == nil
      @wpnDbInitIdx = 0
      err("wpnDbInitIdx parameter was nil")
    else
      @wpnDbInitIdx = wpnDbInitIdx
    end
    
    # init 'wpnTypeCount'
    if wpnTypeCount == nil || wpnTypeCount < 0
      @wpnTypeCount = 0
      err("wpnTypeCount parameter was nil OR 0")
    else
      @wpnTypeCount = wpnTypeCount
    end
    
    # update RNG parameters - up to, but not including count
    @rng_weapon_atk.rngStepLimit = wpnTypeCount-1
    @rng_weapon_asc.rngStepLimit = wpnTypeCount-1
  end
  
  def m_wpnTypeCount
    @m_wpnTypeCount
  end
  
  def wpnTypeCount=(value)
    @wpnTypeCount = value
    # update RNG parameters - up to, but not including count
    @rng_weapon_atk.rngStepLimit = @wpnTypeCount-1
    @rng_weapon_asc.rngStepLimit = @wpnTypeCount-1
  end
  
  def get_weapon_version(startAscension = 0)
    # Get a version of a groupd of certain weapon types
    ascension = @rng_weapon_asc.rng_ascension(startAscension)
    
    wpnIdx = @wpnDbInitIdx + ascension
    
    weapon = $data_weapons[wpnIdx]
    
    if weapon == nil
      err("Weapon does not exist at index: " + wpnIdx.to_s)
      return false
    end
    
    return weapon, ascension
  end
  
  def get_weapon_attack(startAscension = 0, scalar = -1)
    if scalar >= 0
      @rng_weapon_atk.rngScalar = scalar
    end
    atk = @rng_weapon_atk.run(startAscension)
    return atk[0], atk[1]
  end
  
  def get_weapon_grade(ascensionLevel, atk)
    return @rng_weapon_atk.rng_grade(ascensionLevel, atk)
  end
  
  def add_wpn_to_party(wpn, count = 1)
    $game_party.gain_item(wpn, count)
  end
  
  def get_weapon_from_db(wpnCopy)
    $data_weapons[@weapon_generator.generate_weapon(wpnCopy)]
  end
  
  def set_weapon_db_params(idx, count)
    @wpnDbInitIdx = idx
    @wpnTypeCount = count
    # update RNG parameters - up to, but not including count
    @rng_weapon_atk.rngStepLimit = @wpnTypeCount-1
    @rng_weapon_asc.rngStepLimit = @wpnTypeCount-1
  end
  
  def drop_new_weapon(dbidx, count, startAscension = 0, dropChance = 1)
    if dropChance <= 0
      return nil
    elsif dropChance > 1
      dropChance = dropChance / 100
    end
    
    if rand(1) > dropChance
      return nil
    end
    
    set_weapon_db_params(dbidx, count)
    
    wpnRet = get_weapon_version(startAscension)
    
    wpnVersion = wpnRet[0]
    
    ascensionLevel = wpnRet[1]
    
    newWpn = get_weapon_from_db(wpnVersion)
    
    atkRet = get_weapon_attack(ascensionLevel, wpnVersion.params[2])
    
    newWpn.params[2] = atkRet[0]
    
    lvl = atkRet[1]

    newWpn.name += " " + get_weapon_grade(ascensionLevel, newWpn.params[2])
    
    return newWpn
    
  end
  
  def self.msg_drop_weapon(wpnName, count)
    msg = "You found "
    
    if count < 1
      return
    elsif count > 1
      msg += count.to_s + " " + wpnName + "s!"
    else
      msg += "a " + wpnName + "!"
    end
    
    $game_message.add(msg)
  end
  
  def err(errStr)
    puts "ERROR: (RNG_Drop_Weapon) " + errStr
  end
  
end