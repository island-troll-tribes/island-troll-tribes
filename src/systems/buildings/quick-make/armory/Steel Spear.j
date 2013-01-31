
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMSteelSpear takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06H' ) ) then
        return false
    endif
    return true
endfunction

function QMSteelSpearAct takes nothing returns nothing
    local integer slotsNeeded=2
    local real range=700
    local unit u=GetSpellAbilityUnit()
    local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsSteelIngot))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsPole))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
    set u=null
endfunction

//===========================================================================
function InitTrig_Steel_Spear takes nothing returns nothing
    set gg_trg_Steel_Spear = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Steel_Spear, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Steel_Spear, Condition( function QMSteelSpear ) )
    call TriggerAddAction( gg_trg_Steel_Spear, function QMSteelSpearAct )
endfunction//===========================================================================
