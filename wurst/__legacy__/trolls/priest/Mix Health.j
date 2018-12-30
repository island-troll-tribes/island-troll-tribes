
//===========================================================================
function Trig_Mix_Health_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02O' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mix_Health_Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellTargetUnit()) != UNIT_ONE ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mix_Health_Actions takes nothing returns nothing
    if ( Trig_Mix_Health_Func001C() ) then
        set udg_realParameter = ( ( GetUnitStateSwap(UNIT_STATE_LIFE, GetSpellTargetUnit()) + GetUnitStateSwap(UNIT_STATE_LIFE, GetSpellAbilityUnit()) ) / 2.00 )
        call SetUnitLifeBJ( GetSpellAbilityUnit(), udg_realParameter )
        call SetUnitLifeBJ( GetSpellTargetUnit(), udg_realParameter )
    else
    endif
endfunction

//===========================================================================
function InitTrig_Mix_Health takes nothing returns nothing
    set gg_trg_Mix_Health = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Mix_Health, Condition( function Trig_Mix_Health_Conditions ) )
    call TriggerAddAction( gg_trg_Mix_Health, function Trig_Mix_Health_Actions )
endfunction

//===========================================================================
