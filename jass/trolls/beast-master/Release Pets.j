
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function ReleasePets_Back takes nothing returns nothing
    debug call BJDebugMsg(GetUnitName(udg_parameterUnit))
    if GetOwningPlayer(GetEnumUnit()) == GetOwningPlayer(udg_parameterUnit) then
        if IsUnitInGroup(GetEnumUnit(), udg_babyPets) then
            call GroupRemoveUnit(udg_babyPets, GetEnumUnit())
        elseif IsUnitInGroup(GetEnumUnit(), udg_midPets) then
            call GroupRemoveUnit(udg_midPets, GetEnumUnit())
        elseif IsUnitInGroup(GetEnumUnit(), udg_pets) then
            call GroupRemoveUnit(udg_pets, GetEnumUnit())
        endif
        call SetUnitOwner( GetEnumUnit(), Player(PLAYER_NEUTRAL_AGGRESSIVE), true )
        call getPlayersTroll(GetOwningPlayer(GetSpellAbilityUnit()))
        call TriggerExecute( gg_trg_back_to_tame )
        call DisplayTextToForce( GetPlayersAllies(GetOwningPlayer(udg_parameterUnit)), "A pet was released" )
    endif
endfunction

function Trig_Release_Pets_Actions takes nothing returns nothing
    call ForGroup( udg_babyPets, function ReleasePets_Back )
    call ForGroup( udg_midPets, function ReleasePets_Back )
    call ForGroup( udg_pets, function ReleasePets_Back )
endfunction

//===========================================================================
function InitTrig_Release_Pets takes nothing returns nothing
    set gg_trg_Release_Pets = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Release_Pets, function Trig_Release_Pets_Actions )
endfunction

//===========================================================================
