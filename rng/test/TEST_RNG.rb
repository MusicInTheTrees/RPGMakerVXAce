

class RNG_Drop_Weapon
  def test
    run_test = 2
    
    if run_test == 0
      puts 'Drop_Weapons debug'
      
      puts $data_weapons[2].name
      puts $data_weapons[2].params[IDX_ATK].to_s
    elsif run_test == 1
      t = get_weapon_attack(4)
      puts "get_weapon_attack[0] = " + t[0].to_s
      puts "get_weapon_attack[1] = " + t[1].to_s
      
    elsif run_test == 2
      t = get_weapon_version(3)
      puts "get_weapon_version[0] = " + t[0].to_s
      puts "get_weapon_version[1] = " + t[1].to_s
      
    end
    
  end
end

class RNG_Generate_Weapon
  def test
    run_test = 0
    
    if run_test == 0
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
    elsif run_test == 1
      wpn = $data_weapons[2]
      $game_party.gain_item(wpn, 1)
      puts "Dagger wtype_id: " + wpn.wtype_id.to_s
    end
  end  
end