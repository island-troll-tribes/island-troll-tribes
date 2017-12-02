library Leavers initializer onInit requires PublicLibrary, Commands, MapSetup, GameConfig
    function Trig_leavers_Actions takes nothing returns nothing
        local integer PID = GetPlayerId(GetTriggerPlayer())
        local integer tribe = GetPidTribeId(PID)
        local integer ppt = GameConfig.getInstance().getNumPlayersPerTribe()
        local integer i = 0
        local boolean hasActivePlayer = false
        local integer tmpPid
        local unit troll

        call DisplayText(GENERAL_COLOR+GetPlayerName(GetTriggerPlayer())+GRAY_COLOR+" ["+COLOR_CODE[PID]+udg_RealNames[PID]+GRAY_COLOR+"]"+GENERAL_COLOR+" has left the game."+GRAY_COLOR+" (Player "+I2S(PID+1)+")|r")

        if isobserver[PID] or not udg_STARTED then
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

        loop
            exitwhen i >= ppt or hasActivePlayer
            set tmpPid = ppt * tribe + i
            set hasActivePlayer = (PID != tmpPid) and GetPlayerController(Player(tmpPid)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(tmpPid)) == PLAYER_SLOT_STATE_PLAYING
            set i = i + 1
        endloop

        if not hasActivePlayer then
            set i = 0
            loop
                exitwhen i >= ppt
                set troll = GetPlayerTroll(Player(i + tribe * ppt))
                if troll != null and IsUnitAliveBJ(troll) then
                    call KillUnit(troll)
                endif
                set i = i + 1
            endloop
        endif

        call ConditionalTriggerExecute(gg_trg_update_names)

        set troll = null
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