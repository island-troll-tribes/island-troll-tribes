
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_bought_2_but_keep_moving_Conditions takes nothing returns boolean
return GetSellingUnit() == udg_ship2
endfunction

function shipTimerStart2 takes nothing returns nothing
local real X = LoadReal(udg_GameHash, StringHash("ship2"), StringHash("X"))
local real Y = LoadReal(udg_GameHash, StringHash("ship2"), StringHash("Y"))
call IssuePointOrder( udg_ship2, "move", X, Y)
set SHIP2_STOPPED = false
endfunction

function Trig_bought_2_but_keep_moving_Actions takes nothing returns nothing
set SHIP2_STOPPED = true
//call IssueImmediateOrder( udg_ship2, "holdposition")
call IssueImmediateOrder( udg_ship2, "holdposition")
call TimerStart(t__boat2, 7.5 , false, function shipTimerStart2)
endfunction

//===========================================================================
function InitTrig_bought_2_but_keep_moving takes nothing returns nothing
    set gg_trg_bought_2_but_keep_moving = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_bought_2_but_keep_moving, EVENT_PLAYER_UNIT_SELL_ITEM )
    call TriggerAddCondition( gg_trg_bought_2_but_keep_moving, Condition( function Trig_bought_2_but_keep_moving_Conditions ) )
    call TriggerAddAction( gg_trg_bought_2_but_keep_moving, function Trig_bought_2_but_keep_moving_Actions )
endfunction//===========================================================================
