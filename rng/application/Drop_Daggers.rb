#==============================================================================
#
# ⌠ 
# │ Module:.... Drop_Daggers
# │ Author:.... MusicInTheTrees
# │ Created:... 29 April 2023
# │ Version:... 1.0
# ⌡
#
# -- Description --
#  This class returns a version of dagger from the database
#  These parameters are very specific to how the user places the weapons
#  in the database.
#
# -- Global Reference --
#  $drop_daggers (in file MY_Variables)
#==============================================================================

class Drop_Daggers
  
  DBIDX_BOX_CUTTER = 2
  DBIDX_BOX_CUTTER_COUNT = 6
  
  DBIDX_SWITCH_BLADE = 8
  DBIDX_SWITCH_BLADE_COUNT = 6
  
  DBIDX_KITCHEN_KNIFE = 14
  DBIDX_KITCHEN_KNIFE_COUNT = 6
  
  DBIDX_MECH_PENCIL = 20
  DBIDX_MECH_PENCIL_COUNT = 6
  
  def initialize
    @drp_weapon = RNG_Drop_Weapon.new
  end
  
  def drop_box_cutter(startAscension = 0, dropChance = 1)
    boxCutter = @drp_weapon.drop_new_weapon(DBIDX_BOX_CUTTER, 
                                            DBIDX_BOX_CUTTER_COUNT, 
                                            startAscension,
                                            dropChance)
                                            
    if boxCutter == nil
      return nil
    end
    
    # Do other stuff with the boxCutter here
    
    RNG_Drop_Article.add_article_to_party(boxCutter, 1, true)
    
    return boxCutter
  end
  
  def drop_switch_blade(startAscension = 0, dropChance = 1)
    switchBlade = @drp_weapon.drop_new_weapon(DBIDX_SWITCH_BLADE, 
                                              DBIDX_SWITCH_BLADE_COUNT, 
                                              startAscension,
                                              dropChance)
    
    if switchBlade == nil
      return nil
    end
    
    # Do other stuff with the switchBlade here
    
    RNG_Drop_Article.add_article_to_party(switchBlade, 1, true)
    
    return switchBlade
  end
  
  def drop_kitchen_knife(startAscension = 0, dropChance = 1)
    wusthof = @drp_weapon.drop_new_weapon(DBIDX_KITCHEN_KNIFE, 
                                          DBIDX_KITCHEN_KNIFE_COUNT, 
                                          startAscension,
                                          dropChance)
    
    if kitchenKnife == nil
      return
    end
    
    # Do other stuff with the kitchenKnife here
    
    RNG_Drop_Article.add_article_to_party(kitchenKnife, 1, true)
    
    return kitchenKnife
  end
  
  def drop_mech_pencil(startAscension = 0, dropChance = 1)
    mechPencil = @drp_weapon.drop_new_weapon(DBIDX_MECH_PENCIL, 
                                             DBIDX_MECH_PENCIL_COUNT, 
                                             startAscension,
                                             dropChance)
    
    if mechPencil == nil
      return nil
    end
    
    # Do other stuff with the mechPencil here
    
    RNG_Drop_Article.add_article_to_party(mechPencil, 1, true)
    
    return mechPencil
  end
  
  def drop_random_dagger(startAscension = 0, maxWeaponVersion = 0, dropChance = 1)
    
    if maxWeaponVersion < 1
      maxWeaponVersion = 3
    end
    
    daggerChoice = rand(maxWeaponVersion).round
    
    case daggerChoice
    when 0
      drop_box_cutter(startAscension, dropChance)
    when 1
      drop_switch_blade(startAscension, dropChance)
    when 2
      drop_kitchen_knife(startAscension, dropChance)
    when 3
      drop_mech_pencil(startAscension, dropChance)
    else
      puts "Bad dagger choice"
    end
  end
  
  def chest_random_dagger
    drop_random_dagger($my_vars.min_ascension_level, 
                       $my_vars.max_weapon_version,
                       $my_vars.reg_chest_drop_chance)
  end
                     
  def special_chest_random_dagger
    drop_random_dagger($my_vars.min_ascension_level, 
                       $my_vars.max_weapon_version,
                       $my_vars.spc_chest_drop_chance)
  end

  def battle_random_dagger
    drop_random_dagger($my_vars.min_ascension_level, 
                         $my_vars.max_weapon_version, 
                         $my_vars.battle_drop_chance)
  end
  
  def boss_random_dagger
    drop_random_dagger($my_vars.min_ascension_level, 
                         $my_vars.max_weapon_version, 
                         $my_vars.boss_drop_chance)
  end
end