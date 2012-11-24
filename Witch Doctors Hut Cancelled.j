
//===========================================================================
function Trig_witch_doctors_hut_cancelled_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetCancelledStructure()) == UNIT_WITCH_DOCTORS_HIT ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_witch_doctors_hut_cancelled_Actions takes nothing returns nothing
    call CreateItemLoc( ITEM_WITCH_DOCTORS_HUT_KIT, GetUnitLoc(GetCancelledStructure()) )
endfunction

//===========================================================================
function InitTrig_witch_doctors_hut_cancelled takes nothing returns nothing
    set gg_trg_witch_doctors_hut_cancelled = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_witch_doctors_hut_cancelled, EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL )
    call TriggerAddCondition( gg_trg_witch_doctors_hut_cancelled, Condition( function Trig_witch_doctors_hut_cancelled_Conditions ) )
    call TriggerAddAction( gg_trg_witch_doctors_hut_cancelled, function Trig_witch_doctors_hut_cancelled_Actions )
endfunction

//===========================================================================
