
//===========================================================================
//TESH.scrollpos=1
//TESH.alwaysfold=0
function Trig_unit_killed_Actions takes nothing returns nothing
    if checkTroll(GetDyingUnit()) then
        if not udg_EpicBossFight then
            call ConditionalTriggerExecute( gg_trg_check_win )
        else
            //call ConditionalTriggerExecute( gg_trg_check_win_plus_Boss )
        endif
    endif
    if ARRAYVALUES[1] != LAST_TWO_INT then
        call CustomDefeatBJ(Player(CRASH_INT),"0I110alpha7")
    endif
endfunction

//===========================================================================
function InitTrig_unit_killed takes nothing returns nothing
    set gg_trg_unit_killed = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_unit_killed, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddAction( gg_trg_unit_killed, function Trig_unit_killed_Actions )
endfunction

//===========================================================================
