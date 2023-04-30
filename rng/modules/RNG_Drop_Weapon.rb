#==============================================================================
# ** RNG_Drop_Weapon
#------------------------------------------------------------------------------
#  This class returns an arbitrary weapon given a few parameters.
#  These parameters are very specific to how the user places the weapons
#   in the database. 
#  This script MUST be updated as the user updates
#   their weapon database.
#  Params:
#    + Weapon Type (assuming a region of the database. e.g. list of daggers)
#    + Weapon Type Version (Which dagger, in list of daggers, for example)
#    + Min Weapon Type Version Class
#      - (i.e. having multiple versions of the same dagger, but with different
#              power levels/names
#==============================================================================

#require "RNG_Expo_Step"
#include RNG_Expo_Step

class RNG_Drop_Weapon
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  @rng_weapon_atk = RNG_Expo_Step.new
  @rng_weapon_asc = RNG_Expo_Step.new
  
  attr_accessor :m_wpnDbInitIdx
  attr_accessor :m_wpnTypeCount
  
  #--------------------------------------------------------------------------
  # * Constants
  #--------------------------------------------------------------------------
  IDX_ATK = 2
  
  #--------------------------------------------------------------------------
  # * Class Methods
  #--------------------------------------------------------------------------
  def initialize(wpnDbInitIdx, wpnTypeCount)
    super()
    
    # init 'wpnDbInitIdx'
    if wpnDbInitIdx == nil
      @m_wpnDbInitIdx = 0
      err("wpnDbInitIdx parameter was nil")
    else
      @m_wpnDbInitIdx = wpnDbInitIdx
    end
    
    # init 'wpnTypeCount'
    if wpnTypeCount == nil || wpnTypeCount < 0
      @m_wpnTypeCount = 0
      err("wpnTypeCount parameter was nil OR 0")
    else
      @m_wpnTypeCount = wpnTypeCount
    end
    
    # update RNG parameters
    @rng_weapon_atk.rngAscendLimit(wpnTypeCount)
    @rng_weapon_asc.rngAscendLimit(wpnTypeCount)    
  end
  
  def test
    puts 'Drop_Weapons debug'
    
    puts $data_weapons[2].name
    puts $data_weapons[2].params[IDX_ATK].to_s
    
  end
  
  def get_weapon_ascension(startAscension = 0)
    ascension = @rng_weapon_asc.rng_ascension(startAscension)
    
    wpnIdx = attr_accessor + ascension
    
    weapon = $data_weapons[wpnIdx]
    
    if weapon == nil
      err("Weapon does not exist at index: " + wpnIdx.to_s)
      return false
    end
    
    return weapon
  end
  
  
  def err(errStr)
    puts "ERROR: (RNG_Drop_Weapon) " + errStr
    
  end
  
  
  
  
  
end