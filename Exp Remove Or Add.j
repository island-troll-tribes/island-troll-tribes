
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function SuspendHeroExp takes nothing returns nothing
    call SuspendHeroXPBJ( true, GetEnumUnit() )
endfunction

function SetHandleCap takes nothing returns nothing
    call SetPlayerHandicapXPBJ( GetEnumPlayer(), 400.00 )
endfunction

function UnpauseUnits takes nothing returns nothing
    call PauseUnit(GetEnumUnit(), false )
endfunction

function Trig_exp_remove_or_add_Actions takes nothing returns nothing
    if udg_EXPERIENCE_MODE then
        call ForGroup( udg_trolls, function SuspendHeroExp )
        call ForForce( bj_FORCE_ALL_PLAYERS, function SetHandleCap )
    endif
    call ForGroup( udg_trolls, function UnpauseUnits )
endfunction

//===========================================================================
function InitTrig_exp_remove_or_add takes nothing returns nothing
    set gg_trg_exp_remove_or_add = CreateTrigger(  )
    //call TriggerRegisterTimerEventSingle( gg_trg_exp_remove_or_add, 46.00 )
    call TriggerAddAction( gg_trg_exp_remove_or_add, function Trig_exp_remove_or_add_Actions )
endfunction

//===========================================================================
