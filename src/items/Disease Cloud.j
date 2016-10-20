
function DiseaseCloudActions takes nothing returns boolean
    local integer k
    local integer foodCount = 0
    local unit q
    local unit u
    local item i
    if GetSpellAbilityId() != SPELL_DISEASE then
        return false
    endif

    set q = GetSpellTargetUnit()
    set k = UnitInventorySize( q ) - 1

    loop
        exitwhen k < 0
            set i = UnitItemInSlot( q, k )
            if GetItemTypeId( i ) == ITEM_COOKED_MEAT then
                set foodCount = foodCount + GetItemCharges( i )
                call RemoveItem( i )
            endif
        set k = k - 1
    endloop
    if foodCount > 0 then
        loop
            exitwhen foodCount <= 0
            set i = CreateItem( ITEM_DISEASED_MEAT, 0, 0 )
            if foodCount > 9 then
                call SetItemCharges( i, 10 )
            else
                call SetItemCharges( i, foodCount )
            endif
            call UnitAddItem( q, i )
            set foodCount = foodCount - 10
        endloop
    endif

    set u = CreateUnit( GetOwningPlayer( GetSpellAbilityUnit() ), UNIT_DISEASE_CLOUD, GetUnitX( q ), GetUnitY( q ), 0 )
    call SetUnitAbilityLevel( u, 'A043', GetRandomInt( 1, 2 ) )
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
