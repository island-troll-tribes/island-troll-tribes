
//===========================================================================
//TESH.scrollpos=21
//TESH.alwaysfold=0
function Trig_remove_gone_Conditions takes nothing returns boolean
    if ( not ( udg_CLASSIC_MODE == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_remove_gone_Func002Func001Func002002001 takes nothing returns boolean
    return ( GetOwningPlayer(GetEnumUnit()) == ConvertedPlayer(GetForLoopIndexA()) )
endfunction

function Trig_remove_gone_Func002Func001Func002002 takes nothing returns nothing
    if ( Trig_remove_gone_Func002Func001Func002002001() ) then
        call RemoveUnit( GetEnumUnit() )
    else
        call DoNothing(  )
    endif
endfunction

function Trig_remove_gone_Func002Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) != PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_remove_gone_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 12
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( Trig_remove_gone_Func002Func001C() ) then
            call ForGroupBJ( udg_trolls, function Trig_remove_gone_Func002Func001Func002002 )
        else
            call SetPlayerStateBJ( ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_GOLD, 100 )
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction

//===========================================================================
function InitTrig_remove_gone takes nothing returns nothing
    set gg_trg_remove_gone = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_remove_gone, 46.00 )
    call TriggerAddCondition( gg_trg_remove_gone, Condition( function Trig_remove_gone_Conditions ) )
    call TriggerAddAction( gg_trg_remove_gone, function Trig_remove_gone_Actions )
endfunction

//===========================================================================
