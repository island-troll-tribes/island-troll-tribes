
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMBeehive takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06M' ) ) then
        return false
    endif
    return true
endfunction

function QMWSpirit takes nothing returns boolean
    return ( GetItemTypeId(GetFilterItem()) == ITEM_SPIRIT_WIND ) and ( GetWidgetLife(GetFilterItem()) > 0)
endfunction

function QMBeehiveAct takes nothing returns nothing
local integer slotsNeeded=3
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMStick))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMStick))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMWSpirit))
        call UnitAddItemSwapped( i, u )
        set i = null        
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Beehive takes nothing returns nothing
    set gg_trg_Beehive = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Beehive, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Beehive, Condition( function QMBeehive ) )
    call TriggerAddAction( gg_trg_Beehive, function QMBeehiveAct )
endfunction//===========================================================================
