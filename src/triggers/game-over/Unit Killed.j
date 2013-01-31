
function Trig_unit_killed_Actions takes nothing returns nothing
    if checkTroll(GetDyingUnit()) then
        call ConditionalTriggerExecute( gg_trg_check_win )
    endif
endfunction

//===========================================================================
function InitTrig_unit_killed takes nothing returns nothing
    set gg_trg_unit_killed = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_unit_killed, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddAction( gg_trg_unit_killed, function Trig_unit_killed_Actions )
endfunction