
//===========================================================================
function Trig_burrow_cancel_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetCancelledStructure()) == UNIT_TROLL_BURROW ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_burrow_cancel_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_TROLL_BURROW_KIT, GetUnitLoc(GetCancelledStructure()) )
endfunction

//===========================================================================
function InitTrig_burrow_cancel takes nothing returns nothing
    set gg_trg_burrow_cancel = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_burrow_cancel, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL )
    call TriggerAddCondition( gg_trg_burrow_cancel, Condition( function Trig_burrow_cancel_Conditions ) )
    call TriggerAddAction( gg_trg_burrow_cancel, function Trig_burrow_cancel_Actions )
endfunction

//===========================================================================
