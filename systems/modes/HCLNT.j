
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function HCL_NT_MAIN takes nothing returns nothing 
    if udg_HCL_NT and not udg_NOOB_TIME then
        if IsUnitType(GetAttackedUnitBJ(), UNIT_TYPE_HERO) and IsUnitAlly(GetAttacker(),GetOwningPlayer(GetAttackedUnitBJ())) and not UnitHasBuffBJ(GetAttackedUnitBJ(), 'BHav') then
            call IssueImmediateOrderBJ(GetAttacker(),"stop")
        endif
    elseif not udg_HCL_NT then
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction

function InitTrig_HCLNT takes nothing returns nothing
    local trigger NT_TRUE_MAIN = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(NT_TRUE_MAIN,EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddAction(NT_TRUE_MAIN,function HCL_NT_MAIN)
endfunction//===========================================================================
