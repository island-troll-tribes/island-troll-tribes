
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Sniff_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A060' ) ) then
        return false
    endif
    return true
endfunction

function SniffCheck takes nothing returns boolean
    //return ( GetItemUserData(GetFilterItem()) != 0 )
    return HaveSavedHandle(udg_GameHash, GetHandleId(GetFilterItem()), StringHash("sniff"))
endfunction

function Trig_Sniff_Actions takes nothing returns nothing
local unit SNIFFER = GetSpellAbilityUnit()
local player SNIFFER_PLAYER = GetOwningPlayer(SNIFFER)
local item SNIFFED_ITEM=RandomItemInRectBJ(GetRectFromCircleBJ(GetUnitLoc(GetSpellAbilityUnit()), 100),Condition(function SniffCheck))
local unit SNIFFED_UNIT=LoadUnitHandle(udg_GameHash,GetHandleId(SNIFFED_ITEM),StringHash("sniff"))

    if(SNIFFED_ITEM!=null) then
        if(SNIFFED_UNIT!=null) then
            if ( IsUnitAliveBJ(SNIFFED_UNIT) ) then
                if(IsUnitAlly(SNIFFED_UNIT, SNIFFER_PLAYER) == true) then
                    call DisplayTextToForce( GetForceOfPlayer(SNIFFER_PLAYER), GENERAL_COLOR + "Picked up the scent of a friendly " + HIGHLIGHT_COLOR+GetUnitName(SNIFFED_UNIT)+GENERAL_COLOR+" on the "+HIGHLIGHT_COLOR+GetItemName(SNIFFED_ITEM)+"|r" )
                    call PingMinimapLocForForceEx( GetPlayersAllies(SNIFFER_PLAYER), GetUnitLoc(SNIFFED_UNIT), 5.00, bj_MINIMAPPINGSTYLE_FLASHY, 0, 100, 0 )
                else
                    call DisplayTextToForce( GetForceOfPlayer(SNIFFER_PLAYER), GENERAL_COLOR + "Picked up the scent of an enemy " + HIGHLIGHT_COLOR+GetUnitName(SNIFFED_UNIT)+GENERAL_COLOR+" on the "+HIGHLIGHT_COLOR+GetItemName(SNIFFED_ITEM)+"|r" )
                    call PingMinimapLocForForceEx( GetPlayersAllies(SNIFFER_PLAYER), GetUnitLoc(SNIFFED_UNIT), 5.00, bj_MINIMAPPINGSTYLE_ATTACK, 100, 100, 100 )
                endif
            else
                call DisplayTextToForce( GetForceOfPlayer(SNIFFER_PLAYER), GENERAL_COLOR+"You smell something gross....|r" )
            endif
        else
            call DisplayTextToForce( GetForceOfPlayer(SNIFFER_PLAYER), GENERAL_COLOR+"Could not pick up a scent....|r" )
        endif
    else
        call DisplayTextToForce( GetForceOfPlayer(SNIFFER_PLAYER), GENERAL_COLOR+"Could not pick up a scent....|r" )
    endif

set SNIFFER = null
set SNIFFED_ITEM = null
set SNIFFED_UNIT = null
endfunction

//===========================================================================
function InitTrig_Sniff takes nothing returns nothing
    set gg_trg_Sniff = CreateTrigger(  )
 //   call TriggerRegisterAnyUnitEventBJ( gg_trg_Sniff, EVENT_PLAYER_UNIT_SPELL_ENDCAST )
    call TriggerAddCondition( gg_trg_Sniff, Condition( function Trig_Sniff_Conditions ) )
    call TriggerAddAction( gg_trg_Sniff, function Trig_Sniff_Actions )
endfunction//===========================================================================
