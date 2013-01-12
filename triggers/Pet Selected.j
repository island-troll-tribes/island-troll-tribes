
function SelectedEnemyBuilding takes nothing returns boolean
return((IsUnitEnemy(GetTriggerUnit(),GetTriggerPlayer()))and(IsUnitType(GetTriggerUnit(),UNIT_TYPE_STRUCTURE)))!=null
endfunction

function Trig_pet_selected_Func001Func002Func002Func001C takes nothing returns boolean
return((GetUnitTypeId(GetTriggerUnit())==UNIT_ADULT_ELK)or(GetUnitTypeId(GetTriggerUnit())==UNIT_ELK_ADOLESCENT)or(GetUnitTypeId(GetTriggerUnit())==UNIT_ADULT_JUNGLE_BEAR)or(GetUnitTypeId(GetTriggerUnit())==UNIT_JUNGLE_BEAR)or(GetUnitTypeId(GetTriggerUnit())==UNIT_ADULT_JUNGLE_WOLF)or(GetUnitTypeId(GetTriggerUnit())==UNIT_JUNGLE_WOLF)or(GetUnitTypeId(GetTriggerUnit())==UNIT_BEAR_CUB)or(GetUnitTypeId(GetTriggerUnit())==UNIT_FAWN)or(GetUnitTypeId(GetTriggerUnit())==UNIT_WOLF_PUP)or(IsUnitType(GetTriggerUnit(),UNIT_TYPE_FLYING)))!=null
endfunction

function Trig_pet_selected_Func001Func002Func002C takes nothing returns boolean
return(Trig_pet_selected_Func001Func002Func002Func001C())and(IsUnitAlly(GetTriggerUnit(),GetTriggerPlayer()))
endfunction

function Trig_pet_selected_Actions takes nothing returns nothing
if SelectedEnemyBuilding() or Trig_pet_selected_Func001Func002Func002C() then
    if (GetLocalPlayer() == GetTriggerPlayer()) then
        // Use only local code (no net traffic) within this block to avoid desyncs.
        //call ClearSelection()
        call SelectUnit(GetTriggerUnit(),false)
    endif
endif
endfunction

//===========================================================================
function InitTrig_pet_selected takes nothing returns nothing
local integer i = 0
set gg_trg_pet_selected = CreateTrigger(  )
loop
    exitwhen i > 11
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_pet_selected, Player(i), true )
    set i = i + 1
endloop
call TriggerAddAction( gg_trg_pet_selected, function Trig_pet_selected_Actions )
endfunction
//===========================================================================
