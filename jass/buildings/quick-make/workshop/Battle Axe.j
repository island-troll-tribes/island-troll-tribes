
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMBattleAxe takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0G3' ) ) then
        return false
    endif
    return true
endfunction

function QMBattleAxeAct takes nothing returns nothing
local integer slotsNeeded=6
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsStick))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsSteelIngot))
        call UnitAddItemSwapped( i, u )    
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsSteelIngot))
        call UnitAddItemSwapped( i, u )    
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsSpiritWind))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsSpiritWater))
        call UnitAddItemSwapped( i, u )       
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsManaCrystal))
        call UnitAddItemSwapped( i, u )    
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Battle_Axe takes nothing returns nothing
    set gg_trg_Battle_Axe = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Battle_Axe, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Battle_Axe, Condition( function QMBattleAxe ) )
    call TriggerAddAction( gg_trg_Battle_Axe, function QMBattleAxeAct )
endfunction//===========================================================================
