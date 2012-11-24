
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Leaver_Gold_Dist_Conditions takes nothing returns boolean
    if ( not ( GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) > 10 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func001Func001Func002Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    if ( not ( ConvertedPlayer(GetForLoopIndexA()) != GetTriggerPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func001Func001Func003Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    if ( not ( ConvertedPlayer(GetForLoopIndexA()) != GetTriggerPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func001Func001Func006Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    if ( not ( ConvertedPlayer(GetForLoopIndexA()) != GetTriggerPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func001Func001Func007Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    if ( not ( ConvertedPlayer(GetForLoopIndexA()) != GetTriggerPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func001Func001C takes nothing returns boolean
    if ( not ( GetConvertedPlayerId(GetTriggerPlayer()) <= 8 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func001Func003Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    if ( not ( ConvertedPlayer(GetForLoopIndexA()) != GetTriggerPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func001Func004Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    if ( not ( ConvertedPlayer(GetForLoopIndexA()) != GetTriggerPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func001C takes nothing returns boolean
    if ( not ( GetConvertedPlayerId(GetTriggerPlayer()) <= 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func002Func002Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    if ( not ( ConvertedPlayer(GetForLoopIndexA()) != GetTriggerPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func002Func003Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    if ( not ( ConvertedPlayer(GetForLoopIndexA()) != GetTriggerPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func002Func006Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    if ( not ( ConvertedPlayer(GetForLoopIndexA()) != GetTriggerPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func002Func007Func001C takes nothing returns boolean
    if ( not ( GetPlayerSlotState(ConvertedPlayer(GetForLoopIndexA())) == PLAYER_SLOT_STATE_PLAYING ) ) then
        return false
    endif
    if ( not ( ConvertedPlayer(GetForLoopIndexA()) != GetTriggerPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002Func002C takes nothing returns boolean
    if ( not ( GetConvertedPlayerId(GetTriggerPlayer()) <= 6 ) ) then
        return false
    endif
    if ( not ( ConvertedPlayer(GetForLoopIndexA()) != GetTriggerPlayer() ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Func002C takes nothing returns boolean
    if ( not ( udg_SIX_SIX == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Leaver_Gold_Dist_Actions takes nothing returns nothing
    set udg_Temp = 0
    if ( Trig_Leaver_Gold_Dist_Func002C() ) then
        if ( Trig_Leaver_Gold_Dist_Func002Func002C() ) then
            // 6v6, Team 1
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 6
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if ( Trig_Leaver_Gold_Dist_Func002Func002Func006Func001C() ) then
                    set udg_Temp = ( udg_Temp + 1 )
                else
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 6
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if ( Trig_Leaver_Gold_Dist_Func002Func002Func007Func001C() ) then
                    call DisplayTextToForce( GetForceOfPlayer(ConvertedPlayer(GetForLoopIndexA())), ( ( "You have been given " + I2S(( GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) / udg_Temp )) ) + ( " gold from player " + I2S(GetConvertedPlayerId(GetTriggerPlayer())) ) ) )
                    call SetPlayerStateBJ( ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_LUMBER, ( GetPlayerState(ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_LUMBER) + ( GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) / udg_Temp ) ) )
                else
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            // End 6v6, Team 1
        else
            // 6v6, Team 2
            set bj_forLoopAIndex = 7
            set bj_forLoopAIndexEnd = 12
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if ( Trig_Leaver_Gold_Dist_Func002Func002Func002Func001C() ) then
                    set udg_Temp = ( udg_Temp + 1 )
                else
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            set bj_forLoopAIndex = 7
            set bj_forLoopAIndexEnd = 12
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if ( Trig_Leaver_Gold_Dist_Func002Func002Func003Func001C() ) then
                    call DisplayTextToForce( GetForceOfPlayer(ConvertedPlayer(GetForLoopIndexA())), ( ( "You have been given " + I2S(( GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) / udg_Temp )) ) + ( " gold from player " + I2S(GetConvertedPlayerId(GetTriggerPlayer())) ) ) )
                    call SetPlayerStateBJ( ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_LUMBER, ( GetPlayerState(ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_LUMBER) + ( GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) / udg_Temp ) ) )
                else
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            // 6v6, Team 2
        endif
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 6
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
    else
        if ( Trig_Leaver_Gold_Dist_Func002Func001C() ) then
            // 4v4, Team 1
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 4
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if ( Trig_Leaver_Gold_Dist_Func002Func001Func003Func001C() ) then
                    set udg_Temp = ( udg_Temp + 1 )
                else
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 4
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if ( Trig_Leaver_Gold_Dist_Func002Func001Func004Func001C() ) then
                    call DisplayTextToForce( GetForceOfPlayer(ConvertedPlayer(GetForLoopIndexA())), ( ( "You have been given " + I2S(( GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) / udg_Temp )) ) + ( " gold from player " + I2S(GetConvertedPlayerId(GetTriggerPlayer())) ) ) )
                    call SetPlayerStateBJ( ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_LUMBER, ( GetPlayerState(ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_LUMBER) + ( GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) / udg_Temp ) ) )
                else
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            // 4v4, Team 1
        else
            if ( Trig_Leaver_Gold_Dist_Func002Func001Func001C() ) then
                // 4v4, Team 2
                set bj_forLoopAIndex = 5
                set bj_forLoopAIndexEnd = 8
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    if ( Trig_Leaver_Gold_Dist_Func002Func001Func001Func006Func001C() ) then
                        set udg_Temp = ( udg_Temp + 1 )
                    else
                    endif
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                set bj_forLoopAIndex = 5
                set bj_forLoopAIndexEnd = 8
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    if ( Trig_Leaver_Gold_Dist_Func002Func001Func001Func007Func001C() ) then
                        call DisplayTextToForce( GetForceOfPlayer(ConvertedPlayer(GetForLoopIndexA())), ( ( "You have been given " + I2S(( GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) / udg_Temp )) ) + ( " gold from player " + I2S(GetConvertedPlayerId(GetTriggerPlayer())) ) ) )
                        call SetPlayerStateBJ( ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_LUMBER, ( GetPlayerState(ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_LUMBER) + ( GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) / udg_Temp ) ) )
                    else
                    endif
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                // 4v4, Team 2
            else
                // 4v4, Team 3
                set bj_forLoopAIndex = 9
                set bj_forLoopAIndexEnd = 12
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    if ( Trig_Leaver_Gold_Dist_Func002Func001Func001Func002Func001C() ) then
                        set udg_Temp = ( udg_Temp + 1 )
                    else
                    endif
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                set bj_forLoopAIndex = 9
                set bj_forLoopAIndexEnd = 12
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    if ( Trig_Leaver_Gold_Dist_Func002Func001Func001Func003Func001C() ) then
                        call DisplayTextToForce( GetForceOfPlayer(ConvertedPlayer(GetForLoopIndexA())), ( ( "You have been given " + I2S(( GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) / udg_Temp )) ) + ( " gold from player " + I2S(GetConvertedPlayerId(GetTriggerPlayer())) ) ) )
                        call SetPlayerStateBJ( ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_LUMBER, ( GetPlayerState(ConvertedPlayer(GetForLoopIndexA()), PLAYER_STATE_RESOURCE_LUMBER) + ( GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER) / udg_Temp ) ) )
                    else
                    endif
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                // 4v4, Team 3
            endif
        endif
    endif
endfunction

//===========================================================================
function InitTrig_Leaver_Gold_Dist takes nothing returns nothing
local integer i = 0
    set gg_trg_Leaver_Gold_Dist = CreateTrigger(  )
    
loop
    exitwhen i>11
        call TriggerRegisterPlayerEventLeave( gg_trg_Leaver_Gold_Dist, Player(i) )
    set i=i+1
endloop
    call TriggerAddCondition( gg_trg_Leaver_Gold_Dist, Condition( function Trig_Leaver_Gold_Dist_Conditions ) )
    call TriggerAddAction( gg_trg_Leaver_Gold_Dist, function Trig_Leaver_Gold_Dist_Actions )
endfunction

//===========================================================================
