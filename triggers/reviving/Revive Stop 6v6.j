
//
// Relies on trapping correctly
//===========================================================================
function Trig_revive_stop_6v6_Conditions takes nothing returns boolean
    if ( not ( udg_SIX_SIX == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_revive_stop_6v6_Func002C takes nothing returns boolean
    if ( not ( GetConvertedPlayerId(GetOwningPlayer(GetRevivingUnit())) <= 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_revive_stop_6v6_Func003C takes nothing returns boolean
    if ( not ( GetConvertedPlayerId(GetOwningPlayer(GetRevivingUnit())) <= 12 ) ) then
        return false
    endif
    return true
endfunction

function Trig_revive_stop_6v6_Actions takes nothing returns nothing
    if ( Trig_revive_stop_6v6_Func002C() ) then
        set udg_revivingForce1 = false
        return
    else
    endif
    if ( Trig_revive_stop_6v6_Func003C() ) then
        set udg_revivingForce3 = false
        return
    else
    endif
endfunction

//===========================================================================
function InitTrig_revive_stop_6v6 takes nothing returns nothing
    set gg_trg_revive_stop_6v6 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_revive_stop_6v6, EVENT_PLAYER_HERO_REVIVE_CANCEL )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_revive_stop_6v6, EVENT_PLAYER_HERO_REVIVE_FINISH )
    call TriggerAddCondition( gg_trg_revive_stop_6v6, Condition( function Trig_revive_stop_6v6_Conditions ) )
    call TriggerAddAction( gg_trg_revive_stop_6v6, function Trig_revive_stop_6v6_Actions )
endfunction

//===========================================================================
