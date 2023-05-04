
# REFERENCE THIS CLASS THROUGH: $my_vars
$G_MAX_ASCENSION_LEVEL = 6
$G_MAX_WEAPON_VERSION = 4


$G_IDX_MIN_ASCENSION_LEVEL = 41
$G_IDX_MAX_WEAPON_VERSION = 42
$G_IDX_BATTLE_WEAPON_DROP_CHANCE = 43
$G_IDX_BOSS_WEAPON_DROP_CHANCE = 44  


class MyVars
  def newGame
    $game_variables[$G_IDX_MIN_ASCENSION_LEVEL] = 0
    $game_variables[$G_IDX_MAX_WEAPON_VERSION] = 0
    $game_variables[$G_IDX_BATTLE_WEAPON_DROP_CHANCE] = 0.6
    $game_variables[$G_IDX_BOSS_WEAPON_DROP_CHANCE] = 0.4
  end
  
  # ===================================
  # ===== MINIMUM ASCENSION LEVEL =====
  # ===================================
  def min_ascension_level
    return $game_variables[$G_IDX_MIN_ASCENSION_LEVEL]
  end
  
  def min_ascension_level=(val)
    $game_variables[$G_IDX_MIN_ASCENSION_LEVEL] = val
  end
  
  def increment_min_ascension_level
    if min_ascension_level == $G_MAX_ASCENSION_LEVEL
      return
    end
    
    $game_variables[$G_IDX_MIN_ASCENSION_LEVEL] += 1
  end
  
  # ==================================
  # ===== MAXIMUM WEAPON VERSION =====
  # ==================================
  def max_weapon_version
    return $game_variables[$G_IDX_MAX_WEAPON_VERSION]
  end
  
  def max_weapon_version=(val)
    $game_variables[$G_IDX_MAX_WEAPON_VERSION] = val
  end
  
  def increment_max_weapon_version
    if max_weapon_version == $G_MAX_WEAPON_VERSION
      return
    end
    
    $game_variables[$G_IDX_MAX_WEAPON_VERSION] += 1
  end
  
  # ==============================
  # ===== BATTLE DROP CHANCE =====
  # ==============================
  def battle_drop_chance
    return $game_variables[$G_IDX_BATTLE_WEAPON_DROP_CHANCE]
  end
  
  def battle_drop_chance=(val)
    $game_variables[$G_IDX_BATTLE_WEAPON_DROP_CHANCE] = val
  end  
  
  # ============================
  # ===== BOSS DROP CHANCE =====
  # ============================
  def boss_drop_chance
    return $game_variables[$G_IDX_BOSS_WEAPON_DROP_CHANCE]
  end
  
  def boss_drop_chance=(val)
    $game_variables[$G_IDX_BOSS_WEAPON_DROP_CHANCE] = val
  end  
  
  # ===================================
  # =====  =====
  # ===================================
  
  
  # ===================================
  # =====  =====
  # ===================================
  
  
  # ===================================
  # =====  =====
  # ===================================
end


$my_vars = MyVars.new