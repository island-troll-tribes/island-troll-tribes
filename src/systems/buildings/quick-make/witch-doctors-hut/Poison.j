
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Ipoi_Cond takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A062' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Poison_Actions takes nothing returns nothing
local integer slotsNeeded=3
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsMushroom))
        call UnitAddItemSwapped( i, u )
        set i = null
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsMushroom))
        call UnitAddItemSwapped( i, u )
        set i = null
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsMushroom))
        call UnitAddItemSwapped( i, u )
        set i = null
        
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Poison takes nothing returns nothing
    set gg_trg_Poison = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Poison, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Poison, Condition( function Ipoi_Cond ) )
    call TriggerAddAction( gg_trg_Poison, function Trig_Poison_Actions )
endfunction//===========================================================================
