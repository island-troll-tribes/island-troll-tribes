
scope GiveStartingHeat initializer onInit

    function EnumDoHeatAndRemoveActions takes nothing returns nothing
        if GetPlayerSlotState( GetOwningPlayer( GetEnumUnit() ) ) != PLAYER_SLOT_STATE_PLAYING then
            call RemoveUnit( GetEnumUnit() )
        else
            call SetPlayerState( GetOwningPlayer( GetEnumUnit() ), PLAYER_STATE_RESOURCE_GOLD, 100 )
        endif
    endfunction

    function GiveStartingHeatAndRemoveEmptyPlayers takes nothing returns boolean
        if not udg_CLASSIC_MODE then
            return false
        endif
        call ForGroup( udg_trolls, function EnumDoHeatAndRemoveActions )
        return false
    endfunction

    //===========================================================================
    private function onInit takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterTimerEventSingle( t, TIME_NOOBTIME_STARTS_AT )
        call TriggerAddCondition( t, Condition( function GiveStartingHeatAndRemoveEmptyPlayers ) )
    endfunction

endscope
