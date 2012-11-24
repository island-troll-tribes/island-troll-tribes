
//
//  //return ((IsPlayerAlly(GetOwningPlayer(GetEnumUnit()), GetOwningPlayer(GetSpellAbilityUnit()))==false) and (GetEnumUnit()!=udg_parameterUnit))
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
function Trig_metronome_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A01Z' ) ) then
        return false
    endif
    return true
endfunction

function checkTarget takes nothing returns boolean
    if(IsPlayerAlly(GetOwningPlayer(GetEnumUnit()), GetOwningPlayer(GetSpellAbilityUnit()))) then
        return false
    endif
    if(GetEnumUnit()==udg_parameterUnit) then
        return false
    endif
    return true
endfunction

function Trig_metronome_Actions takes nothing returns nothing
    local unit u=GetSpellTargetUnit()
    local unit q=GetSpellAbilityUnit()
    local unit temp
    local integer i=GetRandomInt(1,2)
    local integer start=1
    local integer end
    local integer index



    if(i==1) then
        set end=9
        set index=GetRandomInt(0,9)
        call masterCastAtTarget(q,u,200,200,udg_spells[index],udg_spellStrings[index])
        call PolledWait( 0.50 )
        set temp=u
        set udg_parameterUnit=u
        loop
            exitwhen start>end

            set temp=GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(3000,GetUnitLoc(temp),Condition(function checkTarget)))
            set udg_parameterUnit=temp
            call PolledWait( 0.50 )
            set index=GetRandomInt(0,9)
            call masterCastAtTarget(q,u,800,800,udg_spells[index],udg_spellStrings[index])
            set start=start+1
        endloop
    elseif(i==2) then
        call masterCastAtTarget(q,u,200,200,'A02B',"frostnova")
    endif
endfunction

//===========================================================================
function InitTrig_metronome takes nothing returns nothing
    set gg_trg_metronome = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_metronome, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_metronome, Condition( function Trig_metronome_Conditions ) )
    call TriggerAddAction( gg_trg_metronome, function Trig_metronome_Actions )
endfunction

//===========================================================================
