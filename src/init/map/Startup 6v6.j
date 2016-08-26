
function Trig_Startup_6v6_Func002Func002Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_6v6_Func002Func003Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_6v6_Func003Func001Func001001 takes nothing returns boolean
    return ( GetPlayerSlotState(ConvertedPlayer(( GetForLoopIndexB() + 1 ))) != PLAYER_SLOT_STATE_PLAYING )
endfunction

function Trig_Startup_6v6_Func003Func002Func001C takes nothing returns boolean
    if ( not ( udg_started[( GetForLoopIndexA() - 1 )] == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_6v6_Func003Func003Func001C takes nothing returns boolean
    if ( not ( udg_started[( GetForLoopIndexA() - 1 )] == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_6v6_Func003Func004Func001Func002C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_HERO_PICKER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_TOTEM ) ) then
        return true
    endif
    return false
endfunction

function Trig_Startup_6v6_Func003Func004Func001C takes nothing returns boolean
    if ( not Trig_Startup_6v6_Func003Func004Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_6v6_Func003Func004A takes nothing returns nothing
    if ( Trig_Startup_6v6_Func003Func004Func001C() ) then
        call RemoveUnit( GetEnumUnit() )
    else
    endif
endfunction

function Trig_Startup_6v6_Func003Func005Func001C takes nothing returns boolean
    if ( not ( udg_started[( GetForLoopIndexA() - 1 )] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_6v6_Actions takes nothing returns nothing
    local unit u
    set bj_forLoopBIndex = 0
    set bj_forLoopBIndexEnd = 11
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        if ( Trig_Startup_6v6_Func003Func001Func001001() ) then
            set udg_started[GetForLoopIndexB()] = true
        else
            call DoNothing(  )
        endif
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 6
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( Trig_Startup_6v6_Func003Func002Func001C() ) then
            set u=getRandomTroll(ConvertedPlayer(GetForLoopIndexA()),GetRandomX(gg_rct_revive_1),GetRandomY(gg_rct_revive_1))
            set udg_PUnits[( GetConvertedPlayerId(GetOwningPlayer(u)) - 1 )] = u
            call SuspendHeroXPBJ( false, u )
            call GroupAddUnitSimple( u, udg_trolls )
            call ModifyHeroSkillPoints( u, bj_MODIFYMETHOD_SET, 0 )
            set udg_started[( GetForLoopIndexA() - 1 )] = true
            call SetPlayerStateBJ( ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_GOLD, udg_MAX_HEAT )
        else
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 7
    set bj_forLoopAIndexEnd = 12
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( Trig_Startup_6v6_Func003Func003Func001C() ) then
            set u=getRandomTroll(ConvertedPlayer(GetForLoopIndexA()),GetRandomX(gg_rct_revive_3),GetRandomY(gg_rct_revive_3))
            set udg_PUnits[( GetConvertedPlayerId(GetOwningPlayer(u)) - 1 )] = u
            call SuspendHeroXPBJ( false, u )
            call GroupAddUnitSimple( u, udg_trolls )
            call ModifyHeroSkillPoints( u, bj_MODIFYMETHOD_SET, 0 )
            set udg_started[( GetForLoopIndexA() - 1 )] = true
            call SetPlayerStateBJ( ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_GOLD, udg_MAX_HEAT )
        else
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call ForGroupBJ( GetUnitsInRectAll(GetPlayableMapRect()), function Trig_Startup_6v6_Func003Func004A )
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 12
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( Trig_Startup_6v6_Func003Func005Func001C() ) then
            call setUpSkillTriggers(getPlayersTroll(Player(GetForLoopIndexA() - 1)))
        else
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction

//===========================================================================
function InitTrig_Startup_6v6 takes nothing returns nothing
    set gg_trg_Startup_6v6 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Startup_6v6, function Trig_Startup_6v6_Actions )
endfunction

//===========================================================================
