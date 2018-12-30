
//===========================================================================
function Trig_TeleThief_Cast_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A05X' ) ) then
        return false
    endif
    return true
endfunction

function Trig_TeleThief_Cast_Actions takes nothing returns nothing
    local unit c=GetSpellAbilityUnit()
    //call SetUnitUserDataEx( c, U2I(GetSpellTargetUnit()) )
    call SaveUnitHandle( udg_GameHash, GetHandleId(c), StringHash("fire"), GetSpellTargetUnit())
    call masterCastAtTarget(c,c,0,0,'A05Y',"curse")
    call PolledWait(140)
    //call SetUnitUserDataEx( c, 0 )
    call SaveUnitHandle( udg_GameHash, GetHandleId(c), StringHash("fire"), null)
endfunction

//===========================================================================
function InitTrig_TeleThief_Cast takes nothing returns nothing
    set gg_trg_TeleThief_Cast = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_TeleThief_Cast, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_TeleThief_Cast, Condition( function Trig_TeleThief_Cast_Conditions ) )
    call TriggerAddAction( gg_trg_TeleThief_Cast, function Trig_TeleThief_Cast_Actions )
endfunction

//===========================================================================
