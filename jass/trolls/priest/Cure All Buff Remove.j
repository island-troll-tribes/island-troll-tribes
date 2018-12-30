
//===========================================================================
function Trig_cure_all_buff_remove_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02H' ) ) then
        return false
    endif
    return true
endfunction

function Trig_cure_all_buff_remove_Actions takes nothing returns nothing
    call UnitRemoveBuffsExBJ( bj_BUFF_POLARITY_NEGATIVE, bj_BUFF_RESIST_BOTH, GetSpellTargetUnit(), false, false )
    call UnitRemoveBuffBJ( 'Bspo', GetSpellTargetUnit() )
    call UnitRemoveBuffBJ( 'Bssd', GetSpellTargetUnit() )
    call UnitRemoveBuffBJ( 'Bapl', GetSpellTargetUnit() )
    call UnitRemoveBuffBJ( 'B00A', GetSpellTargetUnit() )
    call UnitRemoveBuffBJ( 'Bplg', GetSpellTargetUnit() )
    call UnitRemoveBuffBJ( 'BEsh', GetSpellTargetUnit() )
    call UnitRemoveBuffBJ( 'BNab', GetSpellTargetUnit() )
    call UnitRemoveBuffBJ( BUFF_DYSENTERY, GetSpellTargetUnit() )
    call masterCastAtTarget(GetSpellTargetUnit(),GetSpellTargetUnit(),0,0,'A07M',"banish")
endfunction

//===========================================================================
function InitTrig_cure_all_buff_remove takes nothing returns nothing
    set gg_trg_cure_all_buff_remove = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_cure_all_buff_remove, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_cure_all_buff_remove, Condition( function Trig_cure_all_buff_remove_Conditions ) )
    call TriggerAddAction( gg_trg_cure_all_buff_remove, function Trig_cure_all_buff_remove_Actions )
endfunction

//===========================================================================
