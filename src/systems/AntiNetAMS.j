
library AntiNetAMS initializer onInit requires IsTypeThing
    private function IsNetVariant takes nothing returns boolean
        local integer id = GetSpellAbilityId()
        call BJDebugMsg(I2S(id))
        return id == 'Aweb' or id == 'Aens'
    endfunction

    private function StopUnitIfTargetHasAMS takes nothing returns nothing
        local unit u
        local unit t = GetSpellTargetUnit()
        call BJDebugMsg(I2S(GetUnitAbilityLevel(t, 'Bam2')))
        call BJDebugMsg(I2S(GetUnitAbilityLevel(t, 'Bams')))
        if GetUnitAbilityLevel(t, 'Bam2') > 0 and IsUnitTroll(t) then
            set u = GetSpellAbilityUnit()
            call IssueImmediateOrder(u, "stop")
            set u = null
        endif
        set t = null
    endfunction

    //===========================================================================
    private function onInit takes nothing returns nothing
        local trigger t = CreateTrigger(  )
        call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SPELL_CAST )
        call TriggerAddCondition( t, Condition( function IsNetVariant ) )
        call TriggerAddAction( t, function StopUnitIfTargetHasAMS )
    endfunction
endlibrary