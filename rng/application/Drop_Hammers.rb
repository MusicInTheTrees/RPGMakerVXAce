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
  
  DBIDX_EASLE = 30
  DBIDX_EASLE_COUNT = 6
  
  DBIDX_GOLF_CLUB = 36
  DBIDX_GOLF_CLUB_COUNT = 6
  
  DBIDX_DESK_CHAIR = 42
  DBIDX_DESK_CHAIR_COUNT = 6
  
  DBIDX_FRIENDS_GUITAR = 48
  DBIDX_FRIENDS_GUITAR_COUNT = 6
  
  def initialize
    @drp_weapon = RNG_Drop_Weapon.new
  end
  
  def drop_easle(startAscension = 0)
    easle = @drp_weapon.drop_new_weapon(DBIDX_EASLE, DBIDX_EASLE_COUNT, startAscension)
    
    # Do other stuff with the easle here
    
    @drp_weapon.add_wpn_to_party(easle)
    
    return ealse
  end
  
  def drop_golf_club(startAscension = 0)
    golfClub = @drp_weapon.drop_new_weapon(DBIDX_GOLF_CLUB, DBIDX_GOLF_CLUB_COUNT, startAscension)
    
    # Do other stuff with the golfClub here
    
    @drp_weapon.add_wpn_to_party(golfClub)
    
    return golfClub
  end
  
  def drop_desk_chair(startAscension = 0)
    deskChair = @drp_weapon.drop_new_weapon(DBIDX_DESK_CHAIR, DBIDX_DESK_CHAIR_COUNT, startAscension)
    
    # Do other stuff with the deskChair here
    
    @drp_weapon.add_wpn_to_party(deskChair)
    
    return deskChair
  end
  
  def drop_friends_guitar(startAscension = 0)
    friendsGuitar = @drp_weapon.drop_new_weapon(DBIDX_FRIENDS_GUITAR, DBIDX_FRIENDS_GUITAR_COUNT, startAscension)
    
    # Do other stuff with the friendsGuitar here
    
    @drp_weapon.add_wpn_to_party(friendsGuitar)
    
    return friendsGuitar
  end
  
end