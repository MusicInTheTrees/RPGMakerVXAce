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
  
  NUMBER_OF_HAMMERS = 4
  
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
  
  def drop_easle(startAscension = 0, dropChance = 1)
    easle = @drp_weapon.drop_new_weapon(DBIDX_EASLE, 
                                        DBIDX_EASLE_COUNT, 
                                        startAscension,
                                        dropChance)
    
    if easle == nil
      return nil
    end
    
    # Do other stuff with the easle here
    
    @drp_weapon.add_wpn_to_party(easle)
    
    @drp_weapon.msg_drop_weapon(easle.name, 1)
    
    return ealse
  end
  
  def drop_golf_club(startAscension = 0, dropChance = 1)
    golfClub = @drp_weapon.drop_new_weapon(DBIDX_GOLF_CLUB, 
                                           DBIDX_GOLF_CLUB_COUNT, 
                                           startAscension,
                                           dropChance)
    
    if golfClub == nil
      return nil
    end
    
    # Do other stuff with the golfClub here
    
    @drp_weapon.add_wpn_to_party(golfClub)
    
    @drp_weapon.msg_drop_weapon(golfClub.name, 1)
    
    return golfClub
  end
  
  def drop_desk_chair(startAscension = 0, dropChance = 1)
    deskChair = @drp_weapon.drop_new_weapon(DBIDX_DESK_CHAIR, 
                                            DBIDX_DESK_CHAIR_COUNT, 
                                            startAscension,
                                            dropChance)
    
    if deskChair == nil
      return nil
    end
    
    # Do other stuff with the deskChair here
    
    @drp_weapon.add_wpn_to_party(deskChair)
    
    @drp_weapon.msg_drop_weapon(deskChair.name, 1)
    
    return deskChair
  end
  
  def drop_friends_guitar(startAscension = 0, dropChance = 1)
    friendsGuitar = @drp_weapon.drop_new_weapon(DBIDX_FRIENDS_GUITAR, 
                                                DBIDX_FRIENDS_GUITAR_COUNT, 
                                                startAscension,
                                                dropChance)
    
    if friendsGuitar == nil
      return nil
    end
    
    # Do other stuff with the friendsGuitar here
    
    @drp_weapon.add_wpn_to_party(friendsGuitar)
    
    @drp_weapon.msg_drop_weapon(friendsGuitar.name, 1)
    
    return friendsGuitar
  end
  
  def drop_random_hammer(startAscension = 0, dropChance = 1)
    hammerChoice = rand(NUMBER_OF_HAMMERS).round
    
    case hammerChoice
    when 0
      drop_easle(startAscension, dropChance)
    when 1
      drop_golf_club(startAscension, dropChance)
    when 2
      drop_desk_chair(startAscension, dropChance)
    when 3
      drop_friends_guitar(startAscension, dropChance)
    else
      puts "Bad hammer choice"
    end
  end
  
end