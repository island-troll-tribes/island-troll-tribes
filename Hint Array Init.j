
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function TipsForceDisplay takes nothing returns nothing
call DisplayTimedTextToPlayer(GetEnumPlayer(), 0, 0, 12,GOLD_COLOR+"Hint: |r"+GENERAL_COLOR+TIPS[tInt]+"|r")
endfunction

function Trig_Hint_Array_Init_Actions takes nothing returns nothing
set tInt = GetRandomInt(1,13)
if tInt == 2 then
    call PingMinimapLocForForceEx( TIP_FORCE, GetUnitLoc(gg_unit_n00N_0017), 7.00, bj_MINIMAPPINGSTYLE_FLASHY, 100, 100, 100 )
elseif tInt == 5 then
    call PingMinimapLocForForceEx( TIP_FORCE, GetUnitLoc(Mammoth), 4.00, bj_MINIMAPPINGSTYLE_FLASHY, 100, 100, 100 )
endif
call ForForce(TIP_FORCE, function TipsForceDisplay)
endfunction

globals
force TIP_FORCE = CreateForce()
string array TIPS
endglobals
//===========================================================================
function InitTrig_Hint_Array_Init takes nothing returns nothing
    set gg_trg_Hint_Array_Init = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_Hint_Array_Init, 180.00 )
    call TriggerAddAction( gg_trg_Hint_Array_Init, function Trig_Hint_Array_Init_Actions )
endfunction

//===========================================================================
