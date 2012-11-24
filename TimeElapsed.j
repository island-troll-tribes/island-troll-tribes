
//===========================================================================
//TESH.scrollpos=-1
//TESH.alwaysfold=0

library GameElapsedTime

    function GetElapsedTime takes nothing returns integer
        return R2I( TimerGetElapsed(GAME_TIMER) )
    endfunction


endlibrary
//===========================================================================
