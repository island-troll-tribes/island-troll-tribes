
//
// is enabled
//===========================================================================
function Trig_spirit_ward_selection_3_6v6_Conditions takes nothing returns boolean
    if ( not ( IsUnitAlly(GetTriggerUnit(), GetTriggerPlayer()) == true ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == UNIT_SPIRIT_WARD ) ) then
        return false
    endif
    if ( not ( udg_revivingForce3 == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_spirit_ward_selection_3_6v6_Actions takes nothing returns nothing
    call SetUnitOwner( GetTriggerUnit(), GetTriggerPlayer(), false )
endfunction

//===========================================================================
function InitTrig_spirit_ward_selection_3_6v6 takes nothing returns nothing
    set gg_trg_spirit_ward_selection_3_6v6 = CreateTrigger(  )
    call DisableTrigger( gg_trg_spirit_ward_selection_3_6v6 )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_3_6v6, Player(6), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_3_6v6, Player(7), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_3_6v6, Player(8), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_3_6v6, Player(9), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_3_6v6, Player(10), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_3_6v6, Player(11), true )
    call TriggerAddCondition( gg_trg_spirit_ward_selection_3_6v6, Condition( function Trig_spirit_ward_selection_3_6v6_Conditions ) )
    call TriggerAddAction( gg_trg_spirit_ward_selection_3_6v6, function Trig_spirit_ward_selection_3_6v6_Actions )
endfunction

//===========================================================================
