
//===========================================================================
//TESH.scrollpos=78
//TESH.alwaysfold=0

globals
    multiboard MODE_BOARD
    constant integer MB_ROWS = 36
endglobals

function CreateModeBoardAndShow takes nothing returns nothing
local string array CMD_NAME
local string array CMD_DES
local string COLOR = ""
local integer MAX_CMDS = 39
local integer INT = 1
//  Names
//      Advantages
set CMD_NAME[1] = "-hm"
set CMD_NAME[2] = "-rh"
set CMD_NAME[3] = "-safe"
set CMD_NAME[4] = "-increase pets"
set CMD_NAME[5] = "-rpg"
set CMD_NAME[6] = "-lavish"
set CMD_NAME[7] = "-rb"
set CMD_NAME[8] = "-rfl"
set CMD_NAME[9] = "-fast"
set CMD_NAME[10] = "-ril"
set CMD_NAME[11] = "-nil"
//      Disadvantages
set CMD_NAME[12] = "-cm"
set CMD_NAME[13] = "-dh"
set CMD_NAME[14] = "-survival"
set CMD_NAME[15] = "-panic"
set CMD_NAME[16] = "-double"
set CMD_NAME[17] = "-famine"
set CMD_NAME[18] = "-faminex2"
set CMD_NAME[19] = "-slow"
set CMD_NAME[20] = "-decrease pets"
set CMD_NAME[21] = "-lfl"
set CMD_NAME[22] = "-lil"
set CMD_NAME[23] = "-no horn"
//      Miscellaneous
set CMD_NAME[24] = "-Test Mode"
set CMD_NAME[25] = "-classic"
set CMD_NAME[26] = "-classic items"
set CMD_NAME[27] = "-elimination"
set CMD_NAME[28] = "-all <class>"
set CMD_NAME[29] = "-no exp"
set CMD_NAME[30] = "-no herbs"
set CMD_NAME[31] = "-no trees"
set CMD_NAME[32] = "-no boats"
set CMD_NAME[33] = "-no trade"
set CMD_NAME[34] = "-no shields"
set CMD_NAME[35] = "-fs"
set CMD_NAME[36] = "-nt ####"
set CMD_NAME[37] = "-equal random"
set CMD_NAME[38] = "-op"
set CMD_NAME[39] = "-tko"
//  Descriptions
//      A
set CMD_DES[1] = "increases amount of heat a fire gives per cast"
set CMD_DES[2] = "increases heat capacity from 100 to 150"
set CMD_DES[3] = "decreases amount of stats per degrade"
set CMD_DES[4] = "increases chance for animal pets to appear"
set CMD_DES[5] = "increases pet growth rate"
set CMD_DES[6] = "increases elk/fish spawn rates, meat from all animals"
set CMD_DES[7] = "raises hostile animal spawn rate"
set CMD_DES[8] = "increases animal and fish limit"
set CMD_DES[9] = "increases amount of items per spawn"
set CMD_DES[10] = "raises the item spawning capacity"
set CMD_DES[11] = "removes the limits on axes/armor/scrolls, item spawning capacity"
//      D
set CMD_DES[12] = "decreases amount of heat a fire gives per cast"
set CMD_DES[13] = "lowers heat capacity from 100 to 75"
set CMD_DES[14] = "decreases heat per cast, animals, food from animals, items"
set CMD_DES[15] = "degrade time from 3 seconds to 2.3 seconds"
set CMD_DES[16] = "doubles stat loss per degrade"
set CMD_DES[17] = "less animals and less food from animals"
set CMD_DES[18] = "even less animals and even less food from animals"
set CMD_DES[19] = "less items spawn"
set CMD_DES[20] = "decreases chance for finding a pet after killing an animal"
set CMD_DES[21] = "lowers maximum animal and fish available at once"
set CMD_DES[22] = "lowers maximum items available at once"
//      M
set CMD_DES[23] = "boss items such as the mammoth horn does not drop"
set CMD_DES[24] = "win conditions are disabled, tribes are given a spirit ward"
set CMD_DES[25] = "sets the game to classic ice troll tribe gameplay, heros applied"
set CMD_DES[26] = "further extends classic style by modifying items as well"
set CMD_DES[27] = "spirit ward is disabled"
set CMD_DES[28] = "forces a certain/random class, eg: -all thief, -all random"
set CMD_DES[29] = "removes experience gain from hostile units/heros"
set CMD_DES[30] = "removes herb bushes from the game"
set CMD_DES[31] = "removes all trees from the game"
set CMD_DES[32] = "disables development of transport boats"
set CMD_DES[33] = "removes all troll merchants, trade boats from the game"
set CMD_DES[34] = "disables creation of shield-type armory"
set CMD_DES[35] = "initializes a fast start, reducing game start timer to 4 seconds"
set CMD_DES[36] = "sets noob time to specific amount, eg: \"-nt 1051\""
set CMD_DES[37] = "sets an equal seed for both (-all random) and time out randoms"
set CMD_DES[38] = "unlocks over powered items added since 2.52a"
set CMD_DES[39] = "Allies cant attack ally trolls"
//
set MODE_BOARD = CreateMultiboard()
call MultiboardSetColumnCount(MODE_BOARD, 2)
call MultiboardSetRowCount(MODE_BOARD, MB_ROWS)
call MultiboardSetTitleText(MODE_BOARD, "Modes ["+I2S(MAX_CMDS)+"]")
call MultiboardSetItemsStyle(MODE_BOARD, true, false)
                
loop
    exitwhen INT > MAX_CMDS
    if INT <= 11 then
        set COLOR = ENERGY_COLOR
    elseif INT <= 22 then
        set COLOR = HEALTH_COLOR
    else
        set COLOR = GOLD_COLOR
    endif
    // Command Name
    if INT <= MB_ROWS then
        call MultiboardSetItemValueBJ(MODE_BOARD, 1, INT, COLOR+CMD_NAME[INT]+":|r "+CMD_DES[INT])
        call MultiboardSetItemWidthBJ(MODE_BOARD, 1, INT, 45)
    else
        call MultiboardSetItemValueBJ(MODE_BOARD, 2, INT - MB_ROWS, COLOR+CMD_NAME[INT]+":|r "+CMD_DES[INT])
        call MultiboardSetItemWidthBJ(MODE_BOARD, 2, INT - MB_ROWS, 45)
    endif
    set INT = INT + 1
endloop    
endfunction

//===========================================================================
function InitTrig_modeboard takes nothing returns nothing
    set gg_trg_modeboard = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_modeboard, 0 )
    call TriggerAddAction( gg_trg_modeboard, function CreateModeBoardAndShow )
endfunction

//===========================================================================
