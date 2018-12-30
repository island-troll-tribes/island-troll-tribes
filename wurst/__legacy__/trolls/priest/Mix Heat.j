
//
// GetSpellAbilityUnit()
// GetSpellTargetUnit()
//===========================================================================
function Trig_Mix_Heat_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02N' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mix_Heat_Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSpellTargetUnit()) != UNIT_ONE ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mix_Heat_Actions takes nothing returns nothing
    if ( Trig_Mix_Heat_Func001C() ) then
        set udg_integerParameter = ( ( GetPlayerState(GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD) + GetPlayerState(GetOwningPlayer(GetSpellTargetUnit()), PLAYER_STATE_RESOURCE_GOLD) ) / 2 )
        call SetPlayerStateBJ( GetOwningPlayer(GetSpellTargetUnit()), PLAYER_STATE_RESOURCE_GOLD, udg_integerParameter )
        call SetPlayerStateBJ( GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD, udg_integerParameter )
    else
    endif
endfunction

//===========================================================================
function InitTrig_Mix_Heat takes nothing returns nothing
    set gg_trg_Mix_Heat = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Mix_Heat, Condition( function Trig_Mix_Heat_Conditions ) )
    call TriggerAddAction( gg_trg_Mix_Heat, function Trig_Mix_Heat_Actions )
endfunction

//===========================================================================
