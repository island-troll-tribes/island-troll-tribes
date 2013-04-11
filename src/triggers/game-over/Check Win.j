
function Trig_check_win_Conditions takes nothing returns boolean
    return not udg_NOOB_TIME and not udg_NOOB_MODE
endfunction

function CountDead takes nothing returns nothing
    local unit u = GetEnumUnit()
    local integer i = GetPlayerId(GetOwningPlayer(u))
    local boolean t1 = (i >= 0) and (i <= 3) //IsUnitAlly(u, Player(3))
    local boolean t2 = (i >= 4) and (i <= 7) //IsUnitAlly(u, Player(7))
    local boolean t3 = (i >= 8) and (i <= 11) //IsUnitAlly(u, Player(11))
    if GetUnitState(u, UNIT_STATE_LIFE) > .455 then
        if t1 then
            set udg_integerParameter =  udg_integerParameter + 1
        elseif t2 then
            set udg_integerParameter2 =  udg_integerParameter2 + 1
        elseif t3 then
            set udg_integerParameter3 =  udg_integerParameter3 + 1
        endif
    endif
    set u = null
endfunction

function CountDead6 takes nothing returns nothing
    local unit u = GetEnumUnit()
    local integer i = GetPlayerId(GetOwningPlayer(u))
    local boolean t1 = (i >= 0) and (i <= 5)
    local boolean t3 = (i >= 6) and (i <= 11)
    if GetUnitState(u, UNIT_STATE_LIFE) > .455 then
        if t1 then
            set udg_integerParameter =  udg_integerParameter + 1
        elseif t3 then
            set udg_integerParameter3 =  udg_integerParameter3 + 1
        endif
    endif
    set u = null
endfunction

function Trig_check_win_customVic takes nothing returns nothing
    call CVic( GetEnumPlayer(), true, true )
endfunction

function Trig_check_win_custDefeatFirst takes nothing returns nothing
    call CDef( GetEnumPlayer(), "You have been defeated first." )
endfunction

function Trig_check_win_custDefeat takes nothing returns nothing
    call CDef( GetEnumPlayer(), "You have been defeated." )
endfunction

function winTimer takes nothing returns nothing
    local timer t = GetExpiredTimer()
    if udg_SIX_SIX then
        if not udg_force1Dead then
            call ForForce( TEAM[1], function Trig_check_win_customVic )
        else
            call ForForce( TEAM[1], function Trig_check_win_custDefeat )
        endif
        if not udg_force3Dead then
            call ForForce( TEAM[3], function Trig_check_win_customVic )
        else
            call ForForce( TEAM[3], function Trig_check_win_custDefeat )
        endif
    else
        if not udg_force1Dead then
            call ForForce( TEAM[1], function Trig_check_win_customVic )
        else
            call ForForce( TEAM[1], function Trig_check_win_custDefeat )
        endif
        
        if not udg_force2Dead then
            call ForForce( TEAM[2], function Trig_check_win_customVic )
        else
            call ForForce( TEAM[2], function Trig_check_win_custDefeat )
        endif
        
        if not udg_force3Dead then
            call ForForce( TEAM[3], function Trig_check_win_customVic )
        else
            call ForForce( TEAM[3], function Trig_check_win_custDefeat )
        endif
    endif
    call PauseTimer(t)
    call DestroyTimer(t)
endfunction

function Trig_check_win_Actions takes nothing returns nothing
    local timer t
    local timerdialog dt
    local integer i=0
    if not GAME_END then
        set udg_integerParameter = 0
        set udg_integerParameter2 = 0
        set udg_integerParameter3 = 0
        
        if udg_SIX_SIX then
            call ForGroup( udg_trolls, function CountDead6 )
            
            if udg_integerParameter == 0 then
                set udg_force1Dead = true
            endif
            if udg_integerParameter3 == 0 then
                set udg_force3Dead = true
            endif
            
            if udg_integerParameter == 0 and udg_force1Dead and not GAME_END then
                set GAME_END = true
                call DisplayTimedTextToForce( GetPlayersAllies(Player(0)),60, HIGHLIGHT_COLOR+"Your tribe has been killed! Please play again." )
                call DisplayTimedTextToForce( GetPlayersEnemies(Player(0)),60, HIGHLIGHT_COLOR+"You have won! Please play again!" )
            endif
            if udg_integerParameter3 == 0 and udg_force3Dead and not GAME_END then
                set GAME_END = true
                call DisplayTimedTextToForce( GetPlayersAllies(Player(11)),60, HIGHLIGHT_COLOR+"Your tribe has been killed! Please play again." )
                call DisplayTimedTextToForce( GetPlayersEnemies(Player(11)),60, HIGHLIGHT_COLOR+"You have won! Please play again!" )
            endif
            
        else
            call ForGroup( udg_trolls, function CountDead )
            
            if udg_integerParameter == 0 then
                set udg_force1Dead = true
            endif
            if udg_integerParameter2 == 0 then
                set udg_force2Dead = true
            endif
            if udg_integerParameter3 == 0 then
                set udg_force3Dead = true
            endif
            
            if udg_integerParameter == 0 and udg_force1Dead and not GAME_END and not TEAM_1_GONE then
                if udg_force3Dead or udg_force2Dead then
                    set GAME_END = true
                    call DisplayTimedTextToForce( TEAM[1],60, HIGHLIGHT_COLOR+"Your tribe has been killed! Please play again." )
                    call DisplayTimedTextToForce( TEAM[2],60, HIGHLIGHT_COLOR+"You have won! Please play again!" )
                    call DisplayTimedTextToForce( TEAM[3],60, HIGHLIGHT_COLOR+"You have won! Please play again!" )
                else
                    set TEAM_1_GONE = true
                    call ForForce(TEAM[1], function Trig_check_win_custDefeatFirst )
                    call DisplayTText( HIGHLIGHT_COLOR+"Team 1 has been defeated.", 30)
                endif
            endif
            if udg_integerParameter2 == 0 and udg_force2Dead and not GAME_END and not TEAM_2_GONE then
                if udg_force3Dead or udg_force1Dead then
                    set GAME_END = true
                    call DisplayTimedTextToForce( TEAM[2],60, HIGHLIGHT_COLOR+"Your tribe has been killed! Please play again." )
                    call DisplayTimedTextToForce( TEAM[1],60, HIGHLIGHT_COLOR+"You have won! Please play again!" )
                    call DisplayTimedTextToForce( TEAM[3],60, HIGHLIGHT_COLOR+"You have won! Please play again!" )
                else
                    set TEAM_2_GONE = true
                    call ForForce(TEAM[2], function Trig_check_win_custDefeatFirst )
                    call DisplayTText(HIGHLIGHT_COLOR+"Team 2 has been defeated.", 30)
                endif
            endif
            if udg_integerParameter3 == 0 and udg_force3Dead and not GAME_END and not TEAM_3_GONE then
                if udg_force1Dead or udg_force2Dead then
                    set GAME_END = true
                    call DisplayTimedTextToForce( TEAM[3],60, HIGHLIGHT_COLOR+"Your tribe has been killed! Please play again." )
                    call DisplayTimedTextToForce( TEAM[1],60, HIGHLIGHT_COLOR+"You have won! Please play again!" )
                    call DisplayTimedTextToForce( TEAM[2],60, HIGHLIGHT_COLOR+"You have won! Please play again!" )
                else
                    set TEAM_3_GONE = true
                    call ForForce( TEAM[3], function Trig_check_win_custDefeatFirst )
                    call DisplayTText(HIGHLIGHT_COLOR+"Team 3 has been defeated.", 30)
                endif
            endif
        endif
        
        if GAME_END then
            call displayStats() // HCL STATS
            
            if udg_SIX_SIX then
                if udg_integerParameter == 0 then
                    loop
                        exitwhen i>5
                            call FlagPlayer(Player(i), 102)
                        set i=i+1
                    endloop
                else
                    loop
                        exitwhen i>5
                            call FlagPlayer(Player(i), 103)
                        set i=i+1
                    endloop
                endif
                if udg_integerParameter3 == 0 then
                    loop
                        exitwhen i>11
                            call FlagPlayer(Player(i), 102)
                        set i=i+1
                    endloop
                else
                    loop
                        exitwhen i>5
                            call FlagPlayer(Player(i), 103)
                        set i=i+1
                    endloop
                endif
            else
                if udg_integerParameter == 0 then
                    loop
                        exitwhen i>3
                            call FlagPlayer(Player(i), 102)
                        set i=i+1
                    endloop
                else
                    loop
                        exitwhen i>3
                            call FlagPlayer(Player(i), 103)
                        set i=i+1
                    endloop
                endif
                if udg_integerParameter2 == 0 then
                    loop
                        exitwhen i>7
                            call FlagPlayer(Player(i), 102)
                        set i=i+1
                    endloop
                else
                    loop
                        exitwhen i>7
                            call FlagPlayer(Player(i), 103)
                        set i=i+1
                    endloop
                endif
                if udg_integerParameter3 == 0 then
                    loop
                        exitwhen i>11
                            call FlagPlayer(Player(i), 102)
                        set i=i+1
                    endloop
                else
                    loop
                        exitwhen i>11
                            call FlagPlayer(Player(i), 103)
                        set i=i+1
                    endloop
                endif
            endif
            
            set t = CreateTimer()
            set dt = CreateTimerDialog(t)
            call TimerStart(t, 20, false, function winTimer)
            call TimerDialogSetTitle(dt, "Game ends in...")
            call TimerDialogDisplay(dt, true)
        endif
    endif
endfunction

globals
    boolean GAME_END = false
    boolean TEAM_1_GONE = false
    boolean TEAM_2_GONE = false
    boolean TEAM_3_GONE = false
    boolean udg_force1Dead = false
    boolean udg_force2Dead = false
    boolean udg_force3Dead = false
endglobals

//===========================================================================
function InitTrig_check_win takes nothing returns nothing
    set gg_trg_check_win = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_check_win, Condition( function Trig_check_win_Conditions ) )
    call TriggerAddAction( gg_trg_check_win, function Trig_check_win_Actions )
endfunction
//===========================================================================
