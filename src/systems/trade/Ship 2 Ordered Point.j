
//===========================================================================
//TESH.scrollpos=7
//TESH.alwaysfold=0
function Trig_Ship_2_Ordered_Point_Conditions takes nothing returns boolean
    return GetOrderedUnit() == udg_ship2
endfunction

function Trig_Ship_2_Ordered_Point_Actions takes nothing returns nothing
local real X = LoadReal(udg_GameHash, StringHash("ship2"), StringHash("X"))
local real Y = LoadReal(udg_GameHash, StringHash("ship2"), StringHash("Y"))
local real x2 = GetOrderPointX()
local real y2 = GetOrderPointY()
local timer t
if SHIP2_STOPPED then
    set t = NewTimer()
    call TimerStart(t,0,false, function ShipStop2)
    set t = null
elseif (x2 != X) and (y2 != Y) then
    call IssuePointOrder( udg_ship2, "move", X, Y)
endif
endfunction

//===========================================================================
function InitTrig_Ship_2_Ordered_Point takes nothing returns nothing
    set gg_trg_Ship_2_Ordered_Point = CreateTrigger(  )
    call TriggerRegisterPlayerUnitEvent(gg_trg_Ship_2_Ordered_Point, Player(15), EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER, null)
    call TriggerAddCondition( gg_trg_Ship_2_Ordered_Point, Condition( function Trig_Ship_2_Ordered_Point_Conditions ) )
    call TriggerAddAction( gg_trg_Ship_2_Ordered_Point, function Trig_Ship_2_Ordered_Point_Actions )
endfunction

//===========================================================================
