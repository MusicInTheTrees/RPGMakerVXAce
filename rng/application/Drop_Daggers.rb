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
#==============================================================================

class Drop_Daggers
  
  NUMBER_OF_DAGGERS = 4
  
  DBIDX_BOX_CUTTER = 2
  DBIDX_BOX_CUTTER_COUNT = 6
  
  DBIDX_SWITCH_BLADE = 8
  DBIDX_SWITCH_BLADE_COUNT = 6
  
  DBIDX_WUSTHOF = 14
  DBIDX_WUSTHOF_COUNT = 6
  
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
    
    @drp_weapon.add_wpn_to_party(boxCutter)
    
    @drp_weapon.msg_drop_weapon(boxCutter.name, 1)
    
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
    
    @drp_weapon.add_wpn_to_party(switchBlade)
    
    @drp_weapon.msg_drop_weapon(switchBlade.name, 1)
    
    return switchBlade
  end
  
  def drop_wusthof(startAscension = 0, dropChance = 1)
    wusthof = @drp_weapon.drop_new_weapon(DBIDX_WUSTHOF, 
                                          DBIDX_WUSTHOF_COUNT, 
                                          startAscension,
                                          dropChance)
    
    if wusthof == nil
      return
    end
    
    # Do other stuff with the wusthof here
    
    @drp_weapon.add_wpn_to_party(wusthof)
    
    @drp_weapon.msg_drop_weapon(wusthof.name, 1)
    
    return wusthof
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
    
    @drp_weapon.add_wpn_to_party(mechPencil)
    
    @drp_weapon.msg_drop_weapon(mechPencil.name, 1)
    
    return mechPencil
  end
  
  def drop_random_dagger(startAscension = 0, dropChance = 1)
    daggerChoice = rand(NUMBER_OF_DAGGERS).round
    
    case daggerChoice
    when 0
      drop_box_cutter(startAscension, dropChance)
    when 1
      drop_switch_blade(startAscension, dropChance)
    when 2
      drop_wusthof(startAscension, dropChance)
    when 3
      drop_mech_pencil(startAscension, dropChance)
    else
      puts "Bad dagger choice"
    end
  end
end