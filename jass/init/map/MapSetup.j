library MapSetup initializer onInit requires TimerUtils, PublicLibrary, GameMode, InitializeUnits

globals
    integer MODES_TIME_LIMIT = 60
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

function Start_Game takes nothing returns nothing
    call ReleaseTimer(GetExpiredTimer())

    call SetTimeOfDay( 6.00 )

    call Map.fireStartGameEvents()

    call DisplayTText(GENERAL_COLOR+"Game has begun.|r", 10)
    call TimerStart(GAME_TIMER, 99999999, false, null)
endfunction

function SlowDisplayea takes nothing returns nothing
    call ReleaseTimer(GetExpiredTimer())
    call TriggerExecute(gg_trg_ShowPlayers)
endfunction

function LocustDisplayUnits takes nothing returns nothing
    call UnitAddAbility(RECIPE_ARMORY, 'Aloc')
    call UnitAddAbility(RECIPE_WORKSHOP, 'Aloc')
    call UnitAddAbility(RECIPE_POT, 'Aloc')
    call UnitAddAbility(RECIPE_WITCH_DOCTORS_HUT, 'Aloc')
    call UnitAddAbility(RECIPE_TANNERY, 'Aloc')
    call UnitAddAbility(RECIPE_FIRE, 'Aloc')
    call UnitAddAbility(RECIPE_GATHERER, 'Aloc')
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
    call TriggerExecute(gg_trg_spawn_call_first)
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

    call DisplayTText(COLOR_CODE[GetPlayerId(modePlayer)]+GetPlayerName(modePlayer)+"|r"+GENERAL_COLOR+" can choose game modes.|r", 30)
    call DisplayTimedTextToPlayer(modePlayer,0,0,30,GENERAL_COLOR+"You have 30 seconds to enter modes|r|n")

    set i = 0
    loop
        exitwhen i > 11
        if GetPlayerController(Player(i)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                set modePlayer = Player(i)
                set i = 12
        endif
        set i = i + 1
    endloop

    call GameMode.registerAll(modePlayer)
    call TriggerRegisterPlayerChatEvent( gg_trg_GameModes, modePlayer, "-", false )
    call TimerStart(MODES_TIMER, MODES_TIME_LIMIT, false, function ModesTimerFinished)
endfunction

private function onInit takes nothing returns nothing
    local integer i = 0
    local timer t = NewTimer()

    call SetTimeOfDayScale(130 * 0.01)
    call SetFloatGameState(GAME_STATE_TIME_OF_DAY, 3)
    call SetMapFlag(MAP_USE_HANDICAPS, false)
    call EnableMinimapFilterButtons(true, false)
    call SetCreepCampFilterState(false)

    call AddItemToStockBJ( ITEM_HYDRA_HINT, OMINOUS_ALTAR, 1, 1 )

    call ForForce(bj_FORCE_ALL_PLAYERS, function ItemRecipeVision)
    call ForForce(bj_FORCE_ALL_PLAYERS, function ResetBMSkills)

    call InitGameCacheBJ( "ITT.w3v" )
    set udg_jumpCache = bj_lastCreatedGameCache
    set udg_GameHash = InitHashtable()

    set gg_trg_GameModes = CreateTrigger()

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
