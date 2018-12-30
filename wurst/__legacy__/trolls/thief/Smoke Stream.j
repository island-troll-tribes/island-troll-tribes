
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Smoke_Stream_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A04E' ) ) then
        return false
    endif
    return true
endfunction

function smokeStreamCast takes nothing returns nothing
if(GetUnitCurrentOrder(udg_smokeStreamer) != String2OrderIdBJ("")) then
call masterCastAtTarget(udg_smokeStreamer,udg_smokeStreamer,0,0,'A032',"cloudoffog")
else
    call DisplayTextToForce( GetPlayersAll(), OrderId2StringBJ(GetUnitCurrentOrder(udg_smokeStreamer)) )
endif
endfunction

function Trig_Smoke_Stream_Actions takes nothing returns nothing
local timer t
set t=CreateTimerBJ(true,.5)
set udg_smokeStreamer=GetSpellAbilityUnit()
call TimerStart(t,.50,true,function smokeStreamCast)
call PolledWait(4)
call DestroyTimer(t)
endfunction

//===========================================================================
function InitTrig_Smoke_Stream takes nothing returns nothing
    set gg_trg_Smoke_Stream = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Smoke_Stream, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
    call TriggerAddCondition( gg_trg_Smoke_Stream, Condition( function Trig_Smoke_Stream_Conditions ) )
    call TriggerAddAction( gg_trg_Smoke_Stream, function Trig_Smoke_Stream_Actions )
endfunction

//===========================================================================
