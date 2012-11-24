
//===========================================================================
function Trig_Smoke_House_cancelled_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetCancelledStructure()) == UNIT_SMOKE_HOUSE ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Smoke_House_cancelled_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_SMOKE_HOUSE_KIT, GetUnitLoc(GetCancelledStructure()) )
endfunction

//===========================================================================
function InitTrig_Smoke_House_cancelled takes nothing returns nothing
    set gg_trg_Smoke_House_cancelled = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Smoke_House_cancelled, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL )
    call TriggerAddCondition( gg_trg_Smoke_House_cancelled, Condition( function Trig_Smoke_House_cancelled_Conditions ) )
    call TriggerAddAction( gg_trg_Smoke_House_cancelled, function Trig_Smoke_House_cancelled_Actions )
endfunction

//===========================================================================
