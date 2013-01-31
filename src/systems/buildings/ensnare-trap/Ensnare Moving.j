
//===========================================================================
function Trig_ensnare_moving_Func002C takes nothing returns boolean
    if ( ( GetSpellAbilityId() == 'Aens' ) ) then
        return true
    endif
    if ( ( GetSpellAbilityId() == 'Aweb' ) ) then
        return true
    endif
    return false
endfunction

function Trig_ensnare_moving_Conditions takes nothing returns boolean
    if ( not Trig_ensnare_moving_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_ensnare_moving_Func001Func002C takes nothing returns boolean
    if ( ( IsUnitType(GetSpellTargetUnit(), UNIT_TYPE_FLYING) == true ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetSpellTargetUnit()) == UNIT_FISH ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetSpellTargetUnit()) == UNIT_GREEN_FISH ) ) then
        return true
    endif
    return false
endfunction

function Trig_ensnare_moving_Func001C takes nothing returns boolean
    if ( not Trig_ensnare_moving_Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_ensnare_moving_Actions takes nothing returns nothing
    if ( Trig_ensnare_moving_Func001C() ) then
        call SetUnitPositionLoc( GetSpellTargetUnit(), GetUnitLoc(GetSpellAbilityUnit()) )
    else
    endif
endfunction

//===========================================================================
function InitTrig_ensnare_moving takes nothing returns nothing
    set gg_trg_ensnare_moving = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ensnare_moving, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_ensnare_moving, Condition( function Trig_ensnare_moving_Conditions ) )
    call TriggerAddAction( gg_trg_ensnare_moving, function Trig_ensnare_moving_Actions )
endfunction

//===========================================================================
