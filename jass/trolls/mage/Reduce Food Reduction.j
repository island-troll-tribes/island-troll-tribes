
//===========================================================================
function Trig_Reduce_Food_reduction_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A029' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Reduce_Food_reduction_Func001Func001Func003001 takes nothing returns boolean
    return ( GetItemTypeId(UnitItemInSlotBJ(GetSpellTargetUnit(), GetForLoopIndexA())) == ITEM_COOKED_MEAT )
endfunction

function Trig_Reduce_Food_reduction_Func001Func001Func003002 takes nothing returns boolean
    return ( GetItemCharges(UnitItemInSlotBJ(GetSpellTargetUnit(), GetForLoopIndexA())) >= 2 )
endfunction

function Trig_Reduce_Food_reduction_Func001Func001C takes nothing returns boolean
    if ( not GetBooleanAnd( Trig_Reduce_Food_reduction_Func001Func001Func003001(), Trig_Reduce_Food_reduction_Func001Func001Func003002() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Reduce_Food_reduction_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 6
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( Trig_Reduce_Food_reduction_Func001Func001C() ) then
            call SetItemCharges( UnitItemInSlotBJ(GetSpellTargetUnit(), GetForLoopIndexA()), IMaxBJ(1, ( GetItemCharges(UnitItemInSlotBJ(GetSpellTargetUnit(), GetForLoopIndexA())) - GetRandomInt(0, 1) )) )
            return
        else
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction

//===========================================================================
function InitTrig_Reduce_Food_reduction takes nothing returns nothing
    set gg_trg_Reduce_Food_reduction = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Reduce_Food_reduction, Condition( function Trig_Reduce_Food_reduction_Conditions ) )
    //call TriggerAddAction( gg_trg_Reduce_Food_reduction, function Trig_Reduce_Food_reduction_Actions )
endfunction

//===========================================================================
