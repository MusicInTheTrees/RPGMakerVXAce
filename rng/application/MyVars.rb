
# REFERENCE THIS CLASS THROUGH: $my_vars
$G_MAX_ASCENSION_LEVEL = 6
$G_MAX_WEAPON_VERSION = 4


$G_IDX_MIN_ASCENSION_LEVEL = 41
$G_IDX_MAX_WEAPON_VERSION = 42
$G_IDX_BATTLE_WEAPON_DROP_CHANCE = 43
$G_IDX_BOSS_WEAPON_DROP_CHANCE = 44
$G_IDX_REG_CHEST_DROP_CHANCE = 45
$G_IDX_SPC_CHEST_DROP_CHANCE = 46


class MyVars
  def initialize
    @newGameInit = false
  end
  
  def newGame
    if false == @newGameInit
      set_min_ascension_level(0)
      
      # If max_weapon_version is 0, it will default to 
      # the actual maximum version (4)
      set_max_weapon_version(0)
      
      set_battle_drop_chance(0.6)
      
      set_boss_drop_chance(0.4)
      
      set_reg_chest_drop_chance(1)
      
      set_spc_chest_drop_chance(0.5)
      
      $drop_daggers    = Drop_Daggers.new
      $drop_hammers    = Drop_Hammers.new
      $drop_staffs     = Drop_Staffs.new
      $drop_long_range = Drop_LongRange.new
    end
    
    @newGameInit = true
  end
  
  def is_initialized
    return @newGameInit
  end
  
  # ===================================
  # ===== MINIMUM ASCENSION LEVEL =====
  # ===================================
  # The minimum ascension level defines which ascension level (power level)
  # of a particular weapon version to start at. 
  # e.g. Daggers: Box Cutter Lead | Zinc | Titanium | Steel | etc.
  #      Minimum Ascension Level: 2
  #      Minimum Dagger Drop: Box Cutter Titanium
  # -----------------------------------
  def min_ascension_level
    return $game_variables[$G_IDX_MIN_ASCENSION_LEVEL]
  end
  
  def set_min_ascension_level(val)
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
  # The maximum weapon version defines the latest version of a weapon type.
  # e.g. Dagger Versions: Box Cutter | Switch Blade | Chef's Knife | etc.
  #      Maximum Weapon Version: 1
  #      Dagger Version Drops: Box Cutter | Switch Blade
  # ----------------------------------
  def max_weapon_version
    return $game_variables[$G_IDX_MAX_WEAPON_VERSION]
  end
  
  def set_max_weapon_version(val)
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
  
  def set_battle_drop_chance(val)
    $game_variables[$G_IDX_BATTLE_WEAPON_DROP_CHANCE] = val
  end  
  
  # ============================
  # ===== BOSS DROP CHANCE =====
  # ============================
  def boss_drop_chance
    return $game_variables[$G_IDX_BOSS_WEAPON_DROP_CHANCE]
  end
  
  def set_boss_drop_chance(val)
    $game_variables[$G_IDX_BOSS_WEAPON_DROP_CHANCE] = val
  end  
  
  # =====================================
  # ===== REGULAR CHEST DROP CHANCE =====
  # =====================================
  def reg_chest_drop_chance
    return $game_variables[$G_IDX_REG_CHEST_DROP_CHANCE]
  end
  
  def set_reg_chest_drop_chance(val)
    $game_variables[$G_IDX_REG_CHEST_DROP_CHANCE] = val
  end
  
  # =====================================
  # ===== SPECIAL CHEST DROP CHANCE =====
  # =====================================
  def spc_chest_drop_chance
    return $game_variables[$G_IDX_SPC_CHEST_DROP_CHANCE]
  end
  
  def set_spc_chest_drop_chance(val)
    $game_variables[$G_IDX_SPC_CHEST_DROP_CHANCE] = val
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
  
  # ===================================
  # =====  =====
  # ===================================
end


$my_vars = MyVars.new