
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMDarkSpear takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0G7' ) ) then
        return false
    endif
    return true
endfunction

function QMDarkSpearAct takes nothing returns nothing
    local integer slotsNeeded=2
    local real range=700
    local unit u=GetSpellAbilityUnit()
    local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsDarkRock))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsPole))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
    set u=null
endfunction

//===========================================================================
function InitTrig_Dark_Spear takes nothing returns nothing
    set gg_trg_Dark_Spear = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Dark_Spear, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Dark_Spear, Condition( function QMDarkSpear ) )
    call TriggerAddAction( gg_trg_Dark_Spear, function QMDarkSpearAct )
endfunction//===========================================================================
