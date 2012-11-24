
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMSteelIngotCond takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06E' ) ) then
        return false
    endif
    return true
endfunction

function QMIronIngot takes nothing returns boolean
    return ( GetItemTypeId(GetFilterItem()) == ITEM_IRON_INGOT ) and ( GetWidgetLife(GetFilterItem()) > 0)
endfunction

function QMSteelIngotAct takes nothing returns nothing
local integer slotsNeeded=4
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMIronIngot))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMIronIngot))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMFlint))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMFlint))
        call UnitAddItemSwapped( i, u )
        set i = null
        
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Steel_Ingot takes nothing returns nothing
    set gg_trg_Steel_Ingot = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Steel_Ingot, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Steel_Ingot, Condition( function QMSteelIngotCond ) )
    call TriggerAddAction( gg_trg_Steel_Ingot, function QMSteelIngotAct )
endfunction//===========================================================================
