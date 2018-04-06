
//===========================================================================
function Trig_tree_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetConstructedStructure()) == UNIT_BUILDING_TREE ) ) then
        return false
    endif
    return true
endfunction

function Trig_tree_Actions takes nothing returns nothing
    call RemoveUnit( GetConstructedStructure() )
    call CreateDestructableLoc( DEST_RUINS_TREE, GetUnitLoc(GetConstructedStructure()), GetRandomDirectionDeg(), 1, 0 )
endfunction

//===========================================================================
function InitTrig_tree takes nothing returns nothing
    set gg_trg_tree = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_tree, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH )
    call TriggerAddCondition( gg_trg_tree, Condition( function Trig_tree_Conditions ) )
    call TriggerAddAction( gg_trg_tree, function Trig_tree_Actions )
endfunction

//===========================================================================
