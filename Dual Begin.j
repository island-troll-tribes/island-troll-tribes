
//===========================================================================
//TESH.scrollpos=22
//TESH.alwaysfold=0
function Trig_Dual_Begin_Func002C takes nothing returns boolean
    if ( not ( IsUnitAliveBJ(udg_DualUnit2) == true ) ) then
        return false
    endif
    if ( not ( IsUnitAliveBJ(udg_DualUnit1) == true ) ) then
        return false
    endif
    return true
endfunction



function Trig_Dual_Begin_Actions takes nothing returns nothing
    call DestroyTimerDialogBJ( GetLastCreatedTimerDialogBJ() )
    if ( Trig_Dual_Begin_Func002C() ) then
        set udg_LastPosBeforeDual1 = RectFromCenterSizeBJ(GetUnitLoc(udg_DualUnit1), 1.00, 1.00)
        set udg_LastPosBeforeDual2 = RectFromCenterSizeBJ(GetUnitLoc(udg_DualUnit2), 1.00, 1.00)
        call PauseUnitBJ( true, udg_DualUnit1 )
        call PauseUnitBJ( true, udg_DualUnit2 )
        call SetUnitPositionLoc( udg_DualUnit1, GetRectCenter(gg_rct_D1_Spawn) )
        call SetUnitPositionLoc( udg_DualUnit2, GetRectCenter(gg_rct_D2_Spawn) )
        call PanCameraToTimedLocForPlayer( GetOwningPlayer(udg_DualUnit1), GetRectCenter(gg_rct_D1_Spawn), 1.00 )
        call PanCameraToTimedLocForPlayer( GetOwningPlayer(udg_DualUnit2), GetRectCenter(gg_rct_D2_Spawn), 1.00 )
        call DisplayTextToForce( GetForceOfPlayer(GetOwningPlayer(udg_DualUnit1)), "|c00ff0000Your duel has begun!|r" )
        call DisplayTextToForce( GetForceOfPlayer(GetOwningPlayer(udg_DualUnit2)), "|c00ff0000Your duel has begun!|r" )
        call PolledWait( 2 )
        call PauseUnitBJ( false, udg_DualUnit1 )
        call PauseUnitBJ( false, udg_DualUnit2 )
        call ResetTrigger(gg_trg_End_Dual)
        call TriggerRegisterUnitEvent( gg_trg_End_Dual, udg_DualUnit1, EVENT_UNIT_DEATH )
        call TriggerRegisterUnitEvent( gg_trg_End_Dual, udg_DualUnit2, EVENT_UNIT_DEATH )
        call TriggerAddAction( gg_trg_End_Dual, function Trig_End_Dual_Actions )
    else
        call DisplayTextToForce( GetForceOfPlayer(GetOwningPlayer(udg_DualUnit1)), "|c00ffffebYour Duel has been cancelled!|r" )
        call DisplayTextToForce( GetForceOfPlayer(GetOwningPlayer(udg_DualUnit2)), "|c00ffffebYour Duel has been cancelled!|r" )
        set udg_DualInProgress = false
    endif
endfunction

//===========================================================================
function InitTrig_Dual_Begin takes nothing returns nothing
    set gg_trg_Dual_Begin = CreateTrigger(  )
    call TriggerRegisterTimerExpireEventBJ( gg_trg_Dual_Begin, udg_DualTimer )
    call TriggerAddAction( gg_trg_Dual_Begin, function Trig_Dual_Begin_Actions )
endfunction

//===========================================================================
