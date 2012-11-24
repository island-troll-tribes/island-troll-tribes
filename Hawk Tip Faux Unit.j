
//===========================================================================
function Trig_Hawk_Tip_Faux_Unit_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == UNIT_PEASANT ) ) then
        return false
    endif
    return true
endfunction

function Trig_Hawk_Tip_Faux_Unit_Actions takes nothing returns nothing
    call RemoveUnit( GetTriggerUnit() )
endfunction

//===========================================================================
function InitTrig_Hawk_Tip_Faux_Unit takes nothing returns nothing
    set gg_trg_Hawk_Tip_Faux_Unit = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_Hawk_Tip_Faux_Unit, GetPlayableMapRect() )
    call TriggerAddCondition( gg_trg_Hawk_Tip_Faux_Unit, Condition( function Trig_Hawk_Tip_Faux_Unit_Conditions ) )
    call TriggerAddAction( gg_trg_Hawk_Tip_Faux_Unit, function Trig_Hawk_Tip_Faux_Unit_Actions )
endfunction

//===========================================================================
