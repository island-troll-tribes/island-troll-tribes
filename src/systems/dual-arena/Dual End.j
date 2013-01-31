
function Trig_End_Dual_Actions takes nothing returns nothing
    set udg_DualInProgress = false
    if ( GetDyingUnit() == udg_DualUnit1 ) then
        call DisplayTextToForce( GetForceOfPlayer(GetOwningPlayer(udg_DualUnit2)), "Congratulations, you have won your duel. You have 15 seconds until you leave the arena." )
    else
        call DisplayTextToForce( GetForceOfPlayer(GetOwningPlayer(udg_DualUnit1)), "Congratulations, you have won your duel. You have 15 seconds until you leave the arena." )
    endif
    call PolledWait( 15.00 )
    if ( RectContainsUnit(gg_rct_Dualing_Area, udg_DualUnit1) ) then
        call SetUnitPositionLoc( udg_DualUnit1, GetRectCenter(udg_LastPosBeforeDual1) )
    endif
    if ( RectContainsUnit(gg_rct_Dualing_Area, udg_DualUnit2) ) then
        call SetUnitPositionLoc( udg_DualUnit2, GetRectCenter(udg_LastPosBeforeDual2) )
    endif
endfunction

function InitTrig_End_Dual takes nothing returns nothing
    set gg_trg_End_Dual = CreateTrigger()
endfunction
