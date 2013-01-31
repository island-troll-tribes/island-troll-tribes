
//===========================================================================
function Trig_camo_undo_Conditions takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetOrderedUnit(), 'B009') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_camo_undo_Actions takes nothing returns nothing
    call UnitRemoveBuffBJ( 'B009', GetOrderedUnit() )
endfunction

//===========================================================================
function InitTrig_camo_undo takes nothing returns nothing
    set gg_trg_camo_undo = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_camo_undo, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_camo_undo, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER )
    call TriggerAddCondition( gg_trg_camo_undo, Condition( function Trig_camo_undo_Conditions ) )
    call TriggerAddAction( gg_trg_camo_undo, function Trig_camo_undo_Actions )
endfunction

//===========================================================================
