
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function IUpoi_Cond takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A063' ) ) then
        return false
    endif
    return true
endfunction

function IUPoi takes nothing returns boolean
    return ( GetItemTypeId(GetFilterItem()) == ITEM_POISON ) and ( GetWidgetLife(GetFilterItem()) > 0)
endfunction

function Trig_UPoison_Actions takes nothing returns nothing
local integer slotsNeeded=2
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function IUPoi))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function IUPoi))
        call UnitAddItemSwapped( i, u )
        set i = null
        
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_UPoison takes nothing returns nothing
    set gg_trg_UPoison = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_UPoison, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_UPoison, Condition( function IUpoi_Cond ) )
    call TriggerAddAction( gg_trg_UPoison, function Trig_UPoison_Actions )
endfunction
//===========================================================================
