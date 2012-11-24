
//
// //Turns disease to meat
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_the_bad_meaties_Conditions takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetManipulatingUnit(), 'Bapl') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_the_bad_meaties_Actions takes nothing returns nothing
local unit PICKING_UNIT = GetManipulatingUnit()
local item TRANSFER_ITEM
local item PICKED_ITEM = GetManipulatedItem()
if GetItemTypeId(PICKED_ITEM) == ITEM_COOKED_MEAT then
    set udg_integerParameter2 = GetItemCharges(PICKED_ITEM)
    call RemoveItem( PICKED_ITEM )
    set TRANSFER_ITEM = CreateItem(ITEM_DISEASED_MEAT, GetUnitX(PICKING_UNIT), GetUnitY(PICKING_UNIT))
    call SetItemCharges( TRANSFER_ITEM, udg_integerParameter2 )
    call UnitAddItem(PICKING_UNIT, TRANSFER_ITEM)
    set TRANSFER_ITEM = null
endif
set PICKING_UNIT = null
set PICKED_ITEM = null
endfunction

//===========================================================================
function InitTrig_the_bad_meaties takes nothing returns nothing
    set gg_trg_the_bad_meaties = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_the_bad_meaties, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_the_bad_meaties, Condition( function Trig_the_bad_meaties_Conditions ) )
    call TriggerAddAction( gg_trg_the_bad_meaties, function Trig_the_bad_meaties_Actions )
endfunction

//===========================================================================
