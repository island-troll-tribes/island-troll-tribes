library TrollUpgrade initializer onInit requires ID, Constants, PublicLibrary
  function TrollUpgrade takes unit REPLACED_UNIT, integer UNIT_ID_REPLACE, boolean SUPERSUB, boolean medallion returns nothing
    local unit REPLACING_UNIT = ReplaceUnitBJ(REPLACED_UNIT, UNIT_ID_REPLACE, 1)
    local player PLAYER = GetOwningPlayer(REPLACED_UNIT)

    call GroupRemoveUnit(udg_trolls, REPLACED_UNIT)
    call GroupAddUnit(udg_trolls, REPLACING_UNIT)
    set udg_PUnits[GetPlayerId(PLAYER)] = REPLACING_UNIT
    call SetHeroLevelBJ(REPLACING_UNIT, 1, false)

    // Supersub from sub needs extra stats
    if not medallion and SUPERSUB then
        call SetHeroStr(REPLACING_UNIT, 13, true)
        call SetHeroAgi(REPLACING_UNIT, 13, true)
        call SetHeroInt(REPLACING_UNIT, 13, true)
    endif

    // Preserve or release BM pet
    if UNIT_ID_REPLACE == UNIT_CHICKEN_FORM then
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

    if SUPERSUB then
      call SetPlayerHandicapXPBJ(PLAYER,200.)
    else
      call SetPlayerHandicapXPBJ(PLAYER,300.)
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

  function Trig_upgrade_Actions takes nothing returns boolean
    local integer UNIT_ID_REPLACE = 0
    local boolean SUPERSUB = false
    local integer SKILL_UPGRADE = GetLearnedSkill()
    
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
    // Supersub
    elseif SKILL_UPGRADE == 'S00Q' then
        set UNIT_ID_REPLACE = UNIT_SAGE
        set SUPERSUB = true
    elseif SKILL_UPGRADE == 'S00R' then
        set UNIT_ID_REPLACE = UNIT_ASSASSIN
        set SUPERSUB = true
    elseif SKILL_UPGRADE == 'S00S' then
        set TRACKER_PRESENT = true
        set UNIT_ID_REPLACE = UNIT_JUGGERNAUT
        set SUPERSUB = true
    elseif SKILL_UPGRADE == 'S00U' then
        set UNIT_ID_REPLACE = UNIT_SPY
        set SUPERSUB = true
    elseif SKILL_UPGRADE == 'S00W' then
        set UNIT_ID_REPLACE = UNIT_OMNIGATHERER
        set SUPERSUB = true
    elseif SKILL_UPGRADE == 'S00V' then
        set UNIT_ID_REPLACE = UNIT_DEMENTIA_MASTER
        set SUPERSUB = true
    elseif SKILL_UPGRADE == 'S00T' then
        set UNIT_ID_REPLACE = UNIT_ULTIMATE_FORM
        set SUPERSUB = true
    endif

    if UNIT_ID_REPLACE != 0 then
      call TrollUpgrade(GetLearningUnit(), UNIT_ID_REPLACE, SUPERSUB, false)
    endif

    return false
  endfunction

  function MedallionCastCheck takes nothing returns boolean
    local unit REPLACED_UNIT = GetSpellAbilityUnit()
    local integer UNIT_ID_REPLACE = 0
    local integer REMOVE_ITEM = 0

    if GetSpellAbilityId() == SPELL_SUPER_FORM_CAST and GetHeroLevel(REPLACED_UNIT)>=8 then
      set REPLACED_UNIT = GetSpellAbilityUnit()
      if(GetUnitTypeId(REPLACED_UNIT)==UNIT_BEAST_MASTER and checkItem(REPLACED_UNIT,ITEM_MED_BEAST_MASTER))then
          set REMOVE_ITEM = ITEM_MED_BEAST_MASTER
          set UNIT_ID_REPLACE = UNIT_ULTIMATE_FORM
      elseif(GetUnitTypeId(REPLACED_UNIT)==UNIT_HUNTER and checkItem(REPLACED_UNIT,ITEM_MED_HUNTER))then
          set REMOVE_ITEM = ITEM_MED_HUNTER
          set UNIT_ID_REPLACE = UNIT_JUGGERNAUT
          set TRACKER_PRESENT = true
      elseif(GetUnitTypeId(REPLACED_UNIT)==UNIT_GATHERER and checkItem(REPLACED_UNIT,ITEM_MED_GATHERER))then
          set REMOVE_ITEM = ITEM_MED_GATHERER
          set UNIT_ID_REPLACE = UNIT_OMNIGATHERER
      elseif(GetUnitTypeId(REPLACED_UNIT)==UNIT_THIEF and checkItem(REPLACED_UNIT,ITEM_MED_THIEF))then
          set REMOVE_ITEM = ITEM_MED_THIEF
          set UNIT_ID_REPLACE = UNIT_ASSASSIN
      elseif(GetUnitTypeId(REPLACED_UNIT)==UNIT_SCOUT and checkItem(REPLACED_UNIT,ITEM_MED_SCOUT))then
          set REMOVE_ITEM = ITEM_MED_SCOUT
          set UNIT_ID_REPLACE = UNIT_SPY
      elseif(GetUnitTypeId(REPLACED_UNIT)==UNIT_MAGE and checkItem(REPLACED_UNIT,ITEM_MED_MAGE))then
          set REMOVE_ITEM = ITEM_MED_MAGE
          set UNIT_ID_REPLACE = UNIT_DEMENTIA_MASTER
      elseif(GetUnitTypeId(REPLACED_UNIT)==UNIT_PRIEST and checkItem(REPLACED_UNIT,ITEM_MED_PRIEST))then
          set REMOVE_ITEM = ITEM_MED_PRIEST
          set UNIT_ID_REPLACE = UNIT_SAGE
      elseif(GetUnitTypeId(REPLACED_UNIT)==UNIT_HEAD_HUNTER and checkItem(REPLACED_UNIT,ITEM_MED_HEAD_HUNER))then
          set REMOVE_ITEM = ITEM_MED_HEAD_HUNER
          set UNIT_ID_REPLACE = UNIT_ARCHER_INTREPIDE    
      endif

      call removeItem(REPLACED_UNIT, REMOVE_ITEM)
      call TrollUpgrade(REPLACED_UNIT, UNIT_ID_REPLACE, true, true)

      set REPLACED_UNIT = null
    endif

    return false
  endfunction


  private function onInit takes nothing returns nothing
      local trigger learnedTrigger = CreateTrigger()
      local trigger itemTrigger = CreateTrigger()

      call TriggerRegisterAnyUnitEventBJ(learnedTrigger, EVENT_PLAYER_HERO_SKILL)
      call TriggerAddCondition(learnedTrigger, Condition(function Trig_upgrade_Actions))

      call TriggerRegisterAnyUnitEventBJ(itemTrigger, EVENT_PLAYER_UNIT_SPELL_CAST)
      call TriggerAddCondition(itemTrigger, Condition(function MedallionCastCheck))
  endfunction
endlibrary