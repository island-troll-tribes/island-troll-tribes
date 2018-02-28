
//
// local fogmodifier f2f=CreateFogModifierRect(p2p,FOG_OF_WAR_VISIBLE,bj_mapInitialPlayableArea,false,false)
// call FogModifierStart(f2f)
// call WaitForString(p2p,"-nomh",false)
// call FogModifierStop(f2f)
// call DestroyFogModifier(f2f)
// set f2f=null
// set p2p=null
//===========================================================================
//TESH.scrollpos=9
//TESH.alwaysfold=0
globals
    fogmodifier array obs_maphack
    boolean array obs_mhstate
    boolean array obs_notices
endglobals

function DIALOG_GLOBAL takes nothing returns nothing
local player p = GetTriggerPlayer()
local integer id = GetPlayerId(p)
local real r = 0
local integer i = 0

if GetClickedButton() == O_DBUTTON[0] then
    // exit
elseif GetClickedButton() == O_DBUTTON[1] then
    // zoom out
    set ZOOM_DISTANCE[id]=ZOOM_DISTANCE[id]+500
elseif GetClickedButton() == O_DBUTTON[2] then
    // zoom in
    set ZOOM_DISTANCE[id]=ZOOM_DISTANCE[id]-500
elseif GetClickedButton() == O_DBUTTON[3] then
    // toggle mh
    if obs_maphack[id] == null then
        set obs_maphack[id] = CreateFogModifierRect(p,FOG_OF_WAR_VISIBLE,bj_mapInitialPlayableArea,false,false)
    endif
    if obs_mhstate[id] then
        call FogModifierStop(obs_maphack[id])
        set obs_mhstate[id] = false
    else
        call FogModifierStart(obs_maphack[id])
        set obs_mhstate[id] = true
    endif
elseif GetClickedButton() == O_DBUTTON[4] then
    // toggle obs notices
    if obs_notices[id] then
        set obs_notices[id] = false
    else
        set obs_notices[id] = true
    endif
elseif GetClickedButton() == O_DBUTTON[5] then
    // "-rn"
    loop
        exitwhen i >= bj_MAX_PLAYERS
        if udg_RealNames[i] != "" then
            call DisplayTimedTextToPlayer(p,0,0,7,COLOR_CODE[i]+I2S(i+1)+"|r "+udg_RealNames[i]+" "+COLOR_CODE[currentcolor[i]]+"[c]|r")
        endif
        set i=i+1
    endloop
endif
endfunction
//call DialogDisplay(GameHost,OBSERVER_DIALOG,true)
function InitTrig_control_dialog takes nothing returns nothing
local integer i = 0
set gg_trg_control_dialog=CreateTrigger()
loop
    exitwhen i > 1 // Creates 5
    set OBSERVER_DIALOG[i] = DialogCreate()
    call TriggerRegisterDialogEvent(gg_trg_control_dialog,OBSERVER_DIALOG[i])
    set i = i + 1
endloop
call TriggerAddAction(gg_trg_control_dialog,function DIALOG_GLOBAL)
endfunction//===========================================================================
