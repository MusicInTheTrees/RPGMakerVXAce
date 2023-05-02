#==============================================================================
#
# ⌠ 
# │ Module:.... Drop_LongRange
# │ Author:.... MusicInTheTrees
# │ Created:... 1 May 2023
# │ Version:... 1.0
# ⌡
#
# -- Description --
#  This class returns a version of Long Range from the database
#  These parameters are very specific to how the user places the weapons
#  in the database.
#==============================================================================

class Drop_Daggers
  
  DBIDX_SUPER_SOAKER = 2
  DBIDX_SUPER_SOAKER_COUNT = 6
  
  DBIDX_POTATO_GUN = 8
  DBIDX_POTATO_GUN_COUNT = 6
  
  DBIDX_SPRAY_PAINT = 14
  DBIDX_SPRAY_PAINT_COUNT = 6
  
  DBIDX_MEGA_PHONE = 20
  DBIDX_MEGA_PHONE_COUNT = 6
  
  def initialize
    @drp_weapon = RNG_Drop_Weapon.new
  end
  
  def drop_super_soaker(startAscension = 0)
    
  end
  
  def drop_potato_gun(startAscension = 0)
    
  end
  
  def drop_spray_paint(startAscension = 0)
    
  end
  
  def drop_mega_phone(startAscension = 0)
    
  end
  
end