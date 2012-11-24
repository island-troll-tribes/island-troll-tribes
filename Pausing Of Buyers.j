
//===========================================================================
function Trig_pausing_of_buyers_Func001Func001001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_HERO_PICKER )
endfunction

function Trig_pausing_of_buyers_Func001A takes nothing returns nothing
    if ( Trig_pausing_of_buyers_Func001Func001001() ) then
        call PauseUnitBJ( true, GetEnumUnit() )
    else
        call DoNothing(  )
    endif
endfunction

function Trig_pausing_of_buyers_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsInRectAll(GetPlayableMapRect()), function Trig_pausing_of_buyers_Func001A )
endfunction

//===========================================================================
function InitTrig_pausing_of_buyers takes nothing returns nothing
    set gg_trg_pausing_of_buyers = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_pausing_of_buyers, 0.50 )
    call TriggerAddAction( gg_trg_pausing_of_buyers, function Trig_pausing_of_buyers_Actions )
endfunction

//===========================================================================
