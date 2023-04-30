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
  def initialize(wpnDbInitIdx, wpnTypeCount)
    
    @rng_weapon_atk = RNG_Expo_Step.new
    @rng_weapon_asc = RNG_Expo_Step.new
    
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
    
    # update RNG parameters
    @rng_weapon_atk.rngAscendLimit = wpnTypeCount
    @rng_weapon_asc.rngAscendLimit = wpnTypeCount
  end
  
  def m_wpnTypeCount
    @m_wpnTypeCount
  end
  
  def wpnTypeCount=(value)
    @wpnTypeCount = value
    @rng_weapon_atk.rngAscendLimit = @wpnTypeCount
    @rng_weapon_asc.rngAscendLimit = @wpnTypeCount
  end
  
  def test
    puts 'Drop_Weapons debug'
    
    puts $data_weapons[2].name
    puts $data_weapons[2].params[IDX_ATK].to_s
    
  end
  
  def get_weapon_ascension(startAscension = 0)
    ascension = @rng_weapon_asc.rng_ascension(startAscension)
    
    wpnIdx = @m_wpnDbInitIdx + ascension
    
    weapon = $data_weapons[wpnIdx]
    
    if weapon == nil
      err("Weapon does not exist at index: " + wpnIdx.to_s)
      return false
    end
    
    return weapon
  end
  
  
  def err(errStr)
    puts "ERROR: (RNG_Drop_Weapon) " + errStr
    
  end
  
end