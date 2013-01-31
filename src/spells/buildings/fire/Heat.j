
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_heat_Conditions takes nothing returns boolean
    return udg_STARTED and GetSpellAbilityId() == 'A002'
endfunction

globals
    unit tempFirer
endglobals

function IsInRangeForHeat takes nothing returns nothing
local real dx = GetUnitX(GetEnumUnit()) - GetUnitX(tempFirer)
local real dy = GetUnitY(GetEnumUnit()) - GetUnitY(tempFirer)
//call DisplayText(R2S(SquareRoot(dx * dx + dy * dy)))
if SquareRoot(dx * dx + dy * dy) <= 380 and IsUnitAlly(GetEnumUnit(), GetOwningPlayer(tempFirer)) then
    call SetPlayerStateBJ( GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD, IMinBJ(( GetPlayerState(GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD) + udg_HEAT_PER_CAST ), udg_MAX_HEAT) )
endif
endfunction

function AoEHeatUpV takes nothing returns nothing
    if checkTroll(GetSpellTargetUnit()) then
        if GetUnitAbilityLevel(GetSpellTargetUnit(), 'BCbf') > 0 then
            call UnitRemoveAbility( GetSpellTargetUnit() ,'BCbf')
        endif
        set tempFirer = GetSpellAbilityUnit()
        call ForGroup(udg_trolls, function IsInRangeForHeat)
    endif
endfunction

/*
function Trig_heat_Actions takes nothing returns nothing
    set udg_booleanParameter = checkTroll(GetSpellTargetUnit())
    if udg_booleanParameter then
        if GetUnitAbilityLevel(GetSpellTargetUnit(), 'BCbf') > 0 then
            call UnitRemoveAbility( GetSpellTargetUnit() ,'BCbf')
        endif
        call SetPlayerStateBJ( GetOwningPlayer(GetSpellTargetUnit()), PLAYER_STATE_RESOURCE_GOLD, IMinBJ(( GetPlayerState(GetOwningPlayer(GetSpellTargetUnit()), PLAYER_STATE_RESOURCE_GOLD) + udg_HEAT_PER_CAST ), udg_MAX_HEAT) )
    endif
endfunction
*/

//===========================================================================
function InitTrig_heat takes nothing returns nothing
    set gg_trg_heat = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_heat, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_heat, Condition( function Trig_heat_Conditions ) )
    call TriggerAddAction( gg_trg_heat, function AoEHeatUpV )
endfunction

//===========================================================================
