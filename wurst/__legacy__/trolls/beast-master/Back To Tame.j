
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_back_to_tame_Actions takes nothing returns nothing
    local player p=GetOwningPlayer(udg_parameterUnit)
    call PolledWait( 1.50 )
    call SetPlayerAbilityAvailableBJ( true, SPELL_PET_TAME, p )//tame
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_RELEASE, p )//release
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_FOLLOW, p )//Follow
    call SetPlayerAbilityAvailableBJ( false, 'A01D', p )//stay
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_SLEEP, p )//sleep
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_ATTACK, p )//attack
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_SCOUT, p )//scout
    call SetPlayerAbilityAvailableBJ( false, 'A06R', p )//bring items
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_GO_TO_HATCHERY, p )//go to hatchery
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_DROP_ITEMS, p )//drop items
    set p=null
endfunction

//===========================================================================
function InitTrig_back_to_tame takes nothing returns nothing
    set gg_trg_back_to_tame = CreateTrigger(  )
    call TriggerAddAction( gg_trg_back_to_tame, function Trig_back_to_tame_Actions )
endfunction

//===========================================================================
