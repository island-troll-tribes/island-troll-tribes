
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Super_Form_Conditions takes nothing returns boolean
    return(GetSpellAbilityId()==SPELL_SUPER_FORM_CAST)
endfunction

function Trig_Super_Form_Actions takes nothing returns nothing
local unit REPLACED_UNIT = GetSpellAbilityUnit()
local unit REPLACING_UNIT
local integer UNIT_ID_REPLACE = 0
local integer REMOVE_ITEM = 0
local player PLAYER
if GetHeroLevel(REPLACED_UNIT)>=8 then
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
endif

if UNIT_ID_REPLACE != 0 then
    set PLAYER = GetOwningPlayer(REPLACED_UNIT)
    call removeItem(REPLACED_UNIT,REMOVE_ITEM)
    call GroupRemoveUnit(udg_trolls,REPLACED_UNIT)
    set REPLACING_UNIT = ReplaceUnitBJ(REPLACED_UNIT,UNIT_ID_REPLACE,1)
    call GroupAddUnit(udg_trolls,REPLACING_UNIT)
    set udg_PUnits[GetPlayerId(PLAYER)]=REPLACING_UNIT
    call SetHeroLevelBJ(REPLACING_UNIT,1,false)
    if UNIT_ID_REPLACE == UNIT_ULTIMATE_FORM then
        set udg_parameterUnit=REPLACING_UNIT
        call TriggerExecute(gg_trg_Rest_BM_SKills)
        call SetPlayerTechResearched(PLAYER,'Roch',1)
    endif
    call SetPlayerHandicapXPBJ(PLAYER,200.)
    
    if (GetLocalPlayer() == PLAYER) then
        // Use only local code (no net traffic) within this block to avoid desyncs.
        call SelectUnit(REPLACING_UNIT, true)
        call ForceUICancel()
    endif
    set REPLACING_UNIT = null
endif
set REPLACED_UNIT = null
endfunction

//===========================================================================
function InitTrig_Super_Form takes nothing returns nothing
set gg_trg_Super_Form=CreateTrigger()
call TriggerRegisterAnyUnitEventBJ(gg_trg_Super_Form,EVENT_PLAYER_UNIT_SPELL_CAST)
call TriggerAddCondition(gg_trg_Super_Form,Condition(function Trig_Super_Form_Conditions))
call TriggerAddAction(gg_trg_Super_Form,function Trig_Super_Form_Actions)
endfunction//===========================================================================
