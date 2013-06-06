
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Boat_Actions__Cast takes nothing returns nothing
    local unit u
    local unit t
    if GetItemTypeId(leg_bow) != 0 then
        set u = GetSpellAbilityUnit()
        set t = GetSpellTargetUnit()
        call masterCastAtTarget(u,t,0,0,'A0AA',"faeriefire")
        set u = null
        set t = null
    endif
endfunction

//===========================================================================
function InitTrig_bow_tract takes nothing returns nothing
    set gg_trg_bow_tract = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_bow_tract, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_bow_tract, Condition( function BowReturn_ID ) )
    call TriggerAddAction( gg_trg_bow_tract, function Boat_Actions__Cast )
endfunction

//===========================================================================
