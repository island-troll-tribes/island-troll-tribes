library PublicLibrary initializer initPublicLibrary requires TimerUtils, ID, Constants, FilterTypeIsThing, InitializeUnits, GlobalsInit

function IsUnitImmobilized takes unit u returns boolean
    return GetUnitAbilityLevel(u, 'Beng') > 0 or GetUnitAbilityLevel(u, 'Bena') > 0 or GetUnitAbilityLevel(u, 'BEer') > 0
endfunction

// superior function to GetUnitsInRangeOfLocMatching
function GetUnitsInRangeMatching takes real radius, real x, real y, boolexpr filter returns group
    local group g = CreateGroup()
    call GroupEnumUnitsInRange(g, x , y , radius, filter)
    call DestroyBoolExpr(filter)
    return g
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
function hasPets takes nothing returns boolean
    return ( GetUnitTypeId(GetFilterUnit()) == UNIT_BEAST_MASTER or GetUnitTypeId(GetFilterUnit()) == UNIT_TRUE_FORM or GetUnitTypeId(GetFilterUnit()) == UNIT_ULTIMATE_FORM )
endfunction

function getAnimalGreenLight takes unit u returns boolean
    local group bms
    local unit bm
    local integer maxLevel = 0
    set bms = GetUnitsInRangeMatching(400, GetUnitX(u), GetUnitY(u), Condition(function hasPets) )
    if(bms != null) then
      loop
        if(FirstOfGroup(bms) != null) then
          set bm = FirstOfGroup(bms)
          set maxLevel = IMaxBJ(maxLevel, GetHeroLevel(bm))
          call GroupRemoveUnit(bms, bm)
        endif
        exitwhen FirstOfGroup(bms) == null
      endloop
    set udg_booleanParameter=( GetRandomReal(0, 1) <= udg_PET_CHANCE+(maxLevel*0.05) )
    else
    set udg_booleanParameter=( GetRandomReal(0, 1) <= udg_PET_CHANCE )
    endif
    set bms = null
    set bm = null
    return udg_booleanParameter
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

function getPlayersTroll takes player p returns nothing
    set udg_parameterUnit=udg_PUnits[GetPlayerId(p)]
endfunction

function GetPlayerTroll takes player p returns unit
    set udg_parameterUnit=udg_PUnits[GetPlayerId(p)]
    return udg_parameterUnit
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
        set udg_SNAKE_RATE = 1
        set udg_WOLF_RATE = 2
    else
        set udg_PANTHER_RATE = R2I(1*udg_BADDIE_BASE)
        set udg_BEAR_RATE = R2I(1*udg_BADDIE_BASE)
        set udg_SNAKE_RATE = R2I(1*udg_BADDIE_BASE)
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
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Nether_Fade, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Jump, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_blink_ww_short_radius, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_master_Thief, p, EVENT_PLAYER_UNIT_ATTACKED )



    elseif(GetUnitTypeId(u)==UNIT_PRIEST) then//priest
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_cloud_cast, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Angelic_Orb, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Mix_Mana, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Mix_Health, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Mix_Heat, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_self_pres, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Omniresist, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Metabolism_All, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Hidden_Power_All, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Multiwave, p, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        call TriggerRegisterPlayerUnitEventSimple( gg_trg_Light_Gate, p, EVENT_PLAYER_UNIT_SPELL_CHANNEL )

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

function itemLower takes integer i returns nothing
    set udg_ITEM_CURRENT=IMaxBJ(udg_ITEM_CURRENT-i,0)
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

globals
    real array ZOOM_DISTANCE
    real array ZOOM_FOGZ
endglobals

function ZoomSetCamera takes integer i returns nothing
    if GetLocalPlayer()==Player(i) then
        call SetCameraField(CAMERA_FIELD_ZOFFSET,ZOOM_DISTANCE[i],1)
        call SetCameraField(CAMERA_FIELD_FARZ,ZOOM_FOGZ[i],0)
    endif
endfunction

function GetRandomX takes rect whichRect returns real
    return GetRandomReal(GetRectMinX(whichRect), GetRectMaxX(whichRect))
endfunction

function GetRandomY takes rect whichRect returns real
    return GetRandomReal(GetRectMinY(whichRect), GetRectMaxY(whichRect))
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

function ControlCameraZoom takes nothing returns nothing
    local integer i = 0
    loop
        exitwhen i == 12
        call ZoomSetCamera( i )
        set i = i + 1
    endloop
endfunction

function initPublicLibrary takes nothing returns nothing
    local timer t = NewTimer()
    call TimerStart( t, 1., true, function ControlCameraZoom )
    set t = null
endfunction

endlibrary
