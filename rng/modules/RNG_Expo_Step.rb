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
  
  # rngStepPercent: this will determine what the difficulty in stepping up to
  # the next round of random number gen is
  # 0.73 is good for startLevel = 0
  # NOTE: It is recommended this value increases up as 'initStepLvl' increases
  #       This is becuase the the RNG value increases exponentially, so it
  #       should be more difficult to reach high ascention levels
  attr_accessor :rngStepPercent
  
  # rngStepLimit: This determines how many times the random gen
  # loop can ascend a step (i.e. stages of your game)
  # It ultimately decides how large of a number can be generated
  attr_accessor :rngStepLimit
  
  # rngStepHandicapStep: This value is (optionally)added to 'rngStepPercent'
  # as the value of 'initStepLvl' increases
  attr_accessor :rngStepHandicapStep
  
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
  IDX_STEP_PERC            = 4
  IDX_STEP_LIMIT           = 5
  IDX_STEP_HANDICAP_STEP   = 6
  
  # NOTE: The steps chance increases linearly, but the values within the steps
  #       increase exponentially.
  # Step Increase  | Average Rate
  # +1             | 8%
  # +2             | 2%
  # +3             | 0.5%
  RNG_PARAMETERS_SET_1 = [0, 2, 0.88, 0.8, 0.73, 20, 0.2]
  
  
  def initialize
    @rngParamDefaultSet = RNG_PARAMETERS_SET_1.dup
    reset
  end
  
  def reset
    @rngScalar             = @rngParamDefaultSet[IDX_SCALAR]
    @rngBase               = @rngParamDefaultSet[IDX_BASE]
    @rngExponentFactor     = @rngParamDefaultSet[IDX_EXPONENT_FACTOR]
    @rngBoundFactor        = @rngParamDefaultSet[IDX_BOUND_FACTOR]
    @rngStepPercent        = @rngParamDefaultSet[IDX_STEP_PERC]
    @rngStepLimit          = @rngParamDefaultSet[IDX_STEP_LIMIT]
    @rngStepHandicapStep   = @rngParamDefaultSet[IDX_STEP_HANDICAP_STEP]
  end
  
  def coerce(val, lwr, upr)
    return upr unless val < upr
    return lwr unless val > lwr
    return val
  end
  
  def pure_curve(initStepLvl = 0)
    # check bounds of initStepLvl - min level is 1
    initStepLvl = coerce(initStepLvl, 1, @rngStepLimit)
    
    # The exponent is dependend on the initial ascension / step level
    # and some scalar factor
    exponent = initStepLvl * @rngExponentFactor
      
    # Calc curve = scalar + base ^ (exp * factor)
    curve = @rngScalar + @rngBase ** exponent
  end
  
  def left_of_center(center)
    (@rngBoundFactor * center).round
  end
  
  def right_of_center(center)
    (center * (2 - @rngBoundFactor)).round
  end
  
  def rng_grade(ascensionLevel, rngVal)
    curve = pure_curve(ascensionLevel)
    center = curve# - @rngScalar
    
    max_val = @rngScalar + right_of_center(center)
    
    # S = >0.98
    # A = >0.9
    # B = >0.8
    # C = >0.7
    # D = >0.6
    # F = > 0.5
    
    if rngVal < (0.6 * max_val)
      return "F"
    elsif rngVal < (0.7 * max_val)
      return "D"
    elsif rngVal < (0.8 * max_val)
      return "C"
    elsif rngVal < (0.9 * max_val)
      return "B"
    elsif rngVal < (0.98 * max_val)
      return "A"
    else
      return "S"
    end
  end
  
  def rng_ascension(initStepLvl = 0, useHandicap = false, maxAscLvl = nil)
    # ascension is the step in expo_step
    # the ascension level or step level is used in the 
    # exponent value of the curve
    
    # Coerce / bound the initial ascension level
    initStepLvl = coerce(initStepLvl, 0, @rngStepLimit)
    
    # The return ascension level
    ascension = initStepLvl
    
    # Set value such that 'ascGuess' must be greater than to ascend a step
    ascThreshold = (@rngStepPercent * 100).round
    
    # handicap percent value that increases as the ascension level increases
    handicapRngStepPercent = @rngStepPercent
    
    # Initial handicap calculation
    if (true == useHandicap)
      # increase the difficulty based on the initial ascension level
      handicapRngStepPercent = initStepLvl * @rngStepHandicapStep
      
      # Coerce - Leave atleast 1% change
      if (handicapRngStepPercent > 0.99)
        handicapRngStepPercent = 0.99          
      end
    end
    
    # Check if the user has set an alternative limit
    limit = @rngStepLimit
    if (maxAscLvl != nil)
      limit = maxAscLvl
    end
    
    # evaluate range of ascension
    size = limit - initStepLvl
    
    # if size is legitimate
    if size > 0
      range = Array.new(limit - initStepLvl) { |i| i }
      
      for i in range do
        # Guess a value from [0, 100]
        ascGuess = rand(101)
        
        if (true == useHandicap)
          handicapRngStepPercent += @rngStepHandicapStep
          
          # Coerce - Leave atleast 1% change
          if (handicapRngStepPercent > 0.99)
            handicapRngStepPercent = 0.99          
          end
          
          ascThreshold = (handicapRngStepPercent * 100).round
        end
        
        # we've reached the highest ascention level
        # if the guess isn't greater than the threshold
        if (ascGuess < ascThreshold)
          break
        else
          ascension += 1
        end
      end
    end
    
    return ascension
    
  end
  
  def run(initStepLvl, useHandicap = false)
    # initStepLvl = Initial Ascention Level = Starting stage of the ascention
    #              level (i.e. game stage).
    
    # check bounds of initStepLvl - min level is 1
    initStepLvl = coerce(initStepLvl, 1, @rngStepLimit)
    
    # The exponent is dependend on the initial ascension / step level
    # and some scalar factor
    ascensionLevel = rng_ascension(initStepLvl, useHandicap)
    exponent = ascensionLevel * @rngExponentFactor
      
    # Calc center = base ^ (exp * factor)
    center = @rngBase ** exponent
    
    # Lower bound of RNG
    left = (@rngBoundFactor * center).round
    
    # Upper bound of RNG
    right = (center * (2 - @rngBoundFactor)).round
    
    # Output RNG value
    rng = ((left + rand(right - left))).round
    
    # Final value
    rng = @rngScalar + rng
    
    return rng, ascensionLevel
    
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