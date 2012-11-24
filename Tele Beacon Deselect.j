
//
// function Tradeship_Condition takes nothing returns nothing
// return IsUnitAlly(GetTriggerUnit(),GetTriggerPlayer())
// endfunction
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function TeleBeaconRangeRemove takes nothing returns boolean
local player p = GetTriggerPlayer()
local unit u = GetTriggerUnit()
local integer id = GetPlayerId(p)
local integer k = 0
local real a = 0
if GetUnitTypeId(u) == UNIT_TELEPORTATION_BEACON and IsUnitAlly(u, p) and tp_selected[id] then
    loop
        exitwhen k > 18
        call DestroyEffect(LoadEffectHandle(udg_GameHash, GetPlayerId(p), k))
        set k = k + 1
    endloop
    set tp_selected[id] = false
endif
set u = null
return false
endfunction

//===========================================================================
function InitTrig_tele_beacon_deselect takes nothing returns nothing
local integer i = 0
set gg_trg_tele_beacon_deselect = CreateTrigger(  )
loop
    exitwhen i > 11
    call TriggerRegisterPlayerUnitEvent(gg_trg_tele_beacon_deselect, Player(i), EVENT_PLAYER_UNIT_DESELECTED, null)
    set i = i + 1
endloop
call TriggerAddCondition( gg_trg_tele_beacon_deselect, Condition( function TeleBeaconRangeRemove ) )
endfunction
//===========================================================================
