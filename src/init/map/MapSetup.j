
// HCL Modes
// a = No Boats
// B = Elimination
// c= All Random
// D = No Horn
// e= 6v6
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

function GetHost takes nothing returns nothing
    local gamecache g = InitGameCache("ITT.w3v")
    call StoreInteger(g, "Map", "Host", GetPlayerId(GetLocalPlayer ()))
    call TriggerSyncStart()
    call SyncStoredInteger(g, "Map", "Host" )
    call TriggerSyncReady()
    set udg_Host = Player( GetStoredInteger(g, "Map", "Host" ))
    call FlushGameCache(g )
    set g = null
endfunction

globals
    effect array spawnBoundE
    string island1Mark = "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes4.mdl"
    string island2Mark = "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes8.mdl"
    string island3Mark = "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes3.mdl"
    integer totalEffectsMark
    boolean spawnBound = false
endglobals

function RemoveAllSpawnBoundEffects takes nothing returns nothing
local integer i = 0
call ReleaseTimer(GetExpiredTimer())
loop
    exitwhen i > totalEffectsMark
    call DestroyEffect(spawnBoundE[i])
    set spawnBoundE[i] = null
    set i = i + 1
endloop
endfunction

function SpawnBoundariesEffect takes nothing returns nothing
    call ReleaseTimer(GetExpiredTimer())
    set spawnBoundE[0] = AddSpecialEffect(island1Mark, -4160.000, 1920.000)
    set spawnBoundE[1] = AddSpecialEffect(island1Mark, -4288.000, 1920.000)
    set spawnBoundE[2] = AddSpecialEffect(island1Mark, -4416.000, 1920.000)
    set spawnBoundE[3] = AddSpecialEffect(island1Mark, -4416.000, 2048.000)
    set spawnBoundE[4] = AddSpecialEffect(island1Mark, -4480.000, 2176.000)
    set spawnBoundE[5] = AddSpecialEffect(island1Mark, -4480.000, 2304.000)
    set spawnBoundE[6] = AddSpecialEffect(island1Mark, -4480.000, 2432.000)
    set spawnBoundE[7] = AddSpecialEffect(island1Mark, -4480.000, 2560.000)
    set spawnBoundE[8] = AddSpecialEffect(island1Mark, -4352.000, 2688.000)
    set spawnBoundE[9] = AddSpecialEffect(island1Mark, -4224.000, 2816.000)
    set spawnBoundE[10] = AddSpecialEffect(island1Mark, -4096.000, 2944.000)
    set spawnBoundE[11] = AddSpecialEffect(island1Mark, -3968.000, 3072.000)
    set spawnBoundE[12] = AddSpecialEffect(island1Mark, -3840.000, 3072.000)
    set spawnBoundE[13] = AddSpecialEffect(island1Mark, -3712.000, 2944.000)
    set spawnBoundE[14] = AddSpecialEffect(island1Mark, -3584.000, 2880.000)
    set spawnBoundE[15] = AddSpecialEffect(island1Mark, -3456.000, 2880.000)
    set spawnBoundE[16] = AddSpecialEffect(island1Mark, -3328.000, 2880.000)
    set spawnBoundE[17] = AddSpecialEffect(island1Mark, -3200.000, 2880.000)
    set spawnBoundE[18] = AddSpecialEffect(island1Mark, -3072.000, 2688.000)
    set spawnBoundE[19] = AddSpecialEffect(island1Mark, -2944.000, 2560.000)
    set spawnBoundE[20] = AddSpecialEffect(island1Mark, -3136.000, 2432.000)
    set spawnBoundE[21] = AddSpecialEffect(island1Mark, -3264.000, 2368.000)
    set spawnBoundE[22] = AddSpecialEffect(island1Mark, -3392.000, 2368.000)
    set spawnBoundE[23] = AddSpecialEffect(island1Mark, -3520.000, 2368.000)
    set spawnBoundE[24] = AddSpecialEffect(island1Mark, -3648.000, 2304.000)
    set spawnBoundE[25] = AddSpecialEffect(island1Mark, -3776.000, 2304.000)
    set spawnBoundE[26] = AddSpecialEffect(island1Mark, -3904.000, 2304.000)
    set spawnBoundE[27] = AddSpecialEffect(island1Mark, -4032.000, 2112.000)

    set spawnBoundE[28] = AddSpecialEffect(island2Mark, 4352.000, 1792.000)
    set spawnBoundE[29] = AddSpecialEffect(island2Mark, 4288.000, 1600.000)
    set spawnBoundE[30] = AddSpecialEffect(island2Mark, 4288.000, 1408.000)
    set spawnBoundE[31] = AddSpecialEffect(island2Mark, 4416.000, 1280.000)
    set spawnBoundE[32] = AddSpecialEffect(island2Mark, 4544.000, 1152.000)
    set spawnBoundE[33] = AddSpecialEffect(island2Mark, 4736.000, 1152.000)
    set spawnBoundE[34] = AddSpecialEffect(island2Mark, 4928.000, 1152.000)
    set spawnBoundE[35] = AddSpecialEffect(island2Mark, 5056.000, 1216.000)
    set spawnBoundE[36] = AddSpecialEffect(island2Mark, 5056.000, 1408.000)
    set spawnBoundE[37] = AddSpecialEffect(island2Mark, 5056.000, 1600.000)
    set spawnBoundE[38] = AddSpecialEffect(island2Mark, 5184.000, 1728.000)
    set spawnBoundE[39] = AddSpecialEffect(island2Mark, 5184.000, 1920.000)
    set spawnBoundE[40] = AddSpecialEffect(island2Mark, 5184.000, 2112.000)
    set spawnBoundE[41] = AddSpecialEffect(island2Mark, 4416.000, 2112.000)
    set spawnBoundE[42] = AddSpecialEffect(island2Mark, 4416.000, 2304.000)
    set spawnBoundE[43] = AddSpecialEffect(island2Mark, 4416.000, 2432.000)
    set spawnBoundE[44] = AddSpecialEffect(island2Mark, 4480.000, 2560.000)
    set spawnBoundE[45] = AddSpecialEffect(island2Mark, 4672.000, 2560.000)
    set spawnBoundE[46] = AddSpecialEffect(island2Mark, 4864.000, 2496.000)
    set spawnBoundE[47] = AddSpecialEffect(island2Mark, 4992.000, 2368.000)
    set spawnBoundE[48] = AddSpecialEffect(island2Mark, 5120.000, 2240.000)

    set spawnBoundE[49] = AddSpecialEffect(island3Mark, 2176.000, -4096.000)
    set spawnBoundE[50] = AddSpecialEffect(island3Mark, 2368.000, -4096.000)
    set spawnBoundE[51] = AddSpecialEffect(island3Mark, 2560.000, -4224.000)
    set spawnBoundE[52] = AddSpecialEffect(island3Mark, 2624.000, -4416.000)
    set spawnBoundE[53] = AddSpecialEffect(island3Mark, 2624.000, -4608.000)
    set spawnBoundE[54] = AddSpecialEffect(island3Mark, 2560.000, -4800.000)
    set spawnBoundE[55] = AddSpecialEffect(island3Mark, 2368.000, -4864.000)
    set spawnBoundE[56] = AddSpecialEffect(island3Mark, 2176.000, -4864.000)
    set spawnBoundE[57] = AddSpecialEffect(island3Mark, 1984.000, -4864.000)
    set spawnBoundE[58] = AddSpecialEffect(island3Mark, 1792.000, -4864.000)
    set spawnBoundE[59] = AddSpecialEffect(island3Mark, 1600.000, -4928.000)
    set spawnBoundE[60] = AddSpecialEffect(island3Mark, 1408.000, -4928.000)
    set spawnBoundE[61] = AddSpecialEffect(island3Mark, 1984.000, -4160.000)
    set spawnBoundE[62] = AddSpecialEffect(island3Mark, 1856.000, -4224.000)
    set spawnBoundE[63] = AddSpecialEffect(island3Mark, 1728.000, -4352.000)
    set spawnBoundE[64] = AddSpecialEffect(island3Mark, 1600.000, -4416.000)
    set spawnBoundE[65] = AddSpecialEffect(island3Mark, 1472.000, -4352.000)
    set spawnBoundE[66] = AddSpecialEffect(island3Mark, 1280.000, -4288.000)
    set spawnBoundE[67] = AddSpecialEffect(island3Mark, 1088.000, -4352.000)
    set spawnBoundE[68] = AddSpecialEffect(island3Mark, 960.000, -4480.000)
    set spawnBoundE[69] = AddSpecialEffect(island3Mark, 1024.000, -4672.000)
    set spawnBoundE[70] = AddSpecialEffect(island3Mark, 1088.000, -4800.000)
    set spawnBoundE[71] = AddSpecialEffect(island3Mark, 1280.000, -4928.000)

    set spawnBoundE[72] = AddSpecialEffect(island2Mark, 4352.000, 1984.000) // woops
    set totalEffectsMark = 72
endfunction

function ItemRecipeVision takes nothing returns nothing
    call CreateFogModifierRectBJ( true, GetEnumPlayer(), FOG_OF_WAR_VISIBLE, gg_rct_vision )
endfunction

function ResetBMSkills takes nothing returns nothing
    call resetBMSkill(GetEnumPlayer())
endfunction

function StartupGold takes nothing returns nothing
    call SetPlayerState(GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER, 1 )
endfunction

function Start_Game takes nothing returns nothing
    call ReleaseTimer(GetExpiredTimer())
    call DisplayTText(GENERAL_COLOR+"Game has begun.|r", 10)

    set NOOB_TIME_DIALOG = CreateTimerDialog(udg_noobTimer)
    call TimerDialogSetTitle(NOOB_TIME_DIALOG, "Noob Time Over")
    call TimerDialogDisplay(NOOB_TIME_DIALOG, true)
    call TimerStart( udg_noobTimer, udg_NOOB_TIME_LEFT , false , null )
    call ConditionalTriggerExecute( gg_trg_init_exp )
    
    if udg_SIX_SIX then
        call TriggerExecute(gg_trg_Startup_6v6)
    else
        call TriggerExecute(gg_trg_Startup_Normal)
    endif
    
    call TriggerExecute(gg_trg_exp_remove_or_add)
    
    call init_countGoldGain()
    
    call TriggerRegisterTimerEvent( gg_trg_stats_degrading, udg_STAT_LOWER_INTERVAL, true)
    call TriggerRegisterTimerEvent( gg_trg_warmth, udg_CLOTHS_HEATUP_INTERVAL, true )
    if spawnBound then
        call DisplayTText("These designated areas have been marked with spawn camping boundaries.", 10)
        call PingMinimapEx(GetRectCenterX(gg_rct_revive_1),GetRectCenterY(gg_rct_revive_1),10,99,0,0,true)
        call PingMinimapEx(GetRectCenterX(gg_rct_revive_2),GetRectCenterY(gg_rct_revive_2),10,99,0,0,true)
        call PingMinimapEx(GetRectCenterX(gg_rct_revive_3),GetRectCenterY(gg_rct_revive_3),10,99,0,0,true)
    endif
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

function GenerateMap takes nothing returns nothing
    local timer t = NewTimer()
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
    call TimerDialogDisplay(MODES_TIMER_DIALOG,false)
    call DestroyTimerDialog(MODES_TIMER_DIALOG)
    call DisplayTText(GENERAL_COLOR+"Game mode set. Generating map...|r", 5)
    
    loop
        exitwhen INTEGER > 11
        set udg_orders[INTEGER] = "stay"
        set INTEGER = INTEGER + 1
    endloop
    
    if not AllowTrade then
        if udg_ship != null then
            call RemoveUnit(udg_ship)
            call RemoveUnit(udg_ship2)
        endif
        set g = CreateGroup()
        call GroupEnumUnitsOfPlayer( g, Player(15), Condition(function IsMerchant))
        call ForGroup(g, function RemoveUnitX)
        call DestroyGroup(g)
        /*
    else
        call TimerStart(antiboatStuck, 3, true, function AntiStuckBoat)
        */
    endif
    //BOAT LOCATION
    //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,5,GENERAL_COLOR+"S1(Bottom)- X:"+R2S(GetUnitX(udg_ship))+" // Y:"+R2S(GetUnitY(udg_ship))+"|r")
    //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,5,GENERAL_COLOR+"S2(Left)- X:"+R2S(GetUnitX(udg_ship2))+" // Y:"+R2S(GetUnitY(udg_ship2))+"|r")
    //END
    call SyncTradeboats()
    call TimerStart(t , 3, false, function Start_Game)
    set t = null
endfunction

function FirstSpawnItemsAnimals takes nothing returns nothing
    call TriggerExecute(gg_trg_spawn_call_first)
    call TimerStart(MODES_TIMER, 4, false, function GenerateMap)
endfunction

function RecallFirst takes nothing returns nothing
    call TimerStart(INSTANCE_TIMER, 0, false, function FirstSpawnItemsAnimals)
endfunction

function Startup_Timer takes nothing returns nothing
    local integer i = 0
    local integer x = 0
    local timer t
    call ReleaseTimer(GetExpiredTimer())
    call LockMammoth()
    call TimerStart(MODES_TIMER, 40, false, function GenerateMap)
    set MODES_TIMER_DIALOG = CreateTimerDialog(MODES_TIMER)
    call TimerDialogSetTitle(MODES_TIMER_DIALOG,"Game Starting")
    call TimerDialogDisplay(MODES_TIMER_DIALOG,true)
    //HCL Modes``
    
    if checkHCLletter("a") then //no boats
        //call ConditionalTriggerExecute(gg_trg_no_Boats)
        call GameModes_Action("-no boats",Player(0))
    endif
    if checkHCLletter("b") then //elimination
        //call ConditionalTriggerExecute(gg_trg_Elimination)
        call GameModes_Action("-elimination",Player(0))
    endif
    
    if checkHCLletter("c") then //all random
        //set udg_AllTroll = 0
        //call ConditionalTriggerExecute(gg_trg_all_modes)
        call GameModes_Action("-all random",Player(0))
    endif
    
    if checkHCLletter("d") then //no horn
        call GameModes_Action("-no horn",Player(0))
    endif
    
    if checkHCLletter("e") then //6v6
        call GameModes_Action("-6v6",Player(0))
    endif
    
    if checkHCLletter("f") then //fixed random
        call GameModes_Action("-equal random",Player(0))
    endif
    
    if checkHCLletter("g") then //fs
        call GameModes_Action("-fs",Player(0))
    endif
    
    if checkHCLletter("h") then //-hm
        call GameModes_Action("-hm",Player(0))
    endif
    
    if checkHCLletter("i") then //no trade
        call GameModes_Action("-no trade",Player(0))
    endif
    
    if checkHCLletter("j") then //op
        call GameModes_Action("-op",Player(0))
    endif
    
    if checkHCLletter("p") then //team kill disabled
        call GameModes_Action("-tko",Player(0))
    endif
    
    if checkHCLletter(",") then //spawn boundaries show
        set t = NewTimer()
        set spawnBound = true
        call TimerStart(t, 0, false, function SpawnBoundariesEffect)
        set t = null
    endif
    
    if checkHCLletter("=") then //locks hcl
        set mode_enter = false
        call DisplayTText(GENERAL_COLOR+"Mode input is locked.", 45)
    else
        call DisplayTText(COLOR_CODE[GetPlayerId(modePlayer)]+GetPlayerName(modePlayer)+"|r"+GENERAL_COLOR+" can choose game modes.|r", 40)
    endif
/////////////////////////////////////////////////////////////////////////////////////////////////////    
//call DisplayTText(GREEN_COLOR+ "0", 20)
    if checkHCLletter(".") and clanhcl then //twgb
        set HostingClan = "TwGB"
        set clanhcl = false
        call DisplayTText("
"+GENERAL_COLOR+"This game is hosted by: |r"+GREEN_COLOR+"Clan TwGB @ Azeroth|r
"+GENERAL_COLOR+"Remember, this is a "+RED_COLOR+"BETA|r"+GENERAL_COLOR+" map|r
"+GENERAL_COLOR+"Please email bugs & suggestions to "+ENERGY_COLOR+"djrquazz@gmail.com|r
"+GOLD_COLOR+"Website:|r http://www.clantwgb.com",60)
    else
        static if PRIVATE_MAP then
            call ClearTextMessages()
            call ShowInterface(false, 0)
            call EnableUserControl(false)
            call DisplayTText(RED_COLOR+"BETA TESTING ON TwGB BOTS ONLY",60*60)
        endif
    endif

//    if checkHCLletter(".") and clanhcl then //tournament announce
//        set clanhcl = false
//        call DisplayTText(GREEN_COLOR+"This game is hosted by: Clan TwGB
//TwGB would like to inform players of this game there will be a Spring Tournament on April 30th at 7:00 PM EST, 2v2 Double Elimination, Final Match contains a surprise for both teams.|r", 50)
//    endif
    
//    if checkHCLletter("t") then // t for tournament
//        set clanhcl=false
//        call DisplayTText(GOLD_COLOR+"This game is hosted by: Clan TwGB
//Welcome to the 2011 Spring Tournament! Modes are:|r", 50)
//        call GameModes_Action("-elimination",Player(0))
//        call GameModes_Action("-no boats",Player(0))
//        set mode_enter = false
//        call DisplayTText(GENERAL_COLOR+"Mode input is locked.", 50)
//    endif
    
//    if checkHCLletter("z") then // z for end of alphabet, but also for boss fight
//        call DisplayTText(GREEN_COLOR+"Welcome to the final round of the spring tournament!
//Stick around at the end of the match for some special action.|r", 50)
//        set udg_EpicBossFight=true
//    endif
    
///////////////////////////////////////////////////////////////////////////////////////////////////////
    //end HCL
    
    /*
    - Clan TdiT = 0
    - Clan Sort = 1
    - Clan MoSD = 2
    - Clan EITT = 3
    - Clan TmsT = 4
    - Clan TwS = 5
    - Clan BiTT = 6
    - Clan ITTP = 7
    - Clan TSOT = 8
    - Clan TwGB = .
    */
    
    if checkHCLletter("0") and clanhcl then
       set clanhcl = false
        call DisplayTText(GREEN_COLOR+"This game is hosted by: Clan TdiT|r",50)
        set HostingClan = "TdiT"
    endif
    if checkHCLletter("1") and clanhcl then
        set clanhcl = false
        call DisplayTText(GREEN_COLOR+"This game is hosted by: Clan Sort|r",50)
        set HostingClan = "Sort"
    endif
    if checkHCLletter("2") and clanhcl then
        call DisplayTText(GREEN_COLOR+"This game is hosted by: Clan TwA", 50)
        set HostingClan = "TwA"
    endif
    if checkHCLletter("3") and clanhcl then
        set clanhcl = false
        call DisplayTText(GREEN_COLOR+"This game is hosted by: Clan EITT|r",50)
        set HostingClan = "EITT"
    endif
    if checkHCLletter("4") and clanhcl then
        set clanhcl = false
        call DisplayTText(GREEN_COLOR+"This game is hosted by: Clan TmsT|r",50)
        set HostingClan = "TmsT"
    endif
    if checkHCLletter("5") and clanhcl then
        set clanhcl = false
        call DisplayTText(GREEN_COLOR+"This game is hosted by: Clan TwS|r",50)
        set HostingClan = "TwS"
    endif
    if checkHCLletter("6") and clanhcl then
        set clanhcl = false
        call DisplayTText(GREEN_COLOR+"This game is hosted by: Clan BiTT|r",50)
        set HostingClan = "BiTT"
    endif
    if checkHCLletter("7") and clanhcl then
        set clanhcl = false
        call DisplayTText(GREEN_COLOR+"This game is hosted by: Clan ITTP|r",50)
        set HostingClan = "ITTP"
    endif
    if checkHCLletter("8") and clanhcl then
        set clanhcl = false
        call DisplayTText(GREEN_COLOR+"This game is hosted by: Clan TSOT|r",50)
        set HostingClan = "TSOT"
    endif
    
    call TimerStart(INSTANCE_TIMER, 36, false, function FirstSpawnItemsAnimals)
    call MultiboardDisplay(MODE_BOARD,true)
    call MultiboardMinimize(MODE_BOARD,true)
endfunction

/*
function ISDATAFarm1 takes nothing returns boolean
return GetUnitTypeId(GetFilterUnit()) == UNIT_FARM and GetOwningPlayer(GetFilterUnit()) == Player(0)
endfunction
function ISDATAFarm2 takes nothing returns boolean
return GetUnitTypeId(GetFilterUnit()) == UNIT_FARM and GetOwningPlayer(GetFilterUnit()) == Player(1)
endfunction
function ISDATAFarm3 takes nothing returns boolean
return GetUnitTypeId(GetFilterUnit()) == UNIT_FARM and GetOwningPlayer(GetFilterUnit()) == Player(2)
endfunction
globals
integer effectdoocount = 27 //start int
group gGoogFarms = CreateGroup()
endglobals
function FarmiestBoundaries takes nothing returns nothing
local unit u = GetEnumUnit()
local player p = GetOwningPlayer(u)
local integer i = GetPlayerId(p)
local real x = GetUnitX(u)
local real y = GetUnitY(u)
if i == 0 then
call DisplayText("set spawnBoundE["+I2S(effectdoocount)+"] = AddSpecialEffect(island1Mark, "+R2S(x)+", "+R2S(y)+")")
elseif i == 1 then
call DisplayText("set spawnBoundE["+I2S(effectdoocount)+"] = AddSpecialEffect(island2Mark, "+R2S(x)+", "+R2S(y)+")")
elseif i == 2 then
call DisplayText("set spawnBoundE["+I2S(effectdoocount)+"] = AddSpecialEffect(island3Mark, "+R2S(x)+", "+R2S(y)+")")
endif
set effectdoocount = effectdoocount + 1
endfunction
*/

function MapSetupActions takes nothing returns nothing
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
    
    call prepareSpells()
    call GetHost()
    call UpdateBoardsLoopInit()
    call LocustDisplayUnits()
    call TimerStart(t,0,false,function Startup_Timer)
    call TimerStart(GAME_TIMER, 99999999, false, null)
    
    /*
    albinoblackbat = -19246298
    */
    
    //call DisplayText(I2S(StringHash("albinoblackbat")))
    
    loop
        exitwhen i > 11
        if IsPlayerObserver(Player(i)) then
            set isobserver[i] = true
            set obs_present = true
            debug call DisplayText("obs detc")
        else
            set isobserver[i] = false
        endif
        if not isobserver[i] then
            call ForceAddPlayer(HINT_FORCE,Player(i))
        endif
        set i = i + 1
    endloop
    
    set i = 0
    loop
        exitwhen i > 11
        if GetPlayerController(Player(i)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                set modePlayer = Player(i)
                set i = 12
        endif
        set i = i + 1
    endloop
    
    call TriggerRegisterPlayerChatEvent( gg_trg_GameModes, modePlayer, "-", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_no_trees, modePlayer, "-no trees", true )
    call TriggerRegisterPlayerChatEvent( gg_trg_no_herbs, modePlayer, "-no herbs", true )
    debug call DisplayTText("DEBUG MODE ACTIVE.", 999)
    call DisplayTText(COLOR_CODE[GetPlayerId(udg_Host)]+GetPlayerName(udg_Host)+"|r"+GENERAL_COLOR+" has been detected as the host.|r", 40)
    call DisplayTText(GENERAL_COLOR+"Choose a troll class while waiting for the modes to be selected.|r", 40)
    call DisplayTText(GENERAL_COLOR+"You will be appointed a random troll if you do not pick.|r", 40)
    call DisplayTimedTextToPlayer(modePlayer,0,0,10,GENERAL_COLOR+"You have 10 seconds to type "+HIGHLIGHT_COLOR+"-6v6|r"+GENERAL_COLOR+" before it is automatically disabled.|r")
    call DisplayTText(GENERAL_COLOR+"Type "+HIGHLIGHT_COLOR+"-repick|r"+GENERAL_COLOR+" to repick a troll.|r", 40)
    
    
    // Spawn camp generator boundaries... lol using farms!!
    // using GameCaptureX (greatness)
    /*
    
    call GroupEnumUnitsInRect(gGoogFarms, GetWorldBounds(), function ISDATAFarm1)
    call ForGroup(gGoogFarms ,function FarmiestBoundaries)
    call GroupEnumUnitsInRect(gGoogFarms, GetWorldBounds(), function ISDATAFarm2)
    call ForGroup(gGoogFarms ,function FarmiestBoundaries)
    call GroupEnumUnitsInRect(gGoogFarms, GetWorldBounds(), function ISDATAFarm3)
    call ForGroup(gGoogFarms ,function FarmiestBoundaries)
    */
    set t = null
endfunction

globals
    boolean mode_enter = true
    timer INSTANCE_TIMER = CreateTimer()
    timer MODES_TIMER = CreateTimer()
    timer GAME_TIMER = CreateTimer()
    timerdialog MODES_TIMER_DIALOG
    timerdialog NOOB_TIME_DIALOG
    integer array pnamePresent
    boolean clanhcl = true
    boolean array isobserver
    boolean obs_present = false
endglobals

//===========================================================================
function InitTrig_MapSetup takes nothing returns nothing
    set gg_trg_MapSetup = CreateTrigger(  )
    call TriggerAddAction( gg_trg_MapSetup, function MapSetupActions )
endfunction
//===========================================================================
