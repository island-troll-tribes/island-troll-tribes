
function DiseaseCloudActions takes nothing returns boolean
    local integer k
    local integer charges = 0
    local real x
    local real y
    local unit q
    local unit u
    local item i

    if GetSpellAbilityId() != SPELL_DISEASE then
        return false
    endif

    set q = GetSpellTargetUnit()
    set k = UnitInventorySize( q ) - 1
    set x = GetUnitX( q )
    set y = GetUnitY( q )

    loop
        exitwhen k < 0
        set i = UnitItemInSlot( q, k )
        if GetItemTypeId( i ) == ITEM_COOKED_MEAT then
            set charges = GetItemCharges( i )
            call RemoveItem( i )
            set i = CreateItem( ITEM_DISEASED_MEAT, x, y )
            call SetItemCharges( i, charges ) 
            call UnitStackItem( q, i )
        endif
        set k = k - 1
    endloop

    set u = CreateUnit( GetOwningPlayer( GetSpellAbilityUnit() ), UNIT_DISEASE_CLOUD, GetUnitX( q ), GetUnitY( q ), 0 )
    call UnitApplyTimedLife( u, 'BTLF', 3 )

    set u = null
    set q = null
    set i = null

    return false
endfunction

function InitTrig_disease_cloud takes nothing returns nothing
    local trigger t = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( t, Condition( function DiseaseCloudActions ) )
endfunction
