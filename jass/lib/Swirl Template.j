
//
// 
// dummyURaw //The rawcode of the dummy unit. int
// dummySRaw //The rawcode of the dummy spell. int
// buffRaw //the buffs rawcode int
// orderS //order string (string)
// castD //How clsoe a unit must be to be hit real
// duration //how long it lasts (seconds) real
// startD //starting distance real
// startS //size of the swirls from the start real
// moveD //how much it will move per second real
// swirlD //how much it swirls outward per second real
// spinSpeed //how fast it spins in degrees real
// integer dR, integer dS, integer bF, string oS, real cD, real du, real sD, real sS, real mD, real sW, real sP
//===========================================================================
//TESH.scrollpos=97
//TESH.alwaysfold=0
//===========================================================================
//Spell Functions.
//This is the spells functions, conditions, and function children.



function HasBuff takes nothing returns boolean
    local integer i = LoadInteger(udg_GameHash, GetHandleId(GetExpiredTimer()), StringHash("buffRaw"))
    return ( UnitHasBuffBJ(GetFilterUnit(), i ) == false )
//  return ( UnitHasBuffBJ(GetFilterUnit(), GetHandleInt(GetExpiredTimer(),"buffRaw")) == false )
//  call SaveInteger(udg_GameHash, GetHandleId(t), StringHash("buffRaw"), bF)
endfunction

function IssueOrder takes nothing returns nothing
    local unit u = LoadUnitHandle( udg_GameHash, GetHandleId( GetExpiredTimer() ), StringHash("dummy"))
    //call IssueTargetOrderBJ( GetHandleUnit(), GetHandleString(I2S(H2I(GetExpiredTimer())),"orderString"), GetEnumUnit() )
    call IssueTargetOrderBJ( u ,  LoadStr(udg_GameHash, GetHandleId(GetExpiredTimer()), StringHash("orderString")), GetEnumUnit() )   
    //For Reference: call SaveStr(udg_GameHash, GetHandleId(t), StringHash("orderString"), oS)
endfunction

function Move takes nothing returns nothing
    local timer t=GetExpiredTimer()
    local group g
    local unit u = LoadUnitHandle( udg_GameHash, GetHandleId(t), StringHash("dummy"))
    //local unit u=GetHandleUnit()
    local real angle = LoadReal(udg_GameHash, GetHandleId(t), StringHash("angle"))
    //local real angle=GetHandleReal( t,"angle")
    local real distance = LoadReal(udg_GameHash, GetHandleId(t), StringHash("distance"))
    //local real distance=GetHandleReal( t,"distance")
    local real direction = LoadReal(udg_GameHash, GetHandleId(t), StringHash("direction"))
    //local real direction=GetHandleReal( t,"direction")
    local real X = LoadReal(udg_GameHash, GetHandleId(t), StringHash("X"))
    //local real X=GetHandleReal( t,"X")
    local real Y = LoadReal(udg_GameHash, GetHandleId(t), StringHash("Y"))
    //local real Y=GetHandleReal( t,"Y")
    local real moveDistance = LoadReal(udg_GameHash, GetHandleId(t), StringHash("moveD"))
    //local real moveDistance=GetHandleReal( t,"moveD")
    local real swirlD = LoadReal(udg_GameHash, GetHandleId(t), StringHash("swirlD"))
    //local real swirlD=GetHandleReal( t,"swirlD")
    local real spinSpeed = LoadReal(udg_GameHash, GetHandleId(t), StringHash("spinSpeed"))
    //local real spinSpeed=GetHandleReal( t,"spinSpeed")

    call SaveUnitHandle(udg_GameHash, GetHandleId(t), StringHash("dummy"), u)
    //call SetHandleHandle(GetExpiredTimer(), "dummy", u)
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("distance"), (distance + swirlD))
    //call SetHandleReal(t, "distance", (distance+swirlD))
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("direction"), (direction + spinSpeed))
    //call SetHandleReal(t, "direction", (direction+spinSpeed))
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("X"), GetLocationX(PolarProjectionBJ(Location(X, Y), moveDistance, angle)) )
    //call SetHandleReal(t, "X",  GetLocationX(PolarProjectionBJ(Location(X, Y), moveDistance, angle)) )
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("Y"), GetLocationY(PolarProjectionBJ(Location(X, Y), moveDistance, angle)) )
    //call SetHandleReal(t, "Y",  GetLocationY(PolarProjectionBJ(Location(X, Y), moveDistance, angle)) )
    
    call SetUnitPositionLoc( u, PolarProjectionBJ(Location(X,Y), distance, direction) )
    set g = GetUnitsInRangeOfLocMatching(LoadReal(udg_GameHash, GetHandleId(t), StringHash("castD")), GetUnitLoc(u), Condition (function HasBuff))
    call ForGroupBJ( g, function IssueOrder )
    //call ForGroupBJ( GetUnitsInRangeOfLocMatching(GetHandleReal( t,"castD"), GetUnitLoc(u), Condition(function HasBuff)), function IssueOrder )

    call DestroyGroup(g)
    set g = null
endfunction

function SwirlActions takes  integer dR, integer dS, integer bF, string oS, real cD, real du, real sD, real sS, real mD, real sW, real sP returns nothing
    local real angle = AngleBetweenPoints(GetUnitLoc(GetTriggerUnit()), GetSpellTargetLoc())
    local real distance = sS
    local real direction = 0.00
    local unit u 
    local timer t=CreateTimer()
    call CreateNUnitsAtLoc( 1, dR, GetOwningPlayer(GetTriggerUnit()), PolarProjectionBJ(GetUnitLoc(GetTriggerUnit()), sD, angle), angle ) 
    set u = GetLastCreatedUnit()
    call UnitAddAbilityBJ( dS, u )
    call SetUnitAbilityLevelSwapped( dS, u, GetUnitAbilityLevelSwapped(GetSpellAbilityId(), GetTriggerUnit()) )
    set direction = angle

    call SaveInteger(udg_GameHash, GetHandleId(t), StringHash("dummySRaw"), dS)
    //call SetHandleInt(t, "dummySRaw", dS)
    call SaveInteger(udg_GameHash, GetHandleId(t), StringHash("buffRaw"), bF)
    //call SetHandleInt(t, "buffRaw", bF)
    call SaveStr(udg_GameHash, GetHandleId(t), StringHash("orderString"), oS)
    //call SetHandleString(I2S(H2I(t)), "orderString", oS)
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("castD"), cD)
    //call SetHandleReal(t, "castD", cD)
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("duration"), du)
    //call SetHandleReal(t, "duration", du)
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("startD"), sD)    
    //call SetHandleReal(t, "startD", sD)
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("startS"), sS)    
    //call SetHandleReal(t, "startS", sS)
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("moveD"), mD)    
    //call SetHandleReal(t, "moveD", mD)
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("swirlD"), sW)    
    //call SetHandleReal(t, "swirlD", sW)
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("spinSpeed"), sP)    
    //call SetHandleReal(t, "spinSpeed", sP)

    call SaveUnitHandle(udg_GameHash, GetHandleId(t), StringHash("dummy"), u)
    //call SetHandleHandle(t, "dummy", u)
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("angle"), angle)
    //call SetHandleReal(t, "angle", angle)
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("distance"), distance)    
    //call SetHandleReal(t, "distance", distance)
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("direction"), direction)
    //call SetHandleReal(t, "direction", direction)
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("X"), GetLocationX(GetUnitLoc(u)))    
    //call SetHandleReal(t, "X", GetLocationX(GetUnitLoc(u)))
    call SaveReal(udg_GameHash, GetHandleId(t), StringHash("Y"), GetLocationY(GetUnitLoc(u)))    
    //call SetHandleReal(t, "Y", GetLocationY(GetUnitLoc(u)))
    call TimerStart(t, 0.01, true, function Move)
    call PolledWait(du)
    //call FlushHandleLocals(t)
    call FlushChildHashtable(udg_GameHash, GetHandleId(t))
    call DestroyTimer(t)
    call KillUnit(u)
    call PolledWait(3.00)
    call RemoveUnit(u)
endfunction

//===========================================================================
function InitTrig_swirl_template takes nothing returns nothing
    set gg_trg_swirl_template = CreateTrigger(  )
endfunction//===========================================================================
