
//===========================================================================
//TESH.scrollpos=-1
//TESH.alwaysfold=0
function AcidBoostConditions takes nothing returns nothing
    local string order = "acidbomb"
    local integer battleSuitID = ITEM_BATTLE_SUIT 
    local integer acidBuffID = 'BNab'
    local integer acidSpellID = 'A0AD'
    local integer boostID = 'A0C6'
    local integer i = 0
    local integer s = 0
    local boolean b = false
    local unit u
    local unit t
    if not (GetSpellAbilityId() == acidSpellID) then
        return
    endif  
    set u = GetSpellAbilityUnit()
    set t = GetSpellTargetUnit()
    set s = UnitInventorySize( t )
    loop
        exitwhen i > s
            if GetItemTypeId( UnitItemInSlot( t, i ) ) == battleSuitID then
               set b = true
            endif
        set i = i + 1
    endloop
    if not b then
        set u = null
        set t = null
        return
    endif
    call UnitRemoveAbility( t, acidBuffID )
    call masterCastAtCaster( u, t, 0, 0, boostID, order )
    set u = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AcidBoost takes nothing returns nothing
    set gg_trg_AcidBoost = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_AcidBoost, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_AcidBoost, function AcidBoostConditions )
endfunction

//===========================================================================
