
//***************************************************************************
//*
//*  Destructable Item Tables
//*
//***************************************************************************

library DestructableItemTables
    function Doodad000881_DropItems takes nothing returns nothing
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
            call RandomDistAddItem( ITEM_HEALING_POTION_IV, 20 )
            call RandomDistAddItem( -1, 80 )
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

    function Doodad001476_DropItems takes nothing returns nothing
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
            call RandomDistAddItem( ITEM_HEALING_POTION_IV, 20 )
            call RandomDistAddItem( -1, 80 )
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

    function Doodad001928_DropItems takes nothing returns nothing
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
            call RandomDistAddItem( ITEM_ULTRA_POISON_SPEAR, 5 )
            call RandomDistAddItem( -1, 95 )
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

    function Doodad002625_DropItems takes nothing returns nothing
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
            call RandomDistAddItem( ITEM_STEEL_AXE, 49 )
            call RandomDistAddItem( ITEM_STEEL_INGOT, 50 )
            call RandomDistAddItem( -1, 1 )
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

    function Doodad002635_DropItems takes nothing returns nothing
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
            call RandomDistAddItem( ITEM_STEEL_AXE, 49 )
            call RandomDistAddItem( ITEM_STEEL_INGOT, 50 )
            call RandomDistAddItem( -1, 1 )
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

    function Doodad002881_DropItems takes nothing returns nothing
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
            call RandomDistAddItem( ITEM_ULTRA_POISON_SPEAR, 5 )
            call RandomDistAddItem( -1, 95 )
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

    function Doodad002882_DropItems takes nothing returns nothing
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
            call RandomDistAddItem( ITEM_HEALING_POTION_IV, 20 )
            call RandomDistAddItem( -1, 80 )
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

    function Doodad004327_DropItems takes nothing returns nothing
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
            call RandomDistAddItem( ITEM_HEALING_POTION_IV, 20 )
            call RandomDistAddItem( -1, 80 )
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