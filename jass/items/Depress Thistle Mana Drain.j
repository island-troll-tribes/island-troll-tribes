
//===========================================================================
//TESH.scrollpos=8
//TESH.alwaysfold=0
function Trig_depress_thistle_mana_drain_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A01L' ) ) then
        return false
    endif
    return true
endfunction

function Trig_depress_thistle_mana_drain_Func002Func001C takes nothing returns boolean
    if ( not ( GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) >= 20.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_depress_thistle_mana_drain_Actions takes nothing returns nothing
    local unit i=GetSpellTargetUnit()
    call ManaBurn(i, 5)
    call PolledWait( 2.00 )
    call ManaBurn(i, 3)
    call PolledWait( 1.50 )
    call ManaBurn(i, 2)
    call PolledWait( 1.50 )
    call ManaBurn(i, 1)
    call PolledWait( 1.00 )
    call ManaBurn(i, 1)
    call PolledWait( 1.00 )
endfunction

//===========================================================================
function InitTrig_depress_thistle_mana_drain takes nothing returns nothing
    set gg_trg_depress_thistle_mana_drain = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_depress_thistle_mana_drain, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_depress_thistle_mana_drain, Condition( function Trig_depress_thistle_mana_drain_Conditions ) )
    call TriggerAddAction( gg_trg_depress_thistle_mana_drain, function Trig_depress_thistle_mana_drain_Actions )
endfunction

//===========================================================================
