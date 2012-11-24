
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_depress_mana_drain_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A025' ) ) then
        return false
    endif
    return true
endfunction

function Trig_depress_mana_drain_Func002Func001C takes nothing returns boolean
    if ( not ( GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) >= 40.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_depress_mana_drain_Actions takes nothing returns nothing
    local unit i=GetSpellTargetUnit()
    call SetUnitManaBJ( i, ( GetUnitStateSwap(UNIT_STATE_MANA, i) - 10.00 ) )
    call PolledWait( 2.00 )
    call SetUnitManaBJ( i, ( GetUnitStateSwap(UNIT_STATE_MANA, i) - 5.00 ) )
    call PolledWait( 2.00 )
    call SetUnitManaBJ( i, ( GetUnitStateSwap(UNIT_STATE_MANA, i) - 5.00 ) )
    call PolledWait( 2.00 )
    call SetUnitManaBJ( i, ( GetUnitStateSwap(UNIT_STATE_MANA, i) - 5.00 ) )
    call PolledWait( 2.00 )
    call SetUnitManaBJ( i, ( GetUnitStateSwap(UNIT_STATE_MANA, i) - 5.00 ) )
    call PolledWait( 2.00 )
endfunction

//===========================================================================
function InitTrig_depress_mana_drain takes nothing returns nothing
    set gg_trg_depress_mana_drain = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_depress_mana_drain, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_depress_mana_drain, Condition( function Trig_depress_mana_drain_Conditions ) )
    call TriggerAddAction( gg_trg_depress_mana_drain, function Trig_depress_mana_drain_Actions )
endfunction

//===========================================================================
