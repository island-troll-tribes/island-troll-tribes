
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function QMShield takes nothing returns boolean
    return GetSpellAbilityId() == 'A09Z'
endfunction

function QMAnyHide takes nothing returns boolean
    return checkHide(GetFilterItem()) and ( GetWidgetLife(GetFilterItem()) > 0)
endfunction

function QMShieldAct takes nothing returns nothing
local integer slotsNeeded=4
local real range=700
local unit u=GetSpellAbilityUnit()
local item i = null
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMAnyHide))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMStick))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMClayBall))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function QMClayBall))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_Shield takes nothing returns nothing
    set gg_trg_Shield = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Shield, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Shield, Condition( function QMShield ) )
    call TriggerAddAction( gg_trg_Shield, function QMShieldAct )
endfunction//===========================================================================
