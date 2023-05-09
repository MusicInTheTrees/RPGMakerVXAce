#==============================================================================
#
# ⌠ 
# │ Module:.... RNG_Generate_Weapon
# │ Author:.... MusicInTheTrees
# │ Created:... 30 April 2023
# │ Version:... 1.0
# ⌡
#
# -- Description --
#  This class dynamically generates weapons and adds them to $data_weapons
#==============================================================================



class RNG_Generate_Weapon
  
  def self.copy_wpn_data(to, from)
    # copy everything but the id
    to.name = from.name
    to.wtype_id = from.wtype_id
    to.animation_id = from.animation_id
    to.params = from.params.dup
    to.price = from.price
    to.etype_id = from.etype_id
    to.icon_index = from.icon_index
    to.description = from.description
    to.features = from.features
    to.note = from.note
  end
  
  def self.generate(copyWpn = nil)
    wpn = RPG::Weapon.new
    
    $data_weapons.push(wpn)
    
    id = $data_weapons.length - 1
    
    wpn.id = id
    
    if (copyWpn != nil)
      RNG_Generate_Weapon.copy_wpn_data(wpn, copyWpn)
    end
    
    return id    
  end
  
  def self.add_wpn_to_party(wpn)
    $game_party.gain_item(wpn, 1)
  end
end