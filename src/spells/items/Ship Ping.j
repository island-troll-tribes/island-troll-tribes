
function Trig_ship_ping_Func003001002 takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_TROLL_TRANSPORT_SHIP and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetSpellAbilityUnit()))
endfunction

function Trig_ship_ping_Func003A takes nothing returns nothing
    call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetUnitLoc(GetEnumUnit()), 7.00, bj_MINIMAPPINGSTYLE_ATTACK, 100.00, 100.00, 100.00 )
endfunction

function Trig_ship_ping_Conditions takes nothing returns boolean
    if GetSpellAbilityId() != 'A02Q' then
        return false
    endif
    call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetUnitLoc(udg_ship), 7.00, bj_MINIMAPPINGSTYLE_FLASHY, 100.00, 100.00, 100.00 )
    call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetUnitLoc(udg_ship2), 7.00, bj_MINIMAPPINGSTYLE_FLASHY, 100.00, 100.00, 100.00 )
    call ForGroupBJ( GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_ship_ping_Func003001002)), function Trig_ship_ping_Func003A )
    return false
endfunction

function InitTrig_ship_ping takes nothing returns nothing
    set gg_trg_ship_ping = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ship_ping, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_ship_ping, Condition( function Trig_ship_ping_Conditions ) )
endfunction

