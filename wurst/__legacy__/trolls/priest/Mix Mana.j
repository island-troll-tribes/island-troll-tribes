
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Mix_Mana_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02M' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mix_Mana_Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellTargetUnit()) != UNIT_ONE ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mix_Mana_Actions takes nothing returns nothing
    if ( Trig_Mix_Mana_Func001C() ) then
        set udg_realParameter = ( ( GetUnitStateSwap(UNIT_STATE_MANA, GetSpellTargetUnit()) + GetUnitStateSwap(UNIT_STATE_MANA, GetSpellAbilityUnit()) ) / 2.00 )
        call SetUnitManaBJ( GetSpellAbilityUnit(), udg_realParameter )
        call SetUnitManaBJ( GetSpellTargetUnit(), udg_realParameter )
    else
    endif
endfunction

//===========================================================================
function InitTrig_Mix_Mana takes nothing returns nothing
    set gg_trg_Mix_Mana = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Mix_Mana, Condition( function Trig_Mix_Mana_Conditions ) )
    call TriggerAddAction( gg_trg_Mix_Mana, function Trig_Mix_Mana_Actions )
endfunction

//===========================================================================
