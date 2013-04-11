
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function IsUnitTrolling takes nothing returns boolean
    return IsUnitTroll(GetTriggerUnit())
endfunction

function healeffectcoat takes nothing returns nothing
    local unit u
    local real dmg
    local integer i
    local player p = GetTriggerPlayer()
    local integer id = GetPlayerId(p)
    if healar[id] then
        set dmg = GetEventDamage()
        set i = GetRandomInt(1,5)
        if i == 1 then
            set u = GetTriggerUnit()
            call SetUnitState(u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+dmg)
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl", u, "head"))
            call masterCastAtCaster(u,u,0,0,'A0A3',"innerfire")
            set u = null
        endif
    endif
endfunction

function EffectItype takes nothing returns nothing
    local unit u = GetTriggerUnit()
    local integer id = GetPlayerId(GetOwningPlayer(u))
    local integer i = GetRandomInt(1,10)
        if frostar[id] then
            if i <= 3 then
                call masterCastAtTarget(u,GetAttacker(),200,200,'A0A5',"frostnova")
            endif
        endif
        /*
        if healar[id] then
            if not IsUnitInGroup(u, healGroup) then
                call GroupAddUnit(healGroup, u)
                call TriggerRegisterUnitEvent( trighealhit, u, EVENT_UNIT_DAMAGED )
            endif
        endif
        */
    set u = null
endfunction

globals
    boolean array frostar
    boolean array healar
    trigger trighealhit = CreateTrigger()
    group healGroup = CreateGroup()
endglobals

//===========================================================================
function InitTrig_cloak_attack_effect_back takes nothing returns nothing
    set gg_trg_cloak_attack_effect_back = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_cloak_attack_effect_back, EVENT_PLAYER_UNIT_ATTACKED )
    call TriggerAddCondition( gg_trg_cloak_attack_effect_back, Condition( function IsUnitTrolling ) )
    call TriggerAddAction( gg_trg_cloak_attack_effect_back, function EffectItype )
    call TriggerAddAction(trighealhit, function healeffectcoat)
endfunction

//===========================================================================
