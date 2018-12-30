
//===========================================================================
//TESH.scrollpos=249
//TESH.alwaysfold=0
function Trig_grow_up_Func001Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == UNIT_ELK_ADOLESCENT ) ) then
        return false
    endif
    if ( not ( GetEnumUnit() == udg_growingPet ) ) then
        return false
    endif
    return true
endfunction

function Trig_grow_up_Func001Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == UNIT_JUNGLE_BEAR ) ) then
        return false
    endif
    if ( not ( GetEnumUnit() == udg_growingPet ) ) then
        return false
    endif
    return true
endfunction

function Trig_grow_up_Func001Func003C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == UNIT_JUNGLE_WOLF ) ) then
        return false
    endif
    if ( not ( GetEnumUnit() == udg_growingPet ) ) then
        return false
    endif
    return true
endfunction

function Trig_grow_up_Func001Func004Func001001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_HAWK_ADOLESCENT )
endfunction

function Trig_grow_up_Func001Func004Func002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'n00K' )
endfunction

function Trig_grow_up_Func001Func004Func003001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_FOREST_DRAGON )
endfunction

function Trig_grow_up_Func001Func004Func004001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == 'n00T' )
endfunction

function Trig_grow_up_Func001Func004Func005001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_BRONZE_DRAGON )
endfunction

function Trig_grow_up_Func001Func004Func006C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'n00K' ) ) then
        return false
    endif
    return true
endfunction

function Trig_grow_up_Func001Func004C takes nothing returns boolean
    if ( not ( IsUnitType(GetEnumUnit(), UNIT_TYPE_FLYING) == true ) ) then
        return false
    endif
    if ( not ( GetEnumUnit() == udg_growingPet ) ) then
        return false
    endif
    return true
endfunction

function Trig_grow_up_Func001A takes nothing returns nothing
    if ( Trig_grow_up_Func001Func001C() ) then
        call ReplaceUnitBJ( GetEnumUnit(), UNIT_ADULT_ELK, bj_UNIT_STATE_METHOD_RELATIVE )
        call GroupAddUnitSimple( GetLastReplacedUnitBJ(), udg_pets )
        call GroupRemoveUnitSimple( GetEnumUnit(), udg_midPets )
    else
    endif
    if ( Trig_grow_up_Func001Func002C() ) then
        call ReplaceUnitBJ( GetEnumUnit(), UNIT_ADULT_JUNGLE_BEAR, bj_UNIT_STATE_METHOD_RELATIVE )
        call GroupAddUnitSimple( GetLastReplacedUnitBJ(), udg_pets )
        call GroupRemoveUnitSimple( GetEnumUnit(), udg_midPets )
    else
    endif
    if ( Trig_grow_up_Func001Func003C() ) then
        call ReplaceUnitBJ( GetEnumUnit(), UNIT_ADULT_JUNGLE_WOLF, bj_UNIT_STATE_METHOD_RELATIVE )
        call GroupAddUnitSimple( GetLastReplacedUnitBJ(), udg_pets )
        call GroupRemoveUnitSimple( GetEnumUnit(), udg_midPets )
    else
    endif
    if ( Trig_grow_up_Func001Func004C() ) then
        if ( Trig_grow_up_Func001Func004Func001001() ) then
            call ReplaceUnitBJ( GetEnumUnit(), UNIT_ALPHA_HAWK, bj_UNIT_STATE_METHOD_DEFAULTS )
        else
            call DoNothing(  )
        endif
        if ( Trig_grow_up_Func001Func004Func002001() ) then
            call ReplaceUnitBJ( GetEnumUnit(), UNIT_GREATER_NETHER_DRAGON, bj_UNIT_STATE_METHOD_DEFAULTS )
        else
            call DoNothing(  )
        endif
        if ( Trig_grow_up_Func001Func004Func003001() ) then
            call ReplaceUnitBJ( GetEnumUnit(), UNIT_GREATER_FOREST_DRAGON, bj_UNIT_STATE_METHOD_DEFAULTS )
        else
            call DoNothing(  )
        endif
        if ( Trig_grow_up_Func001Func004Func004001() ) then
            call ReplaceUnitBJ( GetEnumUnit(), UNIT_GREATER_RED_DRAGON, bj_UNIT_STATE_METHOD_DEFAULTS )
        else
            call DoNothing(  )
        endif
        if ( Trig_grow_up_Func001Func004Func005001() ) then
            call ReplaceUnitBJ( GetEnumUnit(), UNIT_GREATER_BRONZE_DRAGON, bj_UNIT_STATE_METHOD_DEFAULTS )
        else
            call DoNothing(  )
        endif
        if ( Trig_grow_up_Func001Func004Func006C() ) then
            call SetUnitAbilityLevelSwapped( 'A03T', GetLastReplacedUnitBJ(), 6 )
            call SetUnitAbilityLevelSwapped( 'A03V', GetLastReplacedUnitBJ(), 6 )
            call SetUnitAbilityLevelSwapped( 'A03W', GetLastReplacedUnitBJ(), 6 )
            call SetUnitAbilityLevelSwapped( 'A03U', GetLastReplacedUnitBJ(), 6 )
            call SetUnitAbilityLevelSwapped( 'A03S', GetLastReplacedUnitBJ(), 6 )
        else
            call SetUnitAbilityLevelSwapped( 'A03T', GetLastReplacedUnitBJ(), IMinBJ(( GetRandomInt(0, 1) + GetUnitAbilityLevelSwapped('A03T', GetEnumUnit()) ), 6) )
            call SetUnitAbilityLevelSwapped( 'A03V', GetLastReplacedUnitBJ(), IMinBJ(( GetRandomInt(0, 1) + GetUnitAbilityLevelSwapped('A03V', GetEnumUnit()) ), 6) )
            call SetUnitAbilityLevelSwapped( 'A03W', GetLastReplacedUnitBJ(), IMinBJ(( GetRandomInt(0, 1) + GetUnitAbilityLevelSwapped('A03W', GetEnumUnit()) ), 6) )
            call SetUnitAbilityLevelSwapped( 'A03U', GetLastReplacedUnitBJ(), IMinBJ(( GetRandomInt(0, 1) + GetUnitAbilityLevelSwapped('A03U', GetEnumUnit()) ), 6) )
            call SetUnitAbilityLevelSwapped( 'A03S', GetLastReplacedUnitBJ(), IMinBJ(( GetRandomInt(0, 1) + GetUnitAbilityLevelSwapped('A03S', GetEnumUnit()) ), 6) )
        endif
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = UnitInventorySizeBJ(GetEnumUnit())
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call UnitRemoveItemFromSlotSwapped( GetForLoopIndexA(), GetEnumUnit() )
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        call GroupAddUnitSimple( GetLastReplacedUnitBJ(), udg_pets )
        call GroupRemoveUnitSimple( GetEnumUnit(), udg_midPets )
    else
    endif
endfunction

function Trig_grow_up_Func002Func001C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == UNIT_FAWN ) ) then
        return false
    endif
    if ( not ( GetEnumUnit() == udg_growingPet ) ) then
        return false
    endif
    return true
endfunction

function Trig_grow_up_Func002Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == UNIT_WOLF_PUP ) ) then
        return false
    endif
    if ( not ( GetEnumUnit() == udg_growingPet ) ) then
        return false
    endif
    return true
endfunction

function Trig_grow_up_Func002Func003C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == UNIT_BEAR_CUB ) ) then
        return false
    endif
    if ( not ( GetEnumUnit() == udg_growingPet ) ) then
        return false
    endif
    return true
endfunction

function Trig_grow_up_Func002Func004Func001001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_HAWK_HATCHLING )
endfunction

function Trig_grow_up_Func002Func004Func002001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_NETHER_DRAGON_HATCHLING )
endfunction

function Trig_grow_up_Func002Func004Func003001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_FOREST_DRAGON_HATCHLING )
endfunction

function Trig_grow_up_Func002Func004Func004001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_RED_DRAGON_HATCHLING )
endfunction

function Trig_grow_up_Func002Func004Func005001 takes nothing returns boolean
    return ( GetUnitTypeId(GetEnumUnit()) == UNIT_BRONZE_DRAGON_HATCHLING )
endfunction

function Trig_grow_up_Func002Func004Func009C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == UNIT_NETHER_DRAGON_HATCHLING ) ) then
        return false
    endif
    return true
endfunction

function Trig_grow_up_Func002Func004C takes nothing returns boolean
    if ( not ( IsUnitType(GetEnumUnit(), UNIT_TYPE_FLYING) == true ) ) then
        return false
    endif
    if ( not ( GetEnumUnit() == udg_growingPet ) ) then
        return false
    endif
    return true
endfunction

function Trig_grow_up_Func002A takes nothing returns nothing
    if ( Trig_grow_up_Func002Func001C() ) then
        call ReplaceUnitBJ( GetEnumUnit(), UNIT_ELK_ADOLESCENT, bj_UNIT_STATE_METHOD_RELATIVE )
        call GroupAddUnitSimple( GetLastReplacedUnitBJ(), udg_midPets )
        call getPlayersTroll(GetOwningPlayer(GetEnumUnit()))
        call ConditionalTriggerExecute( gg_trg_to_mid_spells )
        call GroupRemoveUnitSimple( GetEnumUnit(), udg_babyPets )
    else
    endif
    if ( Trig_grow_up_Func002Func002C() ) then
        call ReplaceUnitBJ( GetEnumUnit(), UNIT_JUNGLE_WOLF, bj_UNIT_STATE_METHOD_RELATIVE )
        call GroupAddUnitSimple( GetLastReplacedUnitBJ(), udg_midPets )
        call getPlayersTroll(GetOwningPlayer(GetEnumUnit()))
        call ConditionalTriggerExecute( gg_trg_to_mid_spells )
        call GroupRemoveUnitSimple( GetEnumUnit(), udg_babyPets )
    else
    endif
    if ( Trig_grow_up_Func002Func003C() ) then
        call ReplaceUnitBJ( GetEnumUnit(), UNIT_JUNGLE_BEAR, bj_UNIT_STATE_METHOD_RELATIVE )
        call GroupAddUnitSimple( GetLastReplacedUnitBJ(), udg_midPets )
        call getPlayersTroll(GetOwningPlayer(GetEnumUnit()))
        call ConditionalTriggerExecute( gg_trg_to_mid_spells )
        call GroupRemoveUnitSimple( GetEnumUnit(), udg_babyPets )
    else
    endif
    if ( Trig_grow_up_Func002Func004C() ) then
        if ( Trig_grow_up_Func002Func004Func001001() ) then
            call ReplaceUnitBJ( GetEnumUnit(), UNIT_HAWK_ADOLESCENT, bj_UNIT_STATE_METHOD_DEFAULTS )
        else
            call DoNothing(  )
        endif
        if ( Trig_grow_up_Func002Func004Func002001() ) then
            call ReplaceUnitBJ( GetEnumUnit(), 'n00K', bj_UNIT_STATE_METHOD_DEFAULTS )
        else
            call DoNothing(  )
        endif
        if ( Trig_grow_up_Func002Func004Func003001() ) then
            call ReplaceUnitBJ( GetEnumUnit(), UNIT_FOREST_DRAGON, bj_UNIT_STATE_METHOD_DEFAULTS )
        else
            call DoNothing(  )
        endif
        if ( Trig_grow_up_Func002Func004Func004001() ) then
            call ReplaceUnitBJ( GetEnumUnit(), 'n00T', bj_UNIT_STATE_METHOD_DEFAULTS )
        else
            call DoNothing(  )
        endif
        if ( Trig_grow_up_Func002Func004Func005001() ) then
            call ReplaceUnitBJ( GetEnumUnit(), UNIT_BRONZE_DRAGON, bj_UNIT_STATE_METHOD_DEFAULTS )
        else
            call DoNothing(  )
        endif
        call GroupAddUnitSimple( GetLastReplacedUnitBJ(), udg_midPets )
        call getPlayersTroll(GetOwningPlayer(GetEnumUnit()))
        call ConditionalTriggerExecute( gg_trg_to_mid_spells_flyer )
        if ( Trig_grow_up_Func002Func004Func009C() ) then
            call SetUnitAbilityLevelSwapped( 'A03T', GetLastReplacedUnitBJ(), 6 )
            call SetUnitAbilityLevelSwapped( 'A03V', GetLastReplacedUnitBJ(), 6 )
            call SetUnitAbilityLevelSwapped( 'A03W', GetLastReplacedUnitBJ(), 6 )
            call SetUnitAbilityLevelSwapped( 'A03U', GetLastReplacedUnitBJ(), 6 )
            call SetUnitAbilityLevelSwapped( 'A03S', GetLastReplacedUnitBJ(), 6 )
        else
            call SetUnitAbilityLevelSwapped( 'A03T', GetLastReplacedUnitBJ(), IMinBJ(( GetRandomInt(0, 1) + GetUnitAbilityLevelSwapped('A03T', GetEnumUnit()) ), 6) )
            call SetUnitAbilityLevelSwapped( 'A03V', GetLastReplacedUnitBJ(), IMinBJ(( GetRandomInt(0, 1) + GetUnitAbilityLevelSwapped('A03V', GetEnumUnit()) ), 6) )
            call SetUnitAbilityLevelSwapped( 'A03W', GetLastReplacedUnitBJ(), IMinBJ(( GetRandomInt(0, 1) + GetUnitAbilityLevelSwapped('A03W', GetEnumUnit()) ), 6) )
            call SetUnitAbilityLevelSwapped( 'A03U', GetLastReplacedUnitBJ(), IMinBJ(( GetRandomInt(0, 1) + GetUnitAbilityLevelSwapped('A03U', GetEnumUnit()) ), 6) )
            call SetUnitAbilityLevelSwapped( 'A03S', GetLastReplacedUnitBJ(), IMinBJ(( GetRandomInt(0, 1) + GetUnitAbilityLevelSwapped('A03S', GetEnumUnit()) ), 6) )
        endif
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = UnitInventorySizeBJ(GetEnumUnit())
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            call UnitRemoveItemFromSlotSwapped( GetForLoopIndexA(), GetEnumUnit() )
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        call GroupRemoveUnitSimple( GetEnumUnit(), udg_babyPets )
    else
    endif
endfunction

function Trig_grow_up_Actions takes nothing returns nothing
    call ForGroupBJ( udg_midPets, function Trig_grow_up_Func001A )
    call ForGroupBJ( udg_babyPets, function Trig_grow_up_Func002A )
endfunction

//===========================================================================
function InitTrig_grow_up takes nothing returns nothing
    set gg_trg_grow_up = CreateTrigger(  )
    call TriggerAddAction( gg_trg_grow_up, function Trig_grow_up_Actions )
endfunction

//===========================================================================
