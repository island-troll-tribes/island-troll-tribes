
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMBGloves takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06B' ) ) then
        return false
    endif
    return true
endfunction

function QMBGlovesAct takes nothing returns nothing
local integer slotsNeeded=6
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsBaseGloves))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsBone))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsBone))
        call UnitAddItemSwapped( i, u )    
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsBone))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsBone))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsBone))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Bone_Gloves takes nothing returns nothing
    set gg_trg_Bone_Gloves = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Bone_Gloves, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Bone_Gloves, Condition( function QMBGloves ) )
    call TriggerAddAction( gg_trg_Bone_Gloves, function QMBGlovesAct )
endfunction//===========================================================================
