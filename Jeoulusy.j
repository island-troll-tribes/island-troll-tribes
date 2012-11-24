
//===========================================================================
//TESH.scrollpos=22
//TESH.alwaysfold=0
function Trig_jeoulusy_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A051' ) ) then
        return false
    endif
    return true
endfunction

function Trig_jeoulusy_Func002001003001 takes nothing returns boolean
    return ( GetFilterUnit() != udg_jelUnit )
endfunction

function Trig_jeoulusy_Func002001003002 takes nothing returns boolean
    return ( IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_jelUnit)) == true )
endfunction

function Trig_jeoulusy_Func002001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_jeoulusy_Func002001003001(), Trig_jeoulusy_Func002001003002() )
endfunction

function Trig_jeoulusy_Func002A takes nothing returns nothing
    call IssueTargetOrderBJ( GetEnumUnit(), "attack", udg_jelUnit )

endfunction

function jelTimer takes nothing returns nothing
    if ( UnitHasBuffBJ(udg_jelUnit, 'BHav') == true) then

    call ForGroupBJ( GetUnitsInRangeOfLocMatching(800.00, GetUnitLoc(udg_jelUnit), Condition(function Trig_jeoulusy_Func002001003)), function Trig_jeoulusy_Func002A )
    else
    call DestroyTimer(GetExpiredTimer())
    endif
endfunction

function jelousyFunc takes nothing returns nothing
    local timer t=CreateTimer()

    set udg_jelUnit=GetSpellTargetUnit()
    call PolledWait(.5)
    call TimerStart(t,0.2,true,function jelTimer)
    call PolledWait(60)
    call UnitRemoveBuffBJ( 'BHav', udg_jelUnit )

endfunction

//===========================================================================
function InitTrig_jeoulusy takes nothing returns nothing
    set gg_trg_jeoulusy = CreateTrigger(  )
 //   call TriggerRegisterAnyUnitEventBJ( gg_trg_jeoulusy, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_jeoulusy, Condition( function Trig_jeoulusy_Conditions ) )
    call TriggerAddAction( gg_trg_jeoulusy, function jelousyFunc )
endfunction

//===========================================================================
