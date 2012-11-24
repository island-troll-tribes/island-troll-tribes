
//
// disabled in 6v6
//===========================================================================
function Trig_spirit_ward_selection_2_Conditions takes nothing returns boolean
    if ( not ( IsUnitAlly(GetTriggerUnit(), GetTriggerPlayer()) == true ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == UNIT_SPIRIT_WARD ) ) then
        return false
    endif
    if ( not ( udg_revivingForce2 == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_spirit_ward_selection_2_Actions takes nothing returns nothing
    call SetUnitOwner( GetTriggerUnit(), GetTriggerPlayer(), false )
endfunction

//===========================================================================
function InitTrig_spirit_ward_selection_2 takes nothing returns nothing
    set gg_trg_spirit_ward_selection_2 = CreateTrigger(  )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_2, Player(4), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_2, Player(5), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_2, Player(6), true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_spirit_ward_selection_2, Player(7), true )
    call TriggerAddCondition( gg_trg_spirit_ward_selection_2, Condition( function Trig_spirit_ward_selection_2_Conditions ) )
    call TriggerAddAction( gg_trg_spirit_ward_selection_2, function Trig_spirit_ward_selection_2_Actions )
endfunction

//===========================================================================
