
//===========================================================================
function Trig_ensnare_trap_cancelled_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetCancelledStructure()) == UNIT_ENSNARE_TRAP ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_ensnare_trap_cancelled_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_ENSNARE_TRAP_KIT, GetUnitLoc(GetCancelledStructure()) )
endfunction

//===========================================================================
function InitTrig_ensnare_trap_cancelled takes nothing returns nothing
    set gg_trg_ensnare_trap_cancelled = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ensnare_trap_cancelled, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL )
    call TriggerAddCondition( gg_trg_ensnare_trap_cancelled, Condition( function Trig_ensnare_trap_cancelled_Conditions ) )
    call TriggerAddAction( gg_trg_ensnare_trap_cancelled, function Trig_ensnare_trap_cancelled_Actions )
endfunction

//===========================================================================
