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
  def initialize
    
    @drp_box_cutters = RNG_Drop_Weapon.new(2, 6)
    
  end
  
  def drop_box_cutter(startAscension = 0)
    wpnRet = @drp_box_cutters.get_weapon_version(startAscension)
    
    wpnVersion = wpnRet[0]
    
    ascensionLevel = wpnRet[1]
    
    newWpn = @drp_box_cutters.get_weapon_from_db(wpnVersion)
    
    atkRet = @drp_box_cutters.get_weapon_attack(ascensionLevel, wpnVersion.params[2])
    newWpn.params[2] = atkRet[0]
    lvl = atkRet[1]

    newWpn.name += " " + @drp_box_cutters.get_weapon_grade(ascensionLevel, newWpn.params[2])

    
    return newWpn
  end  
end