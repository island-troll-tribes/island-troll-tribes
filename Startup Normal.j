
//
// setUpSkillTriggers
//===========================================================================
//TESH.scrollpos=170
//TESH.alwaysfold=0
function Trig_Startup_Normal_Func002Func002Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_Normal_Func002Func003Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_Normal_Func002Func004Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_Normal_Func002C takes nothing returns boolean
    if ( not ( udg_CLASSIC_MODE == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_Normal_Func003Func001Func001001 takes nothing returns boolean
    return ( GetPlayerSlotState(ConvertedPlayer(( GetForLoopIndexB() + 1 ))) != PLAYER_SLOT_STATE_PLAYING )
endfunction

function Trig_Startup_Normal_Func003Func002Func001C takes nothing returns boolean
    if ( not ( udg_started[( GetForLoopIndexA() - 1 )] == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_Normal_Func003Func003Func001C takes nothing returns boolean
    if ( not ( udg_started[( GetForLoopIndexA() - 1 )] == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_Normal_Func003Func004Func001C takes nothing returns boolean
    if ( not ( udg_started[( GetForLoopIndexA() - 1 )] == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_Normal_Func003Func005Func001Func002C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_HERO_PICKER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetEnumUnit()) == UNIT_TROLL_TOTEM ) ) then
        return true
    endif
    return false
endfunction

function Trig_Startup_Normal_Func003Func005Func001C takes nothing returns boolean
    if ( not Trig_Startup_Normal_Func003Func005Func001Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_Normal_Func003Func005A takes nothing returns nothing
    if ( Trig_Startup_Normal_Func003Func005Func001C() ) then
        call RemoveUnit( GetEnumUnit() )
    else
    endif
endfunction

function Trig_Startup_Normal_Func003Func006Func001C takes nothing returns boolean
    if ( not ( udg_started[( GetForLoopIndexA() - 1 )] == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_Normal_Func003C takes nothing returns boolean
    if ( not ( udg_CLASSIC_MODE == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_Startup_Normal_Actions takes nothing returns nothing
    local unit u
    if ( Trig_Startup_Normal_Func002C() ) then
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 4
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            if ( Trig_Startup_Normal_Func002Func002Func001C() ) then
                set u=CreateUnitAtLoc(ConvertedPlayer(GetForLoopIndexA()),UNIT_ISLAND_TROLL, GetRandomLocInRect(gg_rct_team1selector), bj_UNIT_FACING )
                call SuspendHeroXPBJ( false, u )
                set udg_PUnits[( GetConvertedPlayerId(GetOwningPlayer(u)) - 1 )] = u
                call GroupAddUnitSimple( u, udg_trolls )
                call ModifyHeroSkillPoints( u, bj_MODIFYMETHOD_SET, 0 )
                call SetPlayerStateBJ( ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_GOLD, udg_MAX_HEAT )
            else
            endif
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        set bj_forLoopAIndex = 5
        set bj_forLoopAIndexEnd = 8
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            if ( Trig_Startup_Normal_Func002Func003Func001C() ) then
                set u=CreateUnitAtLoc(ConvertedPlayer(GetForLoopIndexA()),UNIT_ISLAND_TROLL, GetRandomLocInRect(gg_rct_team2selector), bj_UNIT_FACING )
                set udg_PUnits[( GetConvertedPlayerId(GetOwningPlayer(u)) - 1 )] = u
                call GroupAddUnitSimple( u, udg_trolls )
                call SuspendHeroXPBJ( false, u )
                call ModifyHeroSkillPoints( u, bj_MODIFYMETHOD_SET, 0 )
                call SetPlayerStateBJ( ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_GOLD, udg_MAX_HEAT )
            else
            endif
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        set bj_forLoopAIndex = 9
        set bj_forLoopAIndexEnd = 12
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            if ( Trig_Startup_Normal_Func002Func004Func001C() ) then
                set u=CreateUnitAtLoc(ConvertedPlayer(GetForLoopIndexA()),UNIT_ISLAND_TROLL, GetRandomLocInRect(gg_rct_team3selector), bj_UNIT_FACING )
                set udg_PUnits[( GetConvertedPlayerId(GetOwningPlayer(u)) - 1 )] = u
                call SuspendHeroXPBJ( false, u )
                call GroupAddUnitSimple( u, udg_trolls )
                call ModifyHeroSkillPoints( u, bj_MODIFYMETHOD_SET, 0 )
                call SetPlayerStateBJ( ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_GOLD, udg_MAX_HEAT )
            else
            endif
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
    else
    endif
    if ( Trig_Startup_Normal_Func003C() ) then
        set bj_forLoopBIndex = 0
        set bj_forLoopBIndexEnd = 11
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            if ( Trig_Startup_Normal_Func003Func001Func001001() ) then
                set udg_started[GetForLoopIndexB()] = true
            else
                call DoNothing(  )
            endif
            set bj_forLoopBIndex = bj_forLoopBIndex + 1
        endloop
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 4
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            if ( Trig_Startup_Normal_Func003Func002Func001C() ) then
                set u=getRandomTroll(ConvertedPlayer(GetForLoopIndexA()),GetRandomX(gg_rct_team1selector),GetRandomY(gg_rct_team1selector))
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
        set bj_forLoopAIndex = 5
        set bj_forLoopAIndexEnd = 8
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            if ( Trig_Startup_Normal_Func003Func003Func001C() ) then
                set u=getRandomTroll(ConvertedPlayer(GetForLoopIndexA()),GetRandomX(gg_rct_team2selector),GetRandomY(gg_rct_team2selector))
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
        set bj_forLoopAIndex = 9
        set bj_forLoopAIndexEnd = 12
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            if ( Trig_Startup_Normal_Func003Func004Func001C() ) then
                set u=getRandomTroll(ConvertedPlayer(GetForLoopIndexA()),GetRandomX(gg_rct_team3selector),GetRandomY(gg_rct_team3selector))
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
        call ForGroupBJ( GetUnitsInRectAll(GetPlayableMapRect()), function Trig_Startup_Normal_Func003Func005A )
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 12
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            if ( Trig_Startup_Normal_Func003Func006Func001C() ) then
                call setUpSkillTriggers(getPlayersTroll(Player(GetForLoopIndexA() - 1)))
            else
            endif
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
    else
    endif
endfunction

//===========================================================================
function InitTrig_Startup_Normal takes nothing returns nothing
    set gg_trg_Startup_Normal = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Startup_Normal, function Trig_Startup_Normal_Actions )
endfunction

//===========================================================================
