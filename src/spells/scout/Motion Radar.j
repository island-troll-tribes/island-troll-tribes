
//===========================================================================
//TESH.scrollpos=114
//TESH.alwaysfold=0
function Trig_Motion_Radar_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A055' or GetSpellAbilityId() == 'A071') ) then
        return false
    endif
    return true
endfunction


function condF5 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function condF4 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false )
endfunction

function condF2 takes nothing returns boolean
    return GetBooleanAnd( condF4(), condF5() )
endfunction

function condF3 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetSpellAbilityUnit())) == true )
endfunction

function enemyPick takes nothing returns boolean
    return GetBooleanAnd( condF2(), condF3() )
endfunction



function isMoving takes unit u returns boolean
    if ( ( GetUnitCurrentOrder(u) == String2OrderIdBJ("move") ) ) then
        return true
    endif
    if ( ( GetUnitCurrentOrder(u) == String2OrderIdBJ("attack") ) ) then
        return true
    endif
    if ( ( GetUnitCurrentOrder(u) == String2OrderIdBJ("smart") ) ) then
        return true
    endif

    return false
endfunction

function Trig_Motion_Radar_Actions takes nothing returns nothing
    local group temp=CreateGroup()
    local group r
    local unit c=GetSpellAbilityUnit()
    local unit u
    if(UnitHasBuffBJ(GetSpellAbilityUnit(), 'BHbd') == true ) then
        if(GetSpellAbilityId() == 'A071') then
        set r = GetUnitsInRangeOfLocMatching(7000, GetUnitLoc(c), Condition(function enemyPick))
        else
        set r = GetUnitsInRangeOfLocMatching(( 4000.00 + ( 1000.00 * I2R(GetUnitAbilityLevelSwapped('A055', c)) ) ), GetUnitLoc(c), Condition(function enemyPick))
        endif
    else
    if(GetSpellAbilityId() == 'A071') then
    set r = GetUnitsInRangeOfLocMatching(5000, GetUnitLoc(c), Condition(function enemyPick))
    else
    set r = GetUnitsInRangeOfLocMatching(( 2000.00 + ( 1000.00 * I2R(GetUnitAbilityLevelSwapped('A055', c)) ) ), GetUnitLoc(c), Condition(function enemyPick))
    endif
    endif
    call GroupAddGroup( r, temp )
    call GroupClear( r )
loop
    set u = FirstOfGroup(temp)
    exitwhen u == null

    if(isMoving(u)) then
        call GroupAddUnit(r,u)
    endif
    call GroupRemoveUnit(temp, u)
endloop
    call PolledWait(1)
    call GroupAddGroup( r, temp )
    call GroupClear( r )
loop
    set u = FirstOfGroup(temp)
    exitwhen u == null

    if(isMoving(u) or (GetRandomInt(1,2)==1)) then
        call GroupAddUnit(r,u)
    endif
    call GroupRemoveUnit(temp, u)
endloop
    call PolledWait(1)
    call GroupAddGroup( r, temp )
    call GroupClear( r )
loop
    set u = FirstOfGroup(temp)
    exitwhen u == null

    if(isMoving(u) or (GetRandomInt(1,2)==1)) then
        call GroupAddUnit(r,u)
    endif
    call GroupRemoveUnit(temp, u)
endloop
    call PolledWait(1)
    call GroupAddGroup( r, temp )
    call GroupClear( r )
loop
    set u = FirstOfGroup(temp)
    exitwhen u == null

    if(isMoving(u) or (GetRandomInt(1,2)==1)) then
        call GroupAddUnit(r,u)
    endif
    call GroupRemoveUnit(temp, u)
endloop

    call GroupAddGroup( r, temp )
    call GroupClear( r )
loop//actual pinging
    set u = FirstOfGroup(temp)
    exitwhen u == null

    if(GetUnitTypeId(u) == UNIT_ELK) then
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(c)), GetUnitLoc(u), 3.00, bj_MINIMAPPINGSTYLE_FLASHY, 0, 0, 100 )
    elseif(IsUnitType(u, UNIT_TYPE_MECHANICAL)) then
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(c)), GetUnitLoc(u), 3.00, bj_MINIMAPPINGSTYLE_FLASHY, 100, 100, 100 )
    elseif(IsUnitType(u, UNIT_TYPE_FLYING)) then
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(c)), GetUnitLoc(u), 3.00, bj_MINIMAPPINGSTYLE_FLASHY, 100, 80, 40 )
    elseif(IsUnitTroll(u)) then
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(c)), GetUnitLoc(u), 5.00, bj_MINIMAPPINGSTYLE_ATTACK, 100, 0, 0 )
    elseif(GetUnitTypeId(u) == UNIT_FISH or GetUnitTypeId(u) == UNIT_GREEN_FISH) then
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(c)), GetUnitLoc(u), 3.00, bj_MINIMAPPINGSTYLE_FLASHY, 40, 40, 100 )
    else
        call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(c)), GetUnitLoc(u), 3.00, bj_MINIMAPPINGSTYLE_FLASHY, 70, 10, 10 )
    endif

    call GroupRemoveUnit(temp, u)
endloop
endfunction

//===========================================================================
function InitTrig_Motion_Radar takes nothing returns nothing
    set gg_trg_Motion_Radar = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_Motion_Radar, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Motion_Radar, Condition( function Trig_Motion_Radar_Conditions ) )
    call TriggerAddAction( gg_trg_Motion_Radar, function Trig_Motion_Radar_Actions )
endfunction

//===========================================================================
