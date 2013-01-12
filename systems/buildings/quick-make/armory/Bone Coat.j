
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMBCoat takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06C' ) ) then
        return false
    endif
    return true
endfunction

function QMBaseCoat takes nothing returns boolean
    return ( checkBaseCoat(GetFilterItem()) ) and ( GetWidgetLife(GetFilterItem()) > 0)
endfunction

function QMBCoatAct takes nothing returns nothing
local integer slotsNeeded=6
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMBaseCoat))
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
function InitTrig_Bone_Coat takes nothing returns nothing
    set gg_trg_Bone_Coat = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Bone_Coat, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Bone_Coat, Condition( function QMBCoat ) )
    call TriggerAddAction( gg_trg_Bone_Coat, function QMBCoatAct )
endfunction//===========================================================================
