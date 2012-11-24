
//===========================================================================
//TESH.scrollpos=4
//TESH.alwaysfold=0
function Trig_Attraction_Aura_Func001001002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == UNIT_BEAST_MASTER )
endfunction

function Trig_Attraction_Aura_Func001001002002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == UNIT_TRUE_FORM )
endfunction

function Trig_Attraction_Aura_Func001001002 takes nothing returns boolean
    return GetBooleanOr( Trig_Attraction_Aura_Func001001002001(), Trig_Attraction_Aura_Func001001002002() )
endfunction

function Trig_Attraction_Aura_Func001Func001001001003 takes nothing returns boolean
    return ( GetOwningPlayer(GetFilterUnit()) == Player(PLAYER_NEUTRAL_AGGRESSIVE) )
endfunction

function Trig_Attraction_Aura_Func001A takes nothing returns nothing
    call IssuePointOrderLocBJ( GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(1000.00, GetUnitLoc(GetEnumUnit()), Condition(function Trig_Attraction_Aura_Func001Func001001001003))), "attack", GetUnitLoc(GetEnumUnit()) )
endfunction

function Trig_Attraction_Aura_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_Attraction_Aura_Func001001002)), function Trig_Attraction_Aura_Func001A )
endfunction

//===========================================================================
function InitTrig_Attraction_Aura takes nothing returns nothing
    set gg_trg_Attraction_Aura = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_Attraction_Aura, 35.00 )
    call TriggerAddAction( gg_trg_Attraction_Aura, function Trig_Attraction_Aura_Actions )
endfunction//===========================================================================
