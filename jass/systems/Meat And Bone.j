
globals
    boolean Mammoth_Dead = false
    boolean DD_Dead = false
    boolean FirstDuckDead = false
    //boolean Turtle_Dead = false
    boolean Hydra_Dead = false

    unit DiscoDuck = null
    //unit Turtle = null
    unit Hydra = null

    constant string teleportModel = "Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl"
endglobals

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
local integer numCorpses = 0
    // Stuff
    if uid == UNIT_ELK then
        call RemoveUnit(dying)
        set numCorpses = 3
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_ELK_HIDE, x, y )
        set udg_ANIMAL_CURRENT = ( udg_ANIMAL_CURRENT - 1 )
        call getAnimalGreenLight(dying)
        if udg_booleanParameter then
            call CreateUnit( Player(PLAYER_NEUTRAL_PASSIVE), UNIT_FAWN, x, y, 270.00 )
        endif
    elseif uid == UNIT_JUNGLE_WOLF then
        call RemoveUnit( dying )
        set numCorpses = 4
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_JUNGLE_WOLF_HIDE, x, y )
        set udg_ANIMAL_CURRENT = ( udg_ANIMAL_CURRENT - 1 )
        call getAnimalGreenLight(dying)
        if udg_booleanParameter then
            call CreateUnit( Player(PLAYER_NEUTRAL_PASSIVE), UNIT_WOLF_PUP, x, y, 270.00 )
        endif
    elseif uid == UNIT_JUNGLE_BEAR then
        call RemoveUnit( dying )
        set numCorpses = 7
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_JUNGLE_BEAR_HIDE, x, y )
        set udg_ANIMAL_CURRENT = ( udg_ANIMAL_CURRENT - 1 )
        call getAnimalGreenLight(dying)
        if udg_booleanParameter then
            call CreateUnit( Player(PLAYER_NEUTRAL_PASSIVE), UNIT_BEAR_CUB, x, y, 270.00 )
        endif
    elseif uid == UNIT_MAMMOTH and GetUnitAbilityLevel(dying, 'BIil') == 0 then
        set Mammoth_Dead = true
        call RemoveUnit( dying )
        set numCorpses = 16
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        if udg_BOSS_PRIZE_MODE then
            // medallion
            call CreateItem( ITEM_MEDALLION_COURAGE, x, y )
            // horns
            call CreateItem( ITEM_HORN_MAMMOTH, x, y )
        endif
    elseif uid == UNIT_DISCO_DUCK and GetUnitAbilityLevel(dying, 'BIil') == 0 then
        //if not FirstDuckDead then
          //  set FirstDuckDead = true
            //call Start_Boss_Turtle()
        //endif
        set DD_Dead = true
        call RemoveUnit( dying )
        set numCorpses = 13
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        if udg_BOSS_PRIZE_MODE then
            call CreateItem( ITEM_MEDALLION_COURAGE, x, y )
            call CreateItem( ITEM_STEEL_INGOT, x, y )
            call CreateItem( ITEM_STEEL_INGOT, x, y )
            call placePinion(x, y)
        endif
    endif
    // TEH HYDRA ~
    static if LIBRARY_HydrAROUTINE then
    if uid == UNIT_ANCIENT_HYDRA and GetUnitAbilityLevel(dying, 'BIil') == 0 then
        set Hydra_Dead = true
        call RemoveUnit( dying )
        loop
            exitwhen i > R2I(( 8.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(PLAYER_NEUTRAL_AGGRESSIVE), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        set pastTime = false
        call TimerStart(hydraDespawnTimer, 60, false, function HydraDespawn)
        set lesserCount = lesserCount + 1
        set u = CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE), UNIT_LESSER_HYDRA, x, y, GetRandomReal(0, 360))
        call DestroyEffect(AddSpecialEffectTarget(hydraSpawnModel, u, "head"))
        call SetUnitUserData(u, lesserCount)
        set spawn_X[lesserCount] = 0
        set spawn_Y[lesserCount] = 0
        set lesserCount = lesserCount + 1
        set u = CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE), UNIT_LESSER_HYDRA, x, y, GetRandomReal(0, 360))
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
             call CreateCorpse(Player(PLAYER_NEUTRAL_AGGRESSIVE), UNIT_MEAT, x, y, GetRandomReal(0,360) )
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
    set udg_booleanParameter = IsUnitTroll(dying)
    if udg_booleanParameter and GetUnitAbilityLevel(dying, 'BIil') == 0 then
        set numCorpses = 1
        call CreateItem( ITEM_BONE, x, y )
    elseif uid == UNIT_FISH then
        set numCorpses = 1
        set udg_FISH_CURRENT = ( udg_FISH_CURRENT - 1 )
        call RemoveUnit( dying )
    elseif uid == UNIT_MAGENTA_FISH then
        if not fishytrigger then
            call AdjustPlayerStateBJ(5, Player(-GetPlayerId(p)), PLAYER_STATE_RESOURCE_GOLD)
        endif
        set numCorpses = 9
        call CreateItem(ITEM_STICK, x, y)
        call CreateItem(ITEM_MUSHROOM, x, y)
        set udg_ITEM_CURRENT = udg_ITEM_CURRENT + 2
        set udg_FISH_CURRENT = ( udg_FISH_CURRENT - 1 )
        call RemoveUnit( dying )
    elseif uid == UNIT_GREEN_FISH then
        loop
            exitwhen i > R2I(( 3.00 * udg_FOOD_FOR_KILL_PROPORTION ))
             call CreateCorpse(Player(PLAYER_NEUTRAL_AGGRESSIVE), UNIT_MEAT, x, y, GetRandomReal(0,360) )
            set i = i + 1
        endloop
        set udg_FISH_CURRENT = ( udg_FISH_CURRENT - 1 )
        call RemoveUnit( dying )
    elseif uid == UNIT_ADULT_ELK then
        set numCorpses = 7
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_ELK_HIDE, x, y )
        call RemoveUnit( dying )
    elseif uid == UNIT_ELK_ADOLESCENT then
        set numCorpses = 6
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_ELK_HIDE, x, y )
        call RemoveUnit( dying )
    elseif uid == UNIT_ADULT_JUNGLE_BEAR then
        set numCorpses = 9
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_JUNGLE_BEAR_HIDE, x, y )
        call RemoveUnit( dying )
    elseif uid == UNIT_ADULT_JUNGLE_WOLF then
        set numCorpses = 8
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_JUNGLE_WOLF_HIDE, x, y )
        call RemoveUnit( dying )
    elseif uid == UNIT_BEAR_CUB then
        set numCorpses = 3
        call CreateItem( ITEM_BONE, x, y )
        call RemoveUnit( dying )
    elseif uid == UNIT_WOLF_PUP then
        set numCorpses = 2
        call CreateItem( ITEM_BONE, x, y )
        call RemoveUnit( dying )
    elseif uid == UNIT_FAWN then
        set numCorpses = 1
        call CreateItem( ITEM_BONE, x, y )
        call RemoveUnit( dying )
    elseif uid == UNIT_SNAKE then
        set numCorpses = 1
        set udg_ANIMAL_CURRENT = ( udg_ANIMAL_CURRENT - 1 )
        call PolledWait( 0.50 )
        call RemoveUnit( dying )
    elseif uid == UNIT_PANTHER or uid == UNIT_ELDER_PANTHER then
        set numCorpses = 8
        call CreateItem( ITEM_BONE, x, y )
        call CreateItem( ITEM_BONE, x, y )
        if uid == UNIT_PANTHER then
            set udg_ANIMAL_CURRENT = ( udg_ANIMAL_CURRENT - 1 )
        endif
        call RemoveUnit( dying )
    elseif uid == UNIT_ALIGATOR_MAN then
        set numCorpses = 10
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
    elseif uid == UNIT_ONE then
        set numCorpses = 3
        call CreateItem( ITEM_BONE, x, y )
        if udg_BOSS_PRIZE_MODE then
            call CreateItem(ITEM_STEEL_INGOT, x, y)
            call CreateItem(ITEM_ESSENCE_BEES, x, y)
            call CreateItem(ITEM_DARK_ROCK, x, y)
        endif
    elseif IsUnitHawk(dying) then
        set numCorpses = 1
        call CreateItem( ITEM_BONE, x, y )
        call RemoveUnit( dying )
        call getAnimalGreenLight(dying)
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
    loop
        exitwhen i > R2I(( I2R(numCorpses) * udg_FOOD_FOR_KILL_PROPORTION ))
        call CreateCorpse(Player(PLAYER_NEUTRAL_AGGRESSIVE), UNIT_MEAT, x, y, GetRandomReal(0,360))
        set i = i + 1
    endloop
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
