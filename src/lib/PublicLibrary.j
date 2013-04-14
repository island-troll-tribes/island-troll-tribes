
//
//         elseif t <= 4 then
//             call CreateUnit(Player(12), UNIT_HAWK, x, y, 270 )
//         elseif t <= 6 then
//             call CreateUnit(Player(12), UNIT_GREEN_FISH, x, y, 270 )
//         else
//             call CreateUnit(Player(12), UNIT_FISH, x, y, 270 )
//         endif
//     endif
//===========================================================================

library PublicLibrary initializer initPublicLibrary requires TimerUtils, IDUtils, Constants, FilterTypeIsThing

function IsThereItemInSlot takes unit u, integer i returns boolean
    if ( not ( UnitItemInSlotBJ(u, i) != null ) ) then
        return true
    endif
    return false
endfunction

function ReplayToNoticeObservers takes nothing returns nothing
    if IsPlayerObserver(GetEnumPlayer()) == true and obs_notices[GetPlayerId(GetEnumPlayer())] then
        call DisplayTimedTextToPlayer(GetEnumPlayer(), 0, 0, bj_cineFadeContinueTrans, bj_lastPlayedMusic)
    endif
endfunction

function DisplayTimedTextToNoticeObservers takes real duration, string message returns nothing
    local real r = bj_cineFadeContinueTrans
    local string s = bj_lastPlayedMusic

    set bj_cineFadeContinueTrans = duration
    set bj_lastPlayedMusic = message
    
    call ForForce(bj_FORCE_ALL_PLAYERS,function ReplayToNoticeObservers)
    
    set bj_cineFadeContinueTrans = r
    set bj_lastPlayedMusic = s
endfunction

function ReplayToObservers takes nothing returns nothing
    if IsPlayerObserver(GetEnumPlayer()) == true then
        call DisplayTimedTextToPlayer(GetEnumPlayer(), 0, 0, bj_cineFadeContinueTrans, bj_lastPlayedMusic)
    endif
endfunction

function DisplayTimedTextToObservers takes real duration, string message returns nothing
    local real r = bj_cineFadeContinueTrans
    local string s = bj_lastPlayedMusic

    set bj_cineFadeContinueTrans = duration
    set bj_lastPlayedMusic = message
    
    call ForForce(bj_FORCE_ALL_PLAYERS,function ReplayToObservers)
    
    set bj_cineFadeContinueTrans = r
    set bj_lastPlayedMusic = s
endfunction

function ReplayToAll takes nothing returns nothing
    call DisplayTimedTextToPlayer(GetEnumPlayer(), 0, 0, bj_cineFadeContinueTrans, bj_lastPlayedMusic)
endfunction

function DisplayTimedTextToAll takes real duration, string message returns nothing
    local real r = bj_cineFadeContinueTrans
    local string s = bj_lastPlayedMusic

    set bj_cineFadeContinueTrans = duration
    set bj_lastPlayedMusic = message
    
    call ForForce(bj_FORCE_ALL_PLAYERS,function ReplayToAll)
    
    set bj_cineFadeContinueTrans = r
    set bj_lastPlayedMusic = s
endfunction

function DisplayText takes string message returns nothing
    call DisplayTimedTextToAll(7, message)
endfunction

function DisplayTText takes string message, real time returns nothing
    call DisplayTimedTextToAll(time, message)
endfunction

// superior function to GetUnitsInRangeOfLocMatching
function GetUnitsInRangeMatching takes real radius, real x, real y, boolexpr filter returns group
    local group g = CreateGroup()
    call GroupEnumUnitsInRange(g, x , y , radius, filter)
    call DestroyBoolExpr(filter)
    return g
endfunction

function IsWidgetInRect takes rect r, widget w returns boolean
    local real x = GetWidgetX( w )
    local real y = GetWidgetY( w )
    local real collision = 25
    if x < GetRectMaxX(r) + collision and x > GetRectMinX(r) - collision and y < GetRectMaxY(r) + collision and y > GetRectMinY(r) - collision then
        return true
    endif
    return false
endfunction

// New Timed Effects --
function DestroyEffectTimed takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local effect e = LoadEffectHandle(udg_GameHash, GetHandleId(t), StringHash("effect"))
    call DestroyEffect(e)
    call RemoveSavedHandle(udg_GameHash, GetHandleId(t), StringHash("effect"))
    call ReleaseTimer(t)
    set t = null
    set e = null
endfunction

function AddTimedEffectLoc takes string STRINGPATH, location UNITLOC, real TIME returns nothing
    local effect e = AddSpecialEffectLoc(STRINGPATH,UNITLOC)
    local timer t = NewTimer()
    call SaveEffectHandle(udg_GameHash, GetHandleId(t), StringHash("effect"),e)
    call TimerStart(t , TIME, false, function DestroyEffectTimed)
    set t = null
    set e = null
endfunction

function AddTimedEffectPoint takes string STRINGPATH, real x, real y, real TIME returns nothing
    local effect e = AddSpecialEffect(STRINGPATH,x,y)
    local timer t = NewTimer()
    call SaveEffectHandle(udg_GameHash, GetHandleId(t), StringHash("effect"),e)
    call TimerStart(t , TIME, false, function DestroyEffectTimed)
    set t = null
    set e = null
endfunction

//call AddTimedEffectUnit("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl","origin",t,2.5)

function AddTimedEffectUnit takes string STRINGPATH, string UNITHEADER, unit WHICHUNIT, real TIME returns nothing
    local effect e = AddSpecialEffectTarget(STRINGPATH,WHICHUNIT,UNITHEADER)
    local timer t = NewTimer()
    call SaveEffectHandle(udg_GameHash, GetHandleId(t), StringHash("effect"),e)
    call TimerStart(t , TIME, false, function DestroyEffectTimed)
    set t = null
    set e = null
endfunction

//Other functions
function getAnimalGreenLight takes unit u returns nothing
    if(GetUnitTypeId(u) == UNIT_BEAST_MASTER or GetUnitTypeId(u) == UNIT_TRUE_FORM or GetUnitTypeId(u) == UNIT_ULTIMATE_FORM) then
        set udg_booleanParameter=( GetRandomReal(0, 1) <= udg_PET_CHANCE+(GetHeroLevel(u)*0.05) )
    else
        set udg_booleanParameter=( GetRandomReal(0, 1) <= udg_PET_CHANCE )
    endif
endfunction

globals
    boolean real_random = false
endglobals

function getRandomTroll takes player play, real x, real y returns unit
    local integer t = GetRandomInt( 1, 7 )
    if udg_AllTroll != 0 then
        // takes care of -all modes
        set t = udg_AllTroll
    endif
    if ( t == 1 ) then
        return CreateUnit( play, UNIT_GATHERER, x, y, 0.0 )
    elseif ( t == 2 ) then
        return CreateUnit( play, UNIT_HUNTER, x, y, 0.0 )
    elseif ( t == 3 ) then
        return CreateUnit( play, UNIT_SCOUT, x, y, 0.0 )
    elseif ( t == 4 ) then
        return CreateUnit( play, UNIT_MAGE, x, y, 0.0 )
    elseif ( t == 5 ) then
        return CreateUnit( play, UNIT_THIEF, x, y, 0.0 )
    elseif ( t == 6 ) then
        return CreateUnit( play, UNIT_BEAST_MASTER, x, y, 0.0 )
    elseif ( t == 7 ) then
        return CreateUnit( play, UNIT_PRIEST, x, y, 0.0 )
    endif
    return null
endfunction



function prepareSpells takes nothing returns nothing
    set udg_spells[0]='S000'
    set udg_spells[1]='A028'
    set udg_spells[2]='A038'
    set udg_spells[3]='A028'
    set udg_spells[4]='A01K'
    set udg_spells[5]='A02A'
    set udg_spells[6]='A02A'
    set udg_spells[7]='A038'
    set udg_spells[8]='A065'
    set udg_spells[9]='A02V'
    set udg_spells[10]='ACfl'
    set udg_spells[11]='ACtb'
    set udg_spells[12]='A01K'
    set udg_spells[13]='A020'
    set udg_spells[14]='A01X'
    
    set udg_spells[15]='A05C'
    set udg_spells[16]='A05G'
    set udg_spells[17]='A01U'
    set udg_spells[18]='Ainf'
    set udg_spells[19]='Alsh'
    set udg_spells[20]='Aspl'
    set udg_spells[21]='ACif'
    set udg_spells[22]='Arej'
    
    set udg_spellStrings[0]="cyclone"
    set udg_spellStrings[1]="impale"
    set udg_spellStrings[2]="carrionswarm"
    set udg_spellStrings[3]="impale"
    set udg_spellStrings[4]="shadowstrike"
    set udg_spellStrings[5]="frostnova"
    set udg_spellStrings[6]="frostnova"
    set udg_spellStrings[7]="carrionswarm"
    set udg_spellStrings[8]="manaburn"
    set udg_spellStrings[9]="creepthunderbolt"
    set udg_spellStrings[10]="forkedlightning"
    set udg_spellStrings[11]="creepthunderbolt"
    set udg_spellStrings[12]="shadowstrike"
    set udg_spellStrings[13]="frostnova"
    set udg_spellStrings[14]="chainlightning"
    set udg_spellStrings[15]="heal"
    set udg_spellStrings[16]="healingwave"
    set udg_spellStrings[17]="bloodlust"
    set udg_spellStrings[18]="innerfire"
    set udg_spellStrings[19]="lightningshield"
    set udg_spellStrings[20]="spiritlink"
    set udg_spellStrings[21]="innerfire"
    set udg_spellStrings[22]="rejuvination"
    
endfunction

function checkGrow takes unit u returns nothing
    local real i=GetRandomReal(0,1)
    if(i<=udg_PET_GROWTH) then
        set udg_growingPet=u
        set udg_booleanParameter=true
    else
        set udg_booleanParameter=false
    endif
endfunction

function getPlayersTroll takes player p returns unit
    set udg_parameterUnit=udg_PUnits[GetPlayerId(p)]
    return udg_parameterUnit
endfunction

function GetPlayersTroll takes player p returns unit
    local group g = CreateGroup()
    local unit u
    call GroupEnumUnitsOfPlayer( g, p, Condition( function FilterUnitIsTroll ) )
    set u = FirstOfGroup( g )
    call DestroyGroup( g )
    set g = null
    return u
endfunction

function cleanInventory takes unit u returns nothing
    local integer temp=UnitInventorySize(u)
    local integer temp2
    local integer left=UnitInventoryCount(u)
    loop
        exitwhen temp == 1 or left==0
        if(UnitItemInSlotBJ(u, temp) == null) then
            set temp2=temp-1
            
            loop
                exitwhen (UnitItemInSlotBJ(u, temp2) != null) or temp2==1
                set temp2=temp2-1
            endloop
            
            
            call UnitDropItemSlotBJ( u, UnitItemInSlotBJ(u, temp2), temp )
        endif
        set left=left-1
        set temp=temp-1
    endloop
endfunction

function modStats takes nothing returns nothing
    set udg_CLAYBALL_RATE = RMinBJ(1.85,udg_CLAYBALL_RATE+0.3)
    if(udg_MORE_BADDIES==false) then
        set udg_PANTHER_RATE = 1
        set udg_BEAR_RATE = 1
        set udg_SNAKE_RATE = 3
        set udg_WOLF_RATE = 2
    else
        set udg_PANTHER_RATE = R2I(1*udg_BADDIE_BASE)
        set udg_BEAR_RATE = R2I(1*udg_BADDIE_BASE)
        set udg_SNAKE_RATE = R2I(3*udg_BADDIE_BASE)
        set udg_WOLF_RATE = R2I(2*udg_BADDIE_BASE)
    endif
    set udg_FLINT_RATE = RMaxBJ(2.0,udg_FLINT_RATE-0.4)
    set udg_MANACRYSTAL_RATE = RMinBJ(1.6,udg_MANACRYSTAL_RATE+0.5)
    set udg_ROCK_RATE = RMinBJ(3.3,udg_ROCK_RATE+0.5)
    set udg_MUSHROOM_RATE = RMinBJ(1.2,udg_MUSHROOM_RATE+0.4)
    set udg_STICK_RATE = RMinBJ(4.5,udg_STICK_RATE+0.5)
    set udg_TINDER_RATE = RMaxBJ(.7,udg_TINDER_RATE-0.6)
    
    set udg_ITEM_BASE = RMaxBJ(.15,udg_ITEM_BASE-0.2)
    set udg_FOOD_BASE = RMaxBJ(.15,udg_FOOD_BASE-0.2)
endfunction
//////////////////////inventory checking (also class checking)
function countItem takes unit u,integer itm returns integer
    local integer t=0
    local integer count=0
    loop
        exitwhen t > 5
        if( GetItemTypeId(UnitItemInSlot(u, t)) == itm ) then
            set count=count+1
        endif
        set t = t + 1
    endloop
    return count
endfunction

function UnitHasItemType takes unit u, integer id returns boolean
    local integer i = 0
    loop
        exitwhen i > 5
        if GetItemTypeId( UnitItemInSlot( u, i ) ) == id then
            return true
        endif
        set i = i + 1
    endloop
    return false
endfunction

function removeItem takes unit u,integer itm returns nothing
    local integer t=0
    loop
        exitwhen t > 5
        if( GetItemTypeId(UnitItemInSlot(u, t)) == itm ) then
            call RemoveItem( UnitItemInSlot(u, t) )
        endif
        set t = t + 1
    endloop
endfunction

function checkItemWithCharge takes unit u, integer itm returns boolean
    local integer t=0
    loop
        exitwhen t > UnitInventorySize(u)
        if(( GetItemTypeId(UnitItemInSlot(u, t)) == itm ) and ( GetItemCharges(UnitItemInSlot(u, t)) > 0 )) then
            return true
        endif
        set t = t + 1
    endloop
    return true
endfunction

function checkItem takes unit u, integer itm returns boolean
    local integer t=0
    loop
        exitwhen t > UnitInventorySize(u)
        if( GetItemTypeId(UnitItemInSlot(u, t)) == itm ) then
            return true
        endif
        set t = t + 1
    endloop
    return false
endfunction

function countHeat takes nothing returns nothing
    local unit u=udg_parameterUnit
    local integer t=0
    local integer warm=0
    loop
        exitwhen t > 5
        if (IsItemCoat(UnitItemInSlot(u, t))) then
            set warm=warm+5
        endif
        if (IsItemBoots(UnitItemInSlot(u, t))) then
            set warm=warm+2
        endif
        if (IsItemGloves(UnitItemInSlot(u, t))) then
            set warm=warm+2
        endif
        if(GetItemTypeId(UnitItemInSlot(u, t)) == ITEM_DD_PINION_FIRE) then
            set warm=warm+8
        endif
        set t = t + 1
    endloop
    set udg_integerParameter=warm
    set u=null
endfunction

function setUpSkillTriggers takes unit u returns nothing
    local player p=GetOwningPlayer(u)
    
    
    
    if(GetUnitTypeId(u)==UNIT_GATHERER) then//gatherer
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_TeleGather_Cast, p ,EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_item_radar, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_radar_skill_1, p ,EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_radar_skill_2, p ,EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_radar_skill_3, p ,EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_radar_skill_4, p ,EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_radar_skill_5, p ,EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_radar_skill_6, p ,EVENT_PLAYER_UNIT_SPELL_EFFECT )
        //call TriggerRegisterPlayerUnitEventSimple( gg_trg_ItemPull, p ,EVENT_PLAYER_UNIT_SPELL_EFFECT )
        
        
        
    elseif(GetUnitTypeId(u)==UNIT_HUNTER) then//hunter
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Sniff, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Dissentary_Track, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Homeing_Beacon_Ping, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Homing_Beacon_Cast, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        
        
        
    elseif(GetUnitTypeId(u)==UNIT_THIEF) then//thief
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_blur, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_TeleThief_Cast, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Smoke_Stream, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Nether_Fade, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Jump, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_blink_ww_short_radius, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_master_Thief, p, EVENT_PLAYER_UNIT_ATTACKED )
        
        
        
    elseif(GetUnitTypeId(u)==UNIT_PRIEST) then//priest
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_cloud_cast, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Angelic_Orb, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_omnicure, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Mix_Mana, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Mix_Health, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Mix_Heat, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_self_pres, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Omniresist, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Metabolism_All, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Hidden_Power_All, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Multiwave, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Light_Gate, p, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
        
        
    elseif(GetUnitTypeId(u)==UNIT_MAGE) then//mage
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_jeoulusy, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_seizures, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_electromagnet, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Splitting_Flame, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Dream_Eater, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Eruption, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Defender_Orb, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Depression_Orb, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Reduce_Food_reduction, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Stup_Aura, p, EVENT_PLAYER_UNIT_SPELL_CAST )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Stup_Aura_Remove, p, EVENT_PLAYER_UNIT_SPELL_ENDCAST )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_metronome, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_depress_mana_drain, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Storm_Earth_Fire, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Invoke_Runes, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Rune_Release, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Dark_Gate, p, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
        
    elseif(GetUnitTypeId(u)==UNIT_BEAST_MASTER) then//beast master
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_TeleHawk_Cast, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_tamed_abilities, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_tamed_animal_adding, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_release, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Fowl_Play, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        
        
    elseif(GetUnitTypeId(u)==UNIT_SCOUT) then//scout
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Motion_Radar, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_ward_the_area, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_enemy_radar, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Chain_Reveal, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    endif
    
	set p=null
endfunction

globals
    boolean fishytrigger = false
endglobals
function makeAFish takes rect loc returns nothing
    local integer t = GetRandomInt(1,13)
    local integer i = GetRandomInt(0,20000)
    local unit u
    local real x
    local real y
    if udg_FISH_CURRENT<udg_FISH_MAX or udg_ITEM_LIMIT_MODE==false then
        set x = GetRandomReal(GetRectMinX(loc), GetRectMaxX(loc))
        set y = GetRandomReal(GetRectMinY(loc), GetRectMaxY(loc))
        if i == 0 and not fishytrigger then
            set i = GetRandomInt(0,10000)
            if i == 0 then
                set i = GetRandomInt(0,1000)
                if i == 0 then
                    set fishytrigger = true
                    call CreateUnit(Player(12), UNIT_MAGENTA_FISH, x, y, 270 )
                endif
            endif
        elseif t <= 4 then
            set u = CreateUnit(Player(12), UNIT_HAWK, x, y, 270 )
        elseif t <= 6 then
            set u = CreateUnit(Player(12), UNIT_GREEN_FISH, x, y, 270 )
        else
            set u = CreateUnit(Player(12), UNIT_FISH, x, y, 270 )
        endif
    endif
    set u = null
    set udg_FISH_CURRENT=udg_FISH_CURRENT+1
endfunction

function makeFish takes nothing returns nothing
    local integer int=0
    loop
        exitwhen int > udg_FISH_PER_AREA
        call PolledWait( udg_DELAY_TIME )
        call makeAFish(gg_rct_out_1_1)
        call makeAFish(gg_rct_out_3_2)
        call makeAFish(gg_rct_out_1_2)
        call makeAFish(gg_rct_out_5_2)
        call makeAFish(gg_rct_out_2_2)
        call makeAFish(gg_rct_out_3_1)
        call makeAFish(gg_rct_out_4_1)
        call makeAFish(gg_rct_out_4_2)
        call makeAFish(gg_rct_our_5_1)
        call makeAFish(gg_rct_out_2_1)
        call makeAFish(gg_rct_fish_new_2)
        call makeAFish(gg_rct_fish_new_3)
        call makeAFish(gg_rct_fish_new_1)
        call makeAFish(gg_rct_fish_new_4)
        call makeAFish(gg_rct_fish_new_6)
        call makeAFish(gg_rct_fish_new_5)
        call makeAFish(gg_rct_fish_new_7)
        call makeAFish(gg_rct_fish_new_8)
        set int=int+1
    endloop
endfunction

function spawnIslandOne takes itempool p returns nothing
    local integer temp=1
    local item q
    local real rndX=1
    local real rndY=1
    if((udg_ITEM_CURRENT<udg_ITEM_MAX) or (udg_ITEM_LIMIT_MODE==false)) then
        set udg_ITEM_CURRENT=udg_ITEM_CURRENT+1
        call PolledWait( udg_DELAY_TIME )
        set temp=GetRandomInt(1,udg_ISLAND1_3+udg_ISLAND1_2+udg_ISLAND1_1)
        if ( temp<=udg_ISLAND1_3 ) then
            set rndX=GetRandomReal(GetRectMinX(gg_rct_spawn_area_1_3),GetRectMaxX(gg_rct_spawn_area_1_3))
            set rndY=GetRandomReal(GetRectMinY(gg_rct_spawn_area_1_3),GetRectMaxY(gg_rct_spawn_area_1_3))
            set q=PlaceRandomItem(p,rndX,rndY)
        elseif (temp<=udg_ISLAND1_2+udg_ISLAND1_3) then
            set rndX=GetRandomReal(GetRectMinX(gg_rct_spawn_area_1_2),GetRectMaxX(gg_rct_spawn_area_1_2))
            set rndY=GetRandomReal(GetRectMinY(gg_rct_spawn_area_1_2),GetRectMaxY(gg_rct_spawn_area_1_2))
            set q=PlaceRandomItem(p,rndX,rndY)
        elseif (temp<=udg_ISLAND1_1+udg_ISLAND1_2+udg_ISLAND1_3) then
            set rndX=GetRandomReal(GetRectMinX(gg_rct_spawn_area_1_1),GetRectMaxX(gg_rct_spawn_area_1_1))
            set rndY=GetRandomReal(GetRectMinY(gg_rct_spawn_area_1_1),GetRectMaxY(gg_rct_spawn_area_1_1))
            set q=PlaceRandomItem(p,rndX,rndY)
        endif
    endif
    set q=null
endfunction

function spawnIslandTwo takes itempool p returns nothing
    local integer temp=1
    local item q
    local real rndX=1
    local real rndY=1
    if((udg_ITEM_CURRENT<udg_ITEM_MAX) or (udg_ITEM_LIMIT_MODE==false)) then
        set udg_ITEM_CURRENT=udg_ITEM_CURRENT+1
        call PolledWait( udg_DELAY_TIME )
        set temp=GetRandomInt(1,udg_ISLAND2_1+udg_ISLAND2_2+udg_ISLAND2_3)
        if ( temp<=udg_ISLAND2_3 ) then
            set rndX=GetRandomReal(GetRectMinX(gg_rct_spawn_area_2_3),GetRectMaxX(gg_rct_spawn_area_2_3))
            set rndY=GetRandomReal(GetRectMinY(gg_rct_spawn_area_2_3),GetRectMaxY(gg_rct_spawn_area_2_3))
            set q=PlaceRandomItem(p,rndX,rndY)
        elseif (temp<=udg_ISLAND2_3+udg_ISLAND2_2) then
            set rndX=GetRandomReal(GetRectMinX(gg_rct_spawn_area_2_2),GetRectMaxX(gg_rct_spawn_area_2_2))
            set rndY=GetRandomReal(GetRectMinY(gg_rct_spawn_area_2_2),GetRectMaxY(gg_rct_spawn_area_2_2))
            set q=PlaceRandomItem(p,rndX,rndY)
        elseif (temp<=udg_ISLAND2_1+udg_ISLAND2_2+udg_ISLAND2_3) then
            set rndX=GetRandomReal(GetRectMinX(gg_rct_spawn_area_2_1),GetRectMaxX(gg_rct_spawn_area_2_1))
            set rndY=GetRandomReal(GetRectMinY(gg_rct_spawn_area_2_1),GetRectMaxY(gg_rct_spawn_area_2_1))
            set q=PlaceRandomItem(p,rndX,rndY)
        endif
    endif
    set q=null
endfunction

function spawnIslandThree takes itempool p returns nothing
    local integer temp=1
    local item q
    local real rndX=1
    local real rndY=1
    if((udg_ITEM_CURRENT<udg_ITEM_MAX) or (udg_ITEM_LIMIT_MODE==false)) then
        set udg_ITEM_CURRENT=udg_ITEM_CURRENT+1
        call PolledWait( udg_DELAY_TIME )
        set temp=GetRandomInt(1,udg_ISLAND3_1+udg_ISLAND3_2+udg_ISLAND3_3)
        if ( temp<=udg_ISLAND3_2 ) then
            set rndX=GetRandomReal(GetRectMinX(gg_rct_spawn_area_3_2),GetRectMaxX(gg_rct_spawn_area_3_2))
            set rndY=GetRandomReal(GetRectMinY(gg_rct_spawn_area_3_2),GetRectMaxY(gg_rct_spawn_area_3_2))
            set q=PlaceRandomItem(p,rndX,rndY)
        elseif (temp<=udg_ISLAND3_2+udg_ISLAND3_3) then
            set rndX=GetRandomReal(GetRectMinX(gg_rct_spawn_area_3_3),GetRectMaxX(gg_rct_spawn_area_3_3))
            set rndY=GetRandomReal(GetRectMinY(gg_rct_spawn_area_3_3),GetRectMaxY(gg_rct_spawn_area_3_3))
            set q=PlaceRandomItem(p,rndX,rndY)
        elseif (temp<=udg_ISLAND3_1+udg_ISLAND3_2+udg_ISLAND3_3) then
            set rndX=GetRandomReal(GetRectMinX(gg_rct_spawn_area_3_1),GetRectMaxX(gg_rct_spawn_area_3_1))
            set rndY=GetRandomReal(GetRectMinY(gg_rct_spawn_area_3_1),GetRectMaxY(gg_rct_spawn_area_3_1))
            set q=PlaceRandomItem(p,rndX,rndY)
        endif
    endif
    set q=null
endfunction

function spawnIslandFour takes itempool p returns nothing
    local integer temp=1
    local item q
    local real rndX=1
    local real rndY=1
    if((udg_ITEM_CURRENT<udg_ITEM_MAX) or (udg_ITEM_LIMIT_MODE==false)) then
        set udg_ITEM_CURRENT=udg_ITEM_CURRENT+1
        call PolledWait( udg_DELAY_TIME )
        set temp=GetRandomInt(1,udg_ISLAND4_1+udg_ISLAND4_2+udg_ISLAND4_3)
        if ( temp<=udg_ISLAND4_2 ) then
            set rndX=GetRandomReal(GetRectMinX(gg_rct_spawn_area_4_2),GetRectMaxX(gg_rct_spawn_area_4_2))
            set rndY=GetRandomReal(GetRectMinY(gg_rct_spawn_area_4_2),GetRectMaxY(gg_rct_spawn_area_4_2))
            set q=PlaceRandomItem(p,rndX,rndY)
        elseif (temp<=udg_ISLAND4_2+udg_ISLAND4_3) then
            set rndX=GetRandomReal(GetRectMinX(gg_rct_spawn_area_4_3),GetRectMaxX(gg_rct_spawn_area_4_3))
            set rndY=GetRandomReal(GetRectMinY(gg_rct_spawn_area_4_3),GetRectMaxY(gg_rct_spawn_area_4_3))
            set q=PlaceRandomItem(p,rndX,rndY)
        elseif (temp<=udg_ISLAND4_3+udg_ISLAND4_2+udg_ISLAND4_1) then
            set rndX=GetRandomReal(GetRectMinX(gg_rct_spawn_area_4_1),GetRectMaxX(gg_rct_spawn_area_4_1))
            set rndY=GetRandomReal(GetRectMinY(gg_rct_spawn_area_4_1),GetRectMaxY(gg_rct_spawn_area_4_1))
            set q=PlaceRandomItem(p,rndX,rndY)
        endif
    endif
    set q=null
endfunction

//WOW Long spawning Function. CHange pool values for rarity
function spawnItems takes nothing returns nothing
    local itempool p=CreateItemPool()
    local integer i=GetRandomInt(1, 25)
    local integer loopStart
    local integer loopStop
    local integer temp=1
    local real rndX=1
    local real rndY=1
    local integer spawnCount=0
    local integer curIsland
    local item q
    call ItemPoolAddItemType(p,ITEM_TINDER,udg_TINDER_RATE)
    call ItemPoolAddItemType(p,ITEM_FLINT,udg_FLINT_RATE)
    call ItemPoolAddItemType(p,ITEM_STICK,udg_STICK_RATE)
    call ItemPoolAddItemType(p,ITEM_CLAY_BALL,udg_CLAYBALL_RATE)
    call ItemPoolAddItemType(p,ITEM_STONE,udg_ROCK_RATE)
    call ItemPoolAddItemType(p,ITEM_MANA_CRYSTAL,udg_MANACRYSTAL_RATE)
    call ItemPoolAddItemType(p,ITEM_MUSHROOM,udg_MUSHROOM_RATE)
    //magic
    call ItemPoolAddItemType(p,ITEM_MAGIC,.25)
    set curIsland=GetRandomInt(0,3)
    
    loop
        exitwhen spawnCount>3
        
        if(curIsland==0) then
            set loopStart=1
            set loopStop=R2I(udg_NORTH_LEFT_ITEM*udg_SPAWN_BASE)
            loop
                exitwhen loopStart > loopStop
                call spawnIslandOne(p)
                set loopStart = loopStart + 1
            endloop
        endif
        if(curIsland==1) then
            set loopStop=R2I(udg_NORTH_RIGHT_ITEM*udg_SPAWN_BASE)
            set loopStart=1
            loop
                exitwhen loopStart > loopStop
                call spawnIslandTwo(p)
                set loopStart = loopStart + 1
            endloop
        endif
        if(curIsland==2) then
            set loopStop=R2I(udg_SOUTH_RIGHT_ITEM*udg_SPAWN_BASE)
            set loopStart=1
            loop
                exitwhen loopStart > loopStop
                call spawnIslandThree(p)
                set loopStart = loopStart + 1
            endloop
        endif
        if(curIsland==3) then
            set loopStop=R2I(udg_SOUTH_LEFT_ITEM*udg_SPAWN_BASE)
            set loopStart=1
            loop
                exitwhen loopStart > loopStop
                call spawnIslandFour(p)
                set loopStart = loopStart + 1
            endloop
        endif
        set curIsland=ModuloInteger(curIsland+1,4)
        set spawnCount=spawnCount+1
    endloop
    
    call modStats()
    set p=null
	set q=null
endfunction

function itemLower takes integer i returns nothing
    set udg_ITEM_CURRENT=IMaxBJ(udg_ITEM_CURRENT-i,0)
endfunction

function makeAnimal takes rect loc returns nothing
    local integer t = GetRandomInt(1, udg_ELK_RATE+udg_WOLF_RATE+udg_BEAR_RATE+udg_PANTHER_RATE+udg_SNAKE_RATE)
    local real x
    local real y
    if udg_ANIMAL_CURRENT<udg_ANIMAL_MAX or udg_ITEM_LIMIT_MODE==false then
        set x = GetRandomReal(GetRectMinX(loc), GetRectMaxX(loc))
        set y = GetRandomReal(GetRectMinY(loc), GetRectMaxY(loc))
        if t<=udg_PANTHER_RATE then
            call CreateUnit(Player(12), UNIT_PANTHER, x, y, 270 )
        elseif t<=udg_BEAR_RATE+udg_PANTHER_RATE then
            call CreateUnit(Player(12), UNIT_SNAKE, x, y, 270 )
        elseif t<=udg_BEAR_RATE+udg_PANTHER_RATE+udg_SNAKE_RATE then
            call CreateUnit(Player(12), UNIT_JUNGLE_BEAR, x, y, 270 )
        elseif t<=udg_BEAR_RATE+udg_WOLF_RATE+udg_PANTHER_RATE+udg_SNAKE_RATE then
            call CreateUnit(Player(12), UNIT_JUNGLE_WOLF, x, y, 270 )
        else
            call CreateUnit(Player(12), UNIT_ELK, x, y, 270 )
        endif
        set udg_ANIMAL_CURRENT = udg_ANIMAL_CURRENT + 1
    endif
endfunction

//WOW Long animal spawn
function spawnAnimals takes nothing returns nothing
    local integer loopStart=1
    local integer loopStop=R2I(udg_NORTH_LEFT_FOOD*udg_FOOD_BASE)
    local integer temp=1
    loop
        exitwhen loopStart > loopStop
        call PolledWait( udg_DELAY_TIME )
        set temp=GetRandomInt(1,udg_ISLAND1_3+udg_ISLAND1_2+udg_ISLAND1_1)
        if ( temp<=udg_ISLAND1_3 ) then
            call makeAnimal(gg_rct_spawn_area_1_3)
        elseif (temp<=udg_ISLAND1_2+udg_ISLAND1_3) then
            call makeAnimal(gg_rct_spawn_area_1_2)
        elseif (temp<=udg_ISLAND1_1+udg_ISLAND1_2+udg_ISLAND1_3) then
            call makeAnimal(gg_rct_spawn_area_1_1)
        endif
        set loopStart = loopStart + 1
    endloop
    
    set loopStop=R2I(udg_NORTH_RIGHT_FOOD*udg_FOOD_BASE)
    set loopStart=1
    loop
        exitwhen loopStart > loopStop
        call PolledWait( udg_DELAY_TIME )
        set temp=GetRandomInt(1,udg_ISLAND2_1+udg_ISLAND2_2+udg_ISLAND2_3)
        if ( temp<=udg_ISLAND2_3 ) then
            call makeAnimal(gg_rct_spawn_area_2_3)
        elseif (temp<=udg_ISLAND2_3+udg_ISLAND2_2) then
            call makeAnimal(gg_rct_spawn_area_2_2)
        elseif (temp<=udg_ISLAND2_1+udg_ISLAND2_2+udg_ISLAND2_3) then
            call makeAnimal(gg_rct_spawn_area_2_1)
        endif
        set loopStart = loopStart + 1
    endloop
    
    set loopStop=R2I(udg_SOUTH_RIGHT_FOOD*udg_FOOD_BASE)
    set loopStart=1
    loop
        exitwhen loopStart > loopStop
        call PolledWait( udg_DELAY_TIME )
        set temp=GetRandomInt(1,udg_ISLAND3_1+udg_ISLAND3_2+udg_ISLAND3_3)
        if ( temp<=udg_ISLAND3_2 ) then
            call makeAnimal(gg_rct_spawn_area_3_2)
        elseif (temp<=udg_ISLAND3_2+udg_ISLAND3_3) then
            call makeAnimal(gg_rct_spawn_area_3_3)
        elseif (temp<=udg_ISLAND3_1+udg_ISLAND3_2+udg_ISLAND3_3) then
            call makeAnimal(gg_rct_spawn_area_3_1)
        endif
        set loopStart = loopStart + 1
    endloop
    
    set loopStop=R2I(udg_SOUTH_LEFT_FOOD*udg_FOOD_BASE)
    set loopStart=1
    loop
        exitwhen loopStart > loopStop
        call PolledWait( udg_DELAY_TIME )
        set temp=GetRandomInt(1,udg_ISLAND4_1+udg_ISLAND4_2+udg_ISLAND4_3)
        if ( temp<=udg_ISLAND4_2 ) then
            call makeAnimal(gg_rct_spawn_area_4_2)
        elseif (temp<=udg_ISLAND4_2+udg_ISLAND4_3) then
            call makeAnimal(gg_rct_spawn_area_4_3)
        elseif (temp<=udg_ISLAND4_3+udg_ISLAND4_2+udg_ISLAND4_1) then
            call makeAnimal(gg_rct_spawn_area_4_1)
        endif
        set loopStart = loopStart + 1
    endloop
endfunction

function getTrollBossItem takes nothing returns integer
    local integer t=GetRandomInt(1,7)
    if(t==1) then
        return ITEM_ANABOLIC_POTION
    elseif(t==2) then
        return ITEM_BEE_HIVE
    elseif(t==3) then
        return ITEM_FERVER_POTION
    elseif(t==4) then
        return ITEM_DARK_ROCK
    elseif(t==5) then
        return ITEM_IRON_AXE
    elseif(t==6) then
        return ITEM_IRON_SPEAR
    else
        return ITEM_STEEL_INGOT
    endif
    //return ITEM_BONE_COAT
    //Bone coat
    //return ITEM_ULTRA_POISON
    //poison
    //return ITEM_STEEL_SPEAR
    //steel spear
endfunction

function getBossItem takes nothing returns integer
    local integer t=GetRandomInt(1,10)
    if(t==1) then
        return ITEM_POTION_TWIN_ISLANDS
    elseif(t==2) then
        return ITEM_BEE_HIVE
    elseif(t==3) then
        return ITEM_DISEASE_POTION
    elseif(t==4) then
        return ITEM_BEE_HIVE
    elseif(t==5) then
        return ITEM_STEEL_SPEAR
    elseif(t==6) then
        return ITEM_IRON_SPEAR
    elseif(t==7) then
        return ITEM_HEALING_POTION_IV
    elseif(t==8) then
        return ITEM_ULTRA_POISON
    elseif(t==9) then
        return ITEM_MANA_POTION_IV
    else
        return ITEM_STEEL_INGOT
    endif
endfunction

function getTurtleItem takes nothing returns integer
    local integer t = GetRandomInt(1,8)
    if t == 1 then
        return ITEM_STEEL_BOOTS
    elseif t == 2 then
        return ITEM_STEEL_COAT
    elseif t == 3 then
        return ITEM_STEEL_GLOVES
    elseif t == 4 then
        return ITEM_STEEL_SHIELD
    elseif t == 5 then
        return ITEM_ANABOLIC_BOOTS
    elseif t == 6 then
        return ITEM_BATTLE_ARMOR
    elseif t == 7 then
        return ITEM_BATTLE_GLOVES
    else
        return ITEM_BATTLE_SHIELD
    endif
endfunction

function placeMedallion takes real x, real y returns nothing
    local itempool q
    local item u
    //set q=H2IP(GetHandleHandle(Cache(),"medals"))
    set q = LoadItemPoolHandle(udg_GameHash,StringHash("medals"),StringHash("medals"))
    if(q==null) then
        set q=CreateItemPool()
        call ItemPoolAddItemType(q,ITEM_MED_PRIEST,10)
        call ItemPoolAddItemType(q,ITEM_MED_MAGE,10)
        call ItemPoolAddItemType(q,ITEM_MED_SCOUT,10)
        call ItemPoolAddItemType(q,ITEM_MED_BEAST_MASTER,10)
        call ItemPoolAddItemType(q,ITEM_MED_HUNTER,10)
        call ItemPoolAddItemType(q,ITEM_MED_GATHERER,10)
        call ItemPoolAddItemType(q,ITEM_MED_THIEF,10)
        call ItemPoolAddItemType(q,ITEM_DARK_SPEAR,.01)
        //call SetHandleHandle(udg_jumpCache,"medals",q)
        call SaveItemPoolHandle(udg_GameHash,StringHash("medals"),StringHash("medals"),q)
    endif
    set u=PlaceRandomItem(q,x,y)
    if(GetItemTypeId(u)!=ITEM_DARK_SPEAR) then
        call ItemPoolRemoveItemType(q,GetItemTypeId(u))
    endif
    set q=null
    set u=null
endfunction

function placePinion takes real x, real y returns nothing
    local itempool q
    local item u
    //set q=H2IP(GetHandleHandle(Cache(),"pinions"))
    set q = LoadItemPoolHandle(udg_GameHash,StringHash("pinions"),StringHash("pinions"))
    if(q==null) then
        set q=CreateItemPool()
        call ItemPoolAddItemType(q,ITEM_DD_PINION_FIRE,10)
        call ItemPoolAddItemType(q,ITEM_DD_PINION_SHADOW,10)
        call ItemPoolAddItemType(q,ITEM_DD_PINION_PAIN,10)
        call ItemPoolAddItemType(q,ITEM_DARK_SPEAR,.01)
        //call SetHandleHandle(udg_jumpCache,"pinions",q)
        call SaveItemPoolHandle(udg_GameHash,StringHash("pinions"),StringHash("pinions"),q)
    endif
    set u=PlaceRandomItem(q,x,y)
    if(GetItemTypeId(u)!=ITEM_DARK_SPEAR) then
        call ItemPoolRemoveItemType(q,GetItemTypeId(u))
    endif
    set q=null
    set u=null
endfunction

//*************************************************************************************
//*                                                                                   *
//*                     START OF Tree Revival Section                                 *
//*                                                                                   *
//*************************************************************************************

function IsDesTree takes destructable a returns boolean
    local integer d=GetDestructableTypeId(a)
    if d =='ATtr' then
        return true
    elseif d=='BTtw' then
        return true
    elseif d=='KTtw' then
        return true
    elseif d=='YTft' then
        return true
    elseif d=='JTct' then
        return true
    elseif d=='YTst' then
        return true
    elseif d=='YTct' then
        return true
    elseif d=='YTwt' then
        return true
    elseif d=='JTwt' then
        return true
    elseif d=='DTsh' then
        return true
    elseif d=='FTtw' then
        return true
    elseif d=='CTtr' then
        return true
    elseif d=='ITtw' then
        return true
    elseif d=='NTtw' then
        return true
    elseif d=='OTtw' then
        return true
    elseif d==DEST_RUINS_TREE then
        return true
    elseif d=='WTst' then
        return true
    elseif d=='LTlt' then
        return true
    elseif d=='GTsh' then
        return true
    elseif d=='Xtlt' then
        return true
    elseif d=='WTtw' then
        return true
    elseif d=='Attc' then
        return true
    elseif d=='BTtc' then
        return true
    elseif d=='CTtc' then
        return true
    elseif d=='ITtc' then
        return true
    elseif d=='NTtc' then
        return true
    elseif d==DEST_RUINS_TREE_CANOPY then
        return true
    else
        return false
    endif
endfunction

function RegrowTrees takes nothing returns nothing
    local destructable tree = GetDyingDestructable()
    local integer chance = GetRandomInt(1,100)
    if chance < 11 then
        call CreateItem( ITEM_STICK, GetDestructableX(tree), GetDestructableY(tree))
    endif
    set tree=null
endfunction

function Trig_Int_Tree_Revival takes nothing returns nothing
    local trigger t
    if IsDesTree(GetEnumDestructable())==true then
        set t=CreateTrigger()
        call TriggerRegisterDeathEvent( t, GetEnumDestructable() )
        call TriggerAddAction(t,function RegrowTrees)
    endif
	set t=null
endfunction

function Int_Tree_Revive takes nothing returns nothing
    call EnumDestructablesInRect( bj_mapInitialPlayableArea, null, function Trig_Int_Tree_Revival )
endfunction


//*************************************************************************************
//*                                                                                   *
//*                     END OF Tree Revival System                                    *
//*                                                                                   *
//*************************************************************************************

//Trickster sub-function, got tired of writing it.
//Checks a group (used in conjunction with ForGroup)
//returns unit in udg_TempTroll
//ie
//    call ForGroupBJ( udg_trolls, function checkGroup )
//    set mirror =udg_TempTroll

function checkGroup takes nothing returns nothing
    if ( GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer()  ) then
        set udg_TempTroll = GetEnumUnit()
    endif
endfunction

function resetBMSkill takes player p returns nothing
    call SetPlayerAbilityAvailableBJ( true, SPELL_PET_TAME, p )//tame
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_RELEASE, p )//release
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_FOLLOW, p )//Follow
    call SetPlayerAbilityAvailableBJ( false, 'A01D', p )//stay
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_SLEEP, p )//sleep
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_ATTACK, p )//attack
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_SCOUT, p )//scout
    call SetPlayerAbilityAvailableBJ( false, 'A06R', p )//bring items
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_GO_TO_HATCHERY, p )//go to hatchery
    call SetPlayerAbilityAvailableBJ( false, SPELL_PET_DROP_ITEMS, p )//drop items
endfunction

function SetRealNames takes nothing returns nothing
    local integer INTEGER = 0
    loop
        exitwhen INTEGER > 11
        if GetPlayerSlotState(Player(INTEGER)) == PLAYER_SLOT_STATE_PLAYING then
            set udg_RealNames[INTEGER] = GetPlayerName(Player(INTEGER))
        endif
        set INTEGER = INTEGER + 1
    endloop
endfunction

function GetPlayerRealName takes player who returns string
    return udg_RealNames[GetPlayerId(who)]
endfunction

function GetPlayerRealNameById takes integer id returns string
    return udg_RealNames[id]
endfunction

function GetPlayerByRealName takes string name returns player
    local integer i=0
    loop
        exitwhen i>11
        if (StringCase(udg_RealNames[i],false)==StringCase(name,false)) then
            return Player(i)
        endif
        set i=i+1
    endloop
    return Player(12)
endfunction

function GetPlayerIdByRealName takes string name returns integer
    return GetPlayerId(GetPlayerByRealName(name))
endfunction

function LockMammoth takes nothing returns nothing
    call SetDestructableInvulnerable( gg_dest_ZTsx_3140, true )
    set Mammoth = MAMMOTH
    call SetUnitOwner( Mammoth, Player(12), true )
endfunction

function SyncTradeboats takes nothing returns nothing
        call PauseUnit(udg_ship,false)
        call SetUnitX(udg_ship, -80.009 )
        call SetUnitY(udg_ship, -9282.713)
        call IssuePointOrder( udg_ship, "move", 1, 1)
    
        call PauseUnit(udg_ship2,false)
        call SetUnitX(udg_ship2, -9508.619)
        call SetUnitY(udg_ship2, 660.332)
        call IssuePointOrder( udg_ship2, "move", 1, 1)
endfunction

function ConvertEnumCorpseToCookedMeat takes nothing returns nothing
  local unit u = GetEnumUnit()
  local integer INTEGER = 0
  call CreateItem( ITEM_COOKED_MEAT, GetUnitX(u),GetUnitY(u))
  call RemoveUnit(GetEnumUnit())
  set u = null
endfunction

function presCheck takes nothing returns boolean
   return IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_parameterUnit)) and IsUnitTroll(GetFilterUnit()) and GetFilterUnit()!=udg_parameterUnit
endfunction

/*
function AntiStuckBoat takes nothing returns nothing
    if udg_ship != null then
        call IssuePointOrder( udg_ship, "move", 1, 1)
    endif
    if udg_ship2 != null then
        call IssuePointOrder( udg_ship2, "move", 1, 1)
    endif
endfunction
*/

globals
    real array ZOOM_DISTANCE
    real array ZOOM_FOGZ
endglobals

function ZoomSetCamera takes integer i returns nothing
    if GetLocalPlayer()==Player(i) and not( GetGameStatus() == GAME_STATUS_REPLAY ) then
        call SetCameraField(CAMERA_FIELD_ZOFFSET,ZOOM_DISTANCE[i],1)
        call SetCameraField(CAMERA_FIELD_FARZ,ZOOM_FOGZ[i],0)
    endif
endfunction

function ConditionalUpdateBoards takes nothing returns nothing
    call ConditionalTriggerExecute( gg_trg_update_boards )
endfunction

function UpdateBoardsLoopInit takes nothing returns nothing
    local timer t=CreateTimer()
    call TimerStart(t,1,true, function ConditionalUpdateBoards )
    set t=null
endfunction

function SetCameraBoundsEX takes player p, real minX, real minY, real maxX, real maxY returns nothing
    if (GetLocalPlayer() == p) then
        // Use only local code (no net traffic) within this block to avoid desyncs.
        call SetCameraBounds(minX, minY, minX, maxY, maxX, maxY, maxX, minY)
    endif
endfunction

function GetRandomX takes rect whichRect returns real
    return GetRandomReal(GetRectMinX(whichRect), GetRectMaxX(whichRect))
endfunction

function GetRandomY takes rect whichRect returns real
    return GetRandomReal(GetRectMinY(whichRect), GetRectMaxY(whichRect))
endfunction

function CVic takes player whichPlayer, boolean showDialog, boolean showScores returns nothing
    if not isobserver[GetPlayerId(whichPlayer)] then
        call RemovePlayer( whichPlayer, PLAYER_GAME_RESULT_VICTORY )

        if not bj_isSinglePlayer then
            call DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, GetLocalizedString( "PLAYER_VICTORIOUS" ) )
        endif

        // UI only needs to be displayed to users.
        if (GetPlayerController(whichPlayer) == MAP_CONTROL_USER) then
            set bj_changeLevelShowScores = showScores
            if showDialog then
                call CustomVictoryDialogBJ( whichPlayer )
            else
                call CustomVictorySkipBJ( whichPlayer )
            endif
        endif
    endif
endfunction

function CDef takes player whichPlayer, string message returns nothing
    if not isobserver[GetPlayerId(whichPlayer)] then
        call RemovePlayer( whichPlayer, PLAYER_GAME_RESULT_DEFEAT )

        if not bj_isSinglePlayer then
            call DisplayTimedTextFromPlayer(whichPlayer, 0, 0, 60, GetLocalizedString( "PLAYER_DEFEATED" ) )
        endif

        // UI only needs to be displayed to users.
        if (GetPlayerController(whichPlayer) == MAP_CONTROL_USER) then
            call CustomDefeatDialogBJ( whichPlayer, message )
        endif
    endif
endfunction

globals
    constant real   FONT_SIZE = 0.024
endglobals

function ManaBurn takes unit whichUnit, real dmg returns nothing
    local texttag tt
    local real cMana = GetUnitState(whichUnit, UNIT_STATE_MANA)
    local real nMana = cMana - dmg
    local real burn
    if cMana - dmg < 0 then
        set nMana = 0
    endif
    call SetUnitState(whichUnit, UNIT_STATE_MANA, nMana )
    set burn = cMana - nMana
    if IsUnitType(whichUnit, UNIT_TYPE_HERO) == true then
        set tt = CreateTextTag()
        call SetTextTagText(tt, "-"+I2S(R2I(burn)), FONT_SIZE)
        call SetTextTagPos(tt, GetUnitX(whichUnit), GetUnitY(whichUnit), 0.0)
        call SetTextTagColor(tt, 82, 82 ,255 ,255)
        call SetTextTagVelocity(tt, 0.0, 0.04)
        call SetTextTagVisibility(tt, true)
        call SetTextTagFadepoint(tt, 2.0)
        call SetTextTagLifespan(tt, 5.0)
        call SetTextTagPermanent(tt, false)   
    endif
	set tt=null
endfunction

function DisplayNewLineToPlayer takes player p returns nothing
    call DisplayTextToPlayer( p, 0, 0, " " )
endfunction

function DisplayNewLine takes nothing returns nothing
    call DisplayNewLineToPlayer( GetLocalPlayer() )
endfunction

function ControlCameraZoom takes nothing returns nothing
    local integer i = 0
    loop
        exitwhen i == 12
        call ZoomSetCamera( i )
        set i = i + 1
    endloop
endfunction

function Round takes real r returns integer
    if r - I2R(R2I(r)) >= 0.5 then
        return R2I(r+1)
    else
        return R2I(r)
    endif
endfunction

// http://kattana.users.whitehat.dk/script/?script=216
function GetNextItemEnum takes nothing returns nothing
    if DistanceBetweenPoints(GetItemLoc(GetEnumItem()),GetRectCenter(bj_isUnitGroupInRectRect)) < bj_randomSubGroupChance then
        set bj_itemRandomCurrentPick = GetEnumItem()
        set bj_randomSubGroupChance = DistanceBetweenPoints(GetItemLoc(GetEnumItem()),GetRectCenter(bj_isUnitGroupInRectRect))
    endif
endfunction

function FindNextItem takes location L returns item
    local real TempR = bj_randomSubGroupChance
    local item TempI = bj_itemRandomCurrentPick
    local item TempItm
    local rect R = bj_isUnitGroupInRectRect
    set bj_randomSubGroupChance = 1000000
    set bj_isUnitGroupInRectRect = RectFromLoc(Location(0,0),Location(2,2))
    call MoveRectToLoc(bj_isUnitGroupInRectRect,L)
    call EnumItemsInRect(GetEntireMapRect(),null,function GetNextItemEnum)
    set bj_randomSubGroupChance = TempR
    call RemoveRect(bj_isUnitGroupInRectRect)
    set bj_isUnitGroupInRectRect = R
    set R = null
    set TempItm = bj_itemRandomCurrentPick
    set bj_itemRandomCurrentPick = TempI
    set TempI = null
    return TempItm
endfunction

// http://www.thehelper.net/threads/jass-return-item-cost.53645/
function GetItemGoldCostById takes integer uid returns integer
    local integer Val = GetPlayerState(Player(15),PLAYER_STATE_RESOURCE_GOLD)
    local integer ValB = GetPlayerState(Player(15),PLAYER_STATE_RESOURCE_LUMBER)
    local integer Diff
    local unit U = CreateUnitAtLoc(Player(15),'nshe',GetRectCenter(GetPlayableMapRect()),bj_UNIT_FACING)
    call AdjustPlayerStateBJ(50000,Player(15),PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(50000,Player(15),PLAYER_STATE_RESOURCE_LUMBER)
    call UnitAddAbilityBJ('Asid',U)
    set Diff = GetPlayerState(Player(15),PLAYER_STATE_RESOURCE_GOLD)
    call AddItemToStockBJ(uid,U,1,1)
    call IssueTrainOrderByIdBJ(U,uid)
    set Diff = Diff - GetPlayerState(Player(15),PLAYER_STATE_RESOURCE_GOLD)
    call SetPlayerState(Player(15),PLAYER_STATE_RESOURCE_GOLD,Val)
    call SetPlayerState(Player(15),PLAYER_STATE_RESOURCE_LUMBER,ValB)
    call RemoveItem(FindNextItem(GetUnitLoc(U)))
    call RemoveUnit(U)
    set U = null
    return Diff
endfunction

function GetItemLumberCostById takes integer uid returns integer
    local integer Val = GetPlayerState(Player(15),PLAYER_STATE_RESOURCE_GOLD)
    local integer ValB = GetPlayerState(Player(15),PLAYER_STATE_RESOURCE_LUMBER)
    local integer Diff
    local unit U = CreateUnitAtLoc(Player(15),'nshe',GetRectCenter(GetPlayableMapRect()),bj_UNIT_FACING)
    call AdjustPlayerStateBJ(50000,Player(15),PLAYER_STATE_RESOURCE_GOLD)
    call AdjustPlayerStateBJ(50000,Player(15),PLAYER_STATE_RESOURCE_LUMBER)
    call UnitAddAbilityBJ('Asid',U)
    set Diff = GetPlayerState(Player(15),PLAYER_STATE_RESOURCE_LUMBER)
    call AddItemToStockBJ(uid,U,1,1)
    call IssueTrainOrderByIdBJ(U,uid)
    set Diff = Diff - GetPlayerState(Player(15),PLAYER_STATE_RESOURCE_LUMBER)
    call SetPlayerState(Player(15),PLAYER_STATE_RESOURCE_GOLD,Val)
    call SetPlayerState(Player(15),PLAYER_STATE_RESOURCE_LUMBER,ValB)
    call RemoveItem(FindNextItem(GetUnitLoc(U)))
    call RemoveUnit(U)
    set U = null
    return Diff
endfunction

function GetItemLumberCost takes item i returns integer
    return GetItemLumberCostById(GetItemTypeId(i))
endfunction

function GetItemGoldCost takes item i returns integer
    return GetItemGoldCostById(GetItemTypeId(i))
endfunction

function GetItemSellPrice takes item i returns integer
    return Round( GetItemLumberCost( i ) * 0.635 )
endfunction

function initPublicLibrary takes nothing returns nothing
    local timer t = NewTimer()
    call TimerStart( t, 0., false, function SetRealNames )
    set t = NewTimer()
    call TimerStart( t, 1., true, function ControlCameraZoom )
    set t = null
endfunction

endlibrary