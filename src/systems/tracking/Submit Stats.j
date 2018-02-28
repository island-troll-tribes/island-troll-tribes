
library StatsSubmitting

    function displayStats takes nothing returns nothing
        local integer i=0
        local integer k=0
        local integer pid //pid
        local player array players
        local multiboard mb
        call PolledWait(.5)
        loop
            exitwhen i>11 // TODO bj_MAX_PLAYERS
                if ((GetPlayerController(Player(i)) == MAP_CONTROL_USER) and (GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING or GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_LEFT)) then
                    set players[k]=Player(i)
                    set k=k+1
                endif
            set i=i+1
        endloop

        set mb=CreateMultiboardBJ( 4, k+1, "Player Stats" )
        call MultiboardSetItemStyleBJ( mb, 1, 1, true, false )
        call MultiboardSetItemValueBJ( mb, 1, 1, ENERGY_COLOR+"Player Name" )
        call MultiboardSetItemValueBJ( mb, 2, 1, HIGHLIGHT_COLOR+"Kills" )
        call MultiboardSetItemIconBJ ( mb, 2, 1, "ReplaceableTextures\\CommandButtons\\BTNSacrifice.blp" )
        call MultiboardSetItemValueBJ( mb, 3, 1, HIGHLIGHT_COLOR+"Deaths" )
        call MultiboardSetItemIconBJ ( mb, 3, 1, "ReplaceableTextures\\CommandButtons\\BTNAnkh.blp" )
        call MultiboardSetItemValueBJ( mb, 4, 1, HIGHLIGHT_COLOR+"Gold Gained" )
        call MultiboardSetItemIconBJ ( mb, 4, 1, "ReplaceableTextures\\CommandButtons\\BTNChestOfGold.blp" )
        call MultiboardSetItemWidthBJ( mb, 1, 1, 10 )
        call MultiboardSetItemWidthBJ( mb, 2, 1, 5 )
        call MultiboardSetItemWidthBJ( mb, 3, 1, 5 )
        call MultiboardSetItemWidthBJ( mb, 4, 1, 5 )
        
        set i=0
        loop
            exitwhen i==k
                set pid=GetPlayerId(players[i])
                call MultiboardSetItemStyleBJ( mb, 1, i+2, true, false )
                call MultiboardSetItemStyleBJ( mb, 2, i+2, true, false )
                call MultiboardSetItemStyleBJ( mb, 3, i+2, true, false )
                call MultiboardSetItemStyleBJ( mb, 4, i+2, true, false )
                call MultiboardSetItemValueBJ( mb, 1, i+2, COLOR_CODE[pid]+udg_RealNames[pid] )
                call MultiboardSetItemValueBJ( mb, 2, i+2, I2S(playerKills[pid]) )
                call MultiboardSetItemValueBJ( mb, 3, i+2, I2S(playerDeaths[pid]) )
                call MultiboardSetItemValueBJ( mb, 4, i+2, I2S(playerGold[pid]) )
                call MultiboardSetItemWidthBJ( mb, 1, i+2, 12 )
                call MultiboardSetItemWidthBJ( mb, 2, i+2, 5 )
                call MultiboardSetItemWidthBJ( mb, 3, i+2, 5 )
                call MultiboardSetItemWidthBJ( mb, 4, i+2, 3 )
            set i=i+1
        endloop

        call MultiboardDisplay(mb, true)
        call MultiboardMinimize(mb, false)
    endfunction
    
endlibrary