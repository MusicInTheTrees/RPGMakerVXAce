

class Drop_Daggers
  
  @drp_box_cutters = RNG_Drop_Weapon.new(2, 6)
  
  
  def test
    boxCutter = @drp_box_cutters.get_weapon_ascension
    
    if (false == boxCutter)
      puts "FAILED TO GET BOX CUTTER IN CLASS 'Drop_Daggers'"
    else
      puts "SUCCESSFULLY GOT BOX CUTTER IN CLASS 'Drop_Daggers'"
      puts "Dagger: " + boxCutter.name
    end   
    
  end
  
  
  
end