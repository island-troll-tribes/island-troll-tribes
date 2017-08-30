
function Trig_noob_time_off_Conditions takes nothing returns boolean
  return udg_NOOB_TIME
endfunction

function Trig_noob_time_off_Actions takes nothing returns nothing
  set udg_NOOB_TIME = false
  call TimerDialogDisplay(NOOB_TIME_DIALOG,false)
  call DestroyTimerDialog(NOOB_TIME_DIALOG)
  call DisplayTText(GENERAL_COLOR+"Grace period is over. Now you will not be automatically revived when you die! You can still be revived if your team builds a |c00ff0000Spirit Ward|r"+GENERAL_COLOR+"!|r", 10)
  call ModifyGateBJ( bj_GATEOPERATION_OPEN, mammothGate )
  call PolledWait(10) // SO THAT IF A TEAM HAS NO ALIVE PLAYERS, BUT SOME ARE REVIVING, THEY WILL NOT LOSE.
  call ConditionalTriggerExecute( gg_trg_check_win )
endfunction

function InitTrig_noob_time_off takes nothing returns nothing
  set gg_trg_noob_time_off = CreateTrigger(  )
  call TriggerRegisterTimerExpireEventBJ( gg_trg_noob_time_off, udg_noobTimer )
  call TriggerAddCondition( gg_trg_noob_time_off, Condition( function Trig_noob_time_off_Conditions ) )
  call TriggerAddAction( gg_trg_noob_time_off, function Trig_noob_time_off_Actions )
endfunction