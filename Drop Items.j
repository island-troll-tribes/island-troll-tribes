
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Drop_Items_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06P'
endfunction

function Trig_Drop_Items_Actions takes nothing returns nothing
    local integer i = 0
    local integer s = UnitInventorySize(GetSpellAbilityUnit())
    loop
        exitwhen i > s
        call UnitRemoveItem(GetSpellAbilityUnit(), UnitItemInSlot(GetSpellAbilityUnit(), i))
        set i = i + 1
    endloop
endfunction

//===========================================================================
function InitTrig_Drop_Items takes nothing returns nothing
    set gg_trg_Drop_Items = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Drop_Items, EVENT_PLAYER_UNIT_SPELL_FINISH )
    call TriggerAddCondition( gg_trg_Drop_Items, Condition( function Trig_Drop_Items_Conditions ) )
    call TriggerAddAction( gg_trg_Drop_Items, function Trig_Drop_Items_Actions )
endfunction//===========================================================================
