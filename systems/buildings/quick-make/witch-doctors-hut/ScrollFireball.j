
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMFireball takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A067' ) ) then
        return false
    endif
    return true
endfunction

function QMFlint takes nothing returns boolean
    return ( GetItemTypeId(GetFilterItem()) == ITEM_FLINT )and ( GetWidgetLife(GetFilterItem()) > 0)
endfunction

function QMFireballAct takes nothing returns nothing
local integer slotsNeeded=2
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMFlint))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMMC))
        call UnitAddItemSwapped( i , u )
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_ScrollFireball takes nothing returns nothing
    set gg_trg_ScrollFireball = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ScrollFireball, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_ScrollFireball, Condition( function QMFireball ) )
    call TriggerAddAction( gg_trg_ScrollFireball, function QMFireballAct )
endfunction//===========================================================================
