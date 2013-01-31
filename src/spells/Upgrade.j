
//===========================================================================
//TESH.scrollpos=94
//TESH.alwaysfold=0
function ReplaceUnitEx takes unit whichUnit, integer newUnitId, integer unitStateMethod returns unit
    local unit    oldUnit = whichUnit
    local unit    newUnit
    local integer index
    local item    indexItem
    local real    oldRatio

    // If we have bogus data, don't attempt the replace.
    if (oldUnit == null) then
        set bj_lastReplacedUnit = oldUnit
        return oldUnit
    endif

    // Hide the original unit.
    call ShowUnit(oldUnit, false)

    // Create the replacement unit.
    if (newUnitId == 'ugol') then
        set newUnit = CreateBlightedGoldmine(GetOwningPlayer(oldUnit), GetUnitX(oldUnit), GetUnitY(oldUnit), GetUnitFacing(oldUnit))
    else
        set newUnit = CreateUnit(GetOwningPlayer(oldUnit), newUnitId, GetUnitX(oldUnit), GetUnitY(oldUnit), GetUnitFacing(oldUnit))
    endif

    // Set the unit's life and mana according to the requested method.
    if (unitStateMethod == bj_UNIT_STATE_METHOD_RELATIVE) then //1
        // Set the replacement's current/max life ratio to that of the old unit.
        // If both units have mana, do the same for mana.
        if (GetUnitState(oldUnit, UNIT_STATE_MAX_LIFE) > 0) then
            set oldRatio = GetUnitState(oldUnit, UNIT_STATE_LIFE) / GetUnitState(oldUnit, UNIT_STATE_MAX_LIFE)
            call SetUnitState(newUnit, UNIT_STATE_LIFE, oldRatio * GetUnitState(newUnit, UNIT_STATE_MAX_LIFE))
        endif

        if (GetUnitState(oldUnit, UNIT_STATE_MAX_MANA) > 0) and (GetUnitState(newUnit, UNIT_STATE_MAX_MANA) > 0) then
            set oldRatio = GetUnitState(oldUnit, UNIT_STATE_MANA) / GetUnitState(oldUnit, UNIT_STATE_MAX_MANA)
            call SetUnitState(newUnit, UNIT_STATE_MANA, oldRatio * GetUnitState(newUnit, UNIT_STATE_MAX_MANA))
        endif
    elseif (unitStateMethod == bj_UNIT_STATE_METHOD_ABSOLUTE) then
        // Set the replacement's current life to that of the old unit.
        // If the new unit has mana, do the same for mana.
        call SetUnitState(newUnit, UNIT_STATE_LIFE, GetUnitState(oldUnit, UNIT_STATE_LIFE))
        if (GetUnitState(newUnit, UNIT_STATE_MAX_MANA) > 0) then
            call SetUnitState(newUnit, UNIT_STATE_MANA, GetUnitState(oldUnit, UNIT_STATE_MANA))
        endif
    elseif (unitStateMethod == bj_UNIT_STATE_METHOD_DEFAULTS) then
        // The newly created unit should already have default life and mana.
    elseif (unitStateMethod == bj_UNIT_STATE_METHOD_MAXIMUM) then
        // Use max life and mana.
        call SetUnitState(newUnit, UNIT_STATE_LIFE, GetUnitState(newUnit, UNIT_STATE_MAX_LIFE))
        call SetUnitState(newUnit, UNIT_STATE_MANA, GetUnitState(newUnit, UNIT_STATE_MAX_MANA))
    else
        // Unrecognized unit state method - ignore the request.
    endif

    // Mirror properties of the old unit onto the new unit.
    //call PauseUnit(newUnit, IsUnitPaused(oldUnit))
    call SetResourceAmount(newUnit, GetResourceAmount(oldUnit))

    // If both the old and new units are heroes, handle their hero info.
    if (IsUnitType(oldUnit, UNIT_TYPE_HERO) and IsUnitType(newUnit, UNIT_TYPE_HERO)) then

        set index = 0
        loop
            set indexItem = UnitItemInSlot(oldUnit, index)
            if (indexItem != null) then
                call UnitRemoveItem(oldUnit, indexItem)
                call UnitAddItem(newUnit, indexItem)
            endif

            set index = index + 1
            exitwhen index >= bj_MAX_INVENTORY
        endloop
    endif

    return newUnit
endfunction

function Trig_upgrade_Actions takes nothing returns nothing
local integer SKILL_UPGRADE = GetLearnedSkill()
local integer UNIT_ID_REPLACE = 0
local unit REPLACED_UNIT
local unit REPLACING_UNIT
local player PLAYER

if SKILL_UPGRADE=='S001' then
    set UNIT_ID_REPLACE = UNIT_HERB_MASTER
elseif SKILL_UPGRADE=='S007' then
    set UNIT_ID_REPLACE = UNIT_RADAR_GATHERER
elseif SKILL_UPGRADE=='S006' then
    set UNIT_ID_REPLACE = UNIT_WARRIOR
elseif SKILL_UPGRADE == 'S00C' then
    set UNIT_ID_REPLACE = UNIT_TRACKER
    set TRACKER_PRESENT = true
elseif SKILL_UPGRADE == 'S002' then
    set UNIT_ID_REPLACE = UNIT_ELEMENTALIST
elseif SKILL_UPGRADE == 'S009' then
    set UNIT_ID_REPLACE = UNIT_HYPNOTIST
elseif SKILL_UPGRADE == 'S00B' then
    set UNIT_ID_REPLACE = UNIT_MASTER_HEALER
elseif SKILL_UPGRADE == 'S003' then
    set UNIT_ID_REPLACE = UNIT_BOOSTER
elseif SKILL_UPGRADE == 'S005' then
    set UNIT_ID_REPLACE = UNIT_OBSERVER
elseif SKILL_UPGRADE == 'S008' then
    set UNIT_ID_REPLACE = UNIT_RADAR_SCOUT
elseif SKILL_UPGRADE == 'S004' then
    set UNIT_ID_REPLACE = UNIT_CONTORTIONIST
elseif SKILL_UPGRADE == 'S00A' then
    set UNIT_ID_REPLACE = UNIT_ESCAPE_ARTIST
elseif SKILL_UPGRADE == 'S00I' then
    set UNIT_ID_REPLACE = UNIT_CHICKEN_FORM
elseif SKILL_UPGRADE == 'S00H' then
    set UNIT_ID_REPLACE = UNIT_TRUE_FORM
elseif SKILL_UPGRADE == 'S00J' then
    set UNIT_ID_REPLACE = UNIT_MIRROR_TROLL
elseif SKILL_UPGRADE == 'S00L' then
    set UNIT_ID_REPLACE = UNIT_TROLL_WITCH_DOCTOR
elseif SKILL_UPGRADE == 'S00K' then
    set UNIT_ID_REPLACE = UNIT_NECROMANCER
elseif SKILL_UPGRADE == 'S00M' then
    set UNIT_ID_REPLACE = UNIT_SHADOW_HUNTER
elseif SKILL_UPGRADE == 'S00N' then
    set UNIT_ID_REPLACE = UNIT_SHADOW_ARCHER
// Drunken Troll
elseif SKILL_UPGRADE == 'S00O' then
    set UNIT_ID_REPLACE = UNIT_TROLL_BRAWLER
elseif SKILL_UPGRADE == 'S00P' then
    set UNIT_ID_REPLACE = UNIT_TROLL_BREWMASTER
endif

if UNIT_ID_REPLACE != 0 then
    set REPLACED_UNIT = GetLearningUnit()
    set PLAYER = GetOwningPlayer(REPLACED_UNIT)
    call GroupRemoveUnit(udg_trolls,REPLACED_UNIT)
    set REPLACING_UNIT = ReplaceUnitBJ(REPLACED_UNIT,UNIT_ID_REPLACE,1)
    call GroupAddUnit(udg_trolls,REPLACING_UNIT)
    set udg_PUnits[GetPlayerId(PLAYER)]=REPLACING_UNIT
    call SetHeroLevelBJ(REPLACING_UNIT,1,false)
    if UNIT_ID_REPLACE == UNIT_CHICKEN_FORM then
        set udg_parameterUnit=REPLACING_UNIT
        call TriggerExecute(gg_trg_Release_Pets)
        call SetPlayerTechResearched(PLAYER,'Roch',1)
    elseif UNIT_ID_REPLACE == UNIT_TRUE_FORM then
        set udg_parameterUnit=REPLACING_UNIT
        call TriggerExecute(gg_trg_Rest_BM_SKills)
        call SetPlayerTechResearched(PLAYER,'Roch',1)
    endif
    call SetPlayerHandicapXPBJ(PLAYER,300.)
    
    if (GetLocalPlayer() == PLAYER) then
        // Use only local code (no net traffic) within this block to avoid desyncs.
        call SelectUnit(REPLACING_UNIT, true)
        call ForceUICancel()
    endif
    
    set REPLACED_UNIT = null
    set REPLACING_UNIT = null
endif

endfunction

function InitTrig_upgrade takes nothing returns nothing
    set gg_trg_upgrade = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_upgrade, EVENT_PLAYER_HERO_SKILL )
    call TriggerAddAction( gg_trg_upgrade, function Trig_upgrade_Actions )
endfunction

//===========================================================================
