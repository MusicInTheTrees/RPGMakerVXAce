

class RNG_Drop_Equip < RNG_Drop_Article
  def initialize(eqpDbInitIdx = 0, eqpTypeCount = 1)
    super(eqpDbInitIdx, eqpTypeCount)
    
    @rng_equip_val = RNG_Expo_Step.new
    
    # update RNG parameters - up to, but not including count
    @rng_equip_val.rngStepLimit = eqpTypeCount - 1
  end
  
  def set_eqpTypeCount(value)
    set_artTypeCount(value)
    @rng_equip_val.rngStepLimit = @eqpTypeCount-1
  end
  
  def set_equip_db_params(idx, count)
    set_article_db_params(idx, count)
    @rng_equip_val.rngStepLimit = count - 1
  end
  
  def get_equip_value(startAscension = 0, scalar = -1)
    if scalar >= 0
      @rng_equip_val.rngScalar = scalar
    end
    val = @rng_equip_val.run(startAscension)
    return val[0], val[1]
  end
  
  def get_equip_grade(ascensionLevel, value)
    return @rng_equip_val.rng_grade(ascensionLevel, value)
  end
  
  def get_equip_name(eqp, ascensionLevel, value)
    name = ""
    if eqp != nil
      name = eqp.name + " "
    end
    
    name += get_equip_grade(ascensionLevel, value)
  end
  
end