

class RNG_Drop_Article
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :artDbInitIdx
  
  #--------------------------------------------------------------------------
  # * Methods
  #--------------------------------------------------------------------------
  def initialize(artDbInitIdx = 0, artTypeCount = 1)
    
    @rng_article_asc = RNG_Expo_Step.new
    
    # init 'artDbInitIdx'
    if artDbInitIdx == nil
      @artDbInitIdx = 0
      err("artDbInitIdx parameter was nil")
    else
      @artDbInitIdx = artDbInitIdx
    end
    
    # init 'artTypeCount'
    if artTypeCount == nil || artTypeCount < 0
      @artTypeCount = 0
      err("artTypeCount parameter was nil OR 0")
    else
      @artTypeCount = artTypeCount
    end
    
    # update RNG parameters - up to, but not including count
    @rng_article_asc.rngStepLimit = artTypeCount-1
  end
  
  def artTypeCount
    @artTypeCount
  end
  
  def artTypeCount=(value)
    set_artTypeCount(value)
  end
  
  def set_artTypeCount(value)
    @artTypeCount = value
    # update RNG parameters - up to, but not including count
    @rng_article_asc.rngStepLimit = @artTypeCount-1
  end
  
  def get_article_version(data_article, startAscension = 0)
    # 'data_article' is the RPGMakerVxAce database array (e.g. $data_weapons)
    if data_article == nil
      err("data_article (database array) is nil")
    end
    
    if startAscension < 0
      startAscension = 0
    elsif startAscension > @artTypeCount
      startAscension = @artTypeCount
    end
      
    # Get a version of a group of certain article types
    ascension = @rng_article_asc.rng_ascension(startAscension)
    
    artIdx = @artDbInitIdx + ascension
    
    article = data_article[artIdx]
    
    if article == nil
      err("Article does not exist at index: " + wpnIdx.to_s)
      return false
    end
    
    return article, ascension
  end
  
  def set_article_db_params(idx, count)
    @artDbInitIdx = idx
    @artTypeCount = count
    # update RNG parameters - up to, but not including count
    @rng_article_asc.rngStepLimit = @artTypeCount-1
  end
  
  def self.add_article_to_party(art, count = 1, msg = false)
    if art == nil
      err("Article is nil. Can't add nil to inventory")
      return
    elsif count < 1
      err("Article count < 0")
      return
    elsif count > 99
      count = 99
    end
    $game_party.gain_item(art, count)
    
    if true == msg
      RNG_Drop_Article.msg_drop_article(art.name, count)
    end
  end
  
  def self.drop_success(dropChance)
    return false unless dropChance > 0
    return true unless dropChance != 1
    
    if dropChance > 1
      dropChance = dropChance.to_f / 100.0
    end
    
    # If guess [rand(1.0)] is within 'dropChance' -> Drop!
    return false unless rand(1.0) <= dropChance
    return true
  end
  
  def self.msg_drop_article(artcleName, count)
    msg = "You found "
    
    if count < 1
      return
    elsif count > 1
      msg += count.to_s + " " + artcleName + "s!"
    else
      msg += "a " + artcleName + "!"
    end
    
    $game_message.add(msg)
  end
  
  def err(errStr, title = "RNG_Drop_Article")
    puts "ERROR" + "(" + title + "): " + errStr
  end
  
  
end