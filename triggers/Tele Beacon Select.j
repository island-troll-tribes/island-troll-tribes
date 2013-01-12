
//
// function Tradeship_Condition takes nothing returns nothing
// return IsUnitAlly(GetTriggerUnit(),GetTriggerPlayer())
// endfunction
//===========================================================================
//TESH.scrollpos=35
//TESH.alwaysfold=0
globals
    string rangeCheckModFirst = "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes"
    boolean array tp_selected
endglobals

function TeleportBeaconRangeF takes nothing returns boolean
local player p = GetTriggerPlayer()
local unit u = GetTriggerUnit()
local integer i
local string modelPath
local integer array s
local real a = 0
local real x
local real y
local real uX = GetUnitX(u)
local real uY = GetUnitY(u)
local integer k = 0
local integer id = GetPlayerId(p)
local effect e
if GetUnitTypeId(u) == UNIT_TELEPORTATION_BEACON and IsUnitAlly(u, p) and not tp_selected[id] then
    set tp_selected[id] = true
    set i = GetUnitAbilityLevel(u, 'A042')
    //set modelPath = rangeCheckModFirst+I2S(GetRandomInt(0,8))+".mdl"
    set modelPath = rangeCheckModFirst+"2.mdl"
    set s[1] = 500
    set s[2] = 700
    set s[3] = 900
    set s[4] = 1100
    //call GroupEnumUnitsInRange(
    loop
        exitwhen a > 360
        set x = uX+Sin(a*bj_DEGTORAD)*s[i]
        set y = uY+Cos(a*bj_DEGTORAD)*s[i]
        if GetLocalPlayer() != p then
            set modelPath = ""
        endif
        set e = AddSpecialEffect(modelPath, x, y)
        call SaveEffectHandle(udg_GameHash, GetPlayerId(p), k, e)
        set a = a + 20
        set k = k + 1
    endloop
    set e = null
endif
set u = null
return false
endfunction

//===========================================================================
function InitTrig_tele_beacon_select takes nothing returns nothing
local integer i = 0
set gg_trg_tele_beacon_select = CreateTrigger(  )
loop
    exitwhen i > 11
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_tele_beacon_select, Player(i), true )
    set i = i + 1
endloop
call TriggerAddCondition( gg_trg_tele_beacon_select, Condition( function TeleportBeaconRangeF ) )
endfunction
//===========================================================================
