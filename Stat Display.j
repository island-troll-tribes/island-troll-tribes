
//===========================================================================
function Trig_stat_display_Func001C takes nothing returns boolean
    if ( not ( GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) == 20.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_stat_display_Func002C takes nothing returns boolean
    if ( not ( GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) == 20.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_stat_display_Func003C takes nothing returns boolean
    if ( not ( GetPlayerState(GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD) == 20 ) ) then
        return false
    endif
    return true
endfunction

function Trig_stat_display_Actions takes nothing returns nothing
    if ( Trig_stat_display_Func001C() ) then
        call DisplayTimedTextToForce( GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 5.00, "TRIGSTR_1173" )
    else
    endif
    if ( Trig_stat_display_Func002C() ) then
        call DisplayTimedTextToForce( GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 5.00, "TRIGSTR_1174" )
    else
    endif
    if ( Trig_stat_display_Func003C() ) then
        call DisplayTimedTextToForce( GetForceOfPlayer(GetOwningPlayer(GetEnumUnit())), 5.00, "TRIGSTR_1175" )
    else
    endif
endfunction

//===========================================================================
function InitTrig_stat_display takes nothing returns nothing
    set gg_trg_stat_display = CreateTrigger(  )
    call TriggerAddAction( gg_trg_stat_display, function Trig_stat_display_Actions )
endfunction

//===========================================================================
