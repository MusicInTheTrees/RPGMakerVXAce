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
    @weapon_generator = RNG_Generate_Weapon.new
    @drp_box_cutters = RNG_Drop_Weapon.new(2, 6)
    
  end
  
  def add_wpn_to_party(wpn, count = 1)
    $game_party.gain_item(wpn, count)
  end
  
  def get_weapon(wpnCopy)
    $data_weapons[@weapon_generator.generate_weapon(wpnCopy)]
  end
    
  def drop_box_cutter(startAscension = 0)
    wpnRet = @drp_box_cutters.get_weapon_version(startAscension)
    
    wpnVersion = wpnRet[0]
    
    ascensionLevel = wpnRet[1]
    
    newWpn = get_weapon(wpnVersion)
    
    atkRet = @drp_box_cutters.get_weapon_attack(ascensionLevel, wpnVersion.params[2])
    newWpn.params[2] = atkRet[0]
    lvl = atkRet[1]

    newWpn.name += " " + @drp_box_cutters.get_weapon_grade(ascensionLevel, newWpn.params[2])

    
    return newWpn
  end  
end