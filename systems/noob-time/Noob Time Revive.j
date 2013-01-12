
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_noob_time_revive_Conditions takes nothing returns boolean
    return udg_NOOB_TIME and GetPlayerSlotState(GetOwningPlayer(GetDyingUnit())) == PLAYER_SLOT_STATE_PLAYING and checkTroll(GetDyingUnit())
endfunction

function Trig_noob_time_revive_Actions takes nothing returns nothing
    local unit u = GetDyingUnit()
    local player p = GetOwningPlayer(u)
    //call DisplayText(R2S(TimerGetElapsed(GAME_TIMER)))
    call PolledWait(9.5)
    if GetPlayerSlotState(GetOwningPlayer(u)) == PLAYER_SLOT_STATE_PLAYING then
        if udg_SIX_SIX then
            if IsUnitAlly(u, Player(0)) then
                call ReviveHero( u, GetRectCenterX(gg_rct_revive_1),GetRectCenterY(gg_rct_revive_1), false )
            endif
            if IsUnitAlly(u, Player(8)) then
                call ReviveHero( u, GetRectCenterX(gg_rct_revive_3),GetRectCenterY(gg_rct_revive_3), false )
            endif
        else
            if IsUnitAlly(u, Player(0)) then
                call ReviveHero( u, GetRectCenterX(gg_rct_revive_1),GetRectCenterY(gg_rct_revive_1), false )
            endif
            if IsUnitAlly(u, Player(4)) then
                call ReviveHero( u, GetRectCenterX(gg_rct_revive_2),GetRectCenterY(gg_rct_revive_2), false )
            endif
            if IsUnitAlly(u, Player(8)) then
                call ReviveHero( u, GetRectCenterX(gg_rct_revive_3),GetRectCenterY(gg_rct_revive_3), false )
            endif
        endif
        call SetPlayerState( p, PLAYER_STATE_RESOURCE_GOLD, udg_MAX_HEAT )
        if GetLocalPlayer() == p then
            // Use only local code (no net traffic) within this block to avoid desyncs.
            call PanCameraToTimed(GetUnitX(u), GetUnitY(u), 1)
        endif
    endif
    set u = null
endfunction

//===========================================================================
function InitTrig_noob_time_revive takes nothing returns nothing
    set gg_trg_noob_time_revive = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_noob_time_revive, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_noob_time_revive, Condition( function Trig_noob_time_revive_Conditions ) )
    call TriggerAddAction( gg_trg_noob_time_revive, function Trig_noob_time_revive_Actions )
endfunction
//===========================================================================
