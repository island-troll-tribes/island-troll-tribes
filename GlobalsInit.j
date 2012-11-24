
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
library GlobalsInit initializer onLololRunGlobals

    private function onLololRunGlobals takes nothing returns nothing
        local integer i = 0
        
        loop
            exitwhen i > 11
            
            set BATTLE_SHIELD_NUMBER[i] = 0
            set frostar[i] = false
            set healar[i] = false
            set tp_selected[i] = false
            set pnamePresent[i] = 0
            set ZOOM_FOGZ[i] = 5000
            set obs_mhstate[i] = false
            set obs_notices[i] = true
            set i = i + 1
        endloop
    endfunction
    

endlibrary

//===========================================================================
