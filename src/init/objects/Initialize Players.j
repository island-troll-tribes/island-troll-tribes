
//***************************************************************************
//*
//*  Players
//*
//***************************************************************************

library InitPlayers
    function InitCustomPlayerSlots takes nothing returns nothing

        // Player 0
        call SetPlayerStartLocation(Player(0), 0)
        call ForcePlayerStartLocation(Player(0), 0)
        call SetPlayerColor(Player(0), ConvertPlayerColor(0))
        call SetPlayerRacePreference(Player(0), RACE_PREF_ORC)
        call SetPlayerRaceSelectable(Player(0), true)
        call SetPlayerController(Player(0), MAP_CONTROL_USER)

        // Player 1
        call SetPlayerStartLocation(Player(1), 1)
        call ForcePlayerStartLocation(Player(1), 1)
        call SetPlayerColor(Player(1), ConvertPlayerColor(1))
        call SetPlayerRacePreference(Player(1), RACE_PREF_ORC)
        call SetPlayerRaceSelectable(Player(1), true)
        call SetPlayerController(Player(1), MAP_CONTROL_USER)

        // Player 2
        call SetPlayerStartLocation(Player(2), 2)
        call ForcePlayerStartLocation(Player(2), 2)
        call SetPlayerColor(Player(2), ConvertPlayerColor(2))
        call SetPlayerRacePreference(Player(2), RACE_PREF_ORC)
        call SetPlayerRaceSelectable(Player(2), true)
        call SetPlayerController(Player(2), MAP_CONTROL_USER)

        // Player 3
        call SetPlayerStartLocation(Player(3), 3)
        call ForcePlayerStartLocation(Player(3), 3)
        call SetPlayerColor(Player(3), ConvertPlayerColor(3))
        call SetPlayerRacePreference(Player(3), RACE_PREF_ORC)
        call SetPlayerRaceSelectable(Player(3), true)
        call SetPlayerController(Player(3), MAP_CONTROL_USER)

        // Player 4
        call SetPlayerStartLocation(Player(4), 4)
        call ForcePlayerStartLocation(Player(4), 4)
        call SetPlayerColor(Player(4), ConvertPlayerColor(4))
        call SetPlayerRacePreference(Player(4), RACE_PREF_ORC)
        call SetPlayerRaceSelectable(Player(4), true)
        call SetPlayerController(Player(4), MAP_CONTROL_USER)

        // Player 5
        call SetPlayerStartLocation(Player(5), 5)
        call ForcePlayerStartLocation(Player(5), 5)
        call SetPlayerColor(Player(5), ConvertPlayerColor(5))
        call SetPlayerRacePreference(Player(5), RACE_PREF_ORC)
        call SetPlayerRaceSelectable(Player(5), true)
        call SetPlayerController(Player(5), MAP_CONTROL_USER)

        // Player 6
        call SetPlayerStartLocation(Player(6), 6)
        call ForcePlayerStartLocation(Player(6), 6)
        call SetPlayerColor(Player(6), ConvertPlayerColor(6))
        call SetPlayerRacePreference(Player(6), RACE_PREF_ORC)
        call SetPlayerRaceSelectable(Player(6), true)
        call SetPlayerController(Player(6), MAP_CONTROL_USER)

        // Player 7
        call SetPlayerStartLocation(Player(7), 7)
        call ForcePlayerStartLocation(Player(7), 7)
        call SetPlayerColor(Player(7), ConvertPlayerColor(7))
        call SetPlayerRacePreference(Player(7), RACE_PREF_ORC)
        call SetPlayerRaceSelectable(Player(7), true)
        call SetPlayerController(Player(7), MAP_CONTROL_USER)

        // Player 8
        call SetPlayerStartLocation(Player(8), 8)
        call ForcePlayerStartLocation(Player(8), 8)
        call SetPlayerColor(Player(8), ConvertPlayerColor(8))
        call SetPlayerRacePreference(Player(8), RACE_PREF_ORC)
        call SetPlayerRaceSelectable(Player(8), true)
        call SetPlayerController(Player(8), MAP_CONTROL_USER)

        // Player 9
        call SetPlayerStartLocation(Player(9), 9)
        call ForcePlayerStartLocation(Player(9), 9)
        call SetPlayerColor(Player(9), ConvertPlayerColor(9))
        call SetPlayerRacePreference(Player(9), RACE_PREF_ORC)
        call SetPlayerRaceSelectable(Player(9), true)
        call SetPlayerController(Player(9), MAP_CONTROL_USER)

        // Player 10
        call SetPlayerStartLocation(Player(10), 10)
        call ForcePlayerStartLocation(Player(10), 10)
        call SetPlayerColor(Player(10), ConvertPlayerColor(10))
        call SetPlayerRacePreference(Player(10), RACE_PREF_ORC)
        call SetPlayerRaceSelectable(Player(10), true)
        call SetPlayerController(Player(10), MAP_CONTROL_USER)

        // Player 11
        call SetPlayerStartLocation(Player(11), 11)
        call ForcePlayerStartLocation(Player(11), 11)
        call SetPlayerColor(Player(11), ConvertPlayerColor(11))
        call SetPlayerRacePreference(Player(11), RACE_PREF_ORC)
        call SetPlayerRaceSelectable(Player(11), true)
        call SetPlayerController(Player(11), MAP_CONTROL_USER)

    endfunction

    function InitCustomTeams takes nothing returns nothing
        // Force: TRIGSTR_2856
        call SetPlayerTeam(Player(0), 0)
        call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
        call SetPlayerTeam(Player(1), 0)
        call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
        call SetPlayerTeam(Player(2), 0)
        call SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
        call SetPlayerTeam(Player(3), 0)
        call SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)

        //   Allied
        call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
        call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
        call SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
        call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
        call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
        call SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
        call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
        call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
        call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
        call SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
        call SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
        call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)

        //   Shared Vision
        call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
        call SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
        call SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
        call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
        call SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
        call SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
        call SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
        call SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
        call SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
        call SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
        call SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
        call SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)

        // Force: TRIGSTR_2857
        call SetPlayerTeam(Player(4), 1)
        call SetPlayerState(Player(4), PLAYER_STATE_ALLIED_VICTORY, 1)
        call SetPlayerTeam(Player(5), 1)
        call SetPlayerState(Player(5), PLAYER_STATE_ALLIED_VICTORY, 1)
        call SetPlayerTeam(Player(6), 1)
        call SetPlayerState(Player(6), PLAYER_STATE_ALLIED_VICTORY, 1)
        call SetPlayerTeam(Player(7), 1)
        call SetPlayerState(Player(7), PLAYER_STATE_ALLIED_VICTORY, 1)

        //   Allied
        call SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
        call SetPlayerAllianceStateAllyBJ(Player(4), Player(6), true)
        call SetPlayerAllianceStateAllyBJ(Player(4), Player(7), true)
        call SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
        call SetPlayerAllianceStateAllyBJ(Player(5), Player(6), true)
        call SetPlayerAllianceStateAllyBJ(Player(5), Player(7), true)
        call SetPlayerAllianceStateAllyBJ(Player(6), Player(4), true)
        call SetPlayerAllianceStateAllyBJ(Player(6), Player(5), true)
        call SetPlayerAllianceStateAllyBJ(Player(6), Player(7), true)
        call SetPlayerAllianceStateAllyBJ(Player(7), Player(4), true)
        call SetPlayerAllianceStateAllyBJ(Player(7), Player(5), true)
        call SetPlayerAllianceStateAllyBJ(Player(7), Player(6), true)

        //   Shared Vision
        call SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
        call SetPlayerAllianceStateVisionBJ(Player(4), Player(6), true)
        call SetPlayerAllianceStateVisionBJ(Player(4), Player(7), true)
        call SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
        call SetPlayerAllianceStateVisionBJ(Player(5), Player(6), true)
        call SetPlayerAllianceStateVisionBJ(Player(5), Player(7), true)
        call SetPlayerAllianceStateVisionBJ(Player(6), Player(4), true)
        call SetPlayerAllianceStateVisionBJ(Player(6), Player(5), true)
        call SetPlayerAllianceStateVisionBJ(Player(6), Player(7), true)
        call SetPlayerAllianceStateVisionBJ(Player(7), Player(4), true)
        call SetPlayerAllianceStateVisionBJ(Player(7), Player(5), true)
        call SetPlayerAllianceStateVisionBJ(Player(7), Player(6), true)

        // Force: TRIGSTR_2858
        call SetPlayerTeam(Player(8), 2)
        call SetPlayerState(Player(8), PLAYER_STATE_ALLIED_VICTORY, 1)
        call SetPlayerTeam(Player(9), 2)
        call SetPlayerState(Player(9), PLAYER_STATE_ALLIED_VICTORY, 1)
        call SetPlayerTeam(Player(10), 2)
        call SetPlayerState(Player(10), PLAYER_STATE_ALLIED_VICTORY, 1)
        call SetPlayerTeam(Player(11), 2)
        call SetPlayerState(Player(11), PLAYER_STATE_ALLIED_VICTORY, 1)

        //   Allied
        call SetPlayerAllianceStateAllyBJ(Player(8), Player(9), true)
        call SetPlayerAllianceStateAllyBJ(Player(8), Player(10), true)
        call SetPlayerAllianceStateAllyBJ(Player(8), Player(11), true)
        call SetPlayerAllianceStateAllyBJ(Player(9), Player(8), true)
        call SetPlayerAllianceStateAllyBJ(Player(9), Player(10), true)
        call SetPlayerAllianceStateAllyBJ(Player(9), Player(11), true)
        call SetPlayerAllianceStateAllyBJ(Player(10), Player(8), true)
        call SetPlayerAllianceStateAllyBJ(Player(10), Player(9), true)
        call SetPlayerAllianceStateAllyBJ(Player(10), Player(11), true)
        call SetPlayerAllianceStateAllyBJ(Player(11), Player(8), true)
        call SetPlayerAllianceStateAllyBJ(Player(11), Player(9), true)
        call SetPlayerAllianceStateAllyBJ(Player(11), Player(10), true)

        //   Shared Vision
        call SetPlayerAllianceStateVisionBJ(Player(8), Player(9), true)
        call SetPlayerAllianceStateVisionBJ(Player(8), Player(10), true)
        call SetPlayerAllianceStateVisionBJ(Player(8), Player(11), true)
        call SetPlayerAllianceStateVisionBJ(Player(9), Player(8), true)
        call SetPlayerAllianceStateVisionBJ(Player(9), Player(10), true)
        call SetPlayerAllianceStateVisionBJ(Player(9), Player(11), true)
        call SetPlayerAllianceStateVisionBJ(Player(10), Player(8), true)
        call SetPlayerAllianceStateVisionBJ(Player(10), Player(9), true)
        call SetPlayerAllianceStateVisionBJ(Player(10), Player(11), true)
        call SetPlayerAllianceStateVisionBJ(Player(11), Player(8), true)
        call SetPlayerAllianceStateVisionBJ(Player(11), Player(9), true)
        call SetPlayerAllianceStateVisionBJ(Player(11), Player(10), true)

    endfunction

    function InitAllyPriorities takes nothing returns nothing

        call SetStartLocPrioCount(0, 3)
        call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)

        call SetStartLocPrioCount(1, 3)
        call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_HIGH)

        call SetStartLocPrioCount(2, 3)
        call SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH)

        call SetStartLocPrioCount(3, 3)
        call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH)

        call SetStartLocPrioCount(4, 3)
        call SetStartLocPrio(4, 0, 5, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(4, 1, 6, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(4, 2, 7, MAP_LOC_PRIO_HIGH)

        call SetStartLocPrioCount(5, 3)
        call SetStartLocPrio(5, 0, 4, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(5, 1, 6, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(5, 2, 7, MAP_LOC_PRIO_HIGH)

        call SetStartLocPrioCount(6, 3)
        call SetStartLocPrio(6, 0, 4, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(6, 1, 5, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(6, 2, 7, MAP_LOC_PRIO_HIGH)

        call SetStartLocPrioCount(7, 3)
        call SetStartLocPrio(7, 0, 4, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(7, 1, 5, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(7, 2, 6, MAP_LOC_PRIO_HIGH)

        call SetStartLocPrioCount(8, 3)
        call SetStartLocPrio(8, 0, 9, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(8, 1, 10, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(8, 2, 11, MAP_LOC_PRIO_HIGH)

        call SetStartLocPrioCount(9, 3)
        call SetStartLocPrio(9, 0, 8, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(9, 1, 10, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(9, 2, 11, MAP_LOC_PRIO_HIGH)

        call SetStartLocPrioCount(10, 3)
        call SetStartLocPrio(10, 0, 8, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(10, 1, 9, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(10, 2, 11, MAP_LOC_PRIO_HIGH)

        call SetStartLocPrioCount(11, 3)
        call SetStartLocPrio(11, 0, 8, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(11, 1, 9, MAP_LOC_PRIO_HIGH)
        call SetStartLocPrio(11, 2, 10, MAP_LOC_PRIO_HIGH)
    endfunction
endlibrary