
function Trig_Start_Dual_CountDown_Conditions takes nothing returns boolean
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Start_Dual_CountDown_Func007A takes nothing returns nothing
    call TimerDialogDisplayForPlayerBJ( true, GetLastCreatedTimerDialogBJ(), GetEnumPlayer() )
endfunction

function Trig_Start_Dual_CountDown_Func008A takes nothing returns nothing
    call TimerDialogDisplayForPlayerBJ( true, GetLastCreatedTimerDialogBJ(), GetEnumPlayer() )
endfunction

function Trig_Start_Dual_CountDown_Actions takes nothing returns nothing
    call DisplayTextToForce( GetForceOfPlayer(GetOwningPlayer(udg_DualUnit1)), ( GetPlayerName(GetOwningPlayer(udg_DualUnit2)) + " has accepted you challenge to duel!" ) )
    call DisplayTextToForce( GetForceOfPlayer(GetOwningPlayer(udg_DualUnit2)), ( ( "You have accepted " + GetPlayerName(GetOwningPlayer(udg_DualUnit1)) ) + "'s duel challenge!" ) )
    call StartTimerBJ( udg_DualTimer, false, 120.00 )
    call CreateTimerDialogBJ( udg_DualTimer, "Seconds Till Duel:" )
    call TimerDialogSetTitleColorBJ( GetLastCreatedTimerDialogBJ(), 80.00, 40.00, 100.00, 5.00 )
    call ForForce( GetPlayersAllies(GetOwningPlayer(udg_DualUnit1)), function Trig_Start_Dual_CountDown_Func007A )
    call ForForce( GetPlayersAllies(GetOwningPlayer(udg_DualUnit2)), function Trig_Start_Dual_CountDown_Func008A )
endfunction

function InitTrig_Start_Dual_CountDown takes nothing returns nothing
    set gg_trg_Start_Dual_CountDown = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Start_Dual_CountDown, Condition( function Trig_Start_Dual_CountDown_Conditions ) )
    call TriggerAddAction( gg_trg_Start_Dual_CountDown, function Trig_Start_Dual_CountDown_Actions )
endfunction
