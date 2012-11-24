
//===========================================================================
function Trig_tent_cancelled_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetCancelledStructure()) == UNIT_TENT ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_tent_cancelled_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_TENT_KIT, GetUnitLoc(GetCancelledStructure()) )
endfunction

//===========================================================================
function InitTrig_tent_cancelled takes nothing returns nothing
    set gg_trg_tent_cancelled = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_tent_cancelled, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL )
    call TriggerAddCondition( gg_trg_tent_cancelled, Condition( function Trig_tent_cancelled_Conditions ) )
    call TriggerAddAction( gg_trg_tent_cancelled, function Trig_tent_cancelled_Actions )
endfunction

//===========================================================================
