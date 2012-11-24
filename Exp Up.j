
//===========================================================================
//TESH.scrollpos=49
//TESH.alwaysfold=0
function Trig_exp_up_Func004C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_GATHERER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_HERB_MASTER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_RADAR_GATHERER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_OMNIGATHERER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_SCOUT ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_OBSERVER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_RADAR_SCOUT ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_SPY ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_MAGE ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_HYPNOTIST ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_ELEMENTALIST ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_DEMENTIA_MASTER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_PRIEST ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_BOOSTER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_MASTER_HEALER ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetKillingUnitBJ()) == UNIT_SAGE ) ) then
        return true
    endif
    return false
endfunction

function Trig_exp_up_Conditions takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetKillingUnitBJ(), 'Bakb') == true ) ) then
        return false
    endif
    if ( not ( IsUnitEnemy(GetKillingUnitBJ(), GetOwningPlayer(GetDyingUnit())) == true ) ) then
        return false
    endif
    if ( not Trig_exp_up_Func004C() ) then
        return false
    endif
    return true
endfunction


function Trig_exp_up_Actions takes nothing returns nothing
    if IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO)==true then
        call AddHeroXPSwapped( ( 150 * GetUnitLevel(GetDyingUnit()) ), GetKillingUnitBJ(), true )
    else
        call AddHeroXPSwapped( ( 50 * GetUnitLevel(GetDyingUnit()) ), GetKillingUnitBJ(), true )
    endif
endfunction

//===========================================================================
function InitTrig_exp_up takes nothing returns nothing
    set gg_trg_exp_up = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_exp_up, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_exp_up, Condition( function Trig_exp_up_Conditions ) )
    call TriggerAddAction( gg_trg_exp_up, function Trig_exp_up_Actions )
endfunction

//===========================================================================
