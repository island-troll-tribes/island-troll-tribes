library Leavers initializer onInit requires PublicLibrary, Commands, MapSetup
    globals
        boolean TribeHasActivePlayer_hasActivePlayer
    endglobals

    function CheckForActive takes nothing returns nothing
        set TribeHasActivePlayer_hasActivePlayer = TribeHasActivePlayer_hasActivePlayer or GetPlayerSlotState(GetEnumPlayer()) == PLAYER_SLOT_STATE_PLAYING
    endfunction

    function TribeHasActivePlayer takes force tribe returns boolean
        set TribeHasActivePlayer_hasActivePlayer = false
        call ForForce(tribe, function CheckForActive)
        return TribeHasActivePlayer_hasActivePlayer
    endfunction

    function Trig_leavers_Actions takes nothing returns nothing
        local integer PID = GetPlayerId(GetTriggerPlayer())
        call DisplayText(GENERAL_COLOR+GetPlayerName(GetTriggerPlayer())+GRAY_COLOR+" ["+COLOR_CODE[PID]+udg_RealNames[PID]+GRAY_COLOR+"]"+GENERAL_COLOR+" has left the game."+GRAY_COLOR+" (Player "+I2S(PID+1)+")|r")
        if isobserver[PID] then
            return
        endif
        call ConditionalTriggerExecute( gg_trg_update_names )
        if not TribeHasActivePlayer(TEAM[TEAM_PLAYER[PID]]) then
            call KillUnit(GetPlayerTroll(GetTriggerPlayer()))
            call RemoveUnit(GetPlayerTroll(GetTriggerPlayer()))
            return
        endif
        set tempInt = PID
        if not adv_control[PID] then
            call ForForce(TEAM[TEAM_PLAYER[PID]], function ShareAdvControl)
            set adv_control[PID] = true
        endif
        set tempInt = PID
        if not shr_control[PID] then
            call ForForce(TEAM[TEAM_PLAYER[PID]], function ShareControl)
            set shr_control[PID] = true
        endif
        set tempInt = PID
        if not vision_pub[PID] then
            call ForForce(TEAM[TEAM_PLAYER[PID]], function PublicVision)
            set vision_pub[PID] = true
        endif
    endfunction

    //===========================================================================
    private function onInit takes nothing returns nothing
        local integer i = 0
        set gg_trg_leavers = CreateTrigger(  )
        loop
            exitwhen i > 11
            call TriggerRegisterPlayerEvent(gg_trg_leavers, Player(i), EVENT_PLAYER_LEAVE)
            set i = i + 1
        endloop
        call TriggerAddAction( gg_trg_leavers, function Trig_leavers_Actions )
    endfunction
    //===========================================================================
endlibrary