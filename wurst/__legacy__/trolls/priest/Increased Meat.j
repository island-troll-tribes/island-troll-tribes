
//===========================================================================
function Trig_Increased_Meat_Func003C takes nothing returns boolean
    if ( ( GetSpellAbilityId() == 'AIhx' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A047' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'A0C9' ) ) then
        return true
    endif
    return false
endfunction

function Trig_Increased_Meat_Conditions takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetSpellAbilityUnit(), 'Bblo') == true ) ) then
        return false
    endif
    if ( not Trig_Increased_Meat_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_Increased_Meat_Actions takes nothing returns nothing
    call SetUnitLifeBJ( GetSpellAbilityUnit(), ( GetUnitStateSwap(UNIT_STATE_LIFE, GetSpellAbilityUnit()) + 25.00 ) )
endfunction

//===========================================================================
function InitTrig_Increased_Meat takes nothing returns nothing
    set gg_trg_Increased_Meat = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Increased_Meat, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_Increased_Meat, Condition( function Trig_Increased_Meat_Conditions ) )
    call TriggerAddAction( gg_trg_Increased_Meat, function Trig_Increased_Meat_Actions )
endfunction

//===========================================================================
