
//===========================================================================
function Trig_to_mid_spells_flyer_Actions takes nothing returns nothing
    local player p=GetOwningPlayer(udg_parameterUnit)

    
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_TAME, p )//tame
    call SetPlayerAbilityAvailableBJ( true, SPELL_PET_RELEASE, p )//release
    call SetPlayerAbilityAvailableBJ( true, SPELL_PET_FOLLOW, p )//Follow
    call SetPlayerAbilityAvailableBJ( true, 'A01D', p )//stay
    call SetPlayerAbilityAvailableBJ( true, SPELL_PET_SLEEP, p )//sleep
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_ATTACK, p )//attack
    call SetPlayerAbilityAvailableBJ( true, SPELL_PET_SCOUT, p )//scout
    call SetPlayerAbilityAvailableBJ( true, 'A06R', p )//bring items
    call SetPlayerAbilityAvailableBJ( true, SPELL_PET_GO_TO_HATCHERY, p )//go to hatchery
    call SetPlayerAbilityAvailableBJ( true, SPELL_PET_DROP_ITEMS, p )//drop items
   set p=null
endfunction

//===========================================================================
function InitTrig_to_mid_spells_flyer takes nothing returns nothing
    set gg_trg_to_mid_spells_flyer = CreateTrigger(  )
    call TriggerAddAction( gg_trg_to_mid_spells_flyer, function Trig_to_mid_spells_flyer_Actions )
endfunction

//===========================================================================
