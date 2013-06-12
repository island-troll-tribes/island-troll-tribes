
function removeHerbs takes unit u returns nothing
    call removeItem(u,ITEM_RIVER_STEM)
    call removeItem(u,ITEM_RIVER_ROOT)
    call removeItem(u,ITEM_BLUE_HERB)
    call removeItem(u,ITEM_ORANGE_HERB)
    call removeItem(u,ITEM_YELLOW_HERB)
    call removeItem(u,ITEM_PURPLE_HERB)
    call removeItem(u,ITEM_BUTSU)
endfunction


function Trig_mixing_pot_stuff_Actions takes nothing returns nothing
    local unit u=GetSpellAbilityUnit()
    local integer rivStem
    local integer rivRoot
    local integer blu
    local integer oran
    local integer yell
    local integer butsu
    local integer purp
    local boolean spec
    local integer specCount
    local integer specTypes=0
    local item i
    if GetSpellAbilityId() == 'A05A'  then
        set rivStem=countItem(u,ITEM_RIVER_STEM)
        set rivRoot=countItem(u,ITEM_RIVER_ROOT)
        set blu=countItem(u,ITEM_BLUE_HERB)
        set oran=countItem(u,ITEM_ORANGE_HERB)
        set yell=countItem(u,ITEM_YELLOW_HERB)
        set butsu=countItem(u,ITEM_BUTSU)
        set purp=countItem(u,ITEM_PURPLE_HERB)
        set spec=(oran>0 or purp>0 or yell>0 or blu>0)
        set specCount=(blu+yell+oran+purp)

        if(purp>0) then
           set specTypes=specTypes+1
        endif
        if(blu>0) then
           set specTypes=specTypes+1
        endif
        if(yell>0) then
           set specTypes=specTypes+1
        endif
        if(oran>0) then
           set specTypes=specTypes+1
        endif
        if(specTypes>2 and specCount>3) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_ESSENCE_BEES, u ) // EoB
            return
        endif
        if((yell>2 and blu>2) or (oran>2 and purp>2)) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_POTION_TWIN_ISLANDS, u ) // Twin Islands
            return
        endif
        if(spec and rivStem>1 and butsu>1) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_NETHER_POTION, u ) // Nether
            return
        endif
        if(spec and rivRoot>2 and butsu>0) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_DRUNKS_POTION, u ) // Drunk
            return
        endif
        if(specCount>2 and butsu>0) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_FERVER_POTION, u ) // Fervor
            return
        endif
        if(specTypes>1 and specCount>3 and rivRoot>0) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_DISEASE_POTION, u ) //disease pot
            return
        endif
        if(specTypes>1 and specCount>3 and rivStem>1) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_ACID_BOMB, u ) //acid bomb
            return
        endif
        if(rivStem>0 and rivRoot>0 and butsu==2) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_DARK_ROCK, u ) // Dark Rock
            return
        endif
        if(rivStem>5) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_ANABOLIC_POTION, u ) // Anabolic
            return
        endif
        if(rivStem>2 and spec and rivRoot>0) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_ELEMENTAL_SHIELD_POTION, u ) // Elemental
            return
        endif
//manas
        if(rivStem>1 and butsu>2) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_MANA_POTION_IV, u )
            return
        endif
        if(rivStem>1 and butsu>1) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_MANA_POTION_III, u )
            return
        endif
        if(rivStem>0 and butsu>1) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_MANA_POTION_II, u )
            return
        endif
        if(rivStem>0 and butsu>0) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_MANA_POTION_I, u )
            return
        endif
///healing
        if(butsu>2 and rivRoot>1) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_HEALING_POTION_IV, u )
            return
        endif
        if(butsu>1 and rivRoot>1) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_HEALING_POTION_III, u )
            return
        endif
        if(butsu>1 and rivRoot>0) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_HEALING_POTION_II, u )
            return
        endif
        if(butsu>0 and rivRoot>0) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_HEALING_POTION_I, u )
            return
        endif
//essences
        if ((yell==2 and blu==2) or (oran==2 and purp==2) and specCount==4) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_GEM_OF_KNOWLEDGE, u ) // GoK
            return
        endif
        if (specCount>1) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_ANTI_MAGIC_POTION, u ) // Anit Magic
            return
        endif
        if ( rivStem>1 ) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_SPIRIT_WIND, u ) // Wind
            return
        endif
        if ( rivRoot>1 ) then
            call removeHerbs(u)
            call UnitAddItemByIdSwapped( ITEM_SPIRIT_WATER, u ) // Water
            return
        endif
        if(butsu>2) then
            call removeHerbs(u)
            set i = UnitAddItemByIdSwapped( ITEM_CURE_ALL, u ) // CureAll
            if (butsu>5) then
                call SetItemCharges( i, 2 )
            else
                call SetItemCharges( i, 1 )
            endif
            set i = null
            return
        endif
    endif
endfunction

function InitTrig_mixing_pot_stuff takes nothing returns nothing
    set gg_trg_mixing_pot_stuff = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_mixing_pot_stuff, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddAction( gg_trg_mixing_pot_stuff, function Trig_mixing_pot_stuff_Actions )
endfunction

