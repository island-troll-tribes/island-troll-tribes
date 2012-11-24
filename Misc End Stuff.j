
//===========================================================================
function Trig_Misc_End_Stuff_Func001Func001001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_THIEF )
endfunction

function Trig_Misc_End_Stuff_Func001Func002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_SCOUT )
endfunction

function Trig_Misc_End_Stuff_Func001A takes nothing returns nothing
    if ( Trig_Misc_End_Stuff_Func001Func001001() ) then
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Bush_Selection_Thief, GetOwningPlayer(GetEnumUnit()), true )
    else
        call DoNothing(  )
    endif
    if ( Trig_Misc_End_Stuff_Func001Func002001() ) then
        call TriggerRegisterPlayerSelectionEventBJ( gg_trg_Bush_Selection_Scout, GetOwningPlayer(GetEnumUnit()), true )
    else
        call DoNothing(  )
    endif
endfunction

function Trig_Misc_End_Stuff_Actions takes nothing returns nothing
    call ForGroupBJ( udg_trolls, function Trig_Misc_End_Stuff_Func001A )
endfunction

//===========================================================================
function InitTrig_Misc_End_Stuff takes nothing returns nothing
    set gg_trg_Misc_End_Stuff = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_Misc_End_Stuff, 48.00 )
    call TriggerAddAction( gg_trg_Misc_End_Stuff, function Trig_Misc_End_Stuff_Actions )
endfunction

//===========================================================================
