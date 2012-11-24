
//===========================================================================
//TESH.scrollpos=43
//TESH.alwaysfold=0
library_once TimerUtils initializer redInit
//*********************************************************************
//* TimerUtils (Red flavo for 1.23b)
//* ----------
//*
//*  To implement it , create a custom text trigger called TimerUtils
//* and paste the contents of this script there.
//*
//*  To copy from a map to another, copy the trigger holding this
//* library to your map.
//*
//* (requires vJass)   More scripts: htt://www.wc3campaigns.net
//*
//* For your timer needs:
//*  * Attaching
//*  * Recycling (with double-free protection)
//*
//* set t=NewTimer()      : Get a timer (alternative to CreateTimer)
//* ReleaseTimer(t)       : Relese a timer (alt to DestroyTimer)
//* SetTimerData(t,2)     : Attach value 2 to timer
//* GetTimerData(t)       : Get the timer's value.
//*                         You can assume a timer's value is 0
//*                         after NewTimer.
//*
//* Red flavor: Fastest, method in existence for timer attaching,
//*             only takes an array lookup, GetHandleId and subtraction. 
//*             However, all the code in your map requires extra care
//*             not to forget to call ReleaseTimer. It also requires
//*             to preload a lot of timers at map init, they use
//*             memory and handle ids.
//*
//*             I recommend you run your map in debug mode the first
//* time after adding it, make sure you can see map init messages
//* if nothing appears, all is done, if an error appears, it might
//* suggest you a value with OFFSET, in that case, update that value
//* if it still does not work after updating (rare), try a bigger
//* OFFSET by 1000 for example. (Sounds hard? Then use blue or purple
//* timerutils that are friendlier though not as fast)
//*
//********************************************************************

//================================================================
    globals
        constant integer OFFSET     = 0x100000
        constant integer QUANTITY   = 256
        constant integer ARRAY_SIZE = 8191 //changing this to a higher value would effectively
                                                   //cripple the performance making this thing irrelevant

    endglobals

    //==================================================================================================
    globals
        private integer array data[ARRAY_SIZE]
    endglobals

    //It is dependent on jasshelper's recent inlining optimization in order to perform correctly.
    function SetTimerData takes timer t, integer value returns nothing
        debug if(GetHandleId(t)-OFFSET<0) then
        debug     call BJDebugMsg("SetTimerData: Wrong handle id, only use SetTimerData on timers created by NewTimer")
        debug endif
        set data[GetHandleId(t)-OFFSET]=value
    endfunction

    function GetTimerData takes timer t returns integer
        debug if(GetHandleId(t)-OFFSET<0) then
        debug     call BJDebugMsg("GetTimerData: Wrong handle id, only use GetTimerData on timers created by NewTimer")
        debug endif

        return data[GetHandleId(t)-OFFSET]
    endfunction

    //==========================================================================================
    globals
        private timer array tT
        private integer tN = 0
        private constant integer HELD=0x28829022
        //use a totally random number here, the more improbable someone uses it, the better.
    endglobals

    //==========================================================================================
    function NewTimer takes nothing returns timer
        if (tN==0) then
            //If this happens then the QUANTITY rule has already been broken, try to fix the
            // issue, else fail.
            debug call BJDebugMsg("NewTimer: Warning, Exceeding TimerUtils_QUANTITY, please increase it for your map, fix your map's timer leaks or switch to blue flavor when applicable")
            set tT[0]=CreateTimer()
            if (GetHandleId(tT[0])-OFFSET<0) or (GetHandleId(tT[0])-OFFSET>=ARRAY_SIZE) then
                //all right, couldn't fix it
                debug call BJDebugMsg("NewTimer: Unable to allocate a timer, you should probably switch to the blue flavor or fix timer leaks.")
                return null
            endif
        else
            set tN=tN-1
            debug call BJDebugMsg("NewTimer: "+I2S(tN))
        endif
        call SetTimerData(tT[tN],0)
     return tT[tN]
    endfunction

    //==========================================================================================
    function ReleaseTimer takes timer t returns nothing
        if(t==null) then
            debug call BJDebugMsg("Warning: attempt to release a null timer")
            return
        endif
        if (tN==8191) then
            debug call BJDebugMsg("Warning: Timer stack is full, destroying timer!!")

            //stack is full, the map already has much more troubles than the chance of bug
            call DestroyTimer(t)
        else
            call PauseTimer(t)
            if(GetTimerData(t)==HELD) then
                debug call BJDebugMsg("Warning: ReleaseTimer: Double free!")
                return
            endif
            call SetTimerData(t,HELD)
            set tT[tN]=t
            set tN=tN+1
            debug call BJDebugMsg("ReleaseTimer: "+I2S(tN))
        endif    
    endfunction

    private function redInit takes nothing returns nothing
     local integer i=0
     local integer bestoffset=-1

        loop
            exitwhen (i==QUANTITY)
            set tT[i] = CreateTimer()
            if(i==0) then
                set bestoffset=GetHandleId(tT[i])
            endif
            if (GetHandleId(tT[i])-OFFSET>=ARRAY_SIZE) then
                debug call BJDebugMsg("TimerUtils_redInit: Failed a initializing attempt")
                debug call BJDebugMsg("The timer limit is "+I2S(i))
                debug call BJDebugMsg("This is a rare ocurrence, if the timer limit is too low, to change OFFSET to "+I2S(bestoffset) )
                exitwhen true
            endif
            if (GetHandleId(tT[i])-OFFSET>=0)  then
                set i=i+1
            endif
        endloop

        set tN=i
    endfunction

endlibrary

//===========================================================================
