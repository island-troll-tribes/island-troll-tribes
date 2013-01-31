
//***************************************************************************
//*
//*  Map Item Tables
//*
//***************************************************************************

library ItemTables
    function ItemTable000000_DropItems takes nothing returns nothing
        local widget  trigWidget = null
        local unit    trigUnit   = null
        local integer itemID     = 0
        local boolean canDrop    = true

        set trigWidget = bj_lastDyingWidget
        if (trigWidget == null) then
            set trigUnit = GetTriggerUnit()
        endif

        if (trigUnit != null) then
            set canDrop = not IsUnitHidden(trigUnit)
            if (canDrop and GetChangingUnit() != null) then
                set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
            endif
        endif

        if (canDrop) then
            // Item set 0
            call RandomDistReset(  )
            call RandomDistAddItem( 'I04K', 100 )
            set itemID = RandomDistChoose(  )
            if (trigUnit != null) then
                call UnitDropItem( trigUnit, itemID )
            else
                call WidgetDropItem( trigWidget, itemID )
            endif

        endif

        set bj_lastDyingWidget = null
        call DestroyTrigger(GetTriggeringTrigger())
    endfunction
endlibrary
