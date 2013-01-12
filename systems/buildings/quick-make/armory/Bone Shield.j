
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMBoneShield takes nothing returns boolean
    return GetSpellAbilityId() == 'A0A0'
endfunction

function QMBaseShield takes nothing returns boolean
    return ( checkBaseShield(GetFilterItem()) ) and ( GetWidgetLife(GetFilterItem()) > 0)
endfunction

function QMBoneShieldAct takes nothing returns nothing
local integer slotsNeeded=6
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMBaseShield))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMBone))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMBone))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMBone))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMBone))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMBone))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Bone_Shield takes nothing returns nothing
    set gg_trg_Bone_Shield = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Bone_Shield, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Bone_Shield, Condition( function QMBoneShield ) )
    call TriggerAddAction( gg_trg_Bone_Shield, function QMBoneShieldAct )
endfunction//===========================================================================
