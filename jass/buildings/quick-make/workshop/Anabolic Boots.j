
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMAnabolicBoots takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0G1' ) ) then
        return false
    endif
    return true
endfunction

function QMAnabolicBootsAct takes nothing returns nothing
local integer slotsNeeded=6
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsBoneBoots))
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
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsAnabolicPotion))
        call UnitAddItemSwapped( i, u )       
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsAnabolicPotion))
        call UnitAddItemSwapped( i, u )    
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Anabolic_Boots takes nothing returns nothing
    set gg_trg_Anabolic_Boots = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Anabolic_Boots, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Anabolic_Boots, Condition( function QMAnabolicBoots ) )
    call TriggerAddAction( gg_trg_Anabolic_Boots, function QMAnabolicBootsAct )
endfunction//===========================================================================