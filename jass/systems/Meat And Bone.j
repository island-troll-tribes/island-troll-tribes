
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
    // TEH HYDRA ~
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
    if IsUnitTroll(dying) and GetUnitAbilityLevel(dying, 'BIil') == 0 then
        set numCorpses = 1
        call CreateItem( ITEM_BONE, x, y )
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
