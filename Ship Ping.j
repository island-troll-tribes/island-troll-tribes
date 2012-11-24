
//===========================================================================
function Trig_ship_ping_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02Q' ) ) then
        return false
    endif
    return true
endfunction

function Trig_ship_ping_Func003001002001 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetSpellAbilityUnit())) == true )
endfunction

function Trig_ship_ping_Func003001002002 takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_TRANSPORT_SHIP )
endfunction

function Trig_ship_ping_Func003001002 takes nothing returns boolean
    return GetBooleanAnd( Trig_ship_ping_Func003001002001(), Trig_ship_ping_Func003001002002() )
endfunction

function Trig_ship_ping_Func003A takes nothing returns nothing
    call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetUnitLoc(GetEnumUnit()), 7.00, bj_MINIMAPPINGSTYLE_ATTACK, 100.00, 100.00, 100.00 )
endfunction

function Trig_ship_ping_Actions takes nothing returns nothing
    call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetUnitLoc(udg_ship), 7.00, bj_MINIMAPPINGSTYLE_FLASHY, 100.00, 100.00, 100.00 )
    call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetUnitLoc(udg_ship2), 7.00, bj_MINIMAPPINGSTYLE_FLASHY, 100.00, 100.00, 100.00 )
    call ForGroupBJ( GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_ship_ping_Func003001002)), function Trig_ship_ping_Func003A )
endfunction

//===========================================================================
function InitTrig_ship_ping takes nothing returns nothing
    set gg_trg_ship_ping = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ship_ping, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_ship_ping, Condition( function Trig_ship_ping_Conditions ) )
    call TriggerAddAction( gg_trg_ship_ping, function Trig_ship_ping_Actions )
endfunction

//===========================================================================
