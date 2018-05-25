
// HCL Modes
// a = No Boats
// B = Elimination
// c = All Random
// D = No Horn
// e = 6v6
// f = EQUAL random
// g = fast start
// h = -hm
// i = no trade
// j = op mode
// p = team kill off
// , = spawn boundaries
// = = HCL Lock, modes cant be entered.
// CLAN HCL CODE
// 0 = tdit
// 7 =  ittp
// 8 = tsot

library MapSetup initializer onInit requires TimerUtils, PublicLibrary, ClassTracking, GameMode

globals
    integer MODES_TIME_LIMIT = 30
    boolean mode_enter = true
    timer MODES_TIMER = CreateTimer()
    timer GAME_TIMER = CreateTimer()
    integer array pnamePresent
    boolean array isobserver
    boolean obs_present = false
endglobals

function ItemRecipeVision takes nothing returns nothing
    call CreateFogModifierRectBJ( true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_vision )
endfunction

function ResetBMSkills takes nothing returns nothing
    call resetBMSkill(GetEnumPlayer())
endfunction

function StartupGold takes nothing returns nothing
    call SetPlayerState(GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER, 3 )
endfunction

function Start_Game takes nothing returns nothing
    call ReleaseTimer(GetExpiredTimer())

    call Map.fireStartGameEvents()

    call DisplayTText(GENERAL_COLOR+"Game has begun.|r", 10)

    call TimerStart(udg_noobTimer, udg_NOOB_TIME_LEFT , false , null)
    call TimerStart(GAME_TIMER, 99999999, false, null)

    call RegisterPlayersTrollClasses()

    call TriggerRegisterTimerEvent( gg_trg_stats_degrading, udg_STAT_LOWER_INTERVAL, true)
    call TriggerRegisterTimerEvent( gg_trg_warmth, udg_CLOTHS_HEATUP_INTERVAL, true )
endfunction

function RemoveUnitX takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function IsMerchant takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_MERCHANT
endfunction

function SlowDisplayea takes nothing returns nothing
    call ReleaseTimer(GetExpiredTimer())
    call TriggerExecute(gg_trg_ShowPlayers)
endfunction

function LocustDisplayUnits takes nothing returns nothing
    call UnitAddAbility( gg_unit_h000_0181 , 'Aloc')
    call UnitAddAbility( gg_unit_o00I_0173 , 'Aloc')
    call UnitAddAbility( gg_unit_o005_0176 , 'Aloc')
    call UnitAddAbility( gg_unit_o00K_0174 , 'Aloc')
    call UnitAddAbility( gg_unit_o003_0157 , 'Aloc')
    call UnitAddAbility( gg_unit_o004_0179 , 'Aloc')
    call UnitAddAbility( gg_unit_O00B_0180 , 'Aloc')
endfunction

function FirstSpawnItemsAnimals takes nothing returns nothing
    call TriggerExecute(gg_trg_spawn_call_first)
endfunction

function GenerateMap takes nothing returns nothing
    local timer t2
    local integer INTEGER = 0
    local group g

    set udg_STARTED = true
    if BOARD_TEAM[1] == null then
        set t2 = NewTimer()
        call TimerStart(t2 , 10, false, function SlowDisplayea)
        set t2 = null
    else
        call TriggerExecute(gg_trg_ShowPlayers)
    endif

    loop
        exitwhen INTEGER > 11
        set udg_orders[INTEGER] = "stay"
        set INTEGER = INTEGER + 1
    endloop

    call ExecuteFunc("Start_Game")
    call FirstSpawnItemsAnimals()
endfunction

function ModesTimerFinished takes nothing returns nothing
    set mode_enter = false
    call GameMode.deregisterAll()
    call ExecuteFunc("StartClassSelection")
endfunction

function Startup_Timer takes nothing returns nothing
    local integer i = 0
    local timer t

    call ReleaseTimer(GetExpiredTimer())
    call LockMammoth()
    call prepareSpells()
    debug call BJDebugMsg("DEBUG MODE ACTIVE.")

    //HCL Modes

    if checkHCLletter("i") then //no trade
        call GameModes_Action("-no trade",Player(0))
    endif

    if checkHCLletter("0") then
        call GameMode.find("ffa").trigger()
    endif

    if checkHCLletter("1") then
        call GameMode.find("1v1").trigger()
    endif

    if checkHCLletter("2") then
        call GameMode.find("2s").trigger()
    endif

    if checkHCLletter("3") then
        call GameMode.find("3s").trigger()
    endif

    if checkHCLletter("4") then
        call GameMode.find("4s").trigger()
    endif

    if checkHCLletter("6") then
        call GameMode.find("6s").trigger()
    endif

    if checkHCLletter("a") then //all random
        call GameMode.find("all").triggerWithArgs("random")
    endif

    if checkHCLletter("e") then //elimination
        call GameMode.find("el").trigger()
    endif

    if checkHCLletter("f") then
        call GameMode.find("fd").trigger()
    endif

    if checkHCLletter("h") then //-hm
        call GameMode.find("hm").trigger()
    endif

    if checkHCLletter("s") then
        call GameMode.find("sf").trigger()
    endif

    if checkHCLletter("t") then
        call GameMode.find("to").trigger()
    endif

    if checkHCLletter(".") then
        set HOSTING_CLAN = "TwGB"
    endif

    set i = 0
    loop
        exitwhen i > 11
        if GetPlayerController(Player(i)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                set modePlayer = Player(i)
                set i = 12
        endif
        set i = i + 1
    endloop

    if checkHCLletter("=") then //locks hcl
        set mode_enter = false
        set MODES_TIME_LIMIT = 0
        call DisplayTText(GENERAL_COLOR+"Mode input is locked.", 45)
    else
        call DisplayTText(COLOR_CODE[GetPlayerId(modePlayer)]+GetPlayerName(modePlayer)+"|r"+GENERAL_COLOR+" can choose game modes.|r", 30)
        call GameMode.registerAll(modePlayer)

        if HOSTING_CLAN == "TwGB" then
            set i = 0
            loop
                exitwhen i > 11
                if modePlayer != Player(i) and StringCase(GetPlayerName(Player(i)), false) == "liquid." then
                    call DisplayTText(COLOR_CODE[i]+GetPlayerName(Player(i))+"|r"+GENERAL_COLOR+" can also choose game modes.|r", 30)
                    call GameMode.registerAll(Player(i))
                endif
                set i = i + 1
            endloop
        endif

        call DisplayTimedTextToPlayer(modePlayer,0,0,30,GENERAL_COLOR+"You have 30 seconds to enter modes|r")
    endif

    call DisplayNewLine()

    if not( HOSTING_CLAN == "" ) then
        call DisplayTText( GENERAL_COLOR + "This game is hosted by " + GREEN_COLOR + "Clan " + HOSTING_CLAN + "|r", 50 )
    endif

    call TriggerRegisterPlayerChatEvent( gg_trg_GameModes, modePlayer, "-", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_no_trees, modePlayer, "-no trees", true )
    call TriggerRegisterPlayerChatEvent( gg_trg_no_herbs, modePlayer, "-no herbs", true )

    call TimerStart(MODES_TIMER, MODES_TIME_LIMIT, false, function ModesTimerFinished)
endfunction

private function onInit takes nothing returns nothing
    local integer i = 0
    local timer t = NewTimer()

    call SetTimeOfDayScale(130 * 0.01)
    call SetFloatGameState(GAME_STATE_TIME_OF_DAY, 3)
    call SetMapFlag( MAP_USE_HANDICAPS, false )
    call EnableMinimapFilterButtons( true, false )
    call SetCreepCampFilterState( false )

    static if LIBRARY_HydrAROUTINE then
        call AddItemToStockBJ( ITEM_HYDRA_HINT, gg_unit_n019_0145, 1, 1 )
    endif

    call ForForce(bj_FORCE_ALL_PLAYERS, function ItemRecipeVision )
    call ForForce(bj_FORCE_ALL_PLAYERS, function ResetBMSkills )
    call ForForce(bj_FORCE_ALL_PLAYERS, function StartupGold )

    call InitGameCacheBJ( "ITT.w3v" )
    set udg_jumpCache = bj_lastCreatedGameCache
    set udg_GameHash = InitHashtable()

    set gg_trg_no_trees = CreateTrigger(  )
    set gg_trg_GameModes = CreateTrigger(  )
    set gg_trg_no_herbs = CreateTrigger(  )

    call UpdateBoardsLoopInit()
    call LocustDisplayUnits()
    call TimerStart(t,0,false,function Startup_Timer)

    loop
        exitwhen i > 11
        if IsPlayerObserver(Player(i)) then
            set isobserver[i] = true
            set obs_present = true
            debug call DisplayText("obs detc")
        else
            set isobserver[i] = false
        endif
        set i = i + 1
    endloop

    set t = null
endfunction

endlibrary
