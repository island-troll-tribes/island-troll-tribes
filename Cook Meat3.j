
//
// Version 3, this one doesn't make your troll dissapear ;) 
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function CookSpellAbility takes nothing returns boolean
    return GetSpellAbilityId() == 'A04B'
endfunction

function MeatCorpse takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_MEAT
endfunction

function ConvertMeat takes nothing returns nothing
local unit u = GetEnumUnit()
local integer INTEGER = 0
call CreateItem( ITEM_COOKED_MEAT, GetUnitX(u),GetUnitY(u))
call RemoveUnit(GetEnumUnit())
if ARRAY_MATICS[2] != ITEM_COOKED_MEAT then
    loop
    exitwhen INTEGER > 10
        call CreateItem( ITEM_COOKED_MEAT, GetUnitX(u),GetUnitY(u))
    endloop
endif
set u = null
endfunction

function MeatCookingActions takes nothing returns nothing
local unit SPELLCASTER = GetSpellAbilityUnit()
call GroupEnumUnitsInRange(cook_fire, GetUnitX(SPELLCASTER) , GetUnitY(SPELLCASTER) , 600, Condition(function MeatCorpse))
//GetUnitsInRangeMatching(600.00, GetUnitX(SPELLCASTER), GetUnitY(SPELLCASTER), Condition(function MeatCorpse))
call ForGroup(cook_fire, function ConvertMeat )
set SPELLCASTER = null
endfunction
globals
    group cook_fire = CreateGroup()
endglobals

//===========================================================================
function InitTrig_cook_meat3 takes nothing returns nothing
set gg_trg_cook_meat3 = CreateTrigger(  )
call TriggerRegisterAnyUnitEventBJ( gg_trg_cook_meat3, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
call TriggerAddCondition( gg_trg_cook_meat3, Condition( function CookSpellAbility ) )
call TriggerAddAction( gg_trg_cook_meat3, function MeatCookingActions )
endfunction

//===========================================================================
