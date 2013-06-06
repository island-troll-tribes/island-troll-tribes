
//===========================================================================
//TESH.scrollpos=13
//TESH.alwaysfold=0
function Trig_Splitting_Flame_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A04T' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Splitting_Flame_Func002001003001001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false )
endfunction

function Trig_Splitting_Flame_Func002001003001002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) == false )
endfunction

function Trig_Splitting_Flame_Func002001003001 takes nothing returns boolean
    return GetBooleanAnd( Trig_Splitting_Flame_Func002001003001001(), Trig_Splitting_Flame_Func002001003001002() )
endfunction

function Trig_Splitting_Flame_Func002001003002 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetSpellAbilityUnit())) == true )
endfunction

function Trig_Splitting_Flame_Func002001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_Splitting_Flame_Func002001003001(), Trig_Splitting_Flame_Func002001003002() )
endfunction

function Trig_Splitting_Flame_Func002A takes nothing returns nothing
    call masterCastNoTarget(GetSpellAbilityUnit(),GetUnitX(GetEnumUnit()),GetUnitY(GetEnumUnit()),0,0,'A01T',"fanofknives")
endfunction

function Trig_Splitting_Flame_Actions takes nothing returns nothing
    call PolledWait( 1.00 )
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(800.00, GetUnitLoc(GetSpellAbilityUnit()), Condition(function Trig_Splitting_Flame_Func002001003)), function Trig_Splitting_Flame_Func002A )
endfunction

//===========================================================================
function InitTrig_Splitting_Flame takes nothing returns nothing
    set gg_trg_Splitting_Flame = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Splitting_Flame, Condition( function Trig_Splitting_Flame_Conditions ) )
    call TriggerAddAction( gg_trg_Splitting_Flame, function Trig_Splitting_Flame_Actions )
endfunction

//===========================================================================
