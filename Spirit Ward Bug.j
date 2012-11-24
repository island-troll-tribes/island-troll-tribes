
//===========================================================================
function Trig_Spirit_Ward_Bug_Func002Func001Func001001001002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true )
endfunction

function Trig_Spirit_Ward_Bug_Func002Func001Func002001001001002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true )
endfunction

function Trig_Spirit_Ward_Bug_Func002Func001C takes nothing returns boolean
    if ( not ( IsUnitDeadBJ(GroupPickRandomUnit(GetUnitsOfPlayerMatching(GetTriggerPlayer(), Condition(function Trig_Spirit_Ward_Bug_Func002Func001Func002001001001002)))) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Spirit_Ward_Bug_Func002Func002Func001002001001001 takes nothing returns boolean
    return ( IsPlayerAlly(GetFilterPlayer(), GetTriggerPlayer()) == true )
endfunction

function Trig_Spirit_Ward_Bug_Func002Func002Func001002001001002 takes nothing returns boolean
    return ( GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING )
endfunction

function Trig_Spirit_Ward_Bug_Func002Func002Func001002001001 takes nothing returns boolean
    return GetBooleanAnd( Trig_Spirit_Ward_Bug_Func002Func002Func001002001001001(), Trig_Spirit_Ward_Bug_Func002Func002Func001002001001002() )
endfunction

function Trig_Spirit_Ward_Bug_Func002Func002A takes nothing returns nothing
    call SetUnitOwner( GetEnumUnit(), ForcePickRandomPlayer(GetPlayersMatching(Condition(function Trig_Spirit_Ward_Bug_Func002Func002Func001002001001))), true )
endfunction

function Trig_Spirit_Ward_Bug_Func002C takes nothing returns boolean
    if ( not ( CountUnitsInGroup(udg_Ward_UnitGroup) >= 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Spirit_Ward_Bug_Actions takes nothing returns nothing
    set udg_Ward_UnitGroup = GetUnitsOfPlayerAndTypeId(GetTriggerPlayer(), UNIT_SPIRIT_WARD)
    if ( Trig_Spirit_Ward_Bug_Func002C() ) then
        if ( Trig_Spirit_Ward_Bug_Func002Func001C() ) then
            call RemoveUnit( GroupPickRandomUnit(GetUnitsOfPlayerMatching(GetTriggerPlayer(), Condition(function Trig_Spirit_Ward_Bug_Func002Func001Func001001001002))) )
        else
        endif
        call ForGroupBJ( udg_Ward_UnitGroup, function Trig_Spirit_Ward_Bug_Func002Func002A )
    else
    endif
    call DestroyGroup (udg_Ward_UnitGroup)
endfunction

//===========================================================================
function InitTrig_Spirit_Ward_Bug takes nothing returns nothing
    set gg_trg_Spirit_Ward_Bug = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Spirit_Ward_Bug, function Trig_Spirit_Ward_Bug_Actions )
endfunction

//===========================================================================
