
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMRoot takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A066' ) ) then
        return false
    endif
    return true
endfunction

function QMTinder takes nothing returns boolean
    return ( GetItemTypeId(GetFilterItem()) == ITEM_TINDER )and ( GetWidgetLife(GetFilterItem()) > 0)
endfunction

function QMRootAct takes nothing returns nothing
local integer slotsNeeded=2
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMTinder))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMMC))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_ScrollRoot takes nothing returns nothing
    set gg_trg_ScrollRoot = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ScrollRoot, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_ScrollRoot, Condition( function QMRoot ) )
    call TriggerAddAction( gg_trg_ScrollRoot, function QMRootAct )
endfunction//===========================================================================
