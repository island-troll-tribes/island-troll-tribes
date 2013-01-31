
globals
  group cook_fire = CreateGroup()
endglobals

function CookSpellAbility takes nothing returns boolean
  return GetSpellAbilityId() == 'A04B'
endfunction

function MeatCookingActions takes nothing returns nothing
  local unit SPELLCASTER = GetSpellAbilityUnit()
  call GroupEnumUnitsInRange(cook_fire, GetUnitX(SPELLCASTER) , GetUnitY(SPELLCASTER) , 600, Condition(function FilterUnitIsCorpse))
  call ForGroup(cook_fire, function ConvertEnumCorpseToCookedMeat )
  set SPELLCASTER = null
endfunction

function InitTrig_cook_meat3 takes nothing returns nothing
  set gg_trg_cook_meat3 = CreateTrigger(  )
  call TriggerRegisterAnyUnitEventBJ( gg_trg_cook_meat3, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
  call TriggerAddCondition( gg_trg_cook_meat3, Condition( function CookSpellAbility ) )
  call TriggerAddAction( gg_trg_cook_meat3, function MeatCookingActions )
endfunction