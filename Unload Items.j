
//===========================================================================
//TESH.scrollpos=21
//TESH.alwaysfold=0
function Trig_Unload_Items_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06O'
endfunction

function Trig_Unload_Items_Actions takes nothing returns nothing
local integer temp=1
local unit u=GetSpellAbilityUnit()
local unit q=GetSpellTargetUnit()
local integer remaining=UnitInventorySize(q)-UnitInventoryCount(q)
local integer stop=UnitInventorySize(u)

if (  GetUnitTypeId(u) == 'h01G' ) then
    if (  GetUnitTypeId(u) != UNIT_THIEF or GetUnitTypeId(u) != UNIT_CONTORTIONIST or GetUnitTypeId(u) != UNIT_ESCAPE_ARTIST or GetUnitTypeId(u) != UNIT_ASSASSIN) then
         return
    endif
endif
if (  GetUnitTypeId(u) == UNIT_SCOUTS_BUSH ) then
    if (  GetUnitTypeId(u) != UNIT_OBSERVER or GetUnitTypeId(u) != UNIT_SCOUT or GetUnitTypeId(u) != UNIT_RADAR_SCOUT or GetUnitTypeId(u) != UNIT_SPY) then
         return
    endif
endif
    loop
        exitwhen (temp > stop) or (remaining==0)
        //if UnitItemInSlot(u, temp - 1) == null then
        if UnitInventorySize(q)-UnitInventoryCount(q) == 0 then
           set remaining=0
        else
           call UnitAddItem(q, UnitItemInSlot(u, temp - 1))
        endif
        set temp = temp + 1
    endloop

set u=null
set q=null
endfunction

//===========================================================================
function InitTrig_Unload_Items takes nothing returns nothing
    set gg_trg_Unload_Items = CreateTrigger(  )
    call TriggerRegisterPlayerUnitEventSimple( gg_trg_Unload_Items, Player(PLAYER_NEUTRAL_PASSIVE), EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Unload_Items, Condition( function Trig_Unload_Items_Conditions ) )
    call TriggerAddAction( gg_trg_Unload_Items, function Trig_Unload_Items_Actions )
endfunction

//===========================================================================
