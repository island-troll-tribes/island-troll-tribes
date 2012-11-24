
//
// EVENT_PLAYER_UNIT_SPELL_FINISH
// EVENT_PLAYER_UNIT_SPELL_CAST
// PATHING_TYPE_WALKABILITY
//===========================================================================
//TESH.scrollpos=7
//TESH.alwaysfold=0
function Trig_Jump_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A04G' ) ) then
        return false
    endif
    return true
endfunction

function jumpTimerActions takes nothing returns nothing
    //local integer s=GetStoredInteger(udg_jumpCache,"jump.w3v","steps")
    //local unit m=I2U(GetStoredInteger(udg_jumpCache,"jump.w3v","jumper"))
    //local real d=GetStoredReal(udg_jumpCache,"jump.w3v","mp")
    //local real a=GetStoredReal(udg_jumpCache,"jump.w3v","angle")
    //local real temp=0
    local timer t = GetExpiredTimer()
    local integer s=LoadInteger(udg_GameHash,GetHandleId(t),StringHash("steps"))
    local unit m=LoadUnitHandle(udg_GameHash,GetHandleId(t),StringHash("unit"))
    local real d=LoadReal(udg_GameHash,GetHandleId(t),StringHash("mp"))
    local real a=LoadReal(udg_GameHash,GetHandleId(t),StringHash("angle"))
    local real temp=0
    
    if(s>=0) then
        call SetUnitPosition(m,GetUnitX(m)+d*Cos(a),GetUnitY(m)+d*Sin(a))
        call SetUnitFacing(m, a*bj_RADTODEG)
        //call SetUnitPositionLocFacingBJ( m, PolarProjectionBJ(GetUnitLoc(m),d, a), a )
        call SaveInteger(udg_GameHash,GetHandleId(t), StringHash("steps"), s-1)
        set temp=(-((I2R(s)-38)*(I2R(s)-38)))+500
        call SetUnitFlyHeight( m, temp, 0 )
    else
        call DestroyTimer(GetExpiredTimer())
        call PauseUnit( m , false)
        call SetUnitPathing( m, true )
        call SetUnitInvulnerable( m, false )
        call SetUnitFlyHeight(m,0,0)
    endif
    
    set t = null
    set m = null
endfunction

function Trig_Jump_Actions takes nothing returns nothing
    local unit u=GetSpellAbilityUnit()
    local real d=0
    local real movePer=0
    local timer t=CreateTimer()
    local real pX = GetUnitX(u)
    local real pY = GetUnitY(u)
    local real qX = GetSpellTargetX()
    local real qY = GetSpellTargetY()
    local real dx = qX-pX
    local real dy = qY-pY
    local real angle = Atan2(qY-pY,qX-pX)
    //local location p=GetUnitLoc(GetSpellAbilityUnit())
    //local location q=GetSpellTargetLoc()
    //New Stuff
    if SquareRoot(dx*dx+dy*dy)>650 then
        set qX = pX + 650*Cos(angle)
        set qY = pY + 650*Sin(angle)
        //set q = PolarProjectionBJ(p,650,AngleBetweenPoints(p,q))
    endif
    //end New Stuff
    if not IsTerrainWalkable(qX,qY) then
        set qX = pX
        set qY = pY
    endif
    call PolledWait(0.05)
    set dx = qX-pX
    set dy = qY-pY
    set d = SquareRoot(dx*dx+dy*dy)
    
    set movePer=d/75 //(.75 seconds)
    set angle = Atan2(qY-pY,qX-pX)
    call PauseUnit(u, true)
    call SetUnitInvulnerable(u, true)
    
    call UnitAddAbility( u, 'AEme' )
    call UnitRemoveAbility( u, 'AEme' )
    
    call SetUnitPathing( u, false )
    
    //call DisplayText("Real")
    //call DisplayText(R2S(movePer))
    //call DisplayText(R2S(angle))
    //call DisplayText(R2S(d))
    
    call SaveInteger(udg_GameHash,GetHandleId(t), StringHash("steps"), 75)
    call SaveReal(udg_GameHash,GetHandleId(t),StringHash("mp"),movePer)
    call SaveReal(udg_GameHash,GetHandleId(t),StringHash("angle"),angle)
    call SaveUnitHandle(udg_GameHash,GetHandleId(t),StringHash("unit"),u)
    
//    call StoreInteger(udg_jumpCache,"jump.w3v","steps",75)
//    call StoreReal(udg_jumpCache,"jump.w3v","mp",movePer)
//    call StoreReal(udg_jumpCache,"jump.w3v","angle",a)
//    call StoreInteger(udg_jumpCache,"jump.w3v","jumper",H2I(u))

    call TimerStart(t,0.01,true,function jumpTimerActions)
    set u = null
    set t = null
endfunction

//===========================================================================
function InitTrig_Jump takes nothing returns nothing
    set gg_trg_Jump = CreateTrigger(  )
    // call TriggerRegisterAnyUnitEventBJ( gg_trg_Jump, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Jump, Condition( function Trig_Jump_Conditions ) )
    call TriggerAddAction( gg_trg_Jump, function Trig_Jump_Actions )
endfunction
//===========================================================================
