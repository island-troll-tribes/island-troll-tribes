
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Dream_Eater_Conditions takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetSpellTargetUnit(), 'BOvd') == true ) ) then
        return false
    endif
    if ( not ( GetSpellAbilityId() == 'A04Z' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Dream_Eater_Func006C takes nothing returns boolean
    if ( not ( GetUnitStateSwap(UNIT_STATE_MANA, GetSpellTargetUnit()) <= 10 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Dream_Eater_Actions takes nothing returns nothing
    call AddSpecialEffectTargetUnitBJ( "overhead", GetSpellTargetUnit(), "Abilities\\Spells\\Items\\AIso\\AIsoTarget.mdl" )
    call SetUnitLifeBJ( GetSpellTargetUnit(), ( ( GetUnitStateSwap(UNIT_STATE_LIFE, GetSpellTargetUnit()) - 20.00 ) + 0.00 ) )
    call SetUnitManaBJ( GetSpellTargetUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetSpellTargetUnit()) - 50.00 ) )
    call SetUnitLifeBJ( GetSpellAbilityUnit(), ( GetUnitStateSwap(UNIT_STATE_LIFE, GetSpellAbilityUnit()) + 50.00 ) )
    call SetUnitManaBJ( GetSpellAbilityUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetSpellAbilityUnit()) + 50.00 ) )
    if ( Trig_Dream_Eater_Func006C() ) then
        call SetUnitManaBJ( GetSpellTargetUnit(), 10.00 )
    else
    endif
endfunction

//===========================================================================
function InitTrig_Dream_Eater takes nothing returns nothing
    set gg_trg_Dream_Eater = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Dream_Eater, Condition( function Trig_Dream_Eater_Conditions ) )
    call TriggerAddAction( gg_trg_Dream_Eater, function Trig_Dream_Eater_Actions )
endfunction

//===========================================================================
