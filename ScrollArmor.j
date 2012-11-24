
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMArmor takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A068' ) ) then
        return false
    endif
    return true
endfunction

function QMStone takes nothing returns boolean
    return ( GetItemTypeId(GetFilterItem()) == ITEM_STONE ) and ( GetWidgetLife(GetFilterItem()) > 0)
endfunction

function QMArmorAct takes nothing returns nothing
local integer slotsNeeded=2
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMStone))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMMC))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_ScrollArmor takes nothing returns nothing
    set gg_trg_ScrollArmor = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ScrollArmor, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_ScrollArmor, Condition( function QMArmor ) )
    call TriggerAddAction( gg_trg_ScrollArmor, function QMArmorAct )
endfunction//===========================================================================
