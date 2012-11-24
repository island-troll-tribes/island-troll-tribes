
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
globals
    real hydraSpawnX
    real hydraSpawnY
endglobals

function IsHydraAndPoints takes nothing returns boolean
    return GetOrderedUnit() == Hydra and GetOrderPointX() == hydraSpawnX and GetOrderPointY() == hydraSpawnY
endfunction

function React_Stop takes nothing returns nothing 
local integer step = LoadInteger(udg_GameHash, StringHash("hyd"), StringHash("step"))
call ReleaseTimer(GetExpiredTimer())
call IssuePointOrder(Hydra, "attack", hydraB_X[step], hydraB_Y[step])
//call IssueImmediateOrder(Hydra, "stop")
endfunction

function CancelOrder__Actions takes nothing returns nothing
local timer t = NewTimer()
//call DisplayText("returning")
call TimerStart(t,0,false, function React_Stop)
set t = null
endfunction

//===========================================================================
function InitTrig_antiescapehydra takes nothing returns nothing
    set gg_trg_antiescapehydra = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_antiescapehydra, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER )
    call TriggerAddCondition( gg_trg_antiescapehydra, Condition( function IsHydraAndPoints ) )
    call TriggerAddAction( gg_trg_antiescapehydra, function CancelOrder__Actions )
endfunction//===========================================================================
