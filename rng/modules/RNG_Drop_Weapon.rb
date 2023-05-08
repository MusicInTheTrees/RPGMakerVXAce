#==============================================================================
#
# ⌠ 
# │ Module:.... RNG_Drop_Weapon
# │ Author:.... MusicInTheTrees
# │ Created:... 28 April 2023
# │ Version:... 1.0
# ⌡
#
# -- Description
#  This class returns an arbitrary weapon given a few parameters.
#  These parameters are very specific to how the user places the weapons
#  in the database.
#==============================================================================

class RNG_Drop_Weapon < RNG_Drop_Equip
  #--------------------------------------------------------------------------
  # * Constants
  #--------------------------------------------------------------------------
  PARAM_IDX_ATK = 2
  
  #--------------------------------------------------------------------------
  # * Methods
  #--------------------------------------------------------------------------
  def initialize(wpnDbInitIdx = 0, wpnTypeCount = 1)
    super(wpnDbInitIdx, wpnTypeCount)
  end
  
  def get_weapon_from_db(wpnCopy)
    $data_weapons[RNG_Generate_Weapon.generate(wpnCopy)]
  end
  
  def drop_new_weapon(dbidx, count, startAscension = 0, dropChance = 1)
    if false == drop_success(dropChance)
      return nil
    end
    
    set_equip_db_params(dbidx, count)
    
    wpnRet = get_article_version($data_weapons, startAscension)
    
    wpnVersion = wpnRet[0]
    
    ascensionLevel = wpnRet[1]
    
    newWpn = get_weapon_from_db(wpnVersion)
    
    atkRet = get_equip_value(ascensionLevel, wpnVersion.params[PARAM_IDX_ATK])
    
    newWpn.params[PARAM_IDX_ATK] = atkRet[0]
    
    lvl = atkRet[1]
    
    newWpn.name = get_equip_name(newWpn, 
                                 ascensionLevel, 
                                 newWpn.params[PARAM_IDX_ATK])
    
    return newWpn
    
  end
  
end