
function Trig_enemy_radar_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A02T' or GetSpellAbilityId() == 'A07U'
endfunction

function Trig_enemy_radar_Func001Func001C takes nothing returns boolean
    if ( not ( IsPlayerEnemy(GetOwningPlayer(GetEnumUnit()), GetOwningPlayer(GetSpellAbilityUnit())) == true ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetEnumUnit()) != UNIT_HAWK ) ) then
        return false
    endif
    if ( not ( IsUnitAliveBJ(GetEnumUnit()) == true ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetEnumUnit()) != UNIT_FISH ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetEnumUnit()) != UNIT_GREEN_FISH ) ) then
        return false
    endif
    return true
endfunction

function Trig_enemy_radar_Func001A takes nothing returns nothing
    if Trig_enemy_radar_Func001Func001C() then
        if EnumUnitIsElk() then
            call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetUnitLoc(GetEnumUnit()), 3.00, bj_MINIMAPPINGSTYLE_SIMPLE, 20.00, 20.00, 100 )
        else
            call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(GetSpellAbilityUnit())), GetUnitLoc(GetEnumUnit()), 5.00, bj_MINIMAPPINGSTYLE_ATTACK, 0.00, 0.00, 100 )
        endif
    endif
endfunction

function Trig_enemy_radar_Actions takes nothing returns nothing
    local real r=3000.00
    if(UnitHasBuffBJ(GetSpellAbilityUnit(), 'BHbd') == true ) then
        set r=4500.00
    endif
    call ForGroupBJ( GetUnitsInRangeOfLocAll(r, GetUnitLoc(GetSpellAbilityUnit())), function Trig_enemy_radar_Func001A )
endfunction

function InitTrig_enemy_radar takes nothing returns nothing
    set gg_trg_enemy_radar = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_enemy_radar, Condition( function Trig_enemy_radar_Conditions ) )
    call TriggerAddAction( gg_trg_enemy_radar, function Trig_enemy_radar_Actions )
endfunction

