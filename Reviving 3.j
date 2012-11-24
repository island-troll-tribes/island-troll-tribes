
//===========================================================================
function Trig_reviving_3_Conditions takes nothing returns boolean
    if ( not ( IsUnitAlly(GetRevivingUnit(), Player(8)) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_reviving_3_Actions takes nothing returns nothing
    set udg_revivingForce3 = true
endfunction

//===========================================================================
function InitTrig_reviving_3 takes nothing returns nothing
    set gg_trg_reviving_3 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_reviving_3, EVENT_PLAYER_HERO_REVIVE_START )
    call TriggerAddCondition( gg_trg_reviving_3, Condition( function Trig_reviving_3_Conditions ) )
    call TriggerAddAction( gg_trg_reviving_3, function Trig_reviving_3_Actions )
endfunction

//===========================================================================
