
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMUltraPoisonSpear takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0G6' ) ) then
        return false
    endif
    return true
endfunction

function QMUltraPoisonSpearAct takes nothing returns nothing
local integer slotsNeeded=2
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsSpear))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsUltraPoison))
        call UnitAddItemSwapped( i, u )    
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Ultra_Poison_Spear takes nothing returns nothing
    set gg_trg_Ultra_Poison_Spear = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Ultra_Poison_Spear, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Ultra_Poison_Spear, Condition( function QMUltraPoisonSpear ) )
    call TriggerAddAction( gg_trg_Ultra_Poison_Spear, function QMUltraPoisonSpearAct )
endfunction//===========================================================================