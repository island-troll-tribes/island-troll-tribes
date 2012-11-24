
//===========================================================================
//TESH.scrollpos=15
//TESH.alwaysfold=0
globals
    constant real ob_TextTime = 10
endglobals
// DisplayTimedTextToObservers
function RelayObserverEvents__Show takes nothing returns nothing
    local eventid e = GetTriggerEventId()
    local player p = GetTriggerPlayer()
    local integer id = GetPlayerId(p)
    local unit u = GetTriggerUnit()
    if e == EVENT_PLAYER_HERO_SKILL then
        call DisplayTimedTextToNoticeObservers(ob_TextTime, udg_RealNames[id]+"["+GetUnitName(u)+"] has learned: "+GetObjectName(GetLearnedSkill())+" - Level "+I2S(GetLearnedSkillLevel()))
    elseif e == EVENT_PLAYER_HERO_LEVEL and id < 12 then
        call DisplayTimedTextToNoticeObservers(ob_TextTime, udg_RealNames[id]+"["+GetUnitName(u)+"] has leveled to: Level "+I2S(GetUnitLevel(u)))
    elseif e == EVENT_PLAYER_UNIT_PAWN_ITEM then
        // u => seller (troll)
        // solditem => solditem
        // buying unit => buyer (boat/merc)
        call DisplayTimedTextToNoticeObservers(ob_TextTime, udg_RealNames[id]+"["+GetUnitName(u)+"] has sold: "+GetItemName(GetSoldItem())+" to "+GetUnitName(GetBuyingUnit()))
    elseif e == EVENT_PLAYER_UNIT_SELL_ITEM then
        // u => seller (boat/merc)
        set p = GetOwningPlayer(GetBuyingUnit())
        set id = GetPlayerId(p)
        call DisplayTimedTextToNoticeObservers(ob_TextTime, udg_RealNames[id]+"["+GetUnitName(udg_PUnits[id])+"] has bought: "+GetItemName(GetSoldItem())+" from "+GetUnitName(u))
    elseif e == EVENT_PLAYER_UNIT_CONSTRUCT_FINISH then
        call DisplayTimedTextToNoticeObservers(ob_TextTime, udg_RealNames[id]+"["+GetUnitName(udg_PUnits[id])+"] has built: "+GetUnitName(u))
    elseif e == EVENT_PLAYER_HERO_REVIVE_FINISH then
        if udg_NOOB_TIME then
            call DisplayTimedTextToNoticeObservers(ob_TextTime, udg_RealNames[id]+"["+GetUnitName(u)+"] has revived at noob time.")
        else
            call DisplayTimedTextToNoticeObservers(ob_TextTime, udg_RealNames[id]+"["+GetUnitName(u)+"] has revived with ward.")
        endif
    endif
    set u = null
endfunction

//===========================================================================
function InitTrig_observer_msgs takes nothing returns nothing
    local integer i = 0
    set gg_trg_observer_msgs = CreateTrigger(  )
    loop
        exitwhen i > 15
        call TriggerRegisterPlayerUnitEvent(gg_trg_observer_msgs, Player(i), EVENT_PLAYER_HERO_SKILL, null)
        call TriggerRegisterPlayerUnitEvent(gg_trg_observer_msgs, Player(i), EVENT_PLAYER_HERO_LEVEL, null)
        call TriggerRegisterPlayerUnitEvent(gg_trg_observer_msgs, Player(i), EVENT_PLAYER_UNIT_PAWN_ITEM, null)
        call TriggerRegisterPlayerUnitEvent(gg_trg_observer_msgs, Player(i), EVENT_PLAYER_UNIT_SELL_ITEM, null)
        call TriggerRegisterPlayerUnitEvent(gg_trg_observer_msgs, Player(i), EVENT_PLAYER_UNIT_CONSTRUCT_FINISH, null)
        call TriggerRegisterPlayerUnitEvent(gg_trg_observer_msgs, Player(i), EVENT_PLAYER_HERO_REVIVE_FINISH, null)
        set i = i + 1
    endloop
    call TriggerAddAction(gg_trg_observer_msgs, function RelayObserverEvents__Show )
endfunction
//===========================================================================
