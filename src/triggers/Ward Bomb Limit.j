
scope WardBomb initializer onInit
    
    globals
        constant real    RangeLimit = 500.
        constant integer MaxWards   = 10
    endglobals

    function FilterUnitWardBomb takes nothing returns boolean
        return GetUnitTypeId( GetFilterUnit() ) == UNIT_LIVING_CLAY
    endfunction

    function LimitWardBombs takes nothing returns boolean
        if CountUnitsInGroup( GetUnitsInRangeOfLocMatching( RangeLimit, GetUnitLoc(GetSummonedUnit()), Condition(function FilterUnitWardBomb) ) ) >= MaxWards then
            call SetItemCharges( CreateItem( UNIT_LIVING_CLAY, GetUnitX(GetSummonedUnit()), GetUnitY(GetSummonedUnit()) ), 1 )
            call RemoveUnit( GetSummonedUnit() )
        endif
        return false
    endfunction

    //===========================================================================
    private function onInit takes nothing returns nothing
        local trigger t = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SUMMON )
        call TriggerAddCondition( t, Condition( function LimitWardBombs ) )
    endfunction 

endscope

