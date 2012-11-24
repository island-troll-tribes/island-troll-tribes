
//===========================================================================
function Trig_Omnitower_Targeting_Func002C takes nothing returns boolean
    if ( ( GetSpellAbilityId() == 'A045' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A046' ) ) then
        return true
    endif
    return false
endfunction

function Trig_Omnitower_Targeting_Conditions takes nothing returns boolean
    if ( not Trig_Omnitower_Targeting_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_Omnitower_Targeting_Actions takes nothing returns nothing
    call UnitUseItemTarget( GetSpellAbilityUnit(), UnitItemInSlotBJ(GetSpellAbilityUnit(), 1), GetSpellTargetUnit() )
endfunction

//===========================================================================
function InitTrig_Omnitower_Targeting takes nothing returns nothing
    set gg_trg_Omnitower_Targeting = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Omnitower_Targeting, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Omnitower_Targeting, Condition( function Trig_Omnitower_Targeting_Conditions ) )
    call TriggerAddAction( gg_trg_Omnitower_Targeting, function Trig_Omnitower_Targeting_Actions )
endfunction

//===========================================================================
