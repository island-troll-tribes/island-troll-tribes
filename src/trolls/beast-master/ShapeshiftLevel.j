//===========================================================================
function ssConditions takes nothing returns boolean
    return ( GetUnitTypeId(GetTriggerUnit())==UNIT_SHAPESHIFTER_BEAR or GetUnitTypeId(GetTriggerUnit())==UNIT_SHAPESHIFTER_PANTHER or GetUnitTypeId(GetTriggerUnit())==UNIT_SHAPESHIFTER_TIGER )
endfunction

function Trig_ShapeshiftLevel_Actions takes nothing returns nothing
    call SetPlayerAbilityAvailableBJ( true, 'A0EI', GetOwningPlayer(GetTriggerUnit()) )
    call SetPlayerAbilityAvailableBJ( true, 'A0EN', GetOwningPlayer(GetTriggerUnit()) )
    call SetPlayerAbilityAvailableBJ( true, 'A0EO', GetOwningPlayer(GetTriggerUnit()) )
endfunction

//===========================================================================
function InitTrig_ShapeshiftLevel takes nothing returns nothing
    set gg_trg_ShapeshiftLevel = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_ShapeshiftLevel, EVENT_PLAYER_HERO_SKILL )
    call TriggerAddCondition( gg_trg_ShapeshiftLevel, Condition( function ssConditions ) )
    call TriggerAddAction( gg_trg_ShapeshiftLevel, function Trig_ShapeshiftLevel_Actions )
endfunction

//===========================================================================
