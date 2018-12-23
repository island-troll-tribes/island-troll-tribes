
//
//                 set hydraStarted = false
//                 set hydraTimerStarted = false
//                 call PauseTimer(hydraTimer)
//                 call PauseTimer(hydraDespawnTimer)
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
library HydrAROUTINE initializer onInit requires PublicLibrary

globals
    timer hydraTimer = CreateTimer()
    timer hydraSpellTimer = CreateTimer()
    timer hydraDespawnTimer = CreateTimer()
    real array hydraB_X
    real array hydraB_Y
    real array spawn_X
    real array spawn_Y
    boolean pastTime = false
    boolean hydraTimerStarted = false
    boolean hydraStarted = false
    integer lesserCount = 0
    integer trueCount = 0
    group hydraSpell = CreateGroup()
    boolean frostReady = true
    boolean hydraDespawn = false
    integer hydraBackwards = 0
    unit hydraTarget
    real loHP
    constant string hydraSpawnModel = "Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl"
    constant string hydraDespawnModel = "Abilities\\Spells\\Other\\CrushingWave\\CrushingWaveDamage.mdl"
    constant string hydraAltarSfx = "Units\\NightElf\\Wisp\\WispExplode.mdl"
endglobals

function HornSound takes nothing returns nothing
local sound BY=CreateSound("Sound\\Ambient\\DoodadEffects\\TheHornOfCenarius.wav",false,false,false,10,10,"")
call SetSoundPitch(BY,1.)
call SetSoundVolume(BY,127)
call StartSound(BY)
call KillSoundWhenDone(BY)
set BY=null
endfunction

function NaturalEnemies takes nothing returns boolean
    return IsUnitEnemy(GetFilterUnit(), Player(PLAYER_NEUTRAL_AGGRESSIVE))
endfunction

function TriggerResetSpell takes nothing returns nothing
    call PauseTimer(hydraSpellTimer)
    set frostReady = true
endfunction

function HydraFindTarget takes nothing returns nothing
local real r = GetUnitState(GetEnumUnit(), UNIT_STATE_LIFE)
if r < loHP then
    set hydraTarget = null
    set loHP = r
    set hydraTarget = GetEnumUnit()
endif
endfunction

function HydraBoatEncircle takes nothing returns nothing
local real x = GetUnitX(Hydra)
local real y = GetUnitY(Hydra)
local real tx = GetRectCenterX(gg_rct_discoduck)
local real ty = GetRectCenterY(gg_rct_discoduck)
local real dx
local real dy
local timer t
if not Hydra_Dead then
    //call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,999,I2S(CountUnitsInGroup(hydraSpell)))
    //set u = FirstOfGroup(hydraSpell)
    call GroupEnumUnitsInRange(hydraSpell, x, y, 600, Condition(function NaturalEnemies))
    if frostReady and FirstOfGroup(hydraSpell) != null then
        set loHP = 9999
        call ForGroup(hydraSpell, function HydraFindTarget)
        if hydraTarget != null then
        else
            set hydraTarget = FirstOfGroup(hydraSpell)
        endif
        call IssuePointOrder(Hydra, "breathoffrost", GetUnitX(hydraTarget), GetUnitY(hydraTarget))
        set frostReady = false
        call TimerStart(hydraSpellTimer, 10, false, function TriggerResetSpell)
        set hydraTarget = null
    else
        call IssuePointOrder(Hydra, "attack", tx, ty)
    endif
    call TimerStart(hydraTimer, 4, false, function HydraBoatEncircle)
endif
endfunction


function SpawnHydra takes real x, real y returns nothing
local real angle = bj_RADTODEG * Atan2(y, x)
call HornSound()
set Hydra = CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE), UNIT_ANCIENT_HYDRA, x+1, y+1, angle)
set hydraSpawnX = x+1
set hydraSpawnY = y+1
set Hydra_Dead = false
set hydraStarted = true
set hydraDespawn = false
set lesserCount = 0
set trueCount = 0
set hydraBackwards = GetRandomInt(0,1)
call UnitAddSleep(Hydra, false)
call SetUnitCreepGuard(Hydra, false)
call DestroyEffect(AddSpecialEffectTarget(teleportModel, Hydra, "overhead"))
call TimerStart(hydraTimer, 1, false, function HydraBoatEncircle)
endfunction

function LesserSpawns takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_LESSER_HYDRA
endfunction

function RemoveHydras takes nothing returns nothing
    call DestroyEffect(AddSpecialEffect(hydraDespawnModel, GetUnitX(GetEnumUnit()), GetUnitY(GetEnumUnit())))
    call RemoveUnit(GetEnumUnit())
endfunction

function HydraDespawn takes nothing returns nothing
local integer i
local integer s = GetRandomInt(0,5)
if hydraStarted then
    set hydraTimerStarted = false
    set hydraDespawn = true
    set pastTime = false
    call PauseTimer(hydraTimer)
    call PauseTimer(hydraDespawnTimer)
    set i = 0
    loop
        exitwhen i > lesserCount
        if spawn_Y[i] != 0 then
            set spawn_Y[i] = 0
        endif
        set i = i + 1
    endloop
    call GroupEnumUnitsInRect(hydraSpell, GetWorldBounds(), Condition(function LesserSpawns))
    call ForGroup(hydraSpell, function RemoveHydras)
    call SpawnHydra(hydraB_X[s],hydraB_Y[s])
    call SaveInteger(udg_GameHash, StringHash("hyd"), StringHash("step"), s)
endif
endfunction

function AddHydraS takes nothing returns nothing
local integer i = 0
local unit u
//call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,999,":Timer Ended")
set pastTime = true
set hydraTimerStarted = false
call TimerStart(hydraDespawnTimer, 60, false, function HydraDespawn)
loop
    exitwhen i > lesserCount
    if spawn_Y[i] != 0 then
        set lesserCount = lesserCount + 1
        set u = CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE), UNIT_LESSER_HYDRA, spawn_X[i], spawn_Y[i], GetRandomReal(0, 360))
        call DestroyEffect(AddSpecialEffectTarget(hydraSpawnModel, u, "head"))
        call SetUnitUserDataEx(u, lesserCount)
        set spawn_X[lesserCount] = 0
        set spawn_Y[lesserCount] = 0
        set lesserCount = lesserCount + 1
        set u = CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE), UNIT_LESSER_HYDRA, spawn_X[i], spawn_Y[i], GetRandomReal(0, 360))
        call DestroyEffect(AddSpecialEffectTarget(hydraSpawnModel, u, "head"))
        call SetUnitUserDataEx(u, lesserCount)
        set spawn_X[lesserCount] = 0
        set spawn_Y[lesserCount] = 0
        set trueCount = trueCount + 2
        set spawn_Y[i] = 0
    endif
    set i = i + 1
endloop
//call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,999,":Spawn Ended")
set u = null
endfunction

private function onInit takes nothing returns nothing
    // T1 Bottom [blue]
    set hydraB_X[0] = -11571
    set hydraB_Y[0] = 466
    // T1 Spawn
    set hydraB_X[1] = -2816
    set hydraB_Y[1] = 1632
    // T2 Spawn [orange]
    set hydraB_X[2] = -896
    set hydraB_Y[2] = 9685
    // transpass
    set hydraB_X[3] = 1897
    set hydraB_Y[3] = 2816
    // transpass
    set hydraB_X[4] = 4297
    set hydraB_Y[4] = -464
    // T3 Spawn [yellow]
    set hydraB_X[5] = 12253
    set hydraB_Y[5] = -1543
    // transpass
    set hydraB_X[6] = 4297
    set hydraB_Y[6] = -464
    // South West and T3 between [purple]
    set hydraB_X[7] = -1380
    set hydraB_Y[7] = -11501
endfunction

endlibrary//===========================================================================
