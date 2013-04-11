
//===========================================================================
//TESH.scrollpos=57
//TESH.alwaysfold=0
function Trig_sleeping_Func006001 takes nothing returns boolean
    return ( GetSpellAbilityId() == 'A004' )
endfunction

function Trig_sleeping_Func006002 takes nothing returns boolean
    return ( GetSpellAbilityId() == 'A007' )
endfunction

function Trig_sleeping_Conditions takes nothing returns boolean
    if ( not GetBooleanOr( Trig_sleeping_Func006001(), Trig_sleeping_Func006002() ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_sleeping_Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == UNIT_TENT ) ) then
        return false
    endif
    return true
endfunction

function Trig_sleeping_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == UNIT_TROLL_HUT ) ) then
        return false
    endif
    return true
endfunction

function Trig_sleeping_Func003C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == UNIT_MUD_HUT ) ) then
        return false
    endif
    return true
endfunction

function Trig_sleeping_Func005C takes nothing returns boolean
    if ( not ( udg_booleanParameter == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_sleeping_Actions takes nothing returns nothing
    if ( Trig_sleeping_Func001C() ) then
        call SetUnitManaBJ( GetSpellTargetUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetSpellTargetUnit()) + 80.00 ) )
    else
    endif
    if ( Trig_sleeping_Func002C() ) then
        call SetUnitManaBJ( GetSpellTargetUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetSpellTargetUnit()) + 200.00 ) )
    else
    endif
    if ( Trig_sleeping_Func003C() ) then
        call SetUnitManaBJ( GetSpellTargetUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetSpellTargetUnit()) + 200.00 ) )
    else
    endif
    set udg_booleanParameter=IsUnitTroll(GetSpellAbilityUnit())
    if ( Trig_sleeping_Func005C() ) then
        call SetUnitManaBJ( GetSpellTargetUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetSpellTargetUnit()) + 80.00 ) )
        call SetUnitLifeBJ( GetSpellTargetUnit(), ( GetUnitStateSwap(UNIT_STATE_LIFE, GetSpellTargetUnit()) - 20.00 ) )
        call AdjustPlayerStateBJ( -20, GetOwningPlayer(GetSpellTargetUnit()), PLAYER_STATE_RESOURCE_GOLD )
    else
    endif
endfunction

//===========================================================================
function InitTrig_sleeping takes nothing returns nothing
    set gg_trg_sleeping = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_sleeping, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_sleeping, Condition( function Trig_sleeping_Conditions ) )
    call TriggerAddAction( gg_trg_sleeping, function Trig_sleeping_Actions )
endfunction

//===========================================================================
