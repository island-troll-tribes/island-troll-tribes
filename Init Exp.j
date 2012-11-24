
//===========================================================================
function Trig_init_exp_Conditions takes nothing returns boolean
    if ( not ( udg_EXPERIENCE_MODE == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_init_exp_Func002A takes nothing returns nothing
    call SuspendHeroXPBJ( true, GetEnumUnit() )
    call SetPlayerHandicapXPBJ( GetOwningPlayer(GetEnumUnit()), 400.00 )
endfunction

function Trig_init_exp_Actions takes nothing returns nothing
    call ForGroupBJ( udg_trolls, function Trig_init_exp_Func002A )
endfunction

//===========================================================================
function InitTrig_init_exp takes nothing returns nothing
    set gg_trg_init_exp = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_init_exp, Condition( function Trig_init_exp_Conditions ) )
    call TriggerAddAction( gg_trg_init_exp, function Trig_init_exp_Actions )
endfunction

//===========================================================================
