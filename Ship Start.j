
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ship_start_Conditions takes nothing returns boolean
    return GetTriggerUnit() == udg_ship
endfunction

function Trig_ship_start_Actions takes nothing returns nothing
local real X = GetRectCenterX(gg_rct_ship_stop_1)
local real Y = GetRectCenterY(gg_rct_ship_stop_1)

//call SetUnitMoveSpeed( udg_ship , 522) //faster

call SaveReal(udg_GameHash, StringHash("ship"), StringHash("X"), X)
call SaveReal(udg_GameHash, StringHash("ship"), StringHash("Y"), Y)
call IssuePointOrder( udg_ship, "move", X, Y)
endfunction

//===========================================================================
function InitTrig_ship_start takes nothing returns nothing
    set gg_trg_ship_start = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_ship_start, gg_rct_ship_make )
    call TriggerAddCondition( gg_trg_ship_start, Condition( function Trig_ship_start_Conditions ) )
    call TriggerAddAction( gg_trg_ship_start, function Trig_ship_start_Actions )
endfunction

//===========================================================================
