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
  
  NUMBER_OF_LONG_RANGE = 4
  
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
  
  def drop_super_soaker(startAscension = 0, dropChance = 1)
    superSoaker = @drp_weapon.drop_new_weapon(DBIDX_SUPER_SOAKER, 
                                              DBIDX_SUPER_SOAKER_COUNT, 
                                              startAscension,
                                              dropChance)
    
    if superSoaker == nil
      return nil
    end
    
    # Do other stuff with the superSoaker here
    
    @drp_weapon.add_wpn_to_party(superSoaker)
    
    @drp_weapon.msg_drop_weapon(superSoaker.name, 1)
    
    return superSoaker
  end
  
  def drop_potato_gun(startAscension = 0, dropChance = 1)
    potatoGun = @drp_weapon.drop_new_weapon(DBIDX_POTATO_GUN, 
                                            DBIDX_POTATO_GUN_COUNT, 
                                            startAscension,
                                            dropChance)
    
    if potatoGun == nil
      return nil
    end
    
    # Do other stuff with the potatoGun here
    
    @drp_weapon.add_wpn_to_party(potatoGun)
    
    @drp_weapon.msg_drop_weapon(potatoGun.name, 1)
    
    return potatoGun
  end
  
  def drop_spray_paint(startAscension = 0, dropChance = 1)
    sprayPaint = @drp_weapon.drop_new_weapon(DBIDX_SPRAY_PAINT, 
                                             DBIDX_SPRAY_PAINT_COUNT, 
                                             startAscension,
                                             dropChance)
    
    if sprayPaint == nil
      return nil
    end
    
    # Do other stuff with the sprayPaint here
    
    @drp_weapon.add_wpn_to_party(sprayPaint)
    
    @drp_weapon.msg_drop_weapon(sprayPaint.name, 1)
    
    return sprayPaint
  end
  
  def drop_mega_phone(startAscension = 0, dropChance = 1)
    megaPhone = @drp_weapon.drop_new_weapon(DBIDX_MEGA_PHONE, 
                                            DBIDX_MEGA_PHONE_COUNT, 
                                            startAscension,
                                            dropChance)
    
    if megaPhone == nil
      return nil
    end
    
    # Do other stuff with the megaPhone here
    
    @drp_weapon.add_wpn_to_party(megaPhone)
    
    @drp_weapon.msg_drop_weapon(megaPhone.name, 1)
    
    return megaPhone
  end
  
  def drop_random_long_range(startAscension = 0, dropChance = 1)
    longRangeChoice = rand(NUMBER_OF_LONG_RANGE).round
    
    case longRangeChoice
    when 0
      drop_super_soaker(startAscension, dropChance)
    when 1
      drop_potato_gun(startAscension, dropChance)
    when 2
      drop_spray_paint(startAscension, dropChance)
    when 3
      drop_mega_phone(startAscension, dropChance)
    else
      puts "Bad long range choice"
    end
  end
  
end