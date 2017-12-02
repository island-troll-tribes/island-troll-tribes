//TESH.scrollpos=40
//TESH.alwaysfold=0
function mashSilence takes nothing returns boolean
    if ( not ( GetRandomPercentageBJ() <= 21.00 ) ) then
        return false
    endif
    return true
endfunction

function checkmashertroll takes nothing returns boolean
    if ( ( GetUnitTypeId(GetAttackedUnitBJ()) == UNIT_MAGE ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetAttackedUnitBJ()) == UNIT_ELEMENTALIST ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetAttackedUnitBJ()) == UNIT_HYPNOTIST ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetAttackedUnitBJ()) == UNIT_DEMENTIA_MASTER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetAttackedUnitBJ()) == UNIT_PRIEST ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetAttackedUnitBJ()) == UNIT_BOOSTER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetAttackedUnitBJ()) == UNIT_MASTER_HEALER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetAttackedUnitBJ()) == UNIT_SAGE ) ) then
        return true
    endif
    return false
endfunction

function mashhit takes nothing returns nothing
    local unit attack = GetEventDamageSource()
    local unit defend = GetTriggerUnit()
    local integer attacker = GetStoredInteger(udg_attackerCache,"attacker.w3v",I2S(GetPlayerId(GetOwningPlayer(attack))))
    local integer attacked = GetStoredInteger(udg_attackedCache,"attacked.w3v",I2S(GetPlayerId(GetOwningPlayer(defend))))

    if ( IsUnitType(attack, UNIT_TYPE_HERO) == true ) then
        if (attacker!=0 and attacked!=0) then
            call StoreInteger(udg_attackerCache,"attacker.w3v","Player "+I2S(GetPlayerId(GetOwningPlayer(attack))),0)
            call StoreInteger(udg_attackedCache,"attacked.w3v","Player "+I2S(GetPlayerId(GetOwningPlayer(defend))),0)
            if ( mashSilence() ) then
                call masterCastAtCaster(attack,defend,0,0,'A064',"soulburn")
            endif
            if ( checkmashertroll() ) then
                call masterCastAtCaster(attack,defend,0,0,'A065',"manaburn")
            endif

        endif
    endif
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Trig_MageMasher_Conditions takes nothing returns boolean
    if ( not ( UnitHasItemOfTypeBJ(GetAttacker(), ITEM_MAGE_MASHER) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_MageMasher_Actions takes nothing returns nothing
    local trigger detecthit = CreateTrigger()
    local unit attacker=GetAttacker()
    local unit attacked=GetAttackedUnitBJ()
    if (udg_attackerCache==null) then
        set udg_attackerCache = InitGameCacheBJ( "attacker.w3v" )
        set udg_attackedCache = InitGameCacheBJ( "attacked.w3v" )
    endif

    call StoreInteger(udg_attackerCache,"attacker.w3v",I2S(GetPlayerId(GetOwningPlayer(attacker))),1)

    if  (GetStoredInteger(udg_attackedCache,"attacked.w3v",I2S(GetPlayerId(GetOwningPlayer(attacked))))==0) then

        call StoreInteger(udg_attackedCache,"attacked.w3v",I2S(GetPlayerId(GetOwningPlayer(attacked))),1)
        call TriggerRegisterUnitEvent( detecthit, attacked, EVENT_UNIT_DAMAGED )
        call TriggerAddAction(detecthit, function mashhit)

    endif
    call PolledWait(.35)
    //Units have Attack Damage dealt at .330 seconds into animation
    //.35 is just in case they are debuffed.
    call StoreInteger(udg_attackedCache,"attacked.w3v",I2S(GetPlayerId(GetOwningPlayer(attacked))),0)
    call StoreInteger(udg_attackerCache,"attacker.w3v",I2S(GetPlayerId(GetOwningPlayer(attacker))),0)
    set detecthit = null
    call DisableTrigger(detecthit)
    call DestroyTrigger(detecthit)

endfunction

//===========================================================================
function InitTrig_MageMasher takes nothing returns nothing
    set gg_trg_MageMasher = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_MageMasher, EVENT_PLAYER_UNIT_ATTACKED )
    call TriggerAddCondition( gg_trg_MageMasher, Condition( function Trig_MageMasher_Conditions ) )
    call TriggerAddAction( gg_trg_MageMasher, function Trig_MageMasher_Actions )
endfunction
