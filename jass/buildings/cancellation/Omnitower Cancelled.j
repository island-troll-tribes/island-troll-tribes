
//===========================================================================
function Trig_Omnitower_cancelled_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetCancelledStructure()) == UNIT_OMNITOWER ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Omnitower_cancelled_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_OMNIDEFENDER_KIT, GetUnitLoc(GetCancelledStructure()) )
endfunction

//===========================================================================
function InitTrig_Omnitower_cancelled takes nothing returns nothing
    set gg_trg_Omnitower_cancelled = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Omnitower_cancelled, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL )
    call TriggerAddCondition( gg_trg_Omnitower_cancelled, Condition( function Trig_Omnitower_cancelled_Conditions ) )
    call TriggerAddAction( gg_trg_Omnitower_cancelled, function Trig_Omnitower_cancelled_Actions )
endfunction

//===========================================================================
