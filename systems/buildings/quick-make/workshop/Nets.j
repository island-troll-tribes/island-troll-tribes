
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMNets takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06K' ) ) then
        return false
    endif
    return true
endfunction

function QMNetsAct takes nothing returns nothing
local integer slotsNeeded=2
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMTinder))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMTinder))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Nets takes nothing returns nothing
    set gg_trg_Nets = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Nets, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Nets, Condition( function QMNets ) )
    call TriggerAddAction( gg_trg_Nets, function QMNetsAct )
endfunction//===========================================================================
