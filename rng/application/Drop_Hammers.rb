#==============================================================================
#
# ⌠ 
# │ Module:.... Drop_Hammers
# │ Author:.... MusicInTheTrees
# │ Created:... 1 May 2023
# │ Version:... 1.0
# ⌡
#
# -- Description --
#  This class returns a version of hammer from the database
#  These parameters are very specific to how the user places the weapons
#  in the database.
#
# -- Global Reference --
#  $drop_hammers (in file MY_Variables)
#==============================================================================

class Drop_Hammers
  
  DBIDX_EASLE = 30
  DBIDX_EASLE_COUNT = 6
  
  DBIDX_GOLF_CLUB = 36
  DBIDX_GOLF_CLUB_COUNT = 6
  
  DBIDX_DESK_CHAIR = 42
  DBIDX_DESK_CHAIR_COUNT = 6
  
  DBIDX_GUITAR = 48
  DBIDX_GUITAR_COUNT = 6
  
  def initialize
    @drp_weapon = RNG_Drop_Weapon.new
  end
  
  def drop_easle(startAscension = 0, dropChance = 1)
    easle = @drp_weapon.drop_new_weapon(DBIDX_EASLE, 
                                        DBIDX_EASLE_COUNT, 
                                        startAscension,
                                        dropChance)
    
    if easle == nil
      return nil
    end
    
    # Do other stuff with the easle here
    
    RNG_Drop_Article.add_article_to_party(easle, 1, true)
    
    return easle
  end
  
  def drop_golf_club(startAscension = 0, dropChance = 1)
    golfClub = @drp_weapon.drop_new_weapon(DBIDX_GOLF_CLUB, 
                                           DBIDX_GOLF_CLUB_COUNT, 
                                           startAscension,
                                           dropChance)
    
    if golfClub == nil
      return nil
    end
    
    # Do other stuff with the golfClub here
    
    RNG_Drop_Article.add_article_to_party(golfClub, 1, true)
    
    return golfClub
  end
  
  def drop_desk_chair(startAscension = 0, dropChance = 1)
    deskChair = @drp_weapon.drop_new_weapon(DBIDX_DESK_CHAIR, 
                                            DBIDX_DESK_CHAIR_COUNT, 
                                            startAscension,
                                            dropChance)
    
    if deskChair == nil
      return nil
    end
    
    # Do other stuff with the deskChair here
    
    RNG_Drop_Article.add_article_to_party(deskChair, 1, true)
    
    return deskChair
  end
  
  def drop_guitar(startAscension = 0, dropChance = 1)
    guitar = @drp_weapon.drop_new_weapon(DBIDX_GUITAR, 
                                         DBIDX_GUITAR_COUNT, 
                                         startAscension,
                                         dropChance)
    
    if guitar == nil
      return nil
    end
    
    # Do other stuff with the friendsGuitar here
    
    RNG_Drop_Article.add_article_to_party(guitar, 1, true)
    
    return guitar
  end
  
  def drop_random_hammer(startAscension = 0, maxWeaponVersion = 0, dropChance = 1)
    if maxWeaponVersion < 1
      maxWeaponVersion = $G_MAX_WEAPON_VERSION
    end
    
    hammerChoice = rand(maxWeaponVersion).round
    
    case hammerChoice
    when 0
      drop_easle(startAscension, dropChance)
    when 1
      drop_golf_club(startAscension, dropChance)
    when 2
      drop_desk_chair(startAscension, dropChance)
    when 3
      drop_guitar(startAscension, dropChance)
    else
      puts "Bad hammer choice"
    end
  end
  
  def chest_random_hammer
    drop_random_hammer($my_vars.min_ascension_level, 
                       $my_vars.max_weapon_version,
                       $my_vars.reg_chest_drop_chance)
  end
                     
  def special_chest_random_hammer
    drop_random_hammer($my_vars.min_ascension_level, 
                       $my_vars.max_weapon_version,
                       $my_vars.spc_chest_drop_chance)
  end

  def battle_random_hammer
    drop_random_hammer($my_vars.min_ascension_level, 
                       $my_vars.max_weapon_version, 
                       $my_vars.battle_drop_chance)
  end
  
  def boss_random_hammer
    drop_random_hammer($my_vars.min_ascension_level, 
                       $my_vars.max_weapon_version, 
                       $my_vars.boss_drop_chance)
  end
end