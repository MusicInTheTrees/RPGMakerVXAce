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
  
  
  
  def initialize
    @GENERATE_START_INDEX = $data_weapons.length
  end
  
  def get_generated_weapons
    delta = $data_weapons.length - @GENERATE_START_INDEX
    $data_weapons[@GENERATE_START_INDEX, delta]
  end
  
  def copy_wpn_data(to, from)
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
  
  def generate_weapon(copyWpn = nil)
    wpn = RPG::Weapon.new
    
    $data_weapons.push(wpn)
    
    id = $data_weapons.length - 1
    
    wpn.id = id
    
    if (copyWpn != nil)
      copy_wpn_data(wpn, copyWpn)
    end
    
    id    
  end
  
  def add_wpn_to_party(wpn)
    $game_party.gain_item(wpn, 1)
  end
  
  def test
    newWpnIdx = generate_weapon
    wpn = $data_weapons[newWpnIdx]
    wpn.params[2] = 10
    wpn.name = "TEST"
    wpn.wtype_id = 7 # dagger
    puts "Generated weapon name: " + wpn.name
    add_wpn_to_party(wpn)
    
    # Create a second weapon with the same name BUT different stats
    wpn = $data_weapons[generate_weapon]
    wpn.params[2] = 500
    wpn.name = "TEST"
    wpn.wtype_id = 7
    add_wpn_to_party(wpn)
  end
  
  def test0
    wpn = $data_weapons[2]
    $game_party.gain_item(wpn, 1)
    puts "Dagger wtype_id: " + wpn.wtype_id.to_s
    
  end
  
  
  
end