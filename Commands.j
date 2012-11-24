
//===========================================================================
//TESH.scrollpos=165
//TESH.alwaysfold=0
function PrivateVision takes nothing returns nothing
    local player p = GetEnumPlayer()
    local integer id = GetPlayerId(p)
    if tempInt != id then
        call SetPlayerAlliance(Player(tempInt), p, ALLIANCE_SHARED_VISION, false)
    endif
    set p = null
endfunction

function PublicVision takes nothing returns nothing
    local player p = GetEnumPlayer()
    local integer id = GetPlayerId(p)
    if tempInt != id then
        call SetPlayerAlliance(Player(tempInt), p, ALLIANCE_SHARED_VISION, true)
    endif
    set p = null
endfunction

function ShareControl takes nothing returns nothing
    local player p = GetEnumPlayer()
    local integer id = GetPlayerId(p)
    if tempInt != id then
        call SetPlayerAlliance(Player(tempInt), p, ALLIANCE_SHARED_CONTROL, true)
    endif
    set p = null
endfunction

function UnShareControl takes nothing returns nothing
    local player p = GetEnumPlayer()
    local integer id = GetPlayerId(p)
    if tempInt != id then
        call SetPlayerAlliance(Player(tempInt), p, ALLIANCE_SHARED_CONTROL, false)
    endif
    set p = null
endfunction

function ShareAdvControl takes nothing returns nothing
    local player p = GetEnumPlayer()
    local integer id = GetPlayerId(p)
    if tempInt != id then
        call SetPlayerAlliance(Player(tempInt), p, ALLIANCE_SHARED_ADVANCED_CONTROL, true)
        //call SetPlayerAlliance(Player(tempInt), p, ALLIANCE_SHARED_CONTROL, false)
        //call SetPlayerAlliance(Player(tempInt), p, ALLIANCE_SHARED_CONTROL, true)
        call TriggerExecute(gg_trg_ShowPlayers)
    endif
    set p = null
endfunction

function UnShareAdvControl takes nothing returns nothing
    local player p = GetEnumPlayer()
    local integer id = GetPlayerId(p)
    if tempInt != id then
        call SetPlayerAlliance(Player(tempInt), p, ALLIANCE_SHARED_ADVANCED_CONTROL, false)
        call TriggerExecute(gg_trg_ShowPlayers)
    endif
    set p = null
endfunction

globals
    integer tempInt = 0
    boolean array adv_control
    boolean array shr_control
endglobals

function Commands_Action takes nothing returns nothing
    local player p = GetTriggerPlayer()
    local integer PID = GetPlayerId(p)
    local string s = StringCase(GetEventPlayerChatString(),false)
    local string s2 = GetEventPlayerChatString()
    local integer s_l = StringLength(s)
    local string display = ""
    local string fpart = ""
    local string bpart = ""
    local string d_color = ""
    local integer i = 0
    local integer ttt = StringHash(s2)
    local real r = 0
    if s=="-h" then
        if IsPlayerInForce(p, TIP_FORCE) then
            set display = "Your tips are now off."
            call ForceRemovePlayer(TIP_FORCE,p)
        else
            set display = "Your tips are now on."
            call ForceAddPlayer(TIP_FORCE,p)
        endif
        set d_color = GRAY_COLOR
    elseif s=="-clear" then
        if GetLocalPlayer() == p then
            call ClearTextMessages()
        endif
    elseif s=="-modes" then
        call DisplayTimedTextToPlayer(p, 0, 0, 15, currentModes)
    elseif s=="-ms" then
        if udg_PUnits[PID] != null and GetUnitState(udg_PUnits[PID], UNIT_STATE_LIFE) > 0 then
            set fpart = "Your movement speed is:|r "
            set display = I2S(R2I(GetUnitMoveSpeed(udg_PUnits[PID])))
        endif
    elseif s=="-p" then
        set tempInt = PID
        if vision_pub[PID] then
            call ForForce(TEAM[TEAM_PLAYER[PID]], function PrivateVision)
            set vision_pub[PID] = false
            call DisplayTimedTextToForce(TEAM[TEAM_PLAYER[PID]],7, COLOR_CODE[PID]+GetPlayerName(p)+"|r has gone private.")
        else
            call ForForce(TEAM[TEAM_PLAYER[PID]], function PublicVision)
            set vision_pub[PID] = true
            call DisplayTimedTextToForce(TEAM[TEAM_PLAYER[PID]],7, COLOR_CODE[PID]+GetPlayerName(p)+"|r has gone public.")
        endif
    elseif s=="-ac" then
        set tempInt = PID
        if adv_control[PID] then
            call ForForce(TEAM[TEAM_PLAYER[PID]], function UnShareAdvControl)
            set adv_control[PID] = false
            call DisplayTimedTextToForce(TEAM[TEAM_PLAYER[PID]],7, COLOR_CODE[PID]+GetPlayerName(p)+"|r disabled his/her advanced controls.")
        else
            call ForForce(TEAM[TEAM_PLAYER[PID]], function ShareAdvControl)
            set adv_control[PID] = true
            call DisplayTimedTextToForce(TEAM[TEAM_PLAYER[PID]],7, COLOR_CODE[PID]+GetPlayerName(p)+"|r enabled his/her advanced controls.")
        endif
    elseif s=="-sc" then
        set tempInt = PID
        if shr_control[PID] then
            call ForForce(TEAM[TEAM_PLAYER[PID]], function UnShareControl)
            set shr_control[PID] = false
            call DisplayTimedTextToForce(TEAM[TEAM_PLAYER[PID]],7, COLOR_CODE[PID]+GetPlayerName(p)+"|r disabled his/her shared controls.")
        else
            call ForForce(TEAM[TEAM_PLAYER[PID]], function ShareControl)
            set shr_control[PID] = true
            call DisplayTimedTextToForce(TEAM[TEAM_PLAYER[PID]],7, COLOR_CODE[PID]+GetPlayerName(p)+"|r enabled his/her shared controls.")
        endif
    elseif SubString(s,0,3) == "-cn" and s_l > 3 and s != "-cn " then
        if SubString(s,3,4) == " " then
            set fpart = SubString(s2,4,IMinBJ(s_l,19))
        else
            set fpart = SubString(s2,3,IMinBJ(s_l,18))
        endif
        call SetPlayerName(p,fpart)
        call TriggerExecute(gg_trg_update_names)
    elseif s=="-repick" and not udg_STARTED then
        call SetPlayerState(p,PLAYER_STATE_RESOURCE_LUMBER,1)
        call GroupRemoveUnit(udg_trolls,udg_PUnits[PID])
        call RemoveUnit(udg_PUnits[PID])
        set udg_started[PID] = false
        //game started commands
    elseif s=="-rn" then
        loop
            exitwhen i>11
            if udg_RealNames[i] != "" then
                call DisplayTimedTextToPlayer(p,0,0,7,COLOR_CODE[i]+I2S(i+1)+"|r "+udg_RealNames[i]+" "+COLOR_CODE[currentcolor[i]]+"[c]|r")
            endif
            set i=i+1
        endloop
    elseif SubString(s,0,3)=="-c " then
        if SubString(s,3,4) == "-" then
            set r=S2R(SubString(s,3,8))
        else
            set r=S2R(SubString(s,3,7))
        endif
        if r>=-2000 and r<=5000 then
            set ZOOM_DISTANCE[PID]=r
            call ZoomSetCamera( PID )
            set display = "Current Zoom: "+I2S(R2I(r))+" Default: 0"
        endif
        set d_color = GRAY_COLOR
    elseif SubString(s,0,3)=="-f " then
        if SubString(s,3,4) == "-" then
            set r=S2R(SubString(s,3,16))
        else
            set r=S2R(SubString(s,3,15))
        endif
        if r>=4000 and r<=100000 then
            //call DisplayText(I2S(s_l))
            set ZOOM_FOGZ[PID]=r
            call ZoomSetCamera( PID )
            set display = "Current FogZ: "+I2S(R2I(r))+" Default: 5000"
        endif
        set d_color = GRAY_COLOR
    elseif SubString(s,0,10)=="-changelog" then
        call DisplayChangeLog(GetTriggerPlayer())
    endif
    
    if udg_STARTED then
        if SubString(s,0,3)=="-cc" and s_l > 3 then
            if SubString(s,3,4) == " " then
                set fpart = SubString(s,4,6)
            else
                set fpart = SubString(s,3,5)
            endif
            set i = ModuloInteger(S2I(fpart),13)
            set fpart = "Adjusted player color to: "
            set display = COLOR_CODE[i]+"Player "+I2S(i+1)
            call SetPlayerColorBJ(p,ConvertPlayerColor(i),true)
            set currentcolor[PID] = i
        elseif s=="-i am noob" then
            call DisplayTimedTextToForce( GetPlayersAllies(p), 7, GENERAL_COLOR+"Ok. Once again, here are the build help locations. (The White Pings)" )
            call PingMinimapLocForForceEx( GetPlayersAllies(p), GetRectCenter(gg_rct_vision), 5.00, bj_MINIMAPPINGSTYLE_FLASHY, 100, 100, 100 )
            call PanCameraToTimedLocForPlayer( p, GetRectCenter(gg_rct_vision), 1.00 )
        endif
    endif
    
    if display != "" then
        call DisplayTimedTextToPlayer(p,0,0,5,GOLD_COLOR+fpart+d_color+display+GOLD_COLOR+bpart+"|r")
    endif
    
    
    set p=null
endfunction

globals
    boolean array vision_pub
    integer array currentcolor
endglobals

//===========================================================================
function InitTrig_Commands takes nothing returns nothing
    local integer i = 0
    set gg_trg_Commands = CreateTrigger(  )
    loop
        exitwhen i > 11
        call TriggerRegisterPlayerChatEvent( gg_trg_Commands, Player(i), "-", false )
        set adv_control[i] = false
        set shr_control[i] = false
        set vision_pub[i] = true
        set currentcolor[i] = i
        set i = i + 1
    endloop
    call TriggerAddAction( gg_trg_Commands, function Commands_Action )
endfunction
//===========================================================================
