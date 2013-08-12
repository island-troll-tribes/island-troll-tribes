
function Trig_ship_ping_Func003001002 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_TRANSPORT_SHIP and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetSpellAbilityUnit())) or FilterUnitIsTradeShip()
endfunction

function Trig_ship_ping_Func003A takes nothing returns nothing
    call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetUnitLoc(GetEnumUnit()), 7.00, IntegerTertiaryOp(GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_TRANSPORT_SHIP, bj_MINIMAPPINGSTYLE_FLASHY, bj_MINIMAPPINGSTYLE_ATTACK), 100.00, 100.00, 100.00 )
endfunction

function Trig_ship_ping_Conditions takes nothing returns boolean
    if GetSpellAbilityId() != SPELL_SONAR_COMPASS then
        return false
    endif
    call ForGroupBJ( GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_ship_ping_Func003001002)), function Trig_ship_ping_Func003A )
    return false
endfunction

function InitTrig_ship_ping takes nothing returns nothing
    set gg_trg_ship_ping = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ship_ping, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_ship_ping, Condition( function Trig_ship_ping_Conditions ) )
endfunction

