
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMIronIngotCond takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06D' ) ) then
        return false
    endif
    return true
endfunction

function QMIronIngotAct takes nothing returns nothing
local integer slotsNeeded=2
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsStone))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsFlint))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Iron_Ingot takes nothing returns nothing
    set gg_trg_Iron_Ingot = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Iron_Ingot, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Iron_Ingot, Condition( function QMIronIngotCond ) )
    call TriggerAddAction( gg_trg_Iron_Ingot, function QMIronIngotAct )
endfunction//===========================================================================
