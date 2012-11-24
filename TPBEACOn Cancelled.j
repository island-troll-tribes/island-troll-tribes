
//===========================================================================
function Trig_TPBEACOn_cancelled_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetCancelledStructure()) == UNIT_TELEPORTATION_BEACON ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_TPBEACOn_cancelled_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_TELEPORT_BEACON_KIT, GetUnitLoc(GetCancelledStructure()) )
endfunction

//===========================================================================
function InitTrig_TPBEACOn_cancelled takes nothing returns nothing
    set gg_trg_TPBEACOn_cancelled = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_TPBEACOn_cancelled, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL )
    call TriggerAddCondition( gg_trg_TPBEACOn_cancelled, Condition( function Trig_TPBEACOn_cancelled_Conditions ) )
    call TriggerAddAction( gg_trg_TPBEACOn_cancelled, function Trig_TPBEACOn_cancelled_Actions )
endfunction

//===========================================================================
