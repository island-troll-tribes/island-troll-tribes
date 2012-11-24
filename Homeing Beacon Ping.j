
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_Homeing_Beacon_Ping_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A05N' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Homeing_Beacon_Ping_Func001001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetTriggerUnit()) == true )
endfunction

function Trig_Homeing_Beacon_Ping_Actions takes nothing returns nothing
local unit SPELLABILITYUNIT = GetSpellAbilityUnit()
local unit BEACON_UNIT = LoadUnitHandle(udg_GameHash,GetHandleId(SPELLABILITYUNIT),StringHash("beacon"))
    if BEACON_UNIT!=null then
        if ( IsUnitAliveBJ(BEACON_UNIT)) then
            call PingMinimapLocForForceEx( GetPlayersAllies(GetOwningPlayer(SPELLABILITYUNIT)), GetUnitLoc(BEACON_UNIT), 5.00, bj_MINIMAPPINGSTYLE_ATTACK, 100, 100, 100 )
        endif
    endif
set SPELLABILITYUNIT = null
set BEACON_UNIT = null
endfunction

//===========================================================================
function InitTrig_Homeing_Beacon_Ping takes nothing returns nothing
    set gg_trg_Homeing_Beacon_Ping = CreateTrigger(  )
  //  call TriggerRegisterAnyUnitEventBJ( gg_trg_Homeing_Beacon_Ping, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Homeing_Beacon_Ping, Condition( function Trig_Homeing_Beacon_Ping_Conditions ) )
    call TriggerAddAction( gg_trg_Homeing_Beacon_Ping, function Trig_Homeing_Beacon_Ping_Actions )
endfunction

//===========================================================================
