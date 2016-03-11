
function Trig_stack_array_inits_Actions takes nothing returns nothing
  set udg_stackables[0]=ITEM_IRON_SPEAR//iron spear
  set udg_stackables[1]=ITEM_LIVING_CLAY//living clay
  set udg_stackables[2]=ITEM_MAGIC_SEED//magic seed
  set udg_stackables[3]=ITEM_NETS//nets
  set udg_stackables[4]=ITEM_POISON_SPEAR//poison spear
  set udg_stackables[5]=ITEM_REFINED_POISON_SPEAR//refined poison spear
  set udg_stackables[6]=ITEM_SPEAR//spear
  set udg_stackables[7]=ITEM_STEEL_SPEAR//steel spear
  set udg_stackables[8]=ITEM_THISTLES//Thistles
  set udg_stackables[9]=ITEM_ULTRA_POISON_SPEAR//Ultra poison spear
  set udg_stackables[10]=ITEM_ACORN//Acorn
  set udg_stackables[11]=ITEM_COOKED_MEAT//Meat
  set udg_stackables[12]=ITEM_MAGIC_ACORN//Magic Acorn
  set udg_stackables[13]=ITEM_SMOKE_BOMB//Smoke Bomb
  set udg_stackables[14]=ITEM_HEALING_POTION_I//Healing Potion 1
  set udg_stackables[15]=ITEM_HEALING_POTION_II//Healing Potion 2
  set udg_stackables[16]=ITEM_HEALING_POTION_III//Healing Potion 3
  set udg_stackables[17]=ITEM_HEALING_POTION_IV//Healing Potion 4
  set udg_stackables[18]=ITEM_ANABOLIC_POTION//Anabolic Potion
  set udg_stackables[19]=ITEM_DRUNKS_POTION//Drunk's Potion
  set udg_stackables[20]=ITEM_ELEMENTAL_SHIELD_POTION//Elemental Shield Potion
  set udg_stackables[21]=ITEM_NETHER_POTION//Nether Potion
  set udg_stackables[22]=ITEM_MANA_POTION_I//Mana Potion I
  set udg_stackables[23]=ITEM_MANA_POTION_II//Mana Potion II
  set udg_stackables[24]=ITEM_MANA_POTION_III//Mana Potion III
  set udg_stackables[25]=ITEM_MANA_POTION_IV//Mana Potion IV
  set udg_stackables[26]=ITEM_FERVER_POTION//Fervor Potion
  set udg_stackables[27]=ITEM_ANTI_MAGIC_POTION//Anti Magic Potion
  set udg_stackables[28]=ITEM_DARK_THISTLES//Dark Thistles
  set udg_stackables[29]=ITEM_BEE_HIVE//Bee Hive
  set udg_stackables[30]=ITEM_DISEASE_POTION//Disease Potion
  set udg_stackables[31]=ITEM_ENSNARE_TRAP_KIT//Ensnare Traps
  set udg_stackables[32]=ITEM_POTION_TWIN_ISLANDS//Potion of Twin Islands
  set udg_stackables[33]=ITEM_DARK_SPEAR//Dark Spear
  set udg_stackables[34]=ITEM_CURE_ALL//Cure All
  set udg_stackables[35]=ITEM_DISEASED_MEAT//Diseased Meat
  set udg_stackables[36]=ITEM_FIRE_BOMB//Fire Bomb
  set udg_stackables[37]=ITEM_ACID_BOMB//Acid BomB
  set udg_stackables[38]=ITEM_NAPALM//Napalm
  set udg_stackables[39]=ITEM_SMOKED_MEAT//Smoked Meat
  
  set udg_stackable_max[0]=3//iron spear
  set udg_stackable_max[1]=6//living clay
  set udg_stackable_max[2]=6//magic seed
  set udg_stackable_max[3]=8//nets
  set udg_stackable_max[4]=5//poison spear
  set udg_stackable_max[5]=4//refined poison spear
  set udg_stackable_max[6]=6//spear
  set udg_stackable_max[7]=2//steel spear
  set udg_stackable_max[8]=15//Thistles
  set udg_stackable_max[9]=2//Ultra poison spear
  set udg_stackable_max[10]=10//Acorn
  set udg_stackable_max[11]=10//Meat
  set udg_stackable_max[12]=8//Magic Acorn
  set udg_stackable_max[13]=5//Smoke Bomb
  set udg_stackable_max[14]=6//Healing Potion 1
  set udg_stackable_max[15]=5//Healing Potion 2
  set udg_stackable_max[16]=4//Healing Potion 3
  set udg_stackable_max[17]=4//Healing Potion 4
  set udg_stackable_max[18]=2//Anabolic Potion
  set udg_stackable_max[19]=3//Drunk's Potion
  set udg_stackable_max[20]=3//Elemental Shield Potion
  set udg_stackable_max[21]=5//Nether Potion
  set udg_stackable_max[22]=6//Mana Potion 1
  set udg_stackable_max[23]=5//Mana Potion 2
  set udg_stackable_max[24]=4//Mana Potion 3
  set udg_stackable_max[25]=4//Mana Potion 4
  set udg_stackable_max[26]=2//Fervor Potion
  set udg_stackable_max[27]=4//Anti Magic Potion
  set udg_stackable_max[28]=15//Dark Thistles
  set udg_stackable_max[29]=2//Bee Hive
  set udg_stackable_max[30]=2//Disease Potion
  set udg_stackable_max[31]=3//Ensnare Traps
  set udg_stackable_max[32]=2//Potion of Twin Islands
  set udg_stackable_max[33]=3//Dark Spear
  set udg_stackable_max[34]=6//Cure All
  set udg_stackable_max[35]=10//Diseased Meat
  set udg_stackable_max[36]=2//Fire Bomb
  set udg_stackable_max[37]=2//Acid BomB
  set udg_stackable_max[38]=1//napalm
  set udg_stackable_max[39]=10//Smoked Meat
  
  set udg_stackables_UBound=39
endfunction

function InitTrig_stack_array_inits takes nothing returns nothing
    set gg_trg_stack_array_inits = CreateTrigger(  )
    call TriggerAddAction( gg_trg_stack_array_inits, function Trig_stack_array_inits_Actions )
endfunction

