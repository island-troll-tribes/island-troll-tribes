library TrollUpgrade initializer onInit requires ID, Constants, PublicLibrary
  private function ReplaceUnitEx takes unit whichUnit, integer newUnitId, integer unitStateMethod returns unit
    local unit    oldUnit = whichUnit
    local unit    newUnit
    local integer index
    local item    indexItem

    // If we have bogus data, don't attempt the replace.
    if (oldUnit == null) then
      return oldUnit
    endif

    // Hide the original unit.
    call ShowUnit(oldUnit, false)

    set newUnit = CreateUnit(GetOwningPlayer(oldUnit), newUnitId, GetUnitX(oldUnit), GetUnitY(oldUnit), GetUnitFacing(oldUnit))

    call SetUnitState(newUnit, UNIT_STATE_LIFE, GetUnitState(oldUnit, UNIT_STATE_LIFE))
    call SetUnitState(newUnit, UNIT_STATE_MANA, GetUnitState(oldUnit, UNIT_STATE_MANA))

    // Mirror properties of the old unit onto the new unit.
    call SetResourceAmount(newUnit, GetResourceAmount(oldUnit))

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

    call RemoveUnit(oldUnit)

    return newUnit
  endfunction

  private function TrollUpgrade takes unit REPLACED_UNIT, integer UNIT_ID_REPLACE, boolean SUPERSUB, boolean medallion returns nothing
    local unit REPLACING_UNIT = ReplaceUnitEx(REPLACED_UNIT, UNIT_ID_REPLACE, 1)
    local player PLAYER = GetOwningPlayer(REPLACED_UNIT)
    local integer strength = GetHeroStr(REPLACED_UNIT, false)
    local integer agility = GetHeroAgi(REPLACED_UNIT, false)
    local integer intelligence = GetHeroInt(REPLACED_UNIT, false)
    local integer newElementalist = GameConfig.getInstance().isNewMageEnabled()

    call GroupRemoveUnit(udg_trolls, REPLACED_UNIT)
    call GroupAddUnit(udg_trolls, REPLACING_UNIT)
    set udg_PUnits[GetPlayerId(PLAYER)] = REPLACING_UNIT
    call SetHeroLevelBJ(REPLACING_UNIT, 1, false)
    call UnitModifySkillPoints(REPLACING_UNIT, 0)

    // Copy previous attributes
    call SetHeroStr(REPLACING_UNIT, strength, true)
    call SetHeroAgi(REPLACING_UNIT, agility, true)
    call SetHeroInt(REPLACING_UNIT, intelligence, true)

    // Preserve or release BM pet
    if UNIT_ID_REPLACE == UNIT_CHICKEN_FORM or UNIT_ID_REPLACE == UNIT_SHAPESHIFTER_WOLF then
        set udg_parameterUnit=REPLACING_UNIT
        call TriggerExecute(gg_trg_Release_Pets)
        call SetPlayerTechResearched(PLAYER, 'Roch', 1)
    elseif UNIT_ID_REPLACE == UNIT_TRUE_FORM or UNIT_ID_REPLACE == UNIT_ULTIMATE_FORM then
        set udg_parameterUnit = REPLACING_UNIT
        call TriggerExecute(gg_trg_Rest_BM_SKills)
        call SetPlayerTechResearched(PLAYER, 'Roch', 1)
    endif

    // Assassin begins with Assassinate level 1
    if UNIT_ID_REPLACE == UNIT_ASSASSIN then
        call UnitModifySkillPoints(REPLACING_UNIT, 1)
        call SelectHeroSkill(REPLACING_UNIT, ABILITY_ASSASINATE)
    endif

    if (GetLocalPlayer() == PLAYER) then
        // Use only local code (no net traffic) within this block to avoid desyncs.
        call SelectUnit(REPLACING_UNIT, true)
        call ForceUICancel()
    endif

    set REPLACED_UNIT = null
    set REPLACING_UNIT = null
    set PLAYER = null
  endfunction

  private function Trig_upgrade_Actions takes nothing returns boolean
    local integer UNIT_ID_REPLACE = 0
    local boolean SUPERSUB = false
    local integer SKILL_UPGRADE = GetLearnedSkill()
    local unit OLD_UNIT = GetLearningUnit()

    local boolean medallion = false

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
        if (newElementalist == true) then
            set UNIT_ID_REPLACE = UNIT_ELEMENTALIST_NEW
        else
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
        set UNIT_ID_REPLACE = UNIT_SHAPESHIFTER_WOLF
        call SetPlayerAbilityAvailableBJ( false, 'A0ES', GetOwningPlayer(OLD_UNIT) )
        call SetPlayerAbilityAvailableBJ( false, 'A0ET', GetOwningPlayer(OLD_UNIT) )
        call SetPlayerAbilityAvailableBJ( false, 'A0EU', GetOwningPlayer(OLD_UNIT) )
        call SetPlayerAbilityAvailableBJ( false, 'A0EV', GetOwningPlayer(OLD_UNIT) )
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
    // Supersub
    elseif SKILL_UPGRADE == 'S00Q' then
        set UNIT_ID_REPLACE = UNIT_SAGE
        set SUPERSUB = true
        if GetUnitTypeId(OLD_UNIT) == UNIT_PRIEST then
          set medallion = true
        endif
    elseif SKILL_UPGRADE == 'S00R' then
        set UNIT_ID_REPLACE = UNIT_ASSASSIN
        set SUPERSUB = true
        if GetUnitTypeId(OLD_UNIT) == UNIT_THIEF then
          set medallion = true
        endif
    elseif SKILL_UPGRADE == 'S00S' then
        set TRACKER_PRESENT = true
        set UNIT_ID_REPLACE = UNIT_JUGGERNAUT
        set SUPERSUB = true
    elseif SKILL_UPGRADE == 'S00U' then
        set UNIT_ID_REPLACE = UNIT_SPY
        set SUPERSUB = true
        if GetUnitTypeId(OLD_UNIT) == UNIT_SCOUT then
          set medallion = true
        endif
    elseif SKILL_UPGRADE == 'S00W' then
        set UNIT_ID_REPLACE = UNIT_OMNIGATHERER
        set SUPERSUB = true
        if GetUnitTypeId(OLD_UNIT) == UNIT_GATHERER then
          set medallion = true
        endif
    elseif SKILL_UPGRADE == 'S00V' then
        set UNIT_ID_REPLACE = UNIT_DEMENTIA_MASTER
        set SUPERSUB = true
        if GetUnitTypeId(OLD_UNIT) == UNIT_MAGE then
          set medallion = true
        endif
    elseif SKILL_UPGRADE == 'S00T' then
        set UNIT_ID_REPLACE = UNIT_ULTIMATE_FORM
        set SUPERSUB = true
    endif

    if UNIT_ID_REPLACE != 0 then
      call TrollUpgrade(OLD_UNIT, UNIT_ID_REPLACE, SUPERSUB, medallion)
    endif

    set OLD_UNIT = null
    return false
  endfunction

  private function onInit takes nothing returns nothing
    local trigger learnedTrigger = CreateTrigger()

    call TriggerRegisterAnyUnitEventBJ(learnedTrigger, EVENT_PLAYER_HERO_SKILL)
    call TriggerAddCondition(learnedTrigger, Condition(function Trig_upgrade_Actions))
  endfunction
endlibrary
