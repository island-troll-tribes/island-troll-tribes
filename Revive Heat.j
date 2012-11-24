
//===========================================================================
function Trig_revive_heat_Func002001 takes nothing returns boolean
    return ( GetPlayerSlotState(GetOwningPlayer(GetRevivingUnit())) != PLAYER_SLOT_STATE_PLAYING )
endfunction

function Trig_revive_heat_Actions takes nothing returns nothing
    call SetPlayerStateBJ( GetOwningPlayer(GetRevivingUnit()), PLAYER_STATE_RESOURCE_GOLD, udg_MAX_HEAT )
    if ( Trig_revive_heat_Func002001() ) then
        call KillUnit( GetRevivingUnit() )
    else
        call DoNothing(  )
    endif
endfunction

//===========================================================================
function InitTrig_revive_heat takes nothing returns nothing
    set gg_trg_revive_heat = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_revive_heat, EVENT_PLAYER_HERO_REVIVE_FINISH )
    call TriggerAddAction( gg_trg_revive_heat, function Trig_revive_heat_Actions )
endfunction

//===========================================================================
