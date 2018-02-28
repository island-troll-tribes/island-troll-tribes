
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ShowPlayer12_Actions takes nothing returns nothing
local integer PLAYER_INT = 0
local integer BOARD_INT2 = 1
local integer numTribes = GameConfig.getInstance().getNumTribes()

//call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,40,"Show Start")
loop
    exitwhen BOARD_INT2 > numTribes
    loop
        exitwhen PLAYER_INT >= bj_MAX_PLAYERS 
        if IsPlayerInForce(Player(PLAYER_INT),TEAM[BOARD_INT2]) then
//           call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,40,"Player;"+I2S(PLAYER_INT))
            if GetLocalPlayer() == Player(PLAYER_INT) then
                call MultiboardDisplay(BOARD_TEAM[BOARD_INT2], true)
            endif
        endif
        set PLAYER_INT = PLAYER_INT + 1
    endloop
    set PLAYER_INT = 0
    set BOARD_INT2 = BOARD_INT2 +1
endloop

//show observers
set PLAYER_INT = 0
loop
    exitwhen PLAYER_INT>=bj_MAX_PLAYERS
        if IsPlayerObserver(GetLocalPlayer()) then
            call MultiboardDisplay(OBSERVER_BOARD, true)
        endif
    set PLAYER_INT = PLAYER_INT +1
endloop
//call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,40,"Show End")
endfunction

//===========================================================================
function InitTrig_ShowPlayers takes nothing returns nothing
    set gg_trg_ShowPlayers = CreateTrigger(  )
    //call TriggerRegisterTimerEventSingle( gg_trg_ShowPlayers, 17 )
    call TriggerAddAction( gg_trg_ShowPlayers, function Trig_ShowPlayer12_Actions )
endfunction//===========================================================================
