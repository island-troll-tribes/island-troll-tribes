
function Trig_Dual_Arena_Killing_Func005C takes nothing returns boolean
    if ( ( udg_DualInProgress == false ) ) then
        return true
    endif
    if ( ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_HERO) == true ) ) then
        return true
    endif
    return false
endfunction

function Trig_Dual_Arena_Killing_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetEnteringUnit(), UNIT_TYPE_FLYING) == false ) ) then
        return false
    endif
    if ( not ( GetUnitAbilityLevelSwapped('Aloc', GetEnteringUnit()) == 0 ) ) then
        return false
    endif
    if ( not Trig_Dual_Arena_Killing_Func005C() ) then
        return false
    endif
    return true
endfunction

function Trig_Dual_Arena_Killing_Actions takes nothing returns nothing
    call KillUnit( GetEnteringUnit() )
    call DisplayTextToForce( GetForceOfPlayer(GetOwningPlayer(GetEnteringUnit())), "You can not enter the arena!" )
endfunction

//===========================================================================
function InitTrig_Dual_Arena_Killing takes nothing returns nothing
    set gg_trg_Dual_Arena_Killing = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_Dual_Arena_Killing, gg_rct_Dualing_Area )
    call TriggerAddCondition( gg_trg_Dual_Arena_Killing, Condition( function Trig_Dual_Arena_Killing_Conditions ) )
    call TriggerAddAction( gg_trg_Dual_Arena_Killing, function Trig_Dual_Arena_Killing_Actions )
endfunction

//===========================================================================
