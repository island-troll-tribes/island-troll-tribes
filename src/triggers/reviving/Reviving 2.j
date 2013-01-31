
//
// disable for 6v6
//===========================================================================
function Trig_reviving_2_Conditions takes nothing returns boolean
    if ( not ( IsUnitAlly(GetRevivingUnit(), Player(4)) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_reviving_2_Actions takes nothing returns nothing
    set udg_revivingForce2 = true
endfunction

//===========================================================================
function InitTrig_reviving_2 takes nothing returns nothing
    set gg_trg_reviving_2 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_reviving_2, EVENT_PLAYER_HERO_REVIVE_START )
    call TriggerAddCondition( gg_trg_reviving_2, Condition( function Trig_reviving_2_Conditions ) )
    call TriggerAddAction( gg_trg_reviving_2, function Trig_reviving_2_Actions )
endfunction

//===========================================================================
