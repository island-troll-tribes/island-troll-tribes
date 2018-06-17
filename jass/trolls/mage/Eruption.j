
//===========================================================================
function Trig_Eruption_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A04Q' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Eruption_Func003001003001 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetSpellAbilityUnit())) == true )
endfunction

function Trig_Eruption_Func003001003002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false )
endfunction

function Trig_Eruption_Func003001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_Eruption_Func003001003001(), Trig_Eruption_Func003001003002() )
endfunction

function Trig_Eruption_Func003A takes nothing returns nothing
    call UnitDamageTargetBJ( GetSpellAbilityUnit(), GetEnumUnit(), 40.00, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FIRE )
endfunction

function Trig_Eruption_Actions takes nothing returns nothing
    call AddSpecialEffectLocBJ( GetUnitLoc(GetSpellAbilityUnit()), "Abilities\\Spells\\Human\\FlameStrike\\FlameStrike1.mdl" )
    call PolledWait( 0.50 )
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(315.00, GetUnitLoc(GetSpellAbilityUnit()), Condition(function Trig_Eruption_Func003001003)), function Trig_Eruption_Func003A )
endfunction

//===========================================================================
function InitTrig_Eruption takes nothing returns nothing
    set gg_trg_Eruption = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Eruption, Condition( function Trig_Eruption_Conditions ) )
    //call TriggerAddAction( gg_trg_Eruption, function Trig_Eruption_Actions )
endfunction

//===========================================================================
