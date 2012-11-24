
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ship_start_Copy_Conditions takes nothing returns boolean
    return GetTriggerUnit() == udg_ship2
endfunction

function Trig_ship_start_Copy_Actions takes nothing returns nothing
local real X = GetRectCenterX(gg_rct_ship_stop_3_3) 
local real Y = GetRectCenterY(gg_rct_ship_stop_3_3)

//call SetUnitMoveSpeed( udg_ship2 , 522) //faster, but may bug for being sooo fast
//call Cheat("iseedeadpeople")

call SaveReal(udg_GameHash, StringHash("ship2"), StringHash("X"), X)
call SaveReal(udg_GameHash, StringHash("ship2"), StringHash("Y"), Y)
call IssuePointOrder( udg_ship2, "move", X, Y)
endfunction

//===========================================================================
function InitTrig_ship_start_Copy takes nothing returns nothing
    set gg_trg_ship_start_Copy = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_ship_start_Copy, gg_rct_ship_gone )
    call TriggerAddCondition( gg_trg_ship_start_Copy, Condition( function Trig_ship_start_Copy_Conditions ) )
    call TriggerAddAction( gg_trg_ship_start_Copy, function Trig_ship_start_Copy_Actions )
endfunction

//===========================================================================
