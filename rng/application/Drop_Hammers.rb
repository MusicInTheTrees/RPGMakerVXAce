#==============================================================================
#
# ⌠ 
# │ Module:.... Drop_Hammers
# │ Author:.... MusicInTheTrees
# │ Created:... 1 May 2023
# │ Version:... 1.0
# ⌡
#
# -- Description --
#  This class returns a version of hammer from the database
#  These parameters are very specific to how the user places the weapons
#  in the database.
#==============================================================================

class Drop_Daggers
  
  DBIDX_EASLE = 2
  DBIDX_EASLE_COUNT = 6
  
  DBIDX_GOLF_CLUB = 8
  DBIDX_GOLF_CLUB_COUNT = 6
  
  DBIDX_DESK_CHAIR = 14
  DBIDX_DESK_CHAIR_COUNT = 6
  
  DBIDX_FRIENDS_GUITAR = 20
  DBIDX_FRIENDS_GUITAR_COUNT = 6
  
  def initialize
    @drp_weapon = RNG_Drop_Weapon.new
  end
  
  def drop_easl(startAscension = 0)
  
  
  end
  
  def drop_golf_club(startAscension = 0)
    
    
  end
  
  def drop_desk_chair(startAscension = 0)
    
    
  end
  
  def drop_friends_guitar(startAscension = 0)
    
    
  end
  
end