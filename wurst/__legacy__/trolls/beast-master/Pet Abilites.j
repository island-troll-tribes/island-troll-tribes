
//===========================================================================
function Trig_pet_abilites_Func003001 takes nothing returns boolean
    return ( GetSpellAbilityId() == SPELL_PET_ATTACK )
endfunction

function Trig_pet_abilites_Func004001 takes nothing returns boolean
    return ( GetSpellAbilityId() == SPELL_PET_FOLLOW )
endfunction

function Trig_pet_abilites_Func005001 takes nothing returns boolean
    return ( GetSpellAbilityId() == 'A01D' )
endfunction

function Trig_pet_abilites_Func006001 takes nothing returns boolean
    return ( GetSpellAbilityId() == SPELL_PET_SCOUT )
endfunction

function Trig_pet_abilites_Func007001 takes nothing returns boolean
    return ( GetSpellAbilityId() == 'A06R' )
endfunction

function Trig_pet_abilites_Func008001 takes nothing returns boolean
    return ( GetSpellAbilityId() == SPELL_PET_DROP_ITEMS )
endfunction

function Trig_pet_abilites_Func009Func001Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetEnumUnit()) == GetOwningPlayer(GetSpellAbilityUnit()) ) ) then
        return false
    endif
    return true
endfunction

function Trig_pet_abilites_Func009Func001A takes nothing returns nothing
    if ( Trig_pet_abilites_Func009Func001Func001C() ) then
        call masterCastAtTarget(GetEnumUnit(),GetEnumUnit(),0,0,'A01G',"sleep")
        call SetUnitLifeBJ( GetEnumUnit(), ( 60.00 + GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) ) )
    else
    endif
endfunction

function Trig_pet_abilites_Func009C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == SPELL_PET_SLEEP ) ) then
        return false
    endif
    return true
endfunction

function Trig_pet_abilites_Func010Func001Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetEnumUnit()) == GetOwningPlayer(GetSpellAbilityUnit()) ) ) then
        return false
    endif
    return true
endfunction

function Trig_pet_abilites_Func010Func001A takes nothing returns nothing
    if ( Trig_pet_abilites_Func010Func001Func001C() ) then
        call IssuePointOrderLocBJ( GetEnumUnit(), "move", GetUnitLoc(GetSpellTargetUnit()) )
        set udg_orders[( GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit())) - 1 )] = "transiting"
    else
    endif
endfunction

function Trig_pet_abilites_Func010C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == SPELL_PET_GO_TO_HATCHERY ) ) then
        return false
    endif
    return true
endfunction

function Trig_pet_abilites_Func011C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A03P' ) ) then
        return false
    endif
    return true
endfunction

function Trig_pet_abilites_Actions takes nothing returns nothing
    local integer endInt
    local integer startInt=5
    if ( Trig_pet_abilites_Func003001() ) then
        set udg_orders[( GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit())) - 1 )] = "attack"
    else
        call DoNothing(  )
    endif
    if ( Trig_pet_abilites_Func004001() ) then
        set udg_orders[( GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit())) - 1 )] = "move"
    else
        call DoNothing(  )
    endif
    if ( Trig_pet_abilites_Func005001() ) then
        set udg_orders[( GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit())) - 1 )] = "stop"
    else
        call DoNothing(  )
    endif
    if ( Trig_pet_abilites_Func006001() ) then
        set udg_orders[( GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit())) - 1 )] = "scout"
    else
        call DoNothing(  )
    endif
    if ( Trig_pet_abilites_Func007001() ) then
        set udg_orders[( GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit())) - 1 )] = "return me items"
    else
        call DoNothing(  )
    endif
    if ( Trig_pet_abilites_Func008001() ) then
        set udg_orders[( GetConvertedPlayerId(GetOwningPlayer(GetSpellAbilityUnit())) - 1 )] = "drop stop"
    else
        call DoNothing(  )
    endif
    if ( Trig_pet_abilites_Func009C() ) then
        call ForGroupBJ( udg_pets, function Trig_pet_abilites_Func009Func001A )
    else
    endif
    if ( Trig_pet_abilites_Func010C() ) then
        call ForGroupBJ( udg_pets, function Trig_pet_abilites_Func010Func001A )
    else
    endif
    if ( Trig_pet_abilites_Func011C() ) then
        set endInt=( UnitInventorySizeBJ(GetSpellTargetUnit()) - UnitInventoryCount(GetSpellTargetUnit()) )
        loop
        exitwhen startInt>endInt
        call UnitAddItemSwapped( UnitItemInSlotBJ(GetSpellAbilityUnit(), startInt), GetSpellTargetUnit() )
        set startInt=startInt+1
        endloop
    else
    endif
endfunction

//===========================================================================
function InitTrig_pet_abilites takes nothing returns nothing
    set gg_trg_pet_abilites = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_pet_abilites, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddAction( gg_trg_pet_abilites, function Trig_pet_abilites_Actions )
endfunction

//===========================================================================
