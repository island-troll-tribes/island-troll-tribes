
//===========================================================================
function Trig_Spirit_Ward_Bug_2_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 12
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call TriggerRegisterPlayerEventLeave( gg_trg_Spirit_Ward_Bug, ConvertedPlayer(GetForLoopIndexA()) )
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction

//===========================================================================
function InitTrig_Spirit_Ward_Bug_2 takes nothing returns nothing
    set gg_trg_Spirit_Ward_Bug_2 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Spirit_Ward_Bug_2, function Trig_Spirit_Ward_Bug_2_Actions )
endfunction

//===========================================================================
