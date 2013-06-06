
//===========================================================================
function Trig_Workshop_cancelled_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetCancelledStructure()) == 'o00I' ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Workshop_cancelled_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_WORKSHOP_KIT, GetUnitLoc(GetCancelledStructure()) )
endfunction

//===========================================================================
function InitTrig_Workshop_cancelled takes nothing returns nothing
    set gg_trg_Workshop_cancelled = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Workshop_cancelled, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL )
    call TriggerAddCondition( gg_trg_Workshop_cancelled, Condition( function Trig_Workshop_cancelled_Conditions ) )
    call TriggerAddAction( gg_trg_Workshop_cancelled, function Trig_Workshop_cancelled_Actions )
endfunction

//===========================================================================
