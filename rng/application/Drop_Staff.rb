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
  
  DBIDX_STOP_SIGN = 58
  DBIDX_STOP_SIGN_COUNT = 6
  
  DBIDX_RAIN_STICK = 64
  DBIDX_RAIN_STICK_COUNT = 6
  
  DBIDX_PSYCH_BOOK = 70
  DBIDX_PSYCH_BOOK_COUNT = 6
  
  DBIDX_TI = 76
  DBIDX_TI_COUNT = 6
  
  def initialize
    @drp_weapon = RNG_Drop_Weapon.new
  end
  
  def drop_stop_sign(startAscension = 0)
    stopSign = @drp_weapon.drop_new_weapon(DBIDX_STOP_SIGN, DBIDX_STOP_SIGN_COUNT, startAscension)
    
    # Do other stuff with the stopSign here
    
    @drp_weapon.add_wpn_to_party(stopSign)
    
    return stopSign
  end
  
  def drop_rain_stick(startAscension = 0)
    rainStick = @drp_weapon.drop_new_weapon(DBIDX_RAIN_STICK, DBIDX_RAIN_STICK_COUNT, startAscension)
    
    # Do other stuff with the rainStick here
    
    @drp_weapon.add_wpn_to_party(rainStick)
    
    return rainStick
  end
  
  def drop_psych_book(startAscension = 0)
    psychBook = @drp_weapon.drop_new_weapon(DBIDX_PSYCH_BOOK, DBIDX_PSYCH_BOOK_COUNT, startAscension)
    
    # Do other stuff with the psychBook here
    
    @drp_weapon.add_wpn_to_party(psychBook)
    
    return psychBook
  end
  
  def drop_ti(startAscension = 0)
    ti = @drp_weapon.drop_new_weapon(DBIDX_TI, DBIDX_TI_COUNT, startAscension)
    
    # Do other stuff with the ti here
    
    @drp_weapon.add_wpn_to_party(ti)
    
    return ti
  end
end