
//===========================================================================
//TESH.scrollpos=9
//TESH.alwaysfold=0
function removeItems takes unit u returns nothing
    
    local integer sInt=1
    local integer stInt=6
    loop
        exitwhen sInt > stInt
        call RemoveItem( UnitItemInSlotBJ(u, sInt) )
        set sInt = sInt + 1
    endloop

endfunction


function Trig_hatchery_stuff_Actions takes nothing returns nothing
    local unit u=GetSpellAbilityUnit()
    local integer speed
    local integer move
    local integer gather
    local integer health
    local integer inventory
    local integer temp
    local unit q

    if (  GetSpellAbilityId() == 'A03Q' ) then

    if (countItem(u,ITEM_HAWK_EGG)==1) then //Hawk Egg is exactly one
    set speed=countItem(u,ITEM_BUTSU)+countItem(u,ITEM_STICK)//Butsu or stick
    set move=countItem(u,ITEM_CLAY_BALL)+countItem(u,ITEM_SPIRIT_WIND)//clay or spirit of wind
    set gather=countItem(u,ITEM_BLUE_HERB)+countItem(u,ITEM_ORANGE_HERB)+countItem(u,ITEM_PURPLE_HERB)+countItem(u,ITEM_YELLOW_HERB)//Any colored herb
    set health=countItem(u,ITEM_JUNGLE_BEAR_HIDE)+countItem(u,ITEM_ELK_HIDE)+countItem(u,ITEM_JUNGLE_WOLF_HIDE)//any hide
    set inventory=countItem(u,ITEM_THISTLES)+countItem(u,ITEM_MUSHROOM)//thistle shroom

    set temp=countItem(u,ITEM_DARK_ROCK)//dark rock
    set speed=speed+temp
    set move=move+temp
    set gather=gather+temp
    set health=health+temp
    set inventory=inventory+temp

    set temp=(speed+move+gather+health+inventory+countItem(u,ITEM_TINDER)+countItem(u,ITEM_ACORN)+countItem(u,ITEM_SPIRIT_WATER)+countItem(u,ITEM_MANA_CRYSTAL))
    if (temp>4) then

    if(speed>4 and move>4 and gather>4 and health>4 and inventory>4) then
    set q=CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE),UNIT_NETHER_DRAGON_HATCHLING,GetUnitLoc(u),0.0)//nether drake
    elseif(inventory>2) then
    set q=CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE),UNIT_FOREST_DRAGON_HATCHLING,GetUnitLoc(u),0.0)//forest
    elseif(move>2) then
    set q=CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE),UNIT_RED_DRAGON_HATCHLING,GetUnitLoc(u),0.0)//red
    elseif(health>2) then
    set q=CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE),UNIT_BRONZE_DRAGON_HATCHLING,GetUnitLoc(u),0.0) //bronze
   else
    set q=CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE),UNIT_HAWK_HATCHLING,GetUnitLoc(u),0.0) //hawk
    endif
    call removeItems(u)



    //call UnitAddAbilityBJ( 'A03T', q )//gather radius
    //call TriggerSleepAction( 1.00 )
    //call UnitAddAbilityBJ( 'A03V', q )//ealth
    //call TriggerSleepAction( 1.00 )
    //call UnitAddAbilityBJ( 'A03W', q )//inventory
    //call TriggerSleepAction( 1.00 )
    //call UnitAddAbilityBJ( 'A03U', q )//move radius
    //call TriggerSleepAction( 1.00 )
    //call UnitAddAbilityBJ( 'A03S', q )//speed

    call SetUnitAbilityLevelSwapped( 'A03T', q, IMinBJ(IMaxBJ(1,gather),6) )
    call PolledWait( 1.00 )
    call SetUnitAbilityLevelSwapped( 'A03V', q, IMinBJ(IMaxBJ(1,health),6) )
    call PolledWait( 1.00 )
    call SetUnitAbilityLevelSwapped( 'A03W', q, IMinBJ(IMaxBJ(1,inventory),6) )
    call PolledWait( 1.00 )
    call SetUnitAbilityLevelSwapped( 'A03U', q, IMinBJ(IMaxBJ(1,move),6) )
    call PolledWait( 1.00 )
    call SetUnitAbilityLevelSwapped( 'A03S', q, IMinBJ(IMaxBJ(1,speed),6) )

    endif
    endif
    endif
endfunction

//===========================================================================
function InitTrig_hatchery_stuff takes nothing returns nothing
    set gg_trg_hatchery_stuff = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_hatchery_stuff, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddAction( gg_trg_hatchery_stuff, function Trig_hatchery_stuff_Actions )
endfunction

//===========================================================================
