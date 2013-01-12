
//
// function Tradeship_Condition takes nothing returns nothing
// return IsUnitAlly(GetTriggerUnit(),GetTriggerPlayer())
// endfunction
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Tradeship_Condition takes nothing returns boolean
return (GetTriggerUnit() != udg_ship) and (GetTriggerUnit() != udg_ship2)
endfunction

function Tradeship_Selected takes nothing returns nothing
local player PLAYER = GetTriggerPlayer()
local unit UNIT = GetTriggerUnit()

    if IsUnitAlly(UNIT,PLAYER) then
        if IsUnitSelected(udg_ship,PLAYER) then
            if (GetLocalPlayer() == PLAYER) then
                // Use only local code (no net traffic) within this block to avoid desyncs.
                call SelectUnit(udg_ship, false)
            endif
        elseif IsUnitSelected(udg_ship2,PLAYER) then
            if (GetLocalPlayer() == PLAYER) then
                // Use only local code (no net traffic) within this block to avoid desyncs.
                call SelectUnit(udg_ship2, false)
            endif
        endif
    endif

set UNIT = null

endfunction
globals
    //timer antiboatStuck = CreateTimer()
    timer t__boat1 = CreateTimer()
    timer t__boat2 = CreateTimer()
endglobals

//===========================================================================
function InitTrig_tradeship_selection takes nothing returns nothing
local integer i = 0
set gg_trg_tradeship_selection = CreateTrigger(  )
loop
    exitwhen i > 11
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_tradeship_selection, Player(i), true )
    set i = i + 1
endloop
call TriggerAddCondition( gg_trg_tradeship_selection, Condition( function Tradeship_Condition ) )
call TriggerAddAction( gg_trg_tradeship_selection, function Tradeship_Selected )
endfunction
//===========================================================================
