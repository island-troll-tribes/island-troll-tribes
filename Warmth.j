
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_warmth_Func001A takes nothing returns nothing
    local player p = GetOwningPlayer(GetEnumUnit())
    local integer i = GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)
    set udg_parameterUnit = GetEnumUnit()
    call countHeat()
    if(GetTimeOfDay()>=6 and GetTimeOfDay()<=18) then
       set udg_integerParameter=udg_integerParameter+3
    endif
    if(UnitHasBuffBJ(GetEnumUnit(), 'BOae') == true ) then//glowed
       set udg_integerParameter=udg_integerParameter+2
    endif
    if((i + udg_integerParameter)<=udg_MAX_HEAT) then
       call SetPlayerStateBJ(p, PLAYER_STATE_RESOURCE_GOLD, i + udg_integerParameter )
    else
       call SetPlayerStateBJ(p, PLAYER_STATE_RESOURCE_GOLD, udg_MAX_HEAT )
    endif
endfunction

function Trig_warmth_Actions takes nothing returns nothing
    call ForGroupBJ( udg_trolls, function Trig_warmth_Func001A )
endfunction

//===========================================================================
function InitTrig_warmth takes nothing returns nothing
    set gg_trg_warmth = CreateTrigger(  )

    call TriggerAddAction( gg_trg_warmth, function Trig_warmth_Actions )
endfunction

//===========================================================================
