
function QMScrollFireball takes nothing returns boolean
    local integer slotsNeeded=2
    local real range=700
    local unit u=GetSpellAbilityUnit()
    local item i = null
    if GetSpellAbilityId() != 'A067' then
        return false
    endif
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsFlint))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsManaCrystal))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
    set u=null
    return false
endfunction

function InitTrig_ScrollFireball takes nothing returns nothing
    set gg_trg_ScrollFireball = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ScrollFireball, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_ScrollFireball, Condition( function QMScrollFireball ) )
endfunction
