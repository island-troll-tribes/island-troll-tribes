
//===========================================================================
//TESH.scrollpos=15
//TESH.alwaysfold=0
function QMEnsnareTrap takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06I' ) ) then
        return false
    endif
    return true
endfunction

function QMEnsnareTrapAct takes nothing returns nothing
    local integer slotsNeeded=3
    local real range=700
    local unit u=GetSpellAbilityUnit()
    local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsTinder))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsBone))
        if i == null then
            set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsPole))
        endif
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsStick))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
    set u=null
endfunction

//===========================================================================
function InitTrig_Ensnare_Trap takes nothing returns nothing
    set gg_trg_Ensnare_Trap = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Ensnare_Trap, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Ensnare_Trap, Condition( function QMEnsnareTrap ) )
    call TriggerAddAction( gg_trg_Ensnare_Trap, function QMEnsnareTrapAct )
endfunction
//===========================================================================
