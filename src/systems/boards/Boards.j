
//
//     call MultiboardSetRowCount(bj_lastCreatedMultiboard, rows)
//     call MultiboardSetColumnCount(bj_lastCreatedMultiboard, cols)
//     call MultiboardSetTitleText(bj_lastCreatedMultiboard, title)
//     call MultiboardDisplay(bj_lastCreatedMultiboard, true)
//===========================================================================
//TESH.scrollpos=70
//TESH.alwaysfold=0

globals
multiboard array BOARD_TEAM
integer array BOARD_INT
integer array PLAYER_INT_BOARD
multiboard OBSERVER_BOARD
dialog array OBSERVER_DIALOG
button array O_DBUTTON
endglobals

function CreateObsBoardAndDialog takes nothing returns nothing
local string array CMD_DES
local string COLOR = ""
local integer MAX_CMDS = 1
local integer INT = 1


call DialogSetMessage(OBSERVER_DIALOG[0],"Controls:")
set O_DBUTTON[0]=DialogAddButton(OBSERVER_DIALOG[0],"Exit",HK_A)
set O_DBUTTON[1]=DialogAddButton(OBSERVER_DIALOG[0],"Zoom Out",HK_1)
set O_DBUTTON[2]=DialogAddButton(OBSERVER_DIALOG[0],"Zoom In",HK_2)
set O_DBUTTON[3]=DialogAddButton(OBSERVER_DIALOG[0],"Toggle Notices",HK_4)
set O_DBUTTON[4]=DialogAddButton(OBSERVER_DIALOG[0],"-rn",HK_5)

set CMD_DES[1] = ""

//
set OBSERVER_BOARD = CreateMultiboard()
call MultiboardSetColumnCount(OBSERVER_BOARD, 1)
call MultiboardSetRowCount(OBSERVER_BOARD, MAX_CMDS)
call MultiboardSetTitleText(OBSERVER_BOARD, "Observer Events")
call MultiboardSetItemsStyle(OBSERVER_BOARD, true, false)
call MultiboardMinimize(OBSERVER_BOARD, false)
                
loop
    exitwhen INT > MAX_CMDS
        call MultiboardSetItemValueBJ(OBSERVER_BOARD, 1, INT, COLOR+CMD_DES[INT])
        call MultiboardSetItemWidthBJ(OBSERVER_BOARD, 1, INT, 30)
    set INT = INT + 1
endloop
call TriggerExecute(gg_trg_event_commands)
endfunction

function CreateTrollStatusBoard takes nothing returns nothing
local integer INTEGER = 1
local integer PLAYER_INT = 0
local integer numTribes = GameConfig.getInstance().getNumTribes()

    loop
        exitwhen INTEGER > numTribes
        // LOOP PER BOARD:
        set BOARD_INT[INTEGER] = 0
        
        set BOARD_TEAM[INTEGER] = CreateMultiboard()
        call MultiboardSetColumnCount(BOARD_TEAM[INTEGER], 4)
        call MultiboardSetRowCount(BOARD_TEAM[INTEGER], 6)
        call MultiboardSetTitleText(BOARD_TEAM[INTEGER], "Team Stats")
    
        loop
            exitwhen PLAYER_INT >= bj_MAX_PLAYERS
            // LOOP PER PLAYER
            
            if IsPlayerInForce(Player(PLAYER_INT),TEAM[INTEGER]) then
                set TEAM_PLAYER[PLAYER_INT] = INTEGER
                set BOARD_INT[INTEGER] = BOARD_INT[INTEGER] + 1
            
                call MultiboardSetItemValueBJ(BOARD_TEAM[INTEGER], 1, BOARD_INT[INTEGER], HIGHLIGHT_COLOR+GetPlayerName(Player(PLAYER_INT))+"|r")
                call MultiboardSetItemStyleBJ(BOARD_TEAM[INTEGER], 1, BOARD_INT[INTEGER], true, false )
                call MultiboardSetItemStyleBJ(BOARD_TEAM[INTEGER], 2, BOARD_INT[INTEGER], true, true )
                call MultiboardSetItemStyleBJ(BOARD_TEAM[INTEGER], 3, BOARD_INT[INTEGER], true, true )
                call MultiboardSetItemStyleBJ(BOARD_TEAM[INTEGER], 4, BOARD_INT[INTEGER], true, true )
                
                call MultiboardSetItemIconBJ(BOARD_TEAM[INTEGER], 2, BOARD_INT[INTEGER], "ReplaceableTextures\\CommandButtons\\BTNMonsterLure.blp" )
                call MultiboardSetItemIconBJ(BOARD_TEAM[INTEGER], 3, BOARD_INT[INTEGER], "ReplaceableTextures\\PassiveButtons\\PASBTNElunesBlessing.blp" )
                call MultiboardSetItemIconBJ(BOARD_TEAM[INTEGER], 4, BOARD_INT[INTEGER], "ReplaceableTextures\\CommandButtons\\BTNInnerFireOn.blp" )
                
                call MultiboardSetItemWidthBJ(BOARD_TEAM[INTEGER], 1, BOARD_INT[INTEGER], 10)
                call MultiboardSetItemWidthBJ(BOARD_TEAM[INTEGER], 2, BOARD_INT[INTEGER], 4)
                call MultiboardSetItemWidthBJ(BOARD_TEAM[INTEGER], 3, BOARD_INT[INTEGER], 4)
                call MultiboardSetItemWidthBJ(BOARD_TEAM[INTEGER], 4, BOARD_INT[INTEGER], 4)
                
                set PLAYER_INT_BOARD[PLAYER_INT] = BOARD_INT[INTEGER]
            endif
            set PLAYER_INT = PLAYER_INT + 1
        endloop
        set PLAYER_INT = 0
        call MultiboardSetRowCount(BOARD_TEAM[INTEGER], BOARD_INT[INTEGER])
        //call MultiboardDisplay(BOARD_TEAM[INTEGER],true)
        set INTEGER = INTEGER + 1
    endloop
    
    // make observer board
    if obs_present then
        call CreateObsBoardAndDialog()
    endif
endfunction

//===========================================================================
function InitTrig_boards takes nothing returns nothing
    set gg_trg_boards = CreateTrigger(  )
    //call TriggerRegisterTimerEventSingle( gg_trg_boards, 12.00 )
    //call TriggerRegisterTimerEventSingle( gg_trg_boards, .5 )
    call TriggerAddAction( gg_trg_boards, function CreateTrollStatusBoard )
endfunction

//===========================================================================
