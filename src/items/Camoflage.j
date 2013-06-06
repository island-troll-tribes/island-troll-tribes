
//===========================================================================
//TESH.scrollpos=30
//TESH.alwaysfold=0
function Trig_camoflage_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A040' ) ) then
        return false
    endif
    return true
endfunction

function Trig_camoflage_Func001Func001Func003C takes nothing returns boolean
    if ( ( GetDestructableTypeId(GetEnumDestructable()) == DEST_RUINS_TREE ) ) then
        return true
    endif
    if ( ( GetDestructableTypeId(GetEnumDestructable()) == DEST_SUPER_TREE ) ) then
        return true
    endif
    if ( ( GetDestructableTypeId(GetEnumDestructable()) == DEST_RUINS_TREE_CANOPY ) ) then
        return true
    endif
    if ( ( GetDestructableTypeId(GetEnumDestructable()) == DEST_SUPER_TREE_CANOPY ) ) then
        return true
    endif
    return false
endfunction

function Trig_camoflage_Func001Func001C takes nothing returns boolean
    if ( not ( IsDestructableAliveBJ(GetEnumDestructable()) == true ) ) then
        return false
    endif
    if ( not Trig_camoflage_Func001Func001Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_camoflage_Func001A takes nothing returns nothing
    if ( Trig_camoflage_Func001Func001C() ) then
        call masterCastAtTarget(GetSpellAbilityUnit(),GetSpellAbilityUnit(),0,0,'A03G',"invisibility")
    else
    endif
endfunction

function Trig_camoflage_Actions takes nothing returns nothing
    call EnumDestructablesInCircleBJ( 256, GetUnitLoc(GetSpellAbilityUnit()), function Trig_camoflage_Func001A )
endfunction

//===========================================================================
function InitTrig_camoflage takes nothing returns nothing
    set gg_trg_camoflage = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_camoflage, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( gg_trg_camoflage, Condition( function Trig_camoflage_Conditions ) )
    call TriggerAddAction( gg_trg_camoflage, function Trig_camoflage_Actions )
endfunction

//===========================================================================
