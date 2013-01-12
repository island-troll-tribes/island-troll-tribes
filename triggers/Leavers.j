
//
// call CreateCorpseLocBJ( UNIT_FOOTMAN, Player(PLAYER_NEUTRAL_AGGRESSIVE), GetUnitLoc(GetEnumUnit()) )
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function RemoveUnitHeroIcon takes nothing returns nothing
    call RemoveUnit(udg_PUnits[GetTimerData(GetExpiredTimer())])
    call ReleaseTimer(GetExpiredTimer())
endfunction

function KillAndCorpseDrop takes nothing returns nothing
    local unit u = GetEnumUnit()
    local player p = GetTriggerPlayer()
    local real x = GetUnitX(u)
    local real y = GetUnitY(u)
    local timer t
    if GetOwningPlayer(u) == p then
        call GroupRemoveUnit(udg_trolls, u)
        call KillUnit(u)
        call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
        call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
        call CreateCorpse(Player(12), UNIT_MEAT, x, y, GetRandomReal(0,360) )
        set t = NewTimer()
        call SetTimerData(t, GetPlayerId(p))
        call TimerStart(t, 10, false, function RemoveUnitHeroIcon )
    endif
    set u = null
endfunction

function Trig_leavers_Actions takes nothing returns nothing
    local integer PID = GetPlayerId(GetTriggerPlayer())
    call ForGroup( udg_trolls, function KillAndCorpseDrop )
    call DisplayText(GENERAL_COLOR+GetPlayerName(GetTriggerPlayer())+GRAY_COLOR+" ["+COLOR_CODE[PID]+udg_RealNames[PID]+GRAY_COLOR+"]"+GENERAL_COLOR+" has left the game."+GRAY_COLOR+" (Player "+I2S(PID+1)+")|r")
    //if udg_SIX_SIX then
    //    call ConditionalTriggerExecute( gg_trg_check_win_6v6 )
    //else
    call ConditionalTriggerExecute( gg_trg_check_win )
    //endif
    call ConditionalTriggerExecute( gg_trg_update_names )
    set tempInt = PID
    if not adv_control[PID] then
        call ForForce(TEAM[TEAM_PLAYER[PID]], function ShareAdvControl)
        set adv_control[PID] = true
    endif
    set tempInt = PID
    if not shr_control[PID] then
        call ForForce(TEAM[TEAM_PLAYER[PID]], function ShareControl)
        set shr_control[PID] = true
    endif
    set tempInt = PID
    if not vision_pub[PID] then
        call ForForce(TEAM[TEAM_PLAYER[PID]], function PublicVision)
        set vision_pub[PID] = true
    endif
endfunction

//===========================================================================
function InitTrig_leavers takes nothing returns nothing
    local integer i = 0
    set gg_trg_leavers = CreateTrigger(  )
    loop
        exitwhen i > 11
        call TriggerRegisterPlayerEvent(gg_trg_leavers, Player(i), EVENT_PLAYER_LEAVE)
        set i = i + 1
    endloop
    call TriggerAddAction( gg_trg_leavers, function Trig_leavers_Actions )
endfunction
//===========================================================================
