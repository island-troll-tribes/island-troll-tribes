
//===========================================================================
function Trig_Hatchery_cancelled_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetCancelledStructure()) == UNIT_HATCHERY ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Hatchery_cancelled_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_HATCHERY_KIT, GetUnitLoc(GetCancelledStructure()) )
endfunction

//===========================================================================
function InitTrig_Hatchery_cancelled takes nothing returns nothing
    set gg_trg_Hatchery_cancelled = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Hatchery_cancelled, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL )
    call TriggerAddCondition( gg_trg_Hatchery_cancelled, Condition( function Trig_Hatchery_cancelled_Conditions ) )
    call TriggerAddAction( gg_trg_Hatchery_cancelled, function Trig_Hatchery_cancelled_Actions )
endfunction

//===========================================================================
