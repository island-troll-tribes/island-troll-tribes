
//===========================================================================
function Trig_packed_up_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A003' ) ) then
        return false
    endif
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_packed_up_Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == UNIT_FIRE ) ) then
        return false
    endif
    return true
endfunction

function Trig_packed_up_Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == UNIT_TENT ) ) then
        return false
    endif
    return true
endfunction

function Trig_packed_up_Func003C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == UNIT_MAGE_FIRE ) ) then
        return false
    endif
    return true
endfunction

function Trig_packed_up_Func004C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellAbilityUnit()) == UNIT_MAGE_FIRE_SUMMONED ) ) then
        return false
    endif
    return true
endfunction

function Trig_packed_up_Actions takes nothing returns nothing
    if ( Trig_packed_up_Func001C() ) then
        call RemoveUnit( GetSpellAbilityUnit() )
        call CreateItemLoc( ITEM_FIRE_KIT, GetUnitLoc(GetSpellAbilityUnit()) )
    else
    endif
    if ( Trig_packed_up_Func002C() ) then
        call RemoveUnit( GetSpellAbilityUnit() )
        call CreateItemLoc( ITEM_TENT_KIT, GetUnitLoc(GetSpellAbilityUnit()) )
    else
    endif
    if ( Trig_packed_up_Func003C() ) then
        call RemoveUnit( GetSpellAbilityUnit() )
        call CreateItemLoc( ITEM_MAGE_FIRE_KIT, GetUnitLoc(GetSpellAbilityUnit()) )
    else
    endif
    if ( Trig_packed_up_Func004C() ) then
        call RemoveUnit( GetSpellAbilityUnit() )
    else
    endif
endfunction

//===========================================================================
function InitTrig_packed_up takes nothing returns nothing
    set gg_trg_packed_up = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_packed_up, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_packed_up, Condition( function Trig_packed_up_Conditions ) )
    call TriggerAddAction( gg_trg_packed_up, function Trig_packed_up_Actions )
endfunction

//===========================================================================
