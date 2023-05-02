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
  
  DBIDX_SUPER_SOAKER = 85
  DBIDX_SUPER_SOAKER_COUNT = 6
  
  DBIDX_POTATO_GUN = 91
  DBIDX_POTATO_GUN_COUNT = 6
  
  DBIDX_SPRAY_PAINT = 97
  DBIDX_SPRAY_PAINT_COUNT = 6
  
  DBIDX_MEGA_PHONE = 103
  DBIDX_MEGA_PHONE_COUNT = 6
  
  def initialize
    @drp_weapon = RNG_Drop_Weapon.new
  end
  
  def drop_super_soaker(startAscension = 0)
    superSoaker = @drp_weapon.drop_new_weapon(DBIDX_SUPER_SOAKER, DBIDX_SUPER_SOAKER_COUNT, startAscension)
    
    # Do other stuff with the superSoaker here
    
    @drp_weapon.add_wpn_to_party(superSoaker)
    
    return superSoaker
  end
  
  def drop_potato_gun(startAscension = 0)
    potatoGun = @drp_weapon.drop_new_weapon(DBIDX_POTATO_GUN, DBIDX_POTATO_GUN_COUNT, startAscension)
    
    # Do other stuff with the potatoGun here
    
    @drp_weapon.add_wpn_to_party(potatoGun)
    
    return potatoGun
  end
  
  def drop_spray_paint(startAscension = 0)
    sprayPaint = @drp_weapon.drop_new_weapon(DBIDX_SPRAY_PAINT, DBIDX_SPRAY_PAINT_COUNT, startAscension)
    
    # Do other stuff with the sprayPaint here
    
    @drp_weapon.add_wpn_to_party(sprayPaint)
    
    return sprayPaint
  end
  
  def drop_mega_phone(startAscension = 0)
    megaPhone = @drp_weapon.drop_new_weapon(DBIDX_MEGA_PHONE, DBIDX_MEGA_PHONE_COUNT, startAscension)
    
    # Do other stuff with the megaPhone here
    
    @drp_weapon.add_wpn_to_party(megaPhone)
    
    return megaPhone
  end
  
end