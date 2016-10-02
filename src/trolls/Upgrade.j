function Trig_upgrade_Actions takes nothing returns nothing
  local integer SKILL_UPGRADE = GetLearnedSkill()
  local integer UNIT_ID_REPLACE = 0
  local unit REPLACED_UNIT
  local unit REPLACING_UNIT
  local player PLAYER
  local boolean SUPERSUB = false
  
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
      set REPLACED_UNIT = GetLearningUnit()
      set PLAYER = GetOwningPlayer(REPLACED_UNIT)
      call GroupRemoveUnit(udg_trolls,REPLACED_UNIT)
      set REPLACING_UNIT = ReplaceUnitBJ(REPLACED_UNIT,UNIT_ID_REPLACE,1)
      call GroupAddUnit(udg_trolls,REPLACING_UNIT)
      set udg_PUnits[GetPlayerId(PLAYER)]=REPLACING_UNIT
      call SetHeroLevelBJ(REPLACING_UNIT,1,false)

      // Supersub from sub needs extra stats
      if SUPERSUB == true then
          call SetHeroStr(REPLACING_UNIT, 13, true)
          call SetHeroAgi(REPLACING_UNIT, 13, true)
          call SetHeroInt(REPLACING_UNIT, 13, true)
      endif

      // Preserve or release BM pet
      if UNIT_ID_REPLACE == UNIT_CHICKEN_FORM then
          set udg_parameterUnit=REPLACING_UNIT
          call TriggerExecute(gg_trg_Release_Pets)
          call SetPlayerTechResearched(PLAYER,'Roch',1)
      elseif UNIT_ID_REPLACE == UNIT_TRUE_FORM or UNIT_ID_REPLACE == UNIT_ULTIMATE_FORM then
          set udg_parameterUnit=REPLACING_UNIT
          call TriggerExecute(gg_trg_Rest_BM_SKills)
          call SetPlayerTechResearched(PLAYER,'Roch',1)
      endif

      // Assassin begins with (access to) Assassinate level 1
      if UNIT_ID_REPLACE == UNIT_ASSASSIN then
          call UnitModifySkillPoints(REPLACING_UNIT, 1)
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

