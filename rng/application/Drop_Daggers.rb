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
  
  def drop_box_cutter(startAscension = 0)
    boxCutter = @drp_weapon.drop_new_weapon(DBIDX_BOX_CUTTER, DBIDX_BOX_CUTTER_COUNT, startAscension)
    
    # Do other stuff with the boxCutter here
    
    @drp_weapon.add_wpn_to_party(boxCutter)
    
    return boxCutter
  end
  
  def drop_switch_blade(startAscension = 0)
    switchBlade = @drp_weapon.drop_new_weapon(DBIDX_SWITCH_BLADE, DBIDX_SWITCH_BLADE_COUNT, startAscension)
    
    # Do other stuff with the switchBlade here
    
    @drp_weapon.add_wpn_to_party(switchBlade)
    
    return switchBlade
  end
  
  def drop_wusthof(startAscension = 0)
    wusthof = @drp_weapon.drop_new_weapon(DBIDX_WUSTHOF, DBIDX_WUSTHOF_COUNT, startAscension)
    
    # Do other stuff with the wusthof here
    
    @drp_weapon.add_wpn_to_party(wusthof)
    
    return wusthof
  end
  
  def drop_mech_pencil(startAscension = 0)
    mechPencil = @drp_weapon.drop_new_weapon(DBIDX_MECH_PENCIL, DBIDX_MECH_PENCIL_COUNT, startAscension)
    
    # Do other stuff with the mechPencil here
    
    @drp_weapon.add_wpn_to_party(mechPencil)
    
    return mechPencil
  end
end