#==============================================================================
#
# ⌠ 
# │ Module:.... Drop_Daggers
# │ Author:.... MusicInTheTrees
# │ Created:... 29 April 2023
# │ Version:... 1.0
# ⌡
#
# -- Description
#  This class returns a version of dagger from the database
#  These parameters are very specific to how the user places the weapons
#  in the database.
#==============================================================================

class Drop_Daggers
  def initialize
    @drp_box_cutters = RNG_Drop_Weapon.new(2, 6)
  end
  
  def test
    
    boxCutter = @drp_box_cutters.get_weapon_ascension()
    
    if (false == boxCutter)
      puts "FAILED TO GET BOX CUTTER IN CLASS 'Drop_Daggers'"
    else
      puts "SUCCESSFULLY GOT BOX CUTTER IN CLASS 'Drop_Daggers'"
      puts "Dagger: " + boxCutter.name
    end   
    
  end
  
  
  
end