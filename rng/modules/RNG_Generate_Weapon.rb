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
  
  def create_weapon
    wpn = RPG::Weapon.new
    
    $data_weapons.push(wpn)
    
    id = $data_weapons.length - 1
    
    wpn.id = id
    
    id    
  end
  
  def add_wpn_to_party(wpn)
    $game_party.gain_item(wpn, 1)
  end
  
  def test
    newWpnIdx = create_weapon
    wpn = $data_weapons[newWpnIdx]
    wpn.params[2] = 10
    wpn.name = "TEST"
    wpn.wtype_id = 7 # dagger
    puts "Generated weapon name: " + wpn.name
    add_wpn_to_party(wpn)
  end
  
  def test0
    wpn = $data_weapons[2]
    $game_party.gain_item(wpn, 1)
    puts "Dagger wtype_id: " + wpn.wtype_id.to_s
    
  end
  
  
  
end