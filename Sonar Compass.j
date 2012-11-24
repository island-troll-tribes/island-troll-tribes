
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMSonarCompass takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06L' ) ) then
        return false
    endif
    return true
endfunction

function QMSonarCompassAct takes nothing returns nothing
local integer slotsNeeded=2
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMIronIngot))
        call UnitAddItemSwapped( i, u )
        set i = null
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMFlint))
        call UnitAddItemSwapped( i, u )
        set i = null        
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Sonar_Compass takes nothing returns nothing
    set gg_trg_Sonar_Compass = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Sonar_Compass, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Sonar_Compass, Condition( function QMSonarCompass ) )
    call TriggerAddAction( gg_trg_Sonar_Compass, function QMSonarCompassAct )
endfunction//===========================================================================
