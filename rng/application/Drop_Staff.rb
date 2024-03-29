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
#  $drop_staffs (in file MY_Variables)
#==============================================================================

class Drop_Staffs
  
  DBIDX_ROAD_SIGN = 58
  DBIDX_ROAD_SIGN_COUNT = 6
  
  DBIDX_RAIN_STICK = 64
  DBIDX_RAIN_STICK_COUNT = 6
  
  DBIDX_PSYCH_BOOK = 70
  DBIDX_PSYCH_BOOK_COUNT = 6
  
  DBIDX_TI = 76
  DBIDX_TI_COUNT = 6
  
  def initialize
    @drp_weapon = RNG_Drop_Weapon.new
  end
  
  def drop_road_sign(startAscension = 0, dropChance = 1)
    roadSign = @drp_weapon.drop_new_weapon(DBIDX_ROAD_SIGN, 
                                           DBIDX_ROAD_SIGN_COUNT, 
                                           startAscension,
                                           dropChance)
    
    if roadSign == nil
      return nil
    end
    
    # Do other stuff with the roadSign here
    
    RNG_Drop_Article.add_article_to_party(roadSign, 1, true)
    
    return roadSign
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
    
    RNG_Drop_Article.add_article_to_party(rainStick, 1, true)
    
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
    
    RNG_Drop_Article.add_article_to_party(psychBook, 1, true)
    
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
    
    RNG_Drop_Article.add_article_to_party(ti, 1, true)
    
    return ti
  end
  
  def drop_random_staff(startAscension = 0, maxWeaponVersion = 0, dropChance = 1)
    if maxWeaponVersion < 1
      maxWeaponVersion = $G_MAX_WEAPON_VERSION
    end
    
    staffChoice = rand(maxWeaponVersion).round
    
    case staffChoice
    when 0
      drop_road_sign(startAscension, dropChance)
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
    drop_random_staff($my_vars.min_ascension_level, 
                      $my_vars.max_weapon_version,
                      $my_vars.reg_chest_drop_chance)
  end

  def special_chest_random_staff
    drop_random_staff($my_vars.min_ascension_level, 
                      $my_vars.max_weapon_version,
                      $my_vars.spc_chest_drop_chance)
  end
  
  def battle_random_staff
    drop_random_staff($my_vars.min_ascension_level, 
                      $my_vars.max_weapon_version, 
                      $my_vars.battle_drop_chance)
  end
  
  def boss_random_staff
    drop_random_staff($my_vars.min_ascension_level, 
                      $my_vars.max_weapon_version, 
                      $my_vars.boss_drop_chance)
  end
end