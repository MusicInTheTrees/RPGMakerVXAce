#==============================================================================
#
# ⌠ 
# │ Module:.... Drop_LongRange
# │ Author:.... MusicInTheTrees
# │ Created:... 1 May 2023
# │ Version:... 1.0
# ⌡
#
# -- Description --
#  This class returns a version of Long Range from the database
#  These parameters are very specific to how the user places the weapons
#  in the database.
#
# -- Global Reference --
#  $drop_long_range (in file MY_Variables)
#==============================================================================

class Drop_LongRange
  
  DBIDX_SUPER_SOAKER = 86
  DBIDX_SUPER_SOAKER_COUNT = 6
  
  DBIDX_GUN = 92
  DBIDX_GUN_COUNT = 6
  
  DBIDX_SPRAY_PAINT = 98
  DBIDX_SPRAY_PAINT_COUNT = 6
  
  DBIDX_MEGA_PHONE = 104
  DBIDX_MEGA_PHONE_COUNT = 6
  
  def initialize
    @drp_weapon = RNG_Drop_Weapon.new
  end
  
  def drop_super_soaker(startAscension = 0, dropChance = 1)
    superSoaker = @drp_weapon.drop_new_weapon(DBIDX_SUPER_SOAKER, 
                                              DBIDX_SUPER_SOAKER_COUNT, 
                                              startAscension,
                                              dropChance)
    
    if superSoaker == nil
      return nil
    end
    
    # Do other stuff with the superSoaker here
    
    RNG_Drop_Article.add_article_to_party(superSoaker, 1, true)
    
    return superSoaker
  end
  
  def drop_gun(startAscension = 0, dropChance = 1)
    gun = @drp_weapon.drop_new_weapon(DBIDX_GUN, 
                                      DBIDX_GUN_COUNT, 
                                      startAscension,
                                      dropChance)
  
    if gun == nil
      return nil
    end
    
    # Do other stuff with the gun here
    
    RNG_Drop_Article.add_article_to_party(gun, 1, true)
    
    return gun
  end
  
  def drop_spray_paint(startAscension = 0, dropChance = 1)
    sprayPaint = @drp_weapon.drop_new_weapon(DBIDX_SPRAY_PAINT, 
                                             DBIDX_SPRAY_PAINT_COUNT, 
                                             startAscension,
                                             dropChance)
    
    if sprayPaint == nil
      return nil
    end
    
    # Do other stuff with the sprayPaint here
    
    RNG_Drop_Article.add_article_to_party(sprayPaint, 1, true)
    
    return sprayPaint
  end
  
  def drop_mega_phone(startAscension = 0, dropChance = 1)
    megaPhone = @drp_weapon.drop_new_weapon(DBIDX_MEGA_PHONE, 
                                            DBIDX_MEGA_PHONE_COUNT, 
                                            startAscension,
                                            dropChance)
    
    if megaPhone == nil
      return nil
    end
    
    # Do other stuff with the megaPhone here
    
    RNG_Drop_Article.add_article_to_party(megaPhone, 1, true)
    
    return megaPhone
  end
  
  def drop_random_long_range(startAscension = 0, maxWeaponVersion = 0, dropChance = 1)
    if maxWeaponVersion < 1
      maxWeaponVersion = $G_MAX_WEAPON_VERSION
    end
    
    longRangeChoice = rand(maxWeaponVersion).round
    
    case longRangeChoice
    when 0
      drop_super_soaker(startAscension, dropChance)
    when 1
      drop_gun(startAscension, dropChance)
    when 2
      drop_spray_paint(startAscension, dropChance)
    when 3
      drop_mega_phone(startAscension, dropChance)
    else
      puts "Bad long range choice"
    end
  end
  
  def chest_random_long_range
    drop_random_long_range($my_vars.min_ascension_level, 
                           $my_vars.max_weapon_version,
                           $my_vars.reg_chest_drop_chance)
  end

  def special_chest_random_long_range
    drop_random_long_range($my_vars.min_ascension_level, 
                           $my_vars.max_weapon_version,
                           $my_vars.spc_chest_drop_chance)
  end
  
  def battle_random_long_range
    drop_random_long_range($my_vars.min_ascension_level, 
                           $my_vars.max_weapon_version, 
                           $my_vars.battle_drop_chance)
  end
  
  def boss_random_long_range
    drop_random_long_range($my_vars.min_ascension_level, 
                           $my_vars.max_weapon_version, 
                           $my_vars.boss_drop_chance)
  end
end