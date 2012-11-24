
//===========================================================================
//TESH.scrollpos=21
//TESH.alwaysfold=0
function Trig_test_6v6_Func009Func001Func001001 takes nothing returns boolean
    return ( GetForLoopIndexA() != GetForLoopIndexB() )
endfunction

function Trig_test_6v6_Func010Func001Func001001 takes nothing returns boolean
    return ( GetForLoopIndexA() != GetForLoopIndexB() )
endfunction

function Trig_6v6cond takes nothing returns boolean
    return not udg_STARTED and mode_enter
endfunction


function Trig_test_6v6_Actions takes nothing returns nothing
    set udg_SIX_SIX = true
    call DisableTrigger( gg_trg_reviving_2 )
    call DisableTrigger( gg_trg_spirit_ward_selection_2 )
    call DisableTrigger( gg_trg_spirit_ward_selection_3 )
    call DisableTrigger( gg_trg_spirit_ward_selection )
    call EnableTrigger( gg_trg_spirit_ward_selection_6v6 )
    call EnableTrigger( gg_trg_spirit_ward_selection_3_6v6 )
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 6
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set bj_forLoopBIndex = 1
        set bj_forLoopBIndexEnd = 6
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            if ( Trig_test_6v6_Func009Func001Func001001() ) then
                call SetPlayerAllianceStateBJ( ConvertedPlayer(GetForLoopIndexA()), ConvertedPlayer(GetForLoopIndexB()), bj_ALLIANCE_ALLIED_VISION )
            else
                call DoNothing(  )
            endif
            set bj_forLoopBIndex = bj_forLoopBIndex + 1
        endloop
        set bj_forLoopBIndex = 7
        set bj_forLoopBIndexEnd = 12
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            call SetPlayerAllianceStateBJ( ConvertedPlayer(GetForLoopIndexA()), ConvertedPlayer(GetForLoopIndexB()), bj_ALLIANCE_UNALLIED )
            set bj_forLoopBIndex = bj_forLoopBIndex + 1
        endloop
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 7
    set bj_forLoopAIndexEnd = 12
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set bj_forLoopBIndex = 7
        set bj_forLoopBIndexEnd = 12
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            if ( Trig_test_6v6_Func010Func001Func001001() ) then
                call SetPlayerAllianceStateBJ( ConvertedPlayer(GetForLoopIndexA()), ConvertedPlayer(GetForLoopIndexB()), bj_ALLIANCE_ALLIED_VISION )
            else
                call DoNothing(  )
            endif
            set bj_forLoopBIndex = bj_forLoopBIndex + 1
        endloop
        set bj_forLoopBIndex = 1
        set bj_forLoopBIndexEnd = 6
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            call SetPlayerAllianceStateBJ( ConvertedPlayer(GetForLoopIndexA()), ConvertedPlayer(GetForLoopIndexB()), bj_ALLIANCE_UNALLIED )
            set bj_forLoopBIndex = bj_forLoopBIndex + 1
        endloop
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call RemoveUnit( gg_unit_o00H_0032 )
    call SetUnitPositionLoc( gg_unit_O00J_0024, GetRectCenter(gg_rct_p5_6v6) )
    call SetUnitPositionLoc( gg_unit_O00J_0025, GetRectCenter(gg_rct_p6_6v6) )
    call SetUnitPositionLoc( gg_unit_O00J_0026, GetRectCenter(gg_rct_p7_6v6) )
    call SetUnitPositionLoc( gg_unit_O00J_0027, GetRectCenter(gg_rct_p8_6v6) )
    call DisplayText("6v6 mode enabled.")
endfunction

//===========================================================================
function InitTrig_test_6v6 takes nothing returns nothing
    set gg_trg_test_6v6 = CreateTrigger(  )
    //call TriggerRegisterPlayerChatEvent( gg_trg_test_6v6, Player(0), "-6v6", true )
    call TriggerAddCondition( gg_trg_test_6v6, Condition( function Trig_6v6cond ) )
    call TriggerAddAction( gg_trg_test_6v6, function Trig_test_6v6_Actions )
endfunction

//===========================================================================
