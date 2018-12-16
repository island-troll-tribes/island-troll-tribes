
function QMFrostCloak takes nothing returns boolean
    local integer slotsNeeded=3
    local real range=700
    local unit u=GetSpellAbilityUnit()
    local item i = null
    if GetSpellAbilityId() != 'A0GA' then
        return false
    endif
    if((UnitInventorySizeBJ(u) - UnitInventoryCount(u)) >= slotsNeeded) then
        call cleanInventory(u)
        
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsMagic))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsBoneCoat))
        call UnitAddItemSwapped( i, u )
        set i = null
        set i = RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(u), range),Condition(function FilterItemIsSpiritWater))
        call UnitAddItemSwapped( i, u )
        set i = null
    endif
    set u=null
    return false
endfunction

function InitTrig_FrostCloak takes nothing returns nothing
    set gg_trg_FrostCloak = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_FrostCloak, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_FrostCloak, Condition( function QMFrostCloak ) )
endfunction
