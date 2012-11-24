
//===========================================================================
function Trig_Baby_Mammoth_Dies_TONIGHT_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == UNIT_MAMMOTH_BABY ) ) then
        return false
    endif
    return true
endfunction

function Trig_Baby_Mammoth_Dies_TONIGHT_Actions takes nothing returns nothing
    local unit u=GetEnteringUnit()
    call SetUnitExplodedBJ( u, true )
    call PolledWait( 7.00 )
    call KillUnit( u )
endfunction

//===========================================================================
function InitTrig_Baby_Mammoth_Dies_TONIGHT takes nothing returns nothing
    set gg_trg_Baby_Mammoth_Dies_TONIGHT = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_Baby_Mammoth_Dies_TONIGHT, GetPlayableMapRect() )
    call TriggerAddCondition( gg_trg_Baby_Mammoth_Dies_TONIGHT, Condition( function Trig_Baby_Mammoth_Dies_TONIGHT_Conditions ) )
    call TriggerAddAction( gg_trg_Baby_Mammoth_Dies_TONIGHT, function Trig_Baby_Mammoth_Dies_TONIGHT_Actions )
endfunction

//===========================================================================
