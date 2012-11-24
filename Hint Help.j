
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function HintHelpDisplay takes nothing returns nothing
call DisplayTimedTextToPlayer(GetEnumPlayer(), 0, 0, 12,GOLD_COLOR+"Hint: |r"+GENERAL_COLOR+TIPS[11]+"|r")
endfunction

function Trig_Hint_Help_Actions takes nothing returns nothing
call ForForce(TIP_FORCE, function HintHelpDisplay)
endfunction

//===========================================================================
function InitTrig_Hint_Help takes nothing returns nothing
    set gg_trg_Hint_Help = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_Hint_Help, 100.00 )
    call TriggerAddAction( gg_trg_Hint_Help, function Trig_Hint_Help_Actions )
endfunction

//===========================================================================
