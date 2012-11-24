
//===========================================================================
//TESH.scrollpos=3
//TESH.alwaysfold=0
function QMDead takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A069' ) ) then
        return false
    endif
    return true
endfunction

function QMBone takes nothing returns boolean
    return ( GetItemTypeId(GetFilterItem()) == ITEM_BONE ) and ( GetWidgetLife(GetFilterItem()) > 0)
endfunction
function QMMC takes nothing returns boolean
    return ( GetItemTypeId(GetFilterItem()) == ITEM_MANA_CRYSTAL ) and ( GetWidgetLife(GetFilterItem()) > 0)
endfunction

function QMDeadAct takes nothing returns nothing
local integer slotsNeeded=2
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMBone))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMMC))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_ScrollDead takes nothing returns nothing
    set gg_trg_ScrollDead = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ScrollDead, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_ScrollDead, Condition( function QMDead ) )
    call TriggerAddAction( gg_trg_ScrollDead, function QMDeadAct )
endfunction//===========================================================================
