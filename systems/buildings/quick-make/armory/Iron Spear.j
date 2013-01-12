
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMIronSpear takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06G' ) ) then
        return false
    endif
    return true
endfunction

function QMIronSpearAct takes nothing returns nothing
local integer slotsNeeded=2
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i= RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMIronIngot))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMPole))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Iron_Spear takes nothing returns nothing
    set gg_trg_Iron_Spear = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Iron_Spear, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Iron_Spear, Condition( function QMIronSpear ) )
    call TriggerAddAction( gg_trg_Iron_Spear, function QMIronSpearAct )
endfunction//===========================================================================
