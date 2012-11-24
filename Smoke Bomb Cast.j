
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_smoke_bomb_cast_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A03B' ) ) then
        return false
    endif
    return true
endfunction

function Trig_smoke_bomb_cast_Actions takes nothing returns nothing
    call masterCastAreaCaster(GetSpellAbilityUnit(),GetUnitX(GetSpellAbilityUnit()),GetUnitY(GetSpellAbilityUnit()),'A02I',"cloudoffog", 12)
endfunction

//===========================================================================
function InitTrig_smoke_bomb_cast takes nothing returns nothing
    set gg_trg_smoke_bomb_cast = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_smoke_bomb_cast, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_smoke_bomb_cast, Condition( function Trig_smoke_bomb_cast_Conditions ) )
    call TriggerAddAction( gg_trg_smoke_bomb_cast, function Trig_smoke_bomb_cast_Actions )
endfunction

//===========================================================================
