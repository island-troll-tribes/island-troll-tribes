
//===========================================================================
function Trig_enemy_radar_uber_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A03F' ) ) then
        return false
    endif
    return true
endfunction

function Trig_enemy_radar_uber_Func001Func001C takes nothing returns boolean
    if ( not ( IsPlayerEnemy(GetOwningPlayer(GetEnumUnit()), GetOwningPlayer(GetSpellAbilityUnit())) == true ) ) then
        return false
    endif
    if ( not ( IsUnitAliveBJ(GetEnumUnit()) == true ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetEnumUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_enemy_radar_uber_Func001Func002C takes nothing returns boolean
    if ( not ( IsPlayerEnemy(GetOwningPlayer(GetEnumUnit()), GetOwningPlayer(GetSpellAbilityUnit())) == true ) ) then
        return false
    endif
    if ( not ( IsUnitAliveBJ(GetEnumUnit()) == true ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetEnumUnit()) == UNIT_SPIRIT_WARD ) ) then
        return false
    endif
    return true
endfunction

function Trig_enemy_radar_uber_Func001A takes nothing returns nothing
    if ( Trig_enemy_radar_uber_Func001Func001C() ) then
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetUnitLoc(GetEnumUnit()), 5.00, bj_MINIMAPPINGSTYLE_ATTACK, 0.00, 0.00, 100 )
    else
    endif
    if ( Trig_enemy_radar_uber_Func001Func002C() ) then
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetUnitLoc(GetEnumUnit()), 5.00, bj_MINIMAPPINGSTYLE_SIMPLE, 20.00, 20.00, 100 )
    else
    endif
endfunction

function Trig_enemy_radar_uber_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsInRangeOfLocAll(10000.00, GetUnitLoc(GetSpellAbilityUnit())), function Trig_enemy_radar_uber_Func001A )
endfunction

//===========================================================================
function InitTrig_enemy_radar_uber takes nothing returns nothing
    set gg_trg_enemy_radar_uber = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_enemy_radar_uber, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_enemy_radar_uber, Condition( function Trig_enemy_radar_uber_Conditions ) )
    call TriggerAddAction( gg_trg_enemy_radar_uber, function Trig_enemy_radar_uber_Actions )
endfunction

//===========================================================================
