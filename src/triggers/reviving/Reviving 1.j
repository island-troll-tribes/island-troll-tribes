
//===========================================================================
function Trig_reviving_1_Conditions takes nothing returns boolean
    if ( not ( IsUnitAlly(GetRevivingUnit(), Player(0)) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_reviving_1_Actions takes nothing returns nothing
    set udg_revivingForce1 = true
endfunction

//===========================================================================
function InitTrig_reviving_1 takes nothing returns nothing
    set gg_trg_reviving_1 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_reviving_1, EVENT_PLAYER_HERO_REVIVE_START )
    call TriggerAddCondition( gg_trg_reviving_1, Condition( function Trig_reviving_1_Conditions ) )
    call TriggerAddAction( gg_trg_reviving_1, function Trig_reviving_1_Actions )
endfunction

//===========================================================================
