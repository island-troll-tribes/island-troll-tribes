
//===========================================================================
//TESH.scrollpos=-1
//TESH.alwaysfold=1
library KDGCounter initializer init_KDG

    ////////////////////////////////////////////////////////////////
    /// KDG counter
    ////////////////////////////////////////////////////////////////
    
    globals
    
        integer array playerKills [12]
        integer array playerDeaths [12]
        integer array playerGold [12] 
        integer array currentGold [12]
        
        ittEvent deaths
        ittEvent kills
        ittEvent gold
    
    endglobals
    
    function checkMageKill takes unit u returns nothing // only for mana / heat depletion AKA MAGE!
        if (GetUnitTypeId(u)==UNIT_HYPNOTIST or GetUnitTypeId(u)==UNIT_DEMENTIA_MASTER or GetUnitTypeId(u)==UNIT_MAGE or GetUnitTypeId(u)==UNIT_ELEMENTALIST ) and not udg_NOOB_TIME then
            set playerKills [GetPlayerId (GetOwningPlayer (u))] = playerKills [GetPlayerId (GetOwningPlayer (u))] + 1
        endif
    endfunction
    
    function countKD takes nothing returns nothing
        local unit killer = GetKillingUnitBJ()
        if (IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO)) then
            if not (killer == null) and not (IsUnitAlly( killer, GetOwningPlayer( GetTriggerUnit() ) )) then
                set playerKills [GetPlayerId (GetOwningPlayer (killer))] = playerKills [GetPlayerId (GetOwningPlayer (killer))] + 1
            endif
            set playerDeaths [GetPlayerId (GetOwningPlayer (GetTriggerUnit()))] = playerDeaths [GetPlayerId (GetOwningPlayer (GetTriggerUnit()))] + 1
        endif
    endfunction

    function init_KD_counter takes nothing returns nothing
        local integer i=0
        local trigger t=CreateTrigger ()
        loop
            exitwhen i>11
                if GetPlayerController(Player(i)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
                    call TriggerRegisterPlayerUnitEventSimple( t, Player(i), EVENT_PLAYER_UNIT_DEATH )
                endif
            set i=i+1
        endloop
        call TriggerAddAction (t, function countKD)
    endfunction
    
    function addGold takes nothing returns nothing
        local player p = GetOwningPlayer(GetTriggerUnit())
        call TriggerSleepAction(0.01)
        set playerGold[GetPlayerId(p)] = playerGold[GetPlayerId(p)]+GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)-currentGold[GetPlayerId(p)]
        set currentGold[GetPlayerId(p)] = GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)
    endfunction
    
    function setCurrentGold takes nothing returns nothing
        local player p = GetOwningPlayer( GetBuyingUnit() )
        set currentGold[GetPlayerId(p)] = GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)
    endfunction
    
    function init_countGoldGain takes nothing returns nothing
        local trigger sell = CreateTrigger()
        local trigger buy = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ( buy, EVENT_PLAYER_UNIT_SELL_ITEM )
        call TriggerAddAction( buy, function setCurrentGold )
        call TriggerRegisterAnyUnitEventBJ( sell, EVENT_PLAYER_UNIT_PAWN_ITEM )
        call TriggerAddAction( sell, function addGold )
    endfunction
    
    private function initialize_variables takes nothing returns nothing
        local integer i=0
        
        set deaths = ittEvent.create("Deaths", TYPE_INT)
        set kills = ittEvent.create("Kills", TYPE_INT)
        set gold = ittEvent.create("Gold", TYPE_INT)
        
        loop
            exitwhen i>11
                set playerKills[i]=0
                set playerDeaths[i]=0
                set playerGold[i]=0
            set i=i+1
        endloop
        
    endfunction
    
    private function init_KDG takes nothing returns nothing
        local timer t = CreateTimer()
        call TimerStart( t, 1.5, false, function initialize_variables )
    endfunction
    
endlibrary//===========================================================================
