
//===========================================================================
function Trig_tsunami_building_damage_and_fire_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A038' ) ) then
        return false
    endif
    return true
endfunction

function Trig_tsunami_building_damage_and_fire_Func002001003001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true )
endfunction

function Trig_tsunami_building_damage_and_fire_Func002001003002 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetSpellAbilityUnit())) == true )
endfunction

function Trig_tsunami_building_damage_and_fire_Func002001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_tsunami_building_damage_and_fire_Func002001003001(), Trig_tsunami_building_damage_and_fire_Func002001003002() )
endfunction

function Trig_tsunami_building_damage_and_fire_Func002Func001Func002C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_FIRE ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_MAGE_FIRE_SUMMONED ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_MAGE_FIRE ) ) then
        return true
    endif
    return false
endfunction

function Trig_tsunami_building_damage_and_fire_Func002Func001C takes nothing returns boolean
    if ( not Trig_tsunami_building_damage_and_fire_Func002Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_tsunami_building_damage_and_fire_Func002A takes nothing returns nothing
    if ( Trig_tsunami_building_damage_and_fire_Func002Func001C() ) then
        call UnitDamageTargetBJ( GetSpellAbilityUnit(), GetEnumUnit(), 150.00, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL )
    else
        call UnitDamageTargetBJ( GetSpellAbilityUnit(), GetEnumUnit(), 30.00, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL )
    endif
endfunction

function Trig_tsunami_building_damage_and_fire_Func003001003001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true )
endfunction

function Trig_tsunami_building_damage_and_fire_Func003001003002 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetSpellAbilityUnit())) == true )
endfunction

function Trig_tsunami_building_damage_and_fire_Func003001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_tsunami_building_damage_and_fire_Func003001003001(), Trig_tsunami_building_damage_and_fire_Func003001003002() )
endfunction

function Trig_tsunami_building_damage_and_fire_Func003Func001Func002C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_FIRE ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_MAGE_FIRE_SUMMONED ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_MAGE_FIRE ) ) then
        return true
    endif
    return false
endfunction

function Trig_tsunami_building_damage_and_fire_Func003Func001C takes nothing returns boolean
    if ( not Trig_tsunami_building_damage_and_fire_Func003Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_tsunami_building_damage_and_fire_Func003A takes nothing returns nothing
    if ( Trig_tsunami_building_damage_and_fire_Func003Func001C() ) then
        call UnitDamageTargetBJ( GetSpellAbilityUnit(), GetEnumUnit(), 150.00, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL )
    else
        call UnitDamageTargetBJ( GetSpellAbilityUnit(), GetEnumUnit(), 30.00, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL )
    endif
endfunction

function Trig_tsunami_building_damage_and_fire_Func004001003001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == true )
endfunction

function Trig_tsunami_building_damage_and_fire_Func004001003002 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetSpellAbilityUnit())) == true )
endfunction

function Trig_tsunami_building_damage_and_fire_Func004001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_tsunami_building_damage_and_fire_Func004001003001(), Trig_tsunami_building_damage_and_fire_Func004001003002() )
endfunction

function Trig_tsunami_building_damage_and_fire_Func004Func001Func002C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_FIRE ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_MAGE_FIRE_SUMMONED ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_MAGE_FIRE ) ) then
        return true
    endif
    return false
endfunction

function Trig_tsunami_building_damage_and_fire_Func004Func001C takes nothing returns boolean
    if ( not Trig_tsunami_building_damage_and_fire_Func004Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_tsunami_building_damage_and_fire_Func004A takes nothing returns nothing
    if ( Trig_tsunami_building_damage_and_fire_Func004Func001C() ) then
        call UnitDamageTargetBJ( GetSpellAbilityUnit(), GetEnumUnit(), 150.00, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL )
    else
        call UnitDamageTargetBJ( GetSpellAbilityUnit(), GetEnumUnit(), 30.00, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL )
    endif
endfunction

function Trig_tsunami_building_damage_and_fire_Actions takes nothing returns nothing
    set udg_realParameter = AngleBetweenPoints(GetUnitLoc(GetSpellAbilityUnit()), GetSpellTargetLoc())
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(150.00, PolarProjectionBJ(GetUnitLoc(GetSpellAbilityUnit()), 300.00, udg_realParameter), Condition(function Trig_tsunami_building_damage_and_fire_Func002001003)), function Trig_tsunami_building_damage_and_fire_Func002A )
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(150.00, PolarProjectionBJ(GetUnitLoc(GetSpellAbilityUnit()), 450.00, udg_realParameter), Condition(function Trig_tsunami_building_damage_and_fire_Func003001003)), function Trig_tsunami_building_damage_and_fire_Func003A )
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(150.00, PolarProjectionBJ(GetUnitLoc(GetSpellAbilityUnit()), 600.00, udg_realParameter), Condition(function Trig_tsunami_building_damage_and_fire_Func004001003)), function Trig_tsunami_building_damage_and_fire_Func004A )
endfunction

//===========================================================================
function InitTrig_tsunami_building_damage_and_fire takes nothing returns nothing
    set gg_trg_tsunami_building_damage_and_fire = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_tsunami_building_damage_and_fire, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_tsunami_building_damage_and_fire, Condition( function Trig_tsunami_building_damage_and_fire_Conditions ) )
    call TriggerAddAction( gg_trg_tsunami_building_damage_and_fire, function Trig_tsunami_building_damage_and_fire_Actions )
endfunction

//===========================================================================
