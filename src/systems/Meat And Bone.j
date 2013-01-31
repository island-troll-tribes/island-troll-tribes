
//===========================================================================
//TESH.scrollpos=245
//TESH.alwaysfold=0
globals
    boolean Mammoth_Dead = false
    boolean DD_Dead = false
    boolean FirstDuckDead = false
    //boolean Turtle_Dead = false
    boolean Hydra_Dead = false
    
    unit Mammoth = null
    unit DiscoDuck = null
    //unit Turtle = null
    unit Hydra = null
    
    constant string teleportModel = "Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl"
endglobals

/*
function SpawnTurtle takes nothing returns nothing
local timer t = GetExpiredTimer()
local real rX = 0
local real rY = 0
loop
    set rX = GetRandomReal(GetRectMinX(gg_rct_play_area), GetRectMaxX(gg_rct_play_area))
    set rY = GetRandomReal(GetRectMinY(gg_rct_play_area), GetRectMaxY(gg_rct_play_area))
    exitwhen GetTerrainCliffLevel(rX, rY) <= 0
endloop
call KillSoundWhenDone(gg_snd_TheHornOfCenarius)
set Turtle = CreateUnit(Player(12), UNIT_RAPID_TURTLE, rX, rY, GetRandomReal(0,360))
call DestroyEffect(AddSpecialEffectTarget(teleportModel, Turtle, "overhead"))
call ReleaseTimer(t)
call StartTurtleRoutine()
set t = null
endfunction

function Start_Boss_Turtle takes nothing returns nothing
local timer t
if FirstDuckDead then
    set t = NewTimer()
    call TimerStart(t, GetRandomReal(300,900), false, function SpawnTurtle) // Spawns between 5 - 15 minutes
endif
set t = null
endfunction
*/
function SetBackToBMTame takes player p returns nothing
    call PolledWait( 1.50 )    
    call SetPlayerAbilityAvailable( p, SPELL_PET_TAME, true )//tame
    call SetPlayerAbilityAvailable( p, SPELL_PET_RELEASE, false )//release
    call SetPlayerAbilityAvailable( p, SPELL_PET_FOLLOW, false )//Follow
    call SetPlayerAbilityAvailable( p, 'A01D', false )//stay
    call SetPlayerAbilityAvailable( p, SPELL_PET_SLEEP, false )//sleefalse
    call SetPlayerAbilityAvailable( p, SPELL_PET_ATTACK, false )//attack
    call SetPlayerAbilityAvailable( p, SPELL_PET_SCOUT, false )//scout
    call SetPlayerAbilityAvailable( p, 'A06R', false )//bring items
    call SetPlayerAbilityAvailable( p, SPELL_PET_GO_TO_HATCHERY, false )//go to hatchery
    call SetPlayerAbilityAvailable( p, SPELL_PET_DROP_ITEMS, false )//drofalse items
endfunction

/*
    if ( Trig_meat_and_bone_Func025Func002C() ) then
        call GroupRemoveUnitSimple( GetDyingUnit(), udg_babyPets )
        call getPlayersTroll(GetOwningPlayer(GetDyingUnit()))
        set q=udg_parameterUnit
        call TriggerExecute( gg_trg_back_to_tame )
        set udg_parameterUnit=q
        call DisplayTextToForce( GetPlayersAllies(GetOwningPlayer(udg_parameterUnit)), "TRIGSTR_3430" )
     
function ResetBMPets takes nothing returns nothing
local unit d = GetDyingUnit()
local player p = GetOwningPlayer(d)
    if d == GetEnumUnit() then
        if IsUnitInGroup(d, udg_babyPets) then
            call GroupRemoveUnit( udg_babyPets , d)
        elseif IsUnitInGroup(d, udg_midPets) then
            call GroupRemoveUnit( udg_midPets , d)
        elseif IsUnitInGroup(d, udg_pets) then
            call GroupRemoveUnit( udg_pets , d)
        endif
        //set udg_parameterUnit = udg_PUnits[GetPlayerId(p)]
        call SetBackToBMTame( p )
        call DisplayTimedTextToForce(GetPlayersAllies(p), 7, "A pet has died!" )
    endif
set d = null
endfunction
*/
function Trig_meat_and_bone_Actions takes nothing returns nothing
local unit dying = GetDyingUnit()
local unit killing = GetKillingUnit()
local real x = GetUnitX(dying)
local real y = GetUnitY(dying)
local integer uid = GetUnitTypeId(dying)
local boolean b = false
local integer i = 1
local integer v = 0
local unit u
local player p = GetOwningPlayer(dying)
    // Stuff
    if uid == UNIT_ELK then
        call RemoveUnit(dying)
        loop
            exitwhen i > R2I(( 5.00 * udg_FOOD_FOR_KILL_PROPORTION ))
            call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_ELK_HIDE, x, y )
        set udg_ANIMAL_CURRENT = ( udg_ANIMAL_CURRENT - 1 )
        call getAnimalGreenLight(killing)
        if udg_booleanParameter then
            call CreateUnit( Player(15), UNIT_FAWN, x, y, 270.00 )
        endif
    endif
    if uid == UNIT_JUNGLE_WOLF then
        call RemoveUnit( dying )
        loop
            exitwhen i > R2I(( 4.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_JUNGLE_WOLF_HIDE, x, y )
        set udg_ANIMAL_CURRENT = ( udg_ANIMAL_CURRENT - 1 )
        call getAnimalGreenLight(killing)
        if udg_booleanParameter then
            call CreateUnit( Player(15), UNIT_WOLF_PUP, x, y, 270.00 )
        endif
    endif
    if uid == UNIT_JUNGLE_BEAR then
        call RemoveUnit( dying )
        loop
            exitwhen i > R2I(( 7.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_JUNGLE_BEAR_HIDE, x, y )
        set udg_ANIMAL_CURRENT = ( udg_ANIMAL_CURRENT - 1 )
        call getAnimalGreenLight(killing)
        if udg_booleanParameter then
            call CreateUnit( Player(15), UNIT_BEAR_CUB, x, y, 270.00 )
        endif
    endif
    if uid == UNIT_MAMMOTH and GetUnitAbilityLevel(dying, 'BIil') == 0 then
        set Mammoth_Dead = true
        call RemoveUnit( dying )
        loop
            exitwhen i > R2I(( 16.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        if udg_BOSS_PRIZE_MODE then
            if GetRandomReal(0, 100) <= 25 then
                call placeMedallion(x, y)
            endif
            if GetRandomReal(0, 100) <= 25 then
                call placeMedallion(x, y)
            endif
            if GetRandomReal(0, 100) <= 20 then
                call placeMedallion(x, y)
            endif
            if GetRandomReal(0, 100) <= 15 then
                call placeMedallion(x, y)
            endif
            if GetRandomReal(0, 100) <= 15 then
                call placeMedallion(x, y)
            endif
            // bow insert,,, temp
            if GetRandomReal(0, 100) <= 25 then
                set leg_bow = CreateItem(ITEM_ANCIENT_BOW, x, y)
            endif
            // end
            call CreateItem( ITEM_HORN_MAMMOTH, x, y )
            call CreateItem( ITEM_HORN_MAMMOTH, x, y )
        endif
        call getAnimalGreenLight(killing)
        if udg_booleanParameter then
            set u = CreateUnit( Player(15), UNIT_MAMMOTH_BABY, x, y, 270.00 )
            call SetUnitExploded( u, true )
            call UnitApplyTimedLife( u, 'BTLF', 10 )
            set u = null
        endif
    endif
    if uid == UNIT_DISCO_DUCK and GetUnitAbilityLevel(dying, 'BIil') == 0 then
        //if not FirstDuckDead then
          //  set FirstDuckDead = true
            //call Start_Boss_Turtle()
        //endif
        set DD_Dead = true
        call RemoveUnit( dying )
        loop
            exitwhen i > R2I(( 13.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        if udg_BOSS_PRIZE_MODE then
            call placeMedallion(x, y)
            call placeMedallion(x, y)
            call placePinion(x, y)
        endif
    endif
    /*
    if uid == UNIT_RAPID_TURTLE and GetUnitAbilityLevel(dying, 'BIil') == 0 then
        set Turtle_Dead = true
        call RemoveUnit( dying )
        loop
            exitwhen i > R2I(( 20.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        if udg_BOSS_PRIZE_MODE then
            call placeMedallion(x, y)
            call placeMedallion(x, y)
            call placeMedallion(x, y)
            call placeMedallion(x, y)
            set i = 1
            loop
                exitwhen i > GetRandomInt(0, 3)
                    call CreateItem( getTurtleItem(), x, y )
                set i = i + 1
            endloop
        endif
    endif
    */
    // TEH HYDRA ~
    static if LIBRARY_HydrAROUTINE then
    if uid == UNIT_ANCIENT_HYDRA and GetUnitAbilityLevel(dying, 'BIil') == 0 then
        set Hydra_Dead = true
        call RemoveUnit( dying )
        loop
            exitwhen i > R2I(( 8.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        set pastTime = false
        call TimerStart(hydraDespawnTimer, 60, false, function HydraDespawn)
        set lesserCount = lesserCount + 1
        set u = CreateUnit(Player(12), UNIT_LESSER_HYDRA, x, y, GetRandomReal(0, 360))
        call DestroyEffect(AddSpecialEffectTarget(hydraSpawnModel, u, "head"))
        call SetUnitUserData(u, lesserCount)
        set spawn_X[lesserCount] = 0
        set spawn_Y[lesserCount] = 0
        set lesserCount = lesserCount + 1
        set u = CreateUnit(Player(12), UNIT_LESSER_HYDRA, x, y, GetRandomReal(0, 360))
        call DestroyEffect(AddSpecialEffectTarget(hydraSpawnModel, u, "head"))
        call SetUnitUserData(u, lesserCount)
        set spawn_X[lesserCount] = 0
        set spawn_Y[lesserCount] = 0
        set trueCount = trueCount + 2
        set u = null
    endif
    // LESSER HYDRA -- SPAWNS
    if uid == UNIT_LESSER_HYDRA and GetUnitAbilityLevel(dying, 'BIil') == 0 then
        call RemoveUnit( dying )
        set trueCount = trueCount - 1
        loop
            exitwhen i > R2I(( 4.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        set v = GetUnitUserData(dying)
        set spawn_X[v] = x
        set spawn_Y[v] = y
        if trueCount == 0 then
            //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,999,":Last Lesser Hydra killed")
            if pastTime then
                    if hydraTimerStarted then
                    //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,999,":Quick Timer -- Spawn")
                    call TimerStart(hydraTimer, 0, false, function AddHydraS)
                endif
            else
                //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,999,":Timer Pass, Passing Items to corpse")
                set hydraStarted = false
                set hydraTimerStarted = false
                call PauseTimer(hydraTimer)
                call PauseTimer(hydraDespawnTimer)
                set i = 0
                loop
                    exitwhen i > lesserCount
                    if spawn_Y[i] != 0 then
                        call CreateItem( ITEM_HYDRA_SCALE, spawn_X[i], spawn_Y[i])
                        call CreateItem( ITEM_HYDRA_SCALE, spawn_X[i], spawn_Y[i])
                        set spawn_Y[i] = 0
                    endif
                    set i = i + 1
                endloop
                //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,999,":Timer Pass, Done Item Pass")
            endif
        endif
        if not hydraTimerStarted and hydraStarted then
            set hydraTimerStarted = true
            set pastTime = false
            call TimerStart(hydraTimer, 2.5, false, function AddHydraS)
        endif
    endif
    endif
    set udg_booleanParameter = checkTroll(dying)
    if udg_booleanParameter and GetUnitAbilityLevel(dying, 'BIil') == 0 then
        loop
            exitwhen i > R2I(( 3.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
    endif
    if uid == UNIT_FISH then
        loop
            exitwhen i > R2I(( 1.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        set udg_FISH_CURRENT = ( udg_FISH_CURRENT - 1 )
        call RemoveUnit( dying )
    endif
    if uid == UNIT_MAGENTA_FISH then
        if not fishytrigger then
            call AdjustPlayerStateBJ(5, Player(-GetPlayerId(p)), PLAYER_STATE_RESOURCE_GOLD)
        endif
        loop
            exitwhen i > R2I(( 9.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem(ITEM_STICK, x, y)
        call CreateItem(ITEM_MUSHROOM, x, y)
        set udg_ITEM_CURRENT = udg_ITEM_CURRENT + 2
        set udg_FISH_CURRENT = ( udg_FISH_CURRENT - 1 )
        call RemoveUnit( dying )
    endif
    if uid == UNIT_GREEN_FISH then
        loop
            exitwhen i > R2I(( 3.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        set udg_FISH_CURRENT = ( udg_FISH_CURRENT - 1 )
        call RemoveUnit( dying )
    endif
    if uid == UNIT_ADULT_ELK then
        loop
            exitwhen i > R2I(( 7.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_ELK_HIDE, x, y )
        call RemoveUnit( dying )
    endif
    if uid == UNIT_ELK_ADOLESCENT then
        loop
            exitwhen i > R2I(( 6.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_ELK_HIDE, x, y )
        call RemoveUnit( dying )
    endif
    if uid == UNIT_ADULT_JUNGLE_BEAR then
        loop
            exitwhen i > R2I(( 9.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_JUNGLE_BEAR_HIDE, x, y )
        call RemoveUnit( dying )
    endif
    if uid == UNIT_ADULT_JUNGLE_WOLF then
        loop
            exitwhen i > R2I(( 8.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_JUNGLE_WOLF_HIDE, x, y )
        call RemoveUnit( dying )
    endif
    if uid == UNIT_BEAR_CUB then
        loop
            exitwhen i > R2I(( 3.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call RemoveUnit( dying )
    endif
    if uid == UNIT_WOLF_PUP then
        loop
            exitwhen i > R2I(( 2.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call RemoveUnit( dying )
    endif
    if uid == UNIT_FAWN then
        loop
            exitwhen i > R2I(( 1.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call RemoveUnit( dying )
    endif
    if uid == UNIT_SNAKE then
        loop
            exitwhen i > R2I(( 1.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call PolledWait( 0.50 )
        call RemoveUnit( dying )
    endif
    if uid == UNIT_PANTHER or uid == UNIT_ELDER_PANTHER then
        loop
            exitwhen i > R2I(( 8.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        call RemoveUnit( dying )
    endif
    if uid == UNIT_ALIGATOR_MAN then
        loop
            exitwhen i > R2I(( 10.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        if udg_BOSS_PRIZE_MODE then
            set i = 1
            loop
                exitwhen i > GetRandomInt(3, 7)
                    call CreateItem( getBossItem(), x, y )
                set i = i + 1
            endloop
            if GetRandomReal(0, 100) <= 20 then
                call placeMedallion(x, y)
            endif
            if GetRandomReal(0, 100) <= 15 then
                call placeMedallion(x, y)
            endif
        endif
        call RemoveUnit( dying )
    endif
    if uid == UNIT_ONE then
        loop
            exitwhen i > R2I(( 3.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        if udg_BOSS_PRIZE_MODE then
            if GetRandomReal(0, 100) <= 20 then
                call placeMedallion(x, y)
            else
                set i = 1
                loop
                    exitwhen i > GetRandomInt(3, 5)
                        call CreateItem( getTrollBossItem(), x, y )
                    set i = i + 1
                endloop
            endif
        endif
        call RemoveUnit( dying )
    endif
    set udg_booleanParameter = checkHawk(dying)
    if udg_booleanParameter then
        loop
            exitwhen i > R2I(( 2.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        call CreateItem( ITEM_BONE, x, y )
        call RemoveUnit( dying )
        call getAnimalGreenLight(killing)
        if udg_booleanParameter then
            call CreateItem( ITEM_HAWK_EGG, x, y )
        endif
    endif
    // check for dead pet
        if IsUnitInGroup(dying, udg_babyPets) then
            call GroupRemoveUnit( udg_babyPets , dying)
            set b = true
        elseif IsUnitInGroup(dying, udg_midPets) then
            call GroupRemoveUnit( udg_midPets , dying)
            set b = true
        elseif IsUnitInGroup(dying, udg_pets) then
            call GroupRemoveUnit( udg_pets , dying)
            set b = true
        endif
        if b then
            call DisplayTimedTextToForce(GetPlayersAllies(p), 7, "A pet has died!" )
            call SetBackToBMTame( p )
        endif
    //call ForGroup( udg_babyPets, function ResetBMPets )
    //call ForGroup( udg_midPets, function ResetBMPets )
    //call ForGroup( udg_pets, function ResetBMPets )
    set dying = null
    set killing = null
endfunction

//===========================================================================
function InitTrig_meat_and_bone takes nothing returns nothing
    set gg_trg_meat_and_bone = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_meat_and_bone, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddAction( gg_trg_meat_and_bone, function Trig_meat_and_bone_Actions )
endfunction

//===========================================================================
