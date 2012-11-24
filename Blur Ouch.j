
//===========================================================================
function Trig_blur_ouch_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnteringUnit()) == UNIT_BLUR_IMAGE ) ) then
        return false
    endif
    return true
endfunction

function Trig_blur_ouch_Func002001003001 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetEnteringUnit())) == true )
endfunction

function Trig_blur_ouch_Func002001003002 takes nothing returns boolean
    return ( UnitHasBuffBJ(GetEnteringUnit(), 'B00D') == false )
endfunction

function Trig_blur_ouch_Func002001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_blur_ouch_Func002001003001(), Trig_blur_ouch_Func002001003002() )
endfunction

function Trig_blur_ouch_Func002A takes nothing returns nothing
    call masterCastAtTarget(GetEnteringUnit(),GetEnumUnit(),0,0,'A04M',"curse")
endfunction

function Trig_blur_ouch_Actions takes nothing returns nothing
    call PolledWait( 0.25 )
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(150.00, GetUnitLoc(GetEnteringUnit()), Condition(function Trig_blur_ouch_Func002001003)), function Trig_blur_ouch_Func002A )
endfunction

//===========================================================================
function InitTrig_blur_ouch takes nothing returns nothing
    set gg_trg_blur_ouch = CreateTrigger(  )
    call TriggerRegisterEnterRectSimple( gg_trg_blur_ouch, GetPlayableMapRect() )
    call TriggerAddCondition( gg_trg_blur_ouch, Condition( function Trig_blur_ouch_Conditions ) )
    call TriggerAddAction( gg_trg_blur_ouch, function Trig_blur_ouch_Actions )
endfunction

//===========================================================================
