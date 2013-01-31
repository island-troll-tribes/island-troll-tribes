
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_disease_cloud_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A041'
endfunction

function checkCloud takes nothing returns boolean
    return GetUnitTypeId(GetFilterUnit()) == UNIT_DISEASE_CLOUD
endfunction

function Trig_disease_cloud_Actions takes nothing returns nothing

//normal
local unit caster = GetSpellAbilityUnit()
local unit q = GetSpellTargetUnit()

//for testing:
//local unit caster = GetSpellTargetUnit()
//local unit q = GetSpellAbilityUnit()

local unit u = CreateUnit(GetOwningPlayer(caster),UNIT_DISEASE_CLOUD,GetUnitX(q),GetUnitY(q),0)
local integer endInt = UnitInventorySize(q)
local integer temp=1
local integer tempInt
local integer foodcount = 0
local item i

//change food

loop
    exitwhen temp > endInt
    if ( GetItemTypeId(UnitItemInSlotBJ(q, temp)) == ITEM_COOKED_MEAT ) then
        set foodcount = foodcount+GetItemCharges(UnitItemInSlotBJ(q, temp))
        call RemoveItem( UnitItemInSlotBJ(q, temp) )
    endif
    set temp = temp + 1
endloop

if foodcount > 0 then
    loop
        exitwhen foodcount <=0
        set i = CreateItem(ITEM_DISEASED_MEAT,0,0)
        if (foodcount>9) then
            call SetItemCharges( i, 10 )
        else
            call SetItemCharges( i, foodcount )
        endif
        call UnitAddItem(q,i)
        set foodcount=foodcount-10
    endloop
endif

    

call SetUnitAbilityLevel( u, 'A043', GetRandomInt(1,2) )
call UnitApplyTimedLife(u, 'BTLF', 3)

set caster = null
set q = null
set u = null
set i = null
endfunction

//===========================================================================
function InitTrig_disease_cloud takes nothing returns nothing
    set gg_trg_disease_cloud = CreateTrigger(  )
    //EVENT_PLAYER_UNIT_SPELL_EFFECT
    //EVENT_PLAYER_UNIT_SPELL_CHANNEL <-- old one which made the glitch of having the effect with no item loss.
    call TriggerRegisterAnyUnitEventBJ( gg_trg_disease_cloud, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_disease_cloud, Condition( function Trig_disease_cloud_Conditions ) )
    call TriggerAddAction( gg_trg_disease_cloud, function Trig_disease_cloud_Actions )
endfunction

//===========================================================================
