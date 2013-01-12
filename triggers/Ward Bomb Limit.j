
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Ward_Bomb_Limit_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSummonedUnit()) == UNIT_LIVING_CLAY ) ) then
        return false
    endif
    return true
endfunction

function Trig_Ward_Bomb_Limit_Func001Func002001001 takes nothing returns boolean
    return ( GetFilterPlayer() == GetOwningPlayer(GetSummonedUnit()) )
endfunction

function Trig_Ward_Bomb_Limit_Func001Func005001001003 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == UNIT_LIVING_CLAY )
endfunction

function Trig_Ward_Bomb_Limit_Func001C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(GetUnitsInRangeOfLocMatching(500.00, GetUnitLoc(GetSummonedUnit()), Condition(function Trig_Ward_Bomb_Limit_Func001Func005001001003))) == 10 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Ward_Bomb_Limit_Actions takes nothing returns nothing
    if ( Trig_Ward_Bomb_Limit_Func001C() ) then
        call DisplayTextToForce( GetPlayersMatching(Condition(function Trig_Ward_Bomb_Limit_Func001Func002001001)), "Thanks for abusing Ward Bomb, you are the reason there is a limit." )
        call RemoveUnit( GetSummonedUnit() )
        call CreateItemLoc( UNIT_LIVING_CLAY, GetUnitLoc(GetSummonedUnit()) )
    else
        call DoNothing(  )
    endif
endfunction

//===========================================================================
function InitTrig_Ward_Bomb_Limit takes nothing returns nothing
    set gg_trg_Ward_Bomb_Limit = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Ward_Bomb_Limit, EVENT_PLAYER_UNIT_SUMMON )
    call TriggerAddCondition( gg_trg_Ward_Bomb_Limit, Condition( function Trig_Ward_Bomb_Limit_Conditions ) )
    call TriggerAddAction( gg_trg_Ward_Bomb_Limit, function Trig_Ward_Bomb_Limit_Actions )
endfunction //===========================================================================
