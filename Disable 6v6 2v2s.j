
//===========================================================================
//TESH.scrollpos=6
//TESH.alwaysfold=0
function Trig_disable_6v6_Actions takes nothing returns nothing
local integer PLAYER_INT = 0
set modeAllow[27] = false
set modeAllow[30] = false
//call DisableTrigger( gg_trg_test_6v6 )
set TEAM[1] = CreateForce()
set TEAM[2] = CreateForce()
set TEAM[3] = CreateForce()

if udg_SIX_SIX then
    loop
        exitwhen PLAYER_INT > 11
        if GetPlayerSlotState(Player(PLAYER_INT))==PLAYER_SLOT_STATE_PLAYING and not isobserver[PLAYER_INT]then
            if PLAYER_INT < 6 then
                call ForceAddPlayer(TEAM[1] , Player(PLAYER_INT))
            elseif PLAYER_INT < 12 then
                call ForceAddPlayer(TEAM[3] , Player(PLAYER_INT))
            endif
        endif
        set PLAYER_INT = PLAYER_INT + 1
    endloop
elseif m2v2s then
set TEAM[4] = CreateForce()
set TEAM[5] = CreateForce()
set TEAM[6] = CreateForce()
    loop
        exitwhen PLAYER_INT > 11
        if GetPlayerSlotState(Player(PLAYER_INT))==PLAYER_SLOT_STATE_PLAYING and not isobserver[PLAYER_INT]then
            if PLAYER_INT < 2 then
                call ForceAddPlayer(TEAM[1] , Player(PLAYER_INT))
            elseif PLAYER_INT < 4 then
                call ForceAddPlayer(TEAM[2] , Player(PLAYER_INT))
            elseif PLAYER_INT < 6 then
                call ForceAddPlayer(TEAM[3] , Player(PLAYER_INT))
            elseif PLAYER_INT < 8 then
                call ForceAddPlayer(TEAM[4] , Player(PLAYER_INT))
            elseif PLAYER_INT < 10 then
                call ForceAddPlayer(TEAM[5] , Player(PLAYER_INT))
            elseif PLAYER_INT < 12 then
                call ForceAddPlayer(TEAM[6] , Player(PLAYER_INT))
            endif
        endif
        set PLAYER_INT = PLAYER_INT + 1
    endloop
else
    loop
        exitwhen PLAYER_INT > 11
        if GetPlayerSlotState(Player(PLAYER_INT))==PLAYER_SLOT_STATE_PLAYING and not isobserver[PLAYER_INT]then
            if PLAYER_INT < 4 then
                call ForceAddPlayer(TEAM[1] , Player(PLAYER_INT))
            elseif PLAYER_INT < 8 then
                call ForceAddPlayer(TEAM[2] , Player(PLAYER_INT))
            elseif PLAYER_INT < 12 then
                call ForceAddPlayer(TEAM[3] , Player(PLAYER_INT))
            endif
        endif
        set PLAYER_INT = PLAYER_INT + 1
    endloop
endif

call TriggerExecute(gg_trg_boards)

endfunction

globals
integer array ARRAYVALUES
force array TEAM
boolean m2v2s = false
endglobals

//===========================================================================
function InitTrig_Disable_6v6_2v2s takes nothing returns nothing
    set gg_trg_Disable_6v6_2v2s = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_Disable_6v6_2v2s, 10 )
    call TriggerAddAction( gg_trg_Disable_6v6_2v2s, function Trig_disable_6v6_Actions )
endfunction

//===========================================================================
