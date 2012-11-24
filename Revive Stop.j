
//===========================================================================
function Trig_revive_stop_Conditions takes nothing returns boolean
    if ( not ( udg_SIX_SIX == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_revive_stop_Func002C takes nothing returns boolean
    if ( not ( GetConvertedPlayerId(GetOwningPlayer(GetRevivingUnit())) <= 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_revive_stop_Func003C takes nothing returns boolean
    if ( not ( GetConvertedPlayerId(GetOwningPlayer(GetRevivingUnit())) <= 8 ) ) then
        return false
    endif
    return true
endfunction

function Trig_revive_stop_Func004C takes nothing returns boolean
    if ( not ( GetConvertedPlayerId(GetOwningPlayer(GetRevivingUnit())) <= 12 ) ) then
        return false
    endif
    return true
endfunction

function Trig_revive_stop_Actions takes nothing returns nothing
    if ( Trig_revive_stop_Func002C() ) then
        set udg_revivingForce1 = false
        return
    else
    endif
    if ( Trig_revive_stop_Func003C() ) then
        set udg_revivingForce2 = false
        return
    else
    endif
    if ( Trig_revive_stop_Func004C() ) then
        set udg_revivingForce3 = false
        return
    else
    endif
endfunction

//===========================================================================
function InitTrig_revive_stop takes nothing returns nothing
    set gg_trg_revive_stop = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_revive_stop, EVENT_PLAYER_HERO_REVIVE_CANCEL )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_revive_stop, EVENT_PLAYER_HERO_REVIVE_FINISH )
    call TriggerAddCondition( gg_trg_revive_stop, Condition( function Trig_revive_stop_Conditions ) )
    call TriggerAddAction( gg_trg_revive_stop, function Trig_revive_stop_Actions )
endfunction

//===========================================================================
