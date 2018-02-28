
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
library DUMMYLIB requires PublicLibrary

globals
    Table SpearCastTable
    group dummyCast = CreateGroup()
    private constant real spawn_x = 2300
    private constant real spawn_y = -11300
endglobals

// -1 = unused, 1 = in use
function getCast takes player p, real x, real y returns unit
local unit u = FirstOfGroup(dummyCast)
if u == null then
    set u = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), UNIT_MASTER_CASTER, spawn_x, spawn_y, 0)
    call SetUnitInvulnerable(u, true)
    call SetUnitPathing(u, false)
    // debug call DisplayText("DUMMY: Create")
else
    call GroupRemoveUnit(dummyCast, u)
    //call PauseUnit(u, false)
    // debug call DisplayText("DUMMY: Allocate")
endif
call UnitResetCooldown(u)
call SetUnitUserData(u, 1)
call SetUnitOwner(u, p, false)
call SetUnitX(u, x)
call SetUnitY(u, y)
return u
endfunction

function returnCast takes nothing returns nothing
local unit u = LoadUnitHandle(udg_GameHash, GetHandleId(GetExpiredTimer()), StringHash("dumc"))
call RemoveSavedHandle(udg_GameHash, GetHandleId(GetExpiredTimer()), StringHash("dumc"))
call UnitRemoveAbility(u, LoadInteger(udg_GameHash, GetHandleId(GetExpiredTimer()), StringHash("dumcabil")))
call RemoveSavedInteger(udg_GameHash, GetHandleId(GetExpiredTimer()), StringHash("dumcabil"))
call SpearCastTable.remove_h(u)
call ReleaseTimer(GetExpiredTimer())
call SetUnitX(u, spawn_x)
call SetUnitY(u, spawn_y)
call SetUnitUserData(u, -1)
call GroupAddUnit(dummyCast, u)
//call PauseUnit(u, true)
// Pause caused problems with blowgun abilities..
// debug if u == null then
// debug call DisplayText("DUMMY: NULL???")
// debug endif
// debug call DisplayText("DUMMY: Returned")
set u = null
endfunction

function returnCastTimed takes unit u, integer i, real sec returns nothing
local timer t = NewTimer()
// debug call DisplayText("DUMMY: Return Initialized")
call SaveUnitHandle(udg_GameHash, GetHandleId(t), StringHash("dumc"), u)
call SaveInteger(udg_GameHash, GetHandleId(t), StringHash("dumcabil"), i)
call TimerStart(t, sec, false, function returnCast)
set t = null
endfunction

// dummy caster at CASTER'S place
function masterCastAtCaster takes unit c, unit t, real w,real h, integer order, string s returns unit
    local real x = GetUnitX(c)
    local real y = GetUnitY(c)
    local real Cx = GetRandomReal(x - w*0.5, x + w*0.5)
    local real Cy = GetRandomReal(y - h*0.5, y + h*0.5)
    local unit m = getCast(GetOwningPlayer(c),Cx,Cy)
    call UnitAddAbility( m , order)
    call IssueTargetOrder( m, s, t )
    call returnCastTimed(m, order, 4)
    return m
endfunction

// dummy caster at TARGET'S place
function masterCastAtTarget takes unit c, unit t, real w,real h, integer order, string s returns nothing
    local real x = GetUnitX(t)
    local real y = GetUnitY(t)
    local real Cx = GetRandomReal(x - w*0.5, x + w*0.5)
    local real Cy = GetRandomReal(y - h*0.5, y + h*0.5)
    local unit m = getCast(GetOwningPlayer(c),Cx,Cy)
    call UnitAddAbility( m , order)
    call IssueTargetOrder( m, s, t )
    call returnCastTimed(m, order, 4)
    set m = null
endfunction

function masterCastNoTarget takes unit c, real x, real y ,real w,real h, integer order, string s returns nothing
    local real Cx = GetRandomReal(x - w*0.5, x + w*0.5)
    local real Cy = GetRandomReal(y - h*0.5, y + h*0.5)
    local unit m = getCast(GetOwningPlayer(c),Cx,Cy)
    call UnitAddAbility( m , order)
    call IssueImmediateOrder( m, s)
    call returnCastTimed(m, order, 4)
    set m = null
endfunction

function masterCastAreaTarget takes unit c, real x, real y,integer order, string s returns nothing
    local unit m = getCast(GetOwningPlayer(c),x,y)
    call UnitAddAbility( m , order)
    call IssuePointOrder( m, s, x , y)
    call returnCastTimed(m, order, 4)
    set m = null
endfunction

// most of the time for channelings, note the longer return time
function masterCastAreaCaster takes unit c, real x, real y,integer order, string s, real time returns nothing
    local unit m = getCast(GetOwningPlayer(c),GetUnitX(c),GetUnitY(c))
    call UnitAddAbility( m , order)
    call IssuePointOrder( m, s, x , y)
    call returnCastTimed(m, order, time)
    set m = null
endfunction


endlibrary//===========================================================================
