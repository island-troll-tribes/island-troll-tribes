
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_master_Thief_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetAttackedUnitBJ()) == UNIT_THIEF ) ) then
        return false
    endif
    if ( not ( UnitHasBuffBJ(GetAttackedUnitBJ(), DEST_RUINS_TREE_ITEM) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_master_Thief_Func004Func001Func001C takes nothing returns boolean
    if ( not ( GetRandomPercentageBJ() <= 10.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_master_Thief_Func004Func001C takes nothing returns boolean
    if ( not ( GetRandomPercentageBJ() <= 5.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_master_Thief_Func004C takes nothing returns boolean
    if ( not ( GetRandomPercentageBJ() <= 5.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_master_Thief_Actions takes nothing returns nothing
    local unit i=GetAttackedUnitBJ()
    local unit q=GetAttacker()
    if ( Trig_master_Thief_Func004C() ) then
        call UnitAddAbilityBJ( 'Agho', i )
        call PolledWait( 3.00 )
        call UnitRemoveAbilityBJ( 'Agho', i )
    else
        if ( Trig_master_Thief_Func004Func001C() ) then
            call masterCastNoTarget(i,GetUnitX(i),GetUnitY(i),GetRandomReal(0,0),GetRandomReal(0,600),'A035',"stomp")
        else
            if ( Trig_master_Thief_Func004Func001Func001C() ) then
                call masterCastAreaCaster(i,GetUnitX(q),GetUnitY(q),'A032',"cloudoffog",3)
            endif
        endif
    endif
endfunction

//===========================================================================
function InitTrig_master_Thief takes nothing returns nothing
    set gg_trg_master_Thief = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_master_Thief, Condition( function Trig_master_Thief_Conditions ) )
    call TriggerAddAction( gg_trg_master_Thief, function Trig_master_Thief_Actions )
endfunction

//===========================================================================
