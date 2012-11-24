
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_heat_mage_Conditions takes nothing returns boolean
    return udg_STARTED and GetSpellAbilityId() == 'A023'
endfunction

function IsInRangeForMageHeat takes nothing returns nothing
local real dx = GetUnitX(GetEnumUnit()) - GetUnitX(tempFirer)
local real dy = GetUnitY(GetEnumUnit()) - GetUnitY(tempFirer)
if SquareRoot(dx * dx + dy * dy) <= 690 and IsUnitAlly(GetEnumUnit(), GetOwningPlayer(tempFirer)) then
    call SetPlayerStateBJ( GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD, IMinBJ(( GetPlayerState(GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD) + udg_HEAT_PER_CAST*2 ), udg_MAX_HEAT) )
endif
endfunction

function MageAoEHeatUpV takes nothing returns nothing
    if checkTroll(GetSpellTargetUnit()) then
        if GetUnitAbilityLevel(GetSpellTargetUnit(), 'BCbf') > 0 then
            call UnitRemoveAbility( GetSpellTargetUnit() ,'BCbf')
        endif
        set tempFirer = GetSpellAbilityUnit()
        call ForGroup(udg_trolls, function IsInRangeForMageHeat)
    endif
endfunction

/*
function Trig_heat_mage_Actions takes nothing returns nothing
    set udg_booleanParameter=checkTroll(GetSpellTargetUnit())
    if ( Trig_heat_mage_Func003C() ) then
        if ( Trig_heat_mage_Func003Func001001() ) then
            call UnitRemoveBuffBJ( 'BCbf', GetSpellTargetUnit() )
        endif
        //call AdjustPlayerStateBJ( ( udg_HEAT_PER_CAST * 2 ), GetOwningPlayer(GetSpellTargetUnit()), PLAYER_STATE_RESOURCE_GOLD )
        call SetPlayerStateBJ( GetOwningPlayer(GetSpellTargetUnit()), PLAYER_STATE_RESOURCE_GOLD, IMinBJ(( GetPlayerState(GetOwningPlayer(GetSpellTargetUnit()), PLAYER_STATE_RESOURCE_GOLD) + udg_HEAT_PER_CAST*2 ), udg_MAX_HEAT) )
    endif
endfunction
*/

//===========================================================================
function InitTrig_heat_mage takes nothing returns nothing
    set gg_trg_heat_mage = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_heat_mage, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_heat_mage, Condition( function Trig_heat_mage_Conditions ) )
    call TriggerAddAction( gg_trg_heat_mage, function MageAoEHeatUpV )
endfunction

//===========================================================================
