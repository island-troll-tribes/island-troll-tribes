globals
    string gameTimeStr = ""
    string forcedDuelStr = ""
    string gracePeriodStr = ""
    string forestFireStr = ""
endglobals

function measureTime takes nothing returns nothing
local integer mt_hours = 0
local integer mt_mins = 0
local integer mt_secs = 0
local integer mt_time = R2I(TimerGetElapsed(GAME_TIMER))
local string array s
local integer gracePeriodRemaining = R2I(TimerGetRemaining(GRACE_PERIOD_TIMER))
local integer forcedDuelRemaining = R2I(TimerGetRemaining(DUEL_TIMER))
local integer forestFireRemaining = R2I(TimerGetRemaining(FOREST_FIRE_TIMER))
set forcedDuelStr = ""
set gracePeriodStr = ""
set forestFireStr = ""
if mt_time >= 3600 then
    loop
        exitwhen mt_time < 3600
        set mt_time = mt_time - 3600
        set mt_hours = mt_hours + 1
    endloop
endif
if mt_time >= 60 then
    loop
        exitwhen mt_time < 60
        set mt_time = mt_time - 60
        set mt_mins = mt_mins + 1
    endloop
endif
set mt_secs = mt_time
set s[0] = I2S(mt_secs)
set s[1] = I2S(mt_mins)
set s[2] = I2S(mt_hours)
if StringLength(s[0]) == 1 then
    set s[0] = "0"+s[0]
endif
if StringLength(s[1]) == 1 then
    set s[1] = "0"+s[1]
endif
if StringLength(s[2]) == 1 then
    set s[2] = "0"+s[2]
endif
if gracePeriodRemaining > 0 then
    set mt_hours = gracePeriodRemaining / 3600
    set mt_mins = ModuloInteger(gracePeriodRemaining, 3600) / 60
    set mt_secs = ModuloInteger(gracePeriodRemaining, 60)
    set gracePeriodStr = " - Revive " + COLOR_GREEN
    if mt_hours > 0 then
        if mt_hours < 10 then
            set gracePeriodStr = gracePeriodStr + "0"
        endif
        set gracePeriodStr = gracePeriodStr + I2S(mt_hours) + ":"
    endif
    if mt_mins < 10 then
        set gracePeriodStr = gracePeriodStr + "0"
    endif
    set gracePeriodStr = gracePeriodStr + I2S(mt_mins) + ":"
    if mt_secs < 10 then
        set gracePeriodStr = gracePeriodStr + "0"
    endif
    set gracePeriodStr = gracePeriodStr + I2S(mt_secs) + "|r"
endif
if forcedDuelRemaining > 0 then
    set mt_hours = forcedDuelRemaining / 3600
    set mt_mins = ModuloInteger(forcedDuelRemaining, 3600) / 60
    set mt_secs = ModuloInteger(forcedDuelRemaining, 60)
    set forcedDuelStr = " - Duel " + ENERGY_COLOR
    if mt_hours > 0 then
        if mt_hours < 10 then
            set forcedDuelStr = forcedDuelStr + "0"
        endif
        set forcedDuelStr = forcedDuelStr + I2S(mt_hours) + ":"
    endif
    if mt_mins < 10 then
        set forcedDuelStr = forcedDuelStr + "0"
    endif
    set forcedDuelStr = forcedDuelStr + I2S(mt_mins) + ":"
    if mt_secs < 10 then
        set forcedDuelStr = forcedDuelStr + "0"
    endif
    set forcedDuelStr = forcedDuelStr + I2S(mt_secs) + "|r"
endif
if forestFireRemaining > 0 then
    set mt_hours = forestFireRemaining / 3600
    set mt_mins = ModuloInteger(forestFireRemaining, 3600) / 60
    set mt_secs = ModuloInteger(forestFireRemaining, 60)
    set forestFireStr = " - Fire " + RED_COLOR
    if mt_hours > 0 then
        if mt_hours < 10 then
            set forestFireStr = forestFireStr + "0"
        endif
        set forestFireStr = forestFireStr + I2S(mt_hours) + ":"
    endif
    if mt_mins < 10 then
        set forestFireStr = forestFireStr + "0"
    endif
    set forestFireStr = forestFireStr + I2S(mt_mins) + ":"
    if mt_secs < 10 then
        set forestFireStr = forestFireStr + "0"
    endif
    set forestFireStr = forestFireStr + I2S(mt_secs) + "|r"
endif
//set gameTimeStr = I2S(mt_hours)+":"+I2S(mt_mins)+":"+I2S(R2I(mt_secs))
if s[2] == "00" then
    set gameTimeStr = GENERAL_COLOR+s[1]+":"+s[0]+"|r"
else
    set gameTimeStr = GENERAL_COLOR+s[2]+":"+s[1]+":"+s[0]+"|r"
endif
//call PauseTimer(GAME_TIMER)
endfunction

function Trig_update_boards_Actions takes nothing returns nothing
local integer BOARD = 1
local integer PID = 0
local integer numTribes = GameConfig.getInstance().getNumTribes()
call measureTime()
loop
    exitwhen BOARD > numTribes
    call MultiboardSetTitleText(BOARD_TEAM[BOARD], "Stats - " + gameTimeStr + gracePeriodStr + forcedDuelStr + forestFireStr)
    loop
        exitwhen PID > 11
        if IsPlayerInForce(Player(PID),TEAM[BOARD]) then
            call MultiboardSetItemValueBJ( BOARD_TEAM[BOARD], 2, PLAYER_INT_BOARD[PID], HEALTH_COLOR+I2S(R2I(GetUnitState(udg_PUnits[PID], UNIT_STATE_LIFE)))+"|r")
            call MultiboardSetItemValueBJ( BOARD_TEAM[BOARD], 3, PLAYER_INT_BOARD[PID], ENERGY_COLOR+I2S(R2I(GetUnitState(udg_PUnits[PID], UNIT_STATE_MANA)))+"|r")
            call MultiboardSetItemValueBJ( BOARD_TEAM[BOARD], 4, PLAYER_INT_BOARD[PID], GOLD_COLOR+I2S(GetPlayerState(Player(PID), PLAYER_STATE_RESOURCE_GOLD))+"|r")
        endif
        set PID = PID + 1
    endloop
    set PID = 0
    set BOARD = BOARD + 1
endloop
if OBSERVER_BOARD != null then
    call MultiboardSetTitleText(OBSERVER_BOARD, gameTimeStr + gracePeriodStr + forcedDuelStr + forestFireStr)
endif
endfunction

//===========================================================================
function InitTrig_update_boards takes nothing returns nothing
    set gg_trg_update_boards = CreateTrigger(  )
    call TriggerAddAction( gg_trg_update_boards, function Trig_update_boards_Actions )
endfunction

//===========================================================================
