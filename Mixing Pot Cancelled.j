
//===========================================================================
function Trig_Mixing_Pot_cancelled_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetCancelledStructure()) == UNIT_POT ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mixing_Pot_cancelled_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_POT_KIT, GetUnitLoc(GetCancelledStructure()) )
endfunction

//===========================================================================
function InitTrig_Mixing_Pot_cancelled takes nothing returns nothing
    set gg_trg_Mixing_Pot_cancelled = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Mixing_Pot_cancelled, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL )
    call TriggerAddCondition( gg_trg_Mixing_Pot_cancelled, Condition( function Trig_Mixing_Pot_cancelled_Conditions ) )
    call TriggerAddAction( gg_trg_Mixing_Pot_cancelled, function Trig_Mixing_Pot_cancelled_Actions )
endfunction

//===========================================================================
