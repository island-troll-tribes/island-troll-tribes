
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
globals
    timer obs_timer
endglobals
function EncodeObserverEvent takes nothing returns nothing
local integer i = 0
    loop
        exitwhen i >= PLAYER_NEUTRAL_AGGRESSIVE
            if GetLocalPlayer() == Player(i) and IsPlayerObserver(Player(i)) then
                if IsMultiboardDisplayed(OBSERVER_BOARD) and IsMultiboardMinimized(OBSERVER_BOARD) then
                    call MultiboardMinimize(OBSERVER_BOARD, false)
                    call DialogDisplay(Player(i),OBSERVER_DIALOG[0],true)
                endif
            endif
        set i = i + 1
    endloop
if obs_present then
    call TimerStart(obs_timer, 2, false, function EncodeObserverEvent)
endif
endfunction
function Trig_event_commands_Actions takes nothing returns nothing
debug call DisplayText("start ?? looping")
if obs_present then
    debug call DisplayText("obs ok -> looping")
    set obs_timer = CreateTimer()
    call TimerStart(obs_timer, 2, false, function EncodeObserverEvent)
endif
endfunction

//===========================================================================
function InitTrig_event_commands takes nothing returns nothing
    set gg_trg_event_commands = CreateTrigger(  )
    call TriggerAddAction( gg_trg_event_commands, function Trig_event_commands_Actions )
endfunction

//===========================================================================
