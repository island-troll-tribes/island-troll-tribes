
library IsTypeThing requires ID

  function IsUnitTroll takes unit u returns boolean
    return UNIT_TROLL_ALL.has( GetUnitTypeId( u ) ) or GetUnitTypeId( u ) == UNIT_CRAFT_MASTER // pretty hacky... oh well...
  endfunction

  function IsUnitThiefClass takes unit u returns boolean
    local integer id = GetUnitTypeId(u)
    return id == UNIT_THIEF or id == UNIT_ESCAPE_ARTIST or id == UNIT_CONTORTIONIST or id == UNIT_ASSASSIN
  endfunction

  function IsUnitHawk takes unit u returns boolean
    return GetUnitTypeId(u) == UNIT_BRONZE_DRAGON_HATCHLING or GetUnitTypeId(u) == UNIT_FOREST_DRAGON_HATCHLING or GetUnitTypeId(u) == UNIT_HAWK_HATCHLING or GetUnitTypeId(u) == UNIT_NETHER_DRAGON_HATCHLING or GetUnitTypeId(u) == UNIT_RED_DRAGON_HATCHLING or GetUnitTypeId(u) == UNIT_BRONZE_DRAGON or GetUnitTypeId(u) == UNIT_FOREST_DRAGON or GetUnitTypeId(u) == UNIT_HAWK or GetUnitTypeId(u) == UNIT_HAWK_ADOLESCENT or GetUnitTypeId(u) == 'n00K' or GetUnitTypeId(u) == 'n00T' or GetUnitTypeId(u) == UNIT_ALPHA_HAWK or GetUnitTypeId(u) == UNIT_GREATER_BRONZE_DRAGON or GetUnitTypeId(u) == UNIT_GREATER_FOREST_DRAGON or GetUnitTypeId(u) == UNIT_GREATER_NETHER_DRAGON or GetUnitTypeId(u) == UNIT_GREATER_RED_DRAGON
  endfunction

  function IsUnitBoss takes unit u returns boolean
    local integer uid = GetUnitTypeId(u)
    return uid == UNIT_ALIGATOR_MAN or uid == UNIT_ANCIENT_HYDRA or uid == UNIT_DISCO_DUCK or uid == UNIT_LESSER_HYDRA or uid == UNIT_MAGENTA_FISH or uid == UNIT_MAMMOTH or uid == UNIT_ONE or uid == UNIT_RAPID_TURTLE or uid == UNIT_ELDER_PANTHER
  endfunction

  function IsItemHide takes item i returns boolean
    return GetItemTypeId(i) == ITEM_ELK_HIDE or GetItemTypeId(i) == ITEM_JUNGLE_WOLF_HIDE or GetItemTypeId(i) == ITEM_JUNGLE_BEAR_HIDE
  endfunction

  function IsItemPole takes item i returns boolean
    return GetItemTypeId(i) == ITEM_BONE or GetItemTypeId(i) == ITEM_STICK
  endfunction

  function IsItemCoat takes item i returns boolean
    return GetItemTypeId(i) == ITEM_ELK_SKIN_COAT or GetItemTypeId(i) == ITEM_BEAR_SKIN_COAT or GetItemTypeId(i) == ITEM_WOLF_SKIN_COAT or GetItemTypeId(i) == ITEM_BONE_COAT or GetItemTypeId(i) == ITEM_BATTLE_SUIT or GetItemTypeId(i) == ITEM_IRON_COAT or GetItemTypeId(i) == ITEM_STEEL_COAT or GetItemTypeId(i) == ITEM_CAMOUFLAGE_COAT or GetItemTypeId(i)==ITEM_BATTLE_ARMOR or GetItemTypeId(i) == ITEM_BATTLE_SUIT or GetItemTypeId(i) == ITEM_HARDEN_SCALES or GetItemTypeId(i) == ITEM_CLOAK_OF_FLAMES or GetItemTypeId(i) == ITEM_CLOAK_OF_FROST or GetItemTypeId(i) == ITEM_CLOAK_OF_HEALING or GetItemTypeId(i) == ITEM_BATTLE_SUIT
  endfunction

  function IsItemPinion takes item i returns boolean
    return GetItemTypeId(i) == ITEM_DD_PINION_FIRE or GetItemTypeId(i) == ITEM_DD_PINION_SHADOW or GetItemTypeId(i) == ITEM_DD_PINION_PAIN
  endfunction

  function IsItemGloves takes item i returns boolean
    return GetItemTypeId(i) == ITEM_ELK_SKIN_GLOVES or GetItemTypeId(i) == ITEM_WOLF_SKIN_GLOVES or GetItemTypeId(i) == ITEM_BEAR_SKIN_GLOVES or GetItemTypeId(i) == ITEM_BONE_GLOVES or GetItemTypeId(i) == ITEM_IRON_GLOVES or GetItemTypeId(i) == ITEM_STEEL_GLOVES or GetItemTypeId(i) == ITEM_BATTLE_GLOVES or GetItemTypeId(i) == ITEM_HYDRA_CLAWS or GetItemTypeId(i) == ITEM_BATTLE_SUIT
  endfunction

  function IsItemBoots takes item i returns boolean
    return GetItemTypeId(i) == ITEM_ELK_SKIN_BOOTS or GetItemTypeId(i) == ITEM_WOLF_SKIN_BOOTS or GetItemTypeId(i) == ITEM_BEAR_SKIN_BOOTS or GetItemTypeId(i) == ITEM_BONE_BOOTS or GetItemTypeId(i) == ITEM_IRON_BOOTS or GetItemTypeId(i) == ITEM_STEEL_BOOTS or GetItemTypeId(i) == ITEM_ANABOLIC_BOOTS or GetItemTypeId(i) == ITEM_HYDRAAC_FINS or GetItemTypeId(i) == ITEM_BATTLE_SUIT
  endfunction

  function IsItemSpell takes item i returns boolean
    return GetItemTypeId(i) == ITEM_MAGIC_SEED or GetItemTypeId(i) == ITEM_SCROLL_FIREBALL or GetItemTypeId(i) == ITEM_SCROLL_LIVING_DEAD or GetItemTypeId(i) == ITEM_SCROLL_ENTANGLING_ROOTS or GetItemTypeId(i) == ITEM_SCROLL_STONE_ARMOR or GetItemTypeId(i) == ITEM_SCROLL_CYCLONE or GetItemTypeId(i) == ITEM_SCROLL_TSUNAMI or GetItemTypeId(i) == ITEM_SCROLL_SWIFTNESS
  endfunction

  function IsItemAnyAxe takes item i returns boolean
    return GetItemTypeId(i) == ITEM_FLINT_AXE or GetItemTypeId(i) == ITEM_STONE_AXE or GetItemTypeId(i) == ITEM_IRON_AXE or GetItemTypeId(i) == ITEM_STEEL_AXE or GetItemTypeId(i)==ITEM_MAGE_MASHER or GetItemTypeId(i) == ITEM_BATTLE_AXE or GetItemTypeId(i) == ITEM_BATTLE_SUIT or GetItemTypeId(i) == ITEM_BATTLE_SPEAR
  endfunction

  function IsItemAnyShield takes item i returns boolean
    return GetItemTypeId(i) == ITEM_SHIELD or GetItemTypeId(i) == ITEM_BONE_SHIELD or GetItemTypeId(i) == ITEM_IRON_SHIELD or GetItemTypeId(i) == ITEM_STEEL_SHIELD or GetItemTypeId(i) == ITEM_BATTLE_SHIELD or GetItemTypeId(i) == ITEM_BATTLE_SUIT
  endfunction

  function IsItemAxeOrShield takes item i returns boolean
    return IsItemAnyAxe(i) or IsItemAnyShield(i)
  endfunction

  function IsItemBasicBoots takes item i returns boolean
    return GetItemTypeId(i) == ITEM_WOLF_SKIN_BOOTS or GetItemTypeId(i) == ITEM_ELK_SKIN_BOOTS or GetItemTypeId(i) == ITEM_BEAR_SKIN_BOOTS
  endfunction

  function IsItemBasicGloves takes item i returns boolean
    return GetItemTypeId(i) == ITEM_ELK_SKIN_GLOVES or GetItemTypeId(i) == ITEM_WOLF_SKIN_GLOVES or GetItemTypeId(i) == ITEM_BEAR_SKIN_GLOVES
  endfunction

  function IsItemBasicCoat takes item i returns boolean
    return GetItemTypeId(i) == ITEM_ELK_SKIN_COAT or GetItemTypeId(i) == ITEM_BEAR_SKIN_COAT or GetItemTypeId(i) == ITEM_WOLF_SKIN_COAT
  endfunction

  function IsItemBasicShield takes item i returns boolean
    return GetItemTypeId(i) == ITEM_SHIELD
  endfunction

  function IsUnitTradeShip takes unit u returns boolean
    return GetUnitTypeId(u) == UNIT_TRADE_SHIP_1 or GetUnitTypeId(u) == UNIT_TRADE_SHIP_2 or GetUnitTypeId(u) == UNIT_TRADE_SHIP_3 or GetUnitTypeId(u) == UNIT_TRADE_SHIP_4 or GetUnitTypeId(u) == UNIT_TRADE_SHIP_5 or GetUnitTypeId(u) == UNIT_TRADE_SHIP_6
  endfunction

  function IsDestructableTree takes destructable d returns boolean
    return GetDestructableTypeId(d) == DEST_RUINS_TREE or GetDestructableTypeId(d) == DEST_FALSE_TREE or GetDestructableTypeId(d) == DEST_RUINS_TREE_CANOPY or GetDestructableTypeId(d) == DEST_RUINS_TREE_ITEM or GetDestructableTypeId(d) == DEST_SUPER_TREE or GetDestructableTypeId(d) == DEST_SUPER_TREE_CANOPY
  endfunction
endlibrary
