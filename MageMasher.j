
//===========================================================================
//TESH.scrollpos=21
//TESH.alwaysfold=0
library MageMasher initializer InitTrig_MageMasher requires ID, DUMMYLIB
    
    globals
        integer array MAGE_MASHER_CLASSES
        integer MAGE_MASHER_CLASSES_UB
        
        private integer array playerDeadOnPlayer
        private trigger t = CreateTrigger()
        private trigger u = CreateTrigger()
    endglobals
            
    function CheckMasherTroll takes nothing returns boolean
        local integer uid = GetUnitTypeId(GetTriggerUnit())
        local integer i = 0
        loop
            exitwhen i > MAGE_MASHER_CLASSES_UB
                if (uid == MAGE_MASHER_CLASSES[i]) then
                    return true
                endif
            set i = i + 1
        endloop
        return false
    endfunction
    
    function Trig_MageMasher_Conditions takes nothing returns boolean
        local integer index = 0
        local item    indexItem
        local boolean hasMM = false
            
        loop
            set indexItem = UnitItemInSlot(GetAttacker(), index)
            if (indexItem != null) and (GetItemTypeId(indexItem) == ITEM_MAGE_MASHER) then
                return true
            endif

            set index = index + 1
            exitwhen index >= bj_MAX_INVENTORY
        endloop
        
        return false
    endfunction

    function Trig_MageMasher_Actions takes nothing returns nothing
        local unit attacker = GetAttacker()
        local unit defender = GetTriggerUnit()
        
        // Silence Percentage
        if ( GetRandomReal(0, 100) <= 21.00 ) then
            call masterCastAtCaster(attacker,defender,0,0,'A064',"soulburn") 
            
        endif
        
        // manaburn percentage
        if ( GetRandomReal(0, 100) <= 29.00 and CheckMasherTroll() ) then
            call masterCastAtCaster(attacker,defender,0,0,'A065',"manaburn")
        endif
    endfunction
    
    function MageMasher_RegisterUnit takes nothing returns nothing
        if checkTroll( GetTriggerUnit() ) then
            call TriggerRegisterUnitEvent( u, GetTriggerUnit(), EVENT_UNIT_DAMAGED )
        endif
    endfunction

    //===========================================================================
    function InitTrig_MageMasher takes nothing returns nothing
        local region r = CreateRegion()
        call RegionAddRect( r, bj_mapInitialPlayableArea )
        
        call TriggerRegisterEnterRegion( t, r, null )
        call TriggerAddAction( t, function MageMasher_RegisterUnit )
        
        call TriggerAddCondition( u, Condition( function Trig_MageMasher_Conditions ) )
        call TriggerAddAction( u, function Trig_MageMasher_Actions )
        
        set MAGE_MASHER_CLASSES[0] = UNIT_MAGE
        set MAGE_MASHER_CLASSES[1] = UNIT_ELEMENTALIST
        set MAGE_MASHER_CLASSES[2] = UNIT_HYPNOTIST
        set MAGE_MASHER_CLASSES[3] = UNIT_DEMENTIA_MASTER
        set MAGE_MASHER_CLASSES[4] = UNIT_PRIEST
        set MAGE_MASHER_CLASSES[5] = UNIT_BOOSTER
        set MAGE_MASHER_CLASSES[6] = UNIT_MASTER_HEALER
        set MAGE_MASHER_CLASSES[7] = UNIT_SAGE
        set MAGE_MASHER_CLASSES_UB = 7
    endfunction
endlibrary//===========================================================================
