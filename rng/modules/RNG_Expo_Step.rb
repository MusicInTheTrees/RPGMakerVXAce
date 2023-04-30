# ==============================================================================
#
# ⌠ 
# │ Module:.... Exponential Step RNG
# │ Author:.... MusicInTheTrees
# │ Created:... 28 April 2023
# │ Version:... 1.0
# ⌡
#
# -- Description --
#  This class returns an random number based on some input parameters
#  The values increase at an exponential rate combined with step increases
#  The step increases are meant to help with stages of a game
# ==============================================================================

class RNG_Expo_Step
  #--------------------------------------------------------------------------
  # * Formula
  #--------------------------------------------------------------------------
  # rngCenter = base ^ (exp * expFactor)
  # rngCenterRange = rngCenter +/- (rngCenter * bound)
  # rngValue = scalar + rand(rngCenterRange)
  
  # NOTE: SEE BOTTOM OF FILE FOR PYTHON SCRIPT
  #       You can use this to rapidly test values for yourself
  
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  # rngScalar: This is the flat rate that gets applied to every
  # randomly generated number initially.
  attr_accessor :rngScalar
  
  # rngBase: This is the base of the center value of the 
  # randomly generated number
  attr_accessor :rngBase
  
  # rngExponentFactor: This is the shrink or growth factor of the exponent
  # (to the base of the random gen number center value)
  attr_accessor :rngExponentFactor
  
  # rngBoundFactor: This factor determines the range of random gen
  # number once the center value is found
  attr_accessor :rngBoundFactor
  
  # rngAscendPercent: this will determine what the difficulty in ascending to
  # the next round of random number gen is
  # 0.73 is good for startLevel = 0
  # NOTE: It is recommended this value increases up as 'initAscLvl' increases
  #       This is becuase the the RNG value increases exponentially, so it
  #       should be more difficult to reach high ascention levels
  attr_accessor :rngAscendPercent
  
  # rngAscendLimit: This determines how many times the random gen
  # loop can ascend (i.e. stages of your game)
  # It ultimately decides how large of a number can be generated
  attr_accessor :rngAscendLimit
  
  # rngAscendHandicapStep: This value is (optionally)added to 'rngAscendPercent'
  # as the value of 'initAscLvl' increases
  attr_accessor :rngAscendHandicapStep
  
  # rngParamDefaultSet: This is the default array of values used to quickly
  # set the curve parameters. It is based on my own heuristic testing.
  attr_accessor :rngParamDefaultSet
  
  #--------------------------------------------------------------------------
  # * Constants (DEFAULT)
  #   - Each has to do with the formula
  #--------------------------------------------------------------------------
  
  IDX_SCALAR               = 0
  IDX_BASE                 = 1
  IDX_EXPONENT_FACTOR      = 2
  IDX_BOUND_FACTOR         = 3
  IDX_ASCEND_PERC          = 4
  IDX_ASCEND_LIMIT         = 5
  IDX_ASCEND_HANDICAP_STEP = 6
  
  # NOTE: The steps chance increases linearly, but the values within the steps
  #       increase exponentially.
  # Step Increase  | Average Rate
  # +1             | 8%
  # +2             | 2%
  # +3             | 0.5%
  RNG_PARAMETERS_SET_1 = [0, 2, 0.88, 0.8, 0.73, 20, 0.2]
  
  
  def initialize
    @rngParamDefaultSet = RNG_PARAMETERS_SET_1
    reset
  end
  
  def reset
    @rngScalar             = @rngParamDefaultSet[IDX_SCALAR]
    @rngBase               = @rngParamDefaultSet[IDX_BASE]
    @rngExponentFactor     = @rngParamDefaultSet[IDX_EXPONENT_FACTOR]
    @rngBoundFactor        = @rngParamDefaultSet[IDX_BOUND_FACTOR]
    @rngAscendPercent      = @rngParamDefaultSet[IDX_ASCEND_PERC]
    @rngAscendLimit        = @rngParamDefaultSet[IDX_ASCEND_LIMIT]
    @rngAscendHandicapStep = @rngParamDefaultSet[IDX_ASCEND_HANDICAP_STEP]
  end
  
  def coerce(val, lwr, upr)
    return upr unless val < upr
    return lwr unless val > lwr
    return val
  end
  
  def rng_ascension(initAscLvl = 0, useHandicap = false)
    # ascension is the step in expo_step
    # the ascension level or step level is used in the 
    # exponent value of the curve
    
    # Coerce / bound the initial ascension level
    initAscLvl = coerce(initAscLvl, 0, @rngAscendLimit)
    
    # The return ascension level
    ascension = 0
    
    # Set value such that 'ascGuess' must be greater than to ascend a step
    ascThreshold = (@rngAscendPercent * 100).round
    
    # handicap percent value that increases as the ascension level increases
    handicapRngAscendPercent = @rngAscendPercent
    
    # Initial handicap calculation
    if (true == useHandicap)
      # increase the difficulty based on the initial ascension level
      handicapRngAscendPercent = initAscLvl * @rngAscendHandicapStep
      
      # Coerce - Leave atleast 1% change
      if (handicapRngAscendPercent > 0.99)
        handicapRngAscendPercent = 0.99          
      end
    end
    
    range = Array.new(@rngAscendLimit - initAscLvl) { |i| i }
    
    for ascension in range do
      # Guess a value from [0, 100]
      ascGuess = rand(101)
      
      if (true == useHandicap)
        handicapRngAscendPercent += @rngAscendHandicapStep
        
        # Coerce - Leave atleast 1% change
        if (handicapRngAscendPercent > 0.99)
          handicapRngAscendPercent = 0.99          
        end
        
        ascThreshold = (handicapRngAscendPercent * 100).round
      end
      
      # we've reached the highest ascention level
      # if the guess isn't greater than the threshold
      if (ascGuess < ascThreshold)
        break
      end
    end
    
    return ascension
    
  end
  
  def run(initAscLvl, useHandicap = false)
    # initAscLvl = Initial Ascention Level = Starting stage of the ascention
    #              level (i.e. game stage).
    
    # check bounds of initAscLvl
    initAscLvl = coerce(initAscLvl, 0, @rngAscendLimit)
    
    # The exponent is dependend on the initial ascension / step level
    # and some scalar factor
    exponent = rng_ascension(initAscLvl, useHandicap).to_f * @rngExponentFactor
      
    # Calc center = base ^ (exp * factor)
    center = @rngBase.to_f ** exponent
    
    # Lower bound of RNG
    left = (@rngBoundFactor.to_f * center).round
    
    # Upper bound of RNG
    right = (center * (2 - @rngBoundFactor.to_f)).round
    
    # Output RNG value
    rng = ((left + rand(right - left))).round
    
    # Final value
    rng = @rngScalar + rng
    
  end
  
  #--------------------------------------------------------------------------
  # * Macros /  Wrappers
  #--------------------------------------------------------------------------
  def run_1
    run(1)
  end
  
  def run_1_handicap
    run(1, true)
  end
  
  def run_2
    run(2)
  end
  
  def run_2_handicap
    run(2, true)
  end
  
  def run_3
    run(3)
  end
  
  def run_3_handicap
    run(3, true)
  end
  
  def run_4
    run(4)
  end
  
  def run_4_handicap
    run(4, true)
  end
  
  def run_5
    run(5)
  end
  
  def run_5_handicap
    run(5, true)
  end
end

$rng_expo_step = RNG_Expo_Step.new

# <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
# PYTHON SCRIPT
# <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
# https://github.com/MusicInTheTrees/RPGMakerVXAce/blob/main/rng/python/rng_expo_step.py