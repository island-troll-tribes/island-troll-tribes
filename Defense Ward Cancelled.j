
//===========================================================================
function Trig_defense_ward_cancelled_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetCancelledStructure()) == UNIT_DEFENSE_WARD ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_defense_ward_cancelled_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_DEFENSIVE_WARD_KIT, GetUnitLoc(GetCancelledStructure()) )
endfunction

//===========================================================================
function InitTrig_defense_ward_cancelled takes nothing returns nothing
    set gg_trg_defense_ward_cancelled = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_defense_ward_cancelled, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL )
    call TriggerAddCondition( gg_trg_defense_ward_cancelled, Condition( function Trig_defense_ward_cancelled_Conditions ) )
    call TriggerAddAction( gg_trg_defense_ward_cancelled, function Trig_defense_ward_cancelled_Actions )
endfunction

//===========================================================================
