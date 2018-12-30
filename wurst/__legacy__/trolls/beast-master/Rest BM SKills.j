
//===========================================================================
//TESH.scrollpos=41
//TESH.alwaysfold=0
function Trig_Rest_BM_SKills_Func001Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetEnumUnit()) == GetOwningPlayer(udg_parameterUnit) ) ) then
        return false
    endif
    return true
endfunction

function Trig_Rest_BM_SKills_Func001A takes nothing returns nothing
    if ( Trig_Rest_BM_SKills_Func001Func001C() ) then

            call TriggerExecute( gg_trg_Baby_Spells )
    else
    endif
endfunction

function Trig_Rest_BM_SKills_Func002Func001Func001C takes nothing returns boolean
    if ( not ( IsUnitType(GetEnumUnit(), UNIT_TYPE_FLYING) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Rest_BM_SKills_Func002Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetEnumUnit()) == GetOwningPlayer(udg_parameterUnit) ) ) then
        return false
    endif
    return true
endfunction

function Trig_Rest_BM_SKills_Func002A takes nothing returns nothing
    if ( Trig_Rest_BM_SKills_Func002Func001C() ) then
        if ( Trig_Rest_BM_SKills_Func002Func001Func001C() ) then
            call ConditionalTriggerExecute( gg_trg_to_mid_spells_flyer )
        else
            call ConditionalTriggerExecute( gg_trg_to_mid_spells )
        endif
    else
    endif
endfunction

function Trig_Rest_BM_SKills_Func003Func001Func001C takes nothing returns boolean
    if ( not ( IsUnitType(GetEnumUnit(), UNIT_TYPE_FLYING) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Rest_BM_SKills_Func003Func001C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetEnumUnit()) == GetOwningPlayer(udg_parameterUnit) ) ) then
        return false
    endif
    return true
endfunction

function Trig_Rest_BM_SKills_Func003A takes nothing returns nothing
    if ( Trig_Rest_BM_SKills_Func003Func001C() ) then
        if ( Trig_Rest_BM_SKills_Func003Func001Func001C() ) then
            call ConditionalTriggerExecute( gg_trg_to_mid_spells_flyer )
        else
            call ConditionalTriggerExecute( gg_trg_to_mid_spells )
        endif
    else
    endif
endfunction

function Trig_Rest_BM_SKills_Actions takes nothing returns nothing
    call ForGroupBJ( udg_babyPets, function Trig_Rest_BM_SKills_Func001A )
    call ForGroupBJ( udg_midPets, function Trig_Rest_BM_SKills_Func002A )
    call ForGroupBJ( udg_pets, function Trig_Rest_BM_SKills_Func003A )
endfunction

//===========================================================================
function InitTrig_Rest_BM_SKills takes nothing returns nothing
    set gg_trg_Rest_BM_SKills = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Rest_BM_SKills, function Trig_Rest_BM_SKills_Actions )
endfunction

//===========================================================================
