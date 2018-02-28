
//
// GAME_TIMER
//===========================================================================
//TESH.scrollpos=30
//TESH.alwaysfold=0
function Trig_update_boards_Conditions takes nothing returns boolean
    return udg_STARTED
endfunction

globals
    string gameTimeStr = ""
endglobals

function measureTime takes nothing returns nothing
local integer mt_hours = 0
local integer mt_mins = 0
local real mt_secs = 0
local real mt_time = TimerGetElapsed(GAME_TIMER)
local string array s
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
set s[0] = I2S(R2I(mt_secs))
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
//set gameTimeStr = I2S(mt_hours)+":"+I2S(mt_mins)+":"+I2S(R2I(mt_secs))
set gameTimeStr = s[2]+":"+s[1]+":"+s[0]
//call PauseTimer(GAME_TIMER)
endfunction

function Trig_update_boards_Actions takes nothing returns nothing
local integer BOARD = 1
local integer PID = 0
local integer numTribes = GameConfig.getInstance().getNumTribes()
call measureTime()
loop
    exitwhen BOARD > numTribes
    call MultiboardSetTitleText(BOARD_TEAM[BOARD], "Team Stats - "+gameTimeStr)
    loop
        exitwhen PID >= PLAYER_NEUTRAL_AGGRESSIVE
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
    call MultiboardSetTitleText(OBSERVER_BOARD, gameTimeStr)
endif
endfunction

//===========================================================================
function InitTrig_update_boards takes nothing returns nothing
    set gg_trg_update_boards = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_update_boards, Condition( function Trig_update_boards_Conditions ) )
    call TriggerAddAction( gg_trg_update_boards, function Trig_update_boards_Actions )
endfunction

//===========================================================================
