#==============================================================================
#
# ⌠ 
# │ Module:.... Drop_Staff
# │ Author:.... MusicInTheTrees
# │ Created:... 1 May 2023
# │ Version:... 1.0
# ⌡
#
# -- Description --
#  This class returns a version of staff from the database
#  These parameters are very specific to how the user places the weapons
#  in the database.
#==============================================================================

class Drop_Daggers
  
  DBIDX_STOP_SIGN = 2
  DBIDX_STOP_SIGN_COUNT = 6
  
  DBIDX_RAIN_STICK = 8
  DBIDX_RAIN_STICK_COUNT = 6
  
  DBIDX_PSYCH_BOOK = 14
  DBIDX_PSYCH_BOOK_COUNT = 6
  
  DBIDX_TI = 20
  DBIDX_TI_COUNT = 6
  
  def initialize
    @drp_weapon = RNG_Drop_Weapon.new
  end
  
  def drop_stop_sign(startAscension = 0)
    
  end
  
  def drop_rain_stick(startAscension = 0)
    
  end
  
  def drop_psych_book(startAscension = 0)
    
  end
  
  def drop_ti(startAscension = 0)
    
  end
end