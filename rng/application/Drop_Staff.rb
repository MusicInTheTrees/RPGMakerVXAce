#==============================================================================
#
# ⌠ 
# │ Module:.... Drop_Staff
# │ Author:.... MusicInTheTrees
# │ Created:... 1 May 2023
# │ Version:... 1.0
# ⌡
#
# -- Description --
#  This class returns a version of staff from the database
#  These parameters are very specific to how the user places the weapons
#  in the database.
#
# -- Global Reference --
#  $drop_staffs
#==============================================================================

class Drop_Staffs
  
  DBIDX_STOP_SIGN = 58
  DBIDX_STOP_SIGN_COUNT = 6
  
  DBIDX_RAIN_STICK = 64
  DBIDX_RAIN_STICK_COUNT = 6
  
  DBIDX_PSYCH_BOOK = 70
  DBIDX_PSYCH_BOOK_COUNT = 6
  
  DBIDX_TI = 76
  DBIDX_TI_COUNT = 6
  
  def initialize
    @drp_weapon = RNG_Drop_Weapon.new
  end
  
  def drop_stop_sign(startAscension = 0, dropChance = 1)
    stopSign = @drp_weapon.drop_new_weapon(DBIDX_STOP_SIGN, 
                                           DBIDX_STOP_SIGN_COUNT, 
                                           startAscension,
                                           dropChance)
    
    if stopSign == nil
      return nil
    end
    
    # Do other stuff with the stopSign here
    
    @drp_weapon.add_wpn_to_party(stopSign)
    
    RNG_Drop_Weapon.msg_drop_weapon(stopSign.name, 1)
    
    return stopSign
  end
  
  def drop_rain_stick(startAscension = 0, dropChance = 1)
    rainStick = @drp_weapon.drop_new_weapon(DBIDX_RAIN_STICK, 
                                            DBIDX_RAIN_STICK_COUNT, 
                                            startAscension,
                                            dropChance)
    
    if rainStick == nil
      return nil
    end
    
    # Do other stuff with the rainStick here
    
    @drp_weapon.add_wpn_to_party(rainStick)
    
    RNG_Drop_Weapon.msg_drop_weapon(rainStick.name, 1)
    
    return rainStick
  end
  
  def drop_psych_book(startAscension = 0, dropChance = 1)
    psychBook = @drp_weapon.drop_new_weapon(DBIDX_PSYCH_BOOK, 
                                            DBIDX_PSYCH_BOOK_COUNT, 
                                            startAscension,
                                            dropChance)
    
    if psychBook == nil
      return nil
    end
    
    # Do other stuff with the psychBook here
    
    @drp_weapon.add_wpn_to_party(psychBook)
    
    RNG_Drop_Weapon.msg_drop_weapon(psychBook.name, 1)
    
    return psychBook
  end
  
  def drop_ti(startAscension = 0, dropChance = 1)
    ti = @drp_weapon.drop_new_weapon(DBIDX_TI, 
                                     DBIDX_TI_COUNT, 
                                     startAscension,
                                     dropChance)
    
    if ti == nil
      return nil
    end
    
    # Do other stuff with the ti here
    
    @drp_weapon.add_wpn_to_party(ti)
    
    RNG_Drop_Weapon.msg_drop_weapon(ti.name, 1)
    
    return ti
  end
  
  def drop_random_staff(startAscension = 0, maxWeaponVersion = 0, dropChance = 1)
    if maxWeaponVersion < 1
      maxWeaponVersion = 3
    end
    
    staffChoice = rand(maxWeaponVersion).round
    
    case staffChoice
    when 0
      drop_stop_sign(startAscension, dropChance)
    when 1
      drop_rain_stick(startAscension, dropChance)
    when 2
      drop_psych_book(startAscension, dropChance)
    when 3
      drop_ti(startAscension, dropChance)
    else
      puts "Bad staff choice"
    end
  end
  
  def chest_random_staff
    d.drop_random_staff($my_vars.min_ascension_level, 
                        $my_vars.max_weapon_version)
  end

  def battle_random_staff
    d.drop_random_staff($my_vars.min_ascension_level, 
                        $my_vars.max_weapon_version, 
                        $my_vars.battle_drop_chance)
  end
  
  def boss_random_staff
    d.drop_random_staff($my_vars.min_ascension_level, 
                        $my_vars.max_weapon_version, 
                        $my_vars.boss_drop_chance)
  end
end

$drop_staffs = Drop_Staffs.new