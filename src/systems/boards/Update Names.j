
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_update_names_Conditions takes nothing returns boolean
    return udg_STARTED and not GAME_END
endfunction

function Trig_update_names_Actions takes nothing returns nothing
local integer BOARD = 1
local integer PID = 0
local integer numTribes = GameConfig.getInstance().getNumTribes()

loop
    exitwhen BOARD > numTribes
    loop
        exitwhen PID >= bj_MAX_PLAYERS
        if IsPlayerInForce(Player(PID),TEAM[BOARD]) then
            if GetPlayerSlotState(Player(PID))==PLAYER_SLOT_STATE_PLAYING then
                call MultiboardSetItemValueBJ(BOARD_TEAM[BOARD], 1, PLAYER_INT_BOARD[PID], HIGHLIGHT_COLOR+GetPlayerName(Player(PID))+"|r" )
            else
                call MultiboardSetItemValueBJ(BOARD_TEAM[BOARD], 1, PLAYER_INT_BOARD[PID], GRAY_COLOR+GetPlayerName(Player(PID))+"|r" )
            endif
        endif
        set PID = PID + 1
    endloop
    set PID = 0
    set BOARD = BOARD + 1
endloop
    
endfunction

//===========================================================================
function InitTrig_update_names takes nothing returns nothing
    set gg_trg_update_names = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_update_names, Condition( function Trig_update_names_Conditions ) )
    call TriggerAddAction( gg_trg_update_names, function Trig_update_names_Actions )
endfunction

//===========================================================================
