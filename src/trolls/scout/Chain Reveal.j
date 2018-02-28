
//===========================================================================
//TESH.scrollpos=6
//TESH.alwaysfold=0
function Trig_Chain_Reveal_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A073' ) ) then
        return false
    endif
    return true
endfunction


function checkChainReveal takes nothing returns boolean
    return ((GetFilterUnit() != udg_parameterUnit) and (IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_parameterUnit2))) and GetConvertedPlayerId(GetFilterPlayer()) < bj_MAX_PLAYERS)
endfunction

function Trig_Chain_Reveal_Func001A takes nothing returns nothing
    call masterCastAreaTarget(GetSpellAbilityUnit(),GetUnitX(GetEnumUnit()),GetUnitY(GetEnumUnit()),'A01R',"farsight")
endfunction

function Trig_Chain_Reveal_Actions takes nothing returns nothing
    local unit q=GetSpellAbilityUnit()
    local unit u=q
    call ForGroupBJ( GetUnitsOfPlayerAndTypeId(GetOwningPlayer(GetSpellAbilityUnit()), UNIT_LIVING_CLAY), function Trig_Chain_Reveal_Func001A )
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = ( 2 + GetUnitAbilityLevelSwapped('A073', q) )
    loop
        set udg_parameterUnit=u
        set udg_parameterUnit2=q
        set u = GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(2700.00, GetUnitLoc(u), Condition(function checkChainReveal)))
        exitwhen (bj_forLoopAIndex > bj_forLoopAIndexEnd) or (u==null)
        call masterCastAreaTarget(q,GetUnitX(u),GetUnitY(u),'A053',"farsight")
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
        call PolledWait(.5)
    endloop
endfunction

//===========================================================================
function InitTrig_Chain_Reveal takes nothing returns nothing
    set gg_trg_Chain_Reveal = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Chain_Reveal, Condition( function Trig_Chain_Reveal_Conditions ) )
    call TriggerAddAction( gg_trg_Chain_Reveal, function Trig_Chain_Reveal_Actions )
endfunction

//===========================================================================
