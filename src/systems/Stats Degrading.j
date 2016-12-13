
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_stats_degrading_Conditions takes nothing returns boolean
    if ( not ( udg_STARTED == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_stats_degrading_Func001A takes nothing returns nothing
    local integer hD=udg_STAT_DEGRADE_AMOUNT
    local integer eD=udg_STAT_DEGRADE_AMOUNT
    local integer gD=udg_STAT_DEGRADE_AMOUNT
    
    if(UnitHasBuffBJ(GetEnumUnit(), 'B009') == true ) then//removes 3x degrade amount
        set hD=hD*3
        set eD=eD*3
        set gD=gD*3
    endif
    
    if(UnitHasBuffBJ(GetEnumUnit(), 'B01L') == true ) then//bonfire
        set gD=gD-2
    endif

    if(UnitHasBuffBJ(GetEnumUnit(), 'S000') == false) then
        if(UnitHasBuffBJ(GetEnumUnit(), DEST_SUPER_TREE) == true and UnitHasBuffBJ(GetEnumUnit(), 'B00E') == true and UnitHasBuffBJ(GetEnumUnit(), 'B00F') == true) then//all 3
            set eD=eD+GetRandomInt(1,9)
        endif
        if(UnitHasBuffBJ(GetEnumUnit(), 'B00F') == true and UnitHasBuffBJ(GetEnumUnit(), 'B00E') == true ) then//aurad and arrowed
            set eD=eD+GetRandomInt(1,6)
        endif
        if(UnitHasBuffBJ(GetEnumUnit(), DEST_SUPER_TREE) == true and UnitHasBuffBJ(GetEnumUnit(), 'B00E') == true ) then//depressed and arrowed
            set eD=eD+GetRandomInt(1,6)
        endif
        if(UnitHasBuffBJ(GetEnumUnit(), DEST_SUPER_TREE) == true and UnitHasBuffBJ(GetEnumUnit(), 'B00F') == true ) then//depressed and aurad
            set eD=eD+GetRandomInt(1,6)
        endif
        if(UnitHasBuffBJ(GetEnumUnit(), DEST_SUPER_TREE) == true ) then//depressed
            set eD=eD+GetRandomInt(1,3)
        endif
        if(UnitHasBuffBJ(GetEnumUnit(), 'B00F') == true ) then//depressed Aura
            set eD=eD+GetRandomInt(1,3)
        endif
        if(UnitHasBuffBJ(GetEnumUnit(), 'B00E') == true ) then//depressed Arrow
            set eD=eD+GetRandomInt(1,3)
        endif
        if(UnitHasBuffBJ(GetEnumUnit(), 'BCbf') == true ) then//Froze to bone
            set gD=gD+GetRandomInt(1,5)
        endif
    endif

    ///degrades
    call SetUnitLifeBJ( GetEnumUnit(),( GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) - (hD) ) )
    call SetUnitManaBJ( GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) - (eD) ) )
    
    //If not a mirror troll, drain heat
    if (not (  GetUnitTypeId(GetEnumUnit()) == UNIT_MIRROR_TROLL_CLONE   )) then
        call SetPlayerStateBJ( GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD, IMinBJ(( GetPlayerState(GetOwningPlayer(GetEnumUnit()), PLAYER_STATE_RESOURCE_GOLD) - (gD) ), udg_MAX_HEAT) )
    endif
    
    call ConditionalTriggerExecute( gg_trg_stat_display )
endfunction

function Trig_stats_degrading_Actions takes nothing returns nothing
    call ForGroup( udg_trolls, function Trig_stats_degrading_Func001A )
    //Clone Drain (if exists)
    if not (IsUnitGroupDeadBJ(udg_CloneTrolls) ) then
        //call DisplayTextToForce(GetPlayersAll(), "Clone Troll count: "+I2S(CountUnitsInGroup(udg_CloneTrolls)))
        call ForGroup( udg_CloneTrolls, function Trig_stats_degrading_Func001A )
    endif

    //call ConditionalTriggerExecute( gg_trg_update_boards )

    call ConditionalTriggerExecute( gg_trg_checkDeath )
endfunction

//===========================================================================
function InitTrig_stats_degrading takes nothing returns nothing
    set gg_trg_stats_degrading = CreateTrigger(  )

    //call TriggerRegisterTimerEventPeriodic( gg_trg_stats_degrading, udg_STAT_LOWER_INTERVAL )
    call TriggerAddCondition( gg_trg_stats_degrading, Condition( function Trig_stats_degrading_Conditions ) )
    call TriggerAddAction( gg_trg_stats_degrading, function Trig_stats_degrading_Actions )
endfunction

//===========================================================================
