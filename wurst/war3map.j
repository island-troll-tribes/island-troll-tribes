globals
    // User-defined
real udg_SPAWN_BASE= 0
integer udg_NORTH_LEFT_ITEM= 0
integer udg_NORTH_RIGHT_ITEM= 0
integer udg_SOUTH_RIGHT_ITEM= 0
real udg_ITEM_BASE= 0
real udg_FOOD_BASE= 0
integer udg_NORTH_LEFT_FOOD= 0
integer udg_NORTH_RIGHT_FOOD= 0
integer udg_SOUTH_RIGHT_FOOD= 0
real udg_STAT_LOWER_INTERVAL= 0
real udg_CLOTHS_HEATUP_INTERVAL= 0
integer udg_MAX_HEAT= 0
integer udg_HEAT_PER_CAST= 0
group udg_trolls= null
boolean udg_STARTED= false
real udg_FOOD_FOR_KILL_PROPORTION= 0
boolean udg_NOOB_TIME= false
integer udg_SOUTH_LEFT_ITEM= 0
integer udg_SOUTH_LEFT_FOOD= 0
integer udg_ISLAND1_3= 0
integer udg_ISLAND1_2= 0
integer udg_ISLAND1_1= 0
integer udg_ISLAND2_3= 0
integer udg_ISLAND2_2= 0
integer udg_ISLAND2_1= 0
integer udg_ISLAND3_2= 0
integer udg_ISLAND3_3= 0
integer udg_ISLAND3_1= 0
integer udg_ISLAND4_3= 0
integer udg_ISLAND4_2= 0
integer udg_ISLAND4_1= 0
integer udg_ELK_RATE= 0
integer udg_WOLF_RATE= 0
integer udg_BEAR_RATE= 0
real udg_TINDER_RATE= 0
real udg_FLINT_RATE= 0
real udg_STICK_RATE= 0
real udg_CLAYBALL_RATE= 0
real udg_ROCK_RATE= 0
real udg_MANACRYSTAL_RATE= 0
real udg_DELAY_TIME= 0
unit udg_ship= null
boolean udg_shipOn= false
real udg_SHIP_WAIT_TIME= 0
real udg_MUSHROOM_RATE= 0
rect udg_nextShipStop= null
real udg_NEXT_SHIP_INTERVAL= 0
real udg_SHOW_START= 0
integer udg_STAT_DEGRADE_AMOUNT= 0
integer udg_FISH_PER_AREA= 0
group udg_pets= null
string array udg_orders
unit udg_parameterUnit= null
player udg_playerParameter= null
group udg_babyPets= null
real udg_PET_CHANCE= 0
boolean udg_booleanParameter= false
group udg_midPets= null
unit udg_growingPet= null
integer udg_FISH_MAX= 0
integer udg_FISH_CURRENT= 0
integer udg_ANIMAL_CURRENT= 0
integer udg_ANIMAL_MAX= 0
integer udg_ITEM_CURRENT= 0
integer udg_ITEM_MAX= 0
boolean udg_ITEM_LIMIT_MODE= false
integer udg_integerParameter= 0
boolean udg_CLASSIC_MODE= false
boolean udg_FAST_MODE= false
boolean udg_EXTRA_MODE= false
timer udg_noobTimer= null
rect udg_tempLoc= null
boolean udg_BOSS_PRIZE_MODE= false
integer array udg_spells
string array udg_spellStrings
real udg_realParameter= 0
boolean array udg_started
boolean udg_EXPERIENCE_MODE= false
real udg_PET_GROWTH= 0
real udg_NOOB_TIME_LEFT= 0
integer udg_integerParameter2= 0
integer udg_integerParameter3= 0
group udg_plants= null
integer array udg_stackables
integer array udg_stackable_max
integer udg_stackables_UBound= 0
unit udg_hatchCheck= null
unit udg_parameterUnit2= null
boolean udg_revivingForce1= false
boolean udg_revivingForce2= false
boolean udg_revivingForce3= false
unit udg_ship2= null
rect udg_nextShipStop2= null
boolean udg_shipOn2= false
integer udg_SNAKE_RATE= 0
integer udg_PANTHER_RATE= 0
unit udg_smokeStreamer= null
gamecache udg_jumpCache= null
boolean udg_MORE_BADDIES= false
group udg_blurs= null
unit udg_bluringUnit= null
unit udg_jelUnit= null
boolean udg_SIX_SIX= false
integer udg_AllTroll= 0
unit array udg_PUnits
real udg_BADDIE_BASE= 0
boolean udg_TREES= false
integer array udg_DItems
boolean array udg_DAvailable
boolean udg_DualInProgress= false
unit udg_DualUnit1= null
unit udg_DualUnit2= null
timer udg_DualTimer= null
rect udg_LastPosBeforeDual1= null
rect udg_LastPosBeforeDual2= null
boolean udg_NOOB_MODE= false
boolean udg_ELIMINATION= false
unit array udg_DiseaseCastArea
string array udg_RealNames
boolean udg_Famine= false
boolean udg_Herbs= false
boolean udg_Lavish= false
boolean udg_DisabledBoats= false
location udg_TestPoint= null
gamecache udg_attackedCache= null
gamecache udg_attackerCache= null
integer udg_Temp= 0
unit array udg_MindTroll
group udg_CloneTrolls= null
unit udg_TempTroll= null
player udg_Host= null
hashtable udg_GameHash= null
boolean udg_Clonecheck= false
boolean udg_lowerAMH= false
integer udg_PauseCount= 0
unit udg_Magnet= null
integer udg_lastShipOrder2= 0
boolean udg_booleanParameter2= false
integer udg_lastShipOrder= 0
multiboard udg_board3= null
multiboard udg_board2= null
multiboard udg_board1= null
group udg_Ward_UnitGroup= null
boolean udg_NT_DISABLED_YESNO= false
boolean udg_HCL_NT= false
boolean udg_EpicBossFight= false
unit udg_TrollBurr= null
boolean udg_Survive= false

    // Generated
rect gg_rct_D1_Spawn= null
rect gg_rct_D2_Spawn= null
rect gg_rct_discoduck= null
rect gg_rct_Dualing_Area= null
rect gg_rct_fish_new_1= null
rect gg_rct_fish_new_2= null
rect gg_rct_fish_new_3= null
rect gg_rct_fish_new_4= null
rect gg_rct_fish_new_5= null
rect gg_rct_fish_new_6= null
rect gg_rct_fish_new_7= null
rect gg_rct_fish_new_8= null
rect gg_rct_our_5_1= null
rect gg_rct_out_1_1= null
rect gg_rct_out_1_2= null
rect gg_rct_out_2_1= null
rect gg_rct_out_2_2= null
rect gg_rct_out_3_1= null
rect gg_rct_out_3_2= null
rect gg_rct_out_4_1= null
rect gg_rct_out_4_2= null
rect gg_rct_out_5_2= null
rect gg_rct_Rain= null
rect gg_rct_revive_1= null
rect gg_rct_revive_10= null
rect gg_rct_revive_11= null
rect gg_rct_revive_12= null
rect gg_rct_revive_2= null
rect gg_rct_revive_3= null
rect gg_rct_revive_4= null
rect gg_rct_revive_5= null
rect gg_rct_revive_6= null
rect gg_rct_revive_7= null
rect gg_rct_revive_8= null
rect gg_rct_revive_9= null
rect gg_rct_ship_B_1= null
rect gg_rct_ship_BL_1= null
rect gg_rct_ship_BL_2= null
rect gg_rct_ship_BL_3= null
rect gg_rct_ship_BL_4= null
rect gg_rct_ship_BL_5= null
rect gg_rct_ship_BL_6= null
rect gg_rct_ship_BO= null
rect gg_rct_ship_BR_1= null
rect gg_rct_ship_BR_2= null
rect gg_rct_ship_BR_3= null
rect gg_rct_ship_L_1= null
rect gg_rct_ship_L_2= null
rect gg_rct_ship_L_3= null
rect gg_rct_ship_LO= null
rect gg_rct_ship_R_1= null
rect gg_rct_ship_R_2= null
rect gg_rct_ship_RO= null
rect gg_rct_ship_T_1= null
rect gg_rct_ship_T_2= null
rect gg_rct_ship_T_3= null
rect gg_rct_ship_TL_1= null
rect gg_rct_ship_TL_2= null
rect gg_rct_ship_TL_3= null
rect gg_rct_ship_TL_4= null
rect gg_rct_ship_TO= null
rect gg_rct_ship_TR_1= null
rect gg_rct_ship_TR_2= null
rect gg_rct_ship_TR_3= null
rect gg_rct_spawn_area_1_1= null
rect gg_rct_spawn_area_1_2= null
rect gg_rct_spawn_area_1_3= null
rect gg_rct_spawn_area_2_1= null
rect gg_rct_spawn_area_2_2= null
rect gg_rct_spawn_area_2_3= null
rect gg_rct_spawn_area_3_1= null
rect gg_rct_spawn_area_3_2= null
rect gg_rct_spawn_area_3_3= null
rect gg_rct_spawn_area_4_1= null
rect gg_rct_spawn_area_4_2= null
rect gg_rct_spawn_area_4_3= null
rect gg_rct_Thief_Bush_NE_A_In= null
rect gg_rct_Thief_Bush_NE_A_Out= null
rect gg_rct_Thief_Bush_NW_A_In= null
rect gg_rct_Thief_Bush_NW_A_Out= null
rect gg_rct_Thief_Bush_SE_A_In= null
rect gg_rct_Thief_Bush_SE_A_Out= null
rect gg_rct_Thief_Bush_SW_A_In= null
rect gg_rct_Thief_Bush_SW_A_Out= null
rect gg_rct_Thief_Bush_SW_C_In= null
rect gg_rct_Thief_Bush_SW_C_Out= null
rect gg_rct_vision= null
rect gg_rct_TheOne= null
rect gg_rct_Thief_Bush_NE_B_In= null
rect gg_rct_Thief_Bush_NE_B_Out= null
rect gg_rct_Region_063= null
rect gg_rct_TheOneCliff= null


//JASSHelper struct globals:

endglobals


//===========================================================================
// 
// Island Troll Tribes v3.3a Beta 33
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Wed May  8 20:13:05 2019
//   Map Author: pl0x/moop/rocketrusty/Quazz/Meph
// 
//===========================================================================

//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************


function InitGlobals takes nothing returns nothing
    local integer i= 0
    set udg_SPAWN_BASE=1.00
    set udg_NORTH_LEFT_ITEM=30
    set udg_NORTH_RIGHT_ITEM=33
    set udg_SOUTH_RIGHT_ITEM=30
    set udg_ITEM_BASE=1.00
    set udg_FOOD_BASE=1.00
    set udg_NORTH_LEFT_FOOD=9
    set udg_NORTH_RIGHT_FOOD=10
    set udg_SOUTH_RIGHT_FOOD=10
    set udg_STAT_LOWER_INTERVAL=3.00
    set udg_CLOTHS_HEATUP_INTERVAL=35.00
    set udg_MAX_HEAT=100
    set udg_HEAT_PER_CAST=15
    set udg_trolls=CreateGroup()
    set udg_STARTED=false
    set udg_FOOD_FOR_KILL_PROPORTION=1.00
    set udg_NOOB_TIME=true
    set udg_SOUTH_LEFT_ITEM=45
    set udg_SOUTH_LEFT_FOOD=17
    set udg_ISLAND1_3=20
    set udg_ISLAND1_2=33
    set udg_ISLAND1_1=100
    set udg_ISLAND2_3=26
    set udg_ISLAND2_2=21
    set udg_ISLAND2_1=21
    set udg_ISLAND3_2=10
    set udg_ISLAND3_3=48
    set udg_ISLAND3_1=100
    set udg_ISLAND4_3=9
    set udg_ISLAND4_2=5
    set udg_ISLAND4_1=140
    set udg_ELK_RATE=10
    set udg_WOLF_RATE=0
    set udg_BEAR_RATE=0
    set udg_TINDER_RATE=5.00
    set udg_FLINT_RATE=3.00
    set udg_STICK_RATE=3.00
    set udg_CLAYBALL_RATE=1.00
    set udg_ROCK_RATE=1.00
    set udg_MANACRYSTAL_RATE=0.00
    set udg_DELAY_TIME=0.01
    set udg_shipOn=false
    set udg_SHIP_WAIT_TIME=15.00
    set udg_MUSHROOM_RATE=0.00
    set udg_NEXT_SHIP_INTERVAL=0
    set udg_SHOW_START=17.00
    set udg_STAT_DEGRADE_AMOUNT=1
    set udg_FISH_PER_AREA=1
    set udg_pets=CreateGroup()
    set i=0
    loop
        exitwhen ( i > 20 )
        set udg_orders[i]=""
        set i=i + 1
    endloop

    set udg_babyPets=CreateGroup()
    set udg_PET_CHANCE=0.17
    set udg_booleanParameter=false
    set udg_midPets=CreateGroup()
    set udg_FISH_MAX=100
    set udg_FISH_CURRENT=0
    set udg_ANIMAL_CURRENT=0
    set udg_ANIMAL_MAX=120
    set udg_ITEM_CURRENT=0
    set udg_ITEM_MAX=350
    set udg_ITEM_LIMIT_MODE=true
    set udg_integerParameter=0
    set udg_CLASSIC_MODE=false
    set udg_FAST_MODE=false
    set udg_EXTRA_MODE=true
    set udg_noobTimer=CreateTimer()
    set udg_BOSS_PRIZE_MODE=true
    set i=0
    loop
        exitwhen ( i > 23 )
        set udg_spells[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 23 )
        set udg_spellStrings[i]=""
        set i=i + 1
    endloop

    set udg_realParameter=0
    set i=0
    loop
        exitwhen ( i > 12 )
        set udg_started[i]=false
        set i=i + 1
    endloop

    set udg_EXPERIENCE_MODE=true
    set udg_PET_GROWTH=0.02
    set udg_NOOB_TIME_LEFT=480.00
    set udg_integerParameter2=0
    set udg_integerParameter3=0
    set udg_plants=CreateGroup()
    set i=0
    loop
        exitwhen ( i > 37 )
        set udg_stackables[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 37 )
        set udg_stackable_max[i]=0
        set i=i + 1
    endloop

    set udg_stackables_UBound=17
    set udg_revivingForce1=false
    set udg_revivingForce2=false
    set udg_revivingForce3=false
    set udg_shipOn2=false
    set udg_SNAKE_RATE=0
    set udg_PANTHER_RATE=0
    set udg_MORE_BADDIES=false
    set udg_blurs=CreateGroup()
    set udg_SIX_SIX=false
    set udg_AllTroll=0
    set udg_BADDIE_BASE=1.00
    set udg_TREES=true
    set i=0
    loop
        exitwhen ( i > 12 )
        set udg_DItems[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 12 )
        set udg_DAvailable[i]=false
        set i=i + 1
    endloop

    set udg_DualInProgress=false
    set udg_DualTimer=CreateTimer()
    set udg_NOOB_MODE=false
    set udg_ELIMINATION=false
    set i=0
    loop
        exitwhen ( i > 12 )
        set udg_DiseaseCastArea[i]=null
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 12 )
        set udg_RealNames[i]=""
        set i=i + 1
    endloop

    set udg_Famine=false
    set udg_Herbs=false
    set udg_Lavish=false
    set udg_DisabledBoats=true
    set udg_Temp=0
    set i=0
    loop
        exitwhen ( i > 60 )
        set udg_MindTroll[i]=null
        set i=i + 1
    endloop

    set udg_CloneTrolls=CreateGroup()
    set udg_TempTroll=null
    set udg_Host=Player(0)
    set udg_Clonecheck=false
    set udg_lowerAMH=false
    set udg_PauseCount=0
    set udg_booleanParameter2=false
    set udg_Ward_UnitGroup=CreateGroup()
    set udg_NT_DISABLED_YESNO=false
    set udg_HCL_NT=false
    set udg_EpicBossFight=false
    set udg_TrollBurr=null
    set udg_Survive=false
endfunction

//***************************************************************************
//*
//*  Map Item Tables
//*
//***************************************************************************

function ItemTable000000_DropItems takes nothing returns nothing
    local widget trigWidget= null
    local unit trigUnit= null
    local integer itemID= 0
    local boolean canDrop= true

    set trigWidget=bj_lastDyingWidget
    if ( trigWidget == null ) then
        set trigUnit=GetTriggerUnit()
    endif

    if ( trigUnit != null ) then
        set canDrop=not IsUnitHidden(trigUnit)
        if ( canDrop and GetChangingUnit() != null ) then
            set canDrop=( GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE) )
        endif
    endif

    if ( canDrop ) then
        // Item set 0
        call RandomDistReset()
        call RandomDistAddItem('2', 50)
        call RandomDistAddItem('Pd`X', 1261711433)
        set itemID=RandomDistChoose()
        if ( trigUnit != null ) then
            call UnitDropItem(trigUnit, itemID)
        else
            call WidgetDropItem(trigWidget, itemID)
        endif

    endif

    set bj_lastDyingWidget=null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction


//***************************************************************************
//*
//*  Items
//*
//***************************************************************************

function CreateAllItems takes nothing returns nothing
    local integer itemID

    call CreateItem('I006', - 1212.1, - 469.1)
endfunction

//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************

//===========================================================================
function CreateNeutralHostileBuildings takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_AGGRESSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=CreateUnit(p, 'h001', - 4352.0, - 11904.0, 270.000)
    set u=CreateUnit(p, 'h02J', - 6336.0, 1984.0, 270.000)
    set u=CreateUnit(p, 'h02J', 6464.0, 1920.0, 270.000)
    set u=CreateUnit(p, 'h02J', - 6784.0, - 7232.0, 270.000)
    set u=CreateUnit(p, 'h01I', 5120.0, - 9856.0, 270.000)
    set u=CreateUnit(p, 'h01I', - 3008.0, - 7936.0, 270.000)
    set u=CreateUnit(p, 'h01H', - 9408.0, - 6720.0, 270.000)
    set u=CreateUnit(p, 'h01G', - 2560.0, - 7488.0, 270.000)
    set u=CreateUnit(p, 'h01I', - 5056.0, - 192.0, 270.000)
    set u=CreateUnit(p, 'h01I', - 3840.0, - 9472.0, 270.000)
    set u=CreateUnit(p, 'h01I', - 3328.0, - 9536.0, 270.000)
    set u=CreateUnit(p, 'h01I', - 5888.0, - 9024.0, 270.000)
    set u=CreateUnit(p, 'h01I', - 1152.0, 1536.0, 270.000)
    set u=CreateUnit(p, 'h01I', 9408.0, - 1344.0, 270.000)
    set u=CreateUnit(p, 'h02J', 2304.0, - 6656.0, 270.000)
    set u=CreateUnit(p, 'h02J', - 5440.0, - 2944.0, 270.000)
    set u=CreateUnit(p, 'h02J', 1856.0, - 832.0, 270.000)
    set u=CreateUnit(p, 'h02J', 6080.0, - 5952.0, 270.000)
    set u=CreateUnit(p, 'h02J', 2112.0, 7104.0, 270.000)
    set u=CreateUnit(p, 'h02J', - 3136.0, 5568.0, 270.000)
endfunction

//===========================================================================
function CreateNeutralHostile takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_AGGRESSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=CreateUnit(p, 'n01B', - 11338.7, - 9959.1, 313.436)
    set u=CreateUnit(p, 'n01B', - 9681.1, - 11555.2, 356.968)
    set u=CreateUnit(p, 'n005', 201.4, 71.0, 315.000)
    set u=CreateUnit(p, 'n01B', - 9602.2, 10736.6, 335.641)
    set u=CreateUnit(p, 'n011', 10997.8, - 12177.1, 135.000)
    set u=CreateUnit(p, 'n011', - 11898.9, - 11915.7, 45.000)
    set t=CreateTrigger()
    call TriggerRegisterUnitEvent(t, u, EVENT_UNIT_DEATH)
    call TriggerRegisterUnitEvent(t, u, EVENT_UNIT_CHANGE_OWNER)
    call TriggerAddAction(t, function ItemTable000000_DropItems)
    set u=CreateUnit(p, 'n011', - 12162.9, 11005.1, 316.031)
    set u=CreateUnit(p, 'n011', 10880.7, 11008.1, 225.000)
    set t=CreateTrigger()
    call TriggerRegisterUnitEvent(t, u, EVENT_UNIT_DEATH)
    call TriggerRegisterUnitEvent(t, u, EVENT_UNIT_CHANGE_OWNER)
    call TriggerAddAction(t, function ItemTable000000_DropItems)
    set u=CreateUnit(p, 'n01B', 8850.8, 10822.5, 174.284)
    set u=CreateUnit(p, 'n01B', 10534.8, - 5082.3, 33.125)
    set u=CreateUnit(p, 'n01B', 8533.9, - 11884.5, 73.647)
    set u=CreateUnit(p, 'n01B', 3594.4, 10844.1, 56.200)
    set u=CreateUnit(p, 'n01B', - 10657.6, - 5648.6, 307.022)
endfunction

//===========================================================================
function CreateNeutralPassiveBuildings takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=CreateUnit(p, 'n00N', 1152.0, - 896.0, 305.930)
    set u=CreateUnit(p, 'h01H', - 1344.0, 6528.0, 270.000)
    set u=CreateUnit(p, 'h01F', 3712.0, - 7104.0, 270.000)
    set u=CreateUnit(p, 'h00A', 2432.0, - 11136.0, 270.000)
    set u=CreateUnit(p, 'h01G', - 6208.0, - 3520.0, 270.000)
    set u=CreateUnit(p, 'h01G', 8000.0, - 4416.0, 270.000)
    set u=CreateUnit(p, 'h024', 1344.0, - 832.0, 270.000)
    set u=CreateUnit(p, 'h024', 1088.0, - 1088.0, 270.000)
    set u=CreateUnit(p, 'h01H', 384.0, - 832.0, 270.000)
    set u=CreateUnit(p, 'h01H', 1088.0, - 128.0, 270.000)
    set u=CreateUnit(p, 'h01H', 5696.0, - 4224.0, 270.000)
    set u=CreateUnit(p, 'h01I', - 704.0, - 5824.0, 270.000)
    set u=CreateUnit(p, 'h01F', 9536.0, 7744.0, 270.000)
    set u=CreateUnit(p, 'n019', - 128.0, 384.0, 340.157)
    set u=CreateUnit(p, 'h01G', 1728.0, 7360.0, 270.000)
    set u=CreateUnit(p, 'h01G', - 7872.0, 2176.0, 270.000)
    set u=CreateUnit(p, 'h01F', - 1600.0, 8896.0, 270.000)
    set u=CreateUnit(p, 'h01F', - 9152.0, 192.0, 270.000)
    set u=CreateUnit(p, 'h01F', 576.0, - 7104.0, 270.000)
    set u=CreateUnit(p, 'h01F', 7232.0, - 5952.0, 270.000)
    set u=CreateUnit(p, 'h01F', - 5952.0, 3904.0, 270.000)
    set u=CreateUnit(p, 'h01F', 4288.0, 8768.0, 270.000)
    set u=CreateUnit(p, 'h01F', 8128.0, 5312.0, 270.000)
    set u=CreateUnit(p, 'h01H', 832.0, - 8896.0, 270.000)
    set u=CreateUnit(p, 'h01F', - 4928.0, - 6336.0, 270.000)
    set u=CreateUnit(p, 'h01H', 7744.0, 7872.0, 270.000)
    set u=CreateUnit(p, 'h01H', 5696.0, 320.0, 270.000)
    set u=CreateUnit(p, 'h01H', - 6336.0, 6208.0, 270.000)
    set u=CreateUnit(p, 'h01H', - 320.0, - 4544.0, 270.000)
    set u=CreateUnit(p, 'h01I', 1600.0, - 3776.0, 270.000)
    set u=CreateUnit(p, 'h01I', - 7808.0, 2624.0, 270.000)
    set u=CreateUnit(p, 'h01I', - 6016.0, - 4032.0, 270.000)
    set u=CreateUnit(p, 'h01I', - 2560.0, - 2944.0, 270.000)
    set u=CreateUnit(p, 'h01I', - 4416.0, 9536.0, 270.000)
    set u=CreateUnit(p, 'h01I', 1088.0, 7104.0, 270.000)
    set u=CreateUnit(p, 'h01I', 5184.0, 6848.0, 270.000)
    set u=CreateUnit(p, 'h01I', 7872.0, - 3904.0, 270.000)
    set u=CreateUnit(p, 'h01J', - 7296.0, 7104.0, 270.000)
    set u=CreateUnit(p, 'h01J', - 5312.0, 7104.0, 270.000)
    set u=CreateUnit(p, 'h01K', 6208.0, 6144.0, 270.000)
    set u=CreateUnit(p, 'h01K', 5056.0, 6080.0, 270.000)
    set u=CreateUnit(p, 'h01L', 7744.0, - 4928.0, 270.000)
    set u=CreateUnit(p, 'h01L', 3328.0, - 5696.0, 270.000)
    set u=CreateUnit(p, 'h024', - 5056.0, 4416.0, 270.000)
    set u=CreateUnit(p, 'h01Q', 2432.0, - 11328.0, 270.000)
    set u=CreateUnit(p, 'h024', 8704.0, 8768.0, 270.000)
    set u=CreateUnit(p, 'h024', 8320.0, 576.0, 270.000)
    set u=CreateUnit(p, 'h024', 8576.0, 448.0, 270.000)
    set u=CreateUnit(p, 'h024', 6208.0, - 1216.0, 270.000)
    set u=CreateUnit(p, 'h024', 8768.0, - 8256.0, 270.000)
    set u=CreateUnit(p, 'h024', 1408.0, - 5440.0, 270.000)
    set u=CreateUnit(p, 'h024', 2112.0, - 3520.0, 270.000)
    set u=CreateUnit(p, 'h024', - 7616.0, 9152.0, 270.000)
    set u=CreateUnit(p, 'h024', - 8640.0, - 512.0, 270.000)
    set u=CreateUnit(p, 'h024', - 7872.0, - 5888.0, 270.000)
    set u=CreateUnit(p, 'h024', - 448.0, - 3264.0, 270.000)
    set u=CreateUnit(p, 'h025', - 7168.0, - 1664.0, 270.000)
    set u=CreateUnit(p, 'h025', - 2880.0, 7360.0, 270.000)
    set u=CreateUnit(p, 'h025', - 4288.0, 3264.0, 270.000)
    set u=CreateUnit(p, 'h025', 3136.0, 8064.0, 270.000)
    set u=CreateUnit(p, 'h025', 2368.0, 4224.0, 270.000)
    set u=CreateUnit(p, 'h025', 8256.0, - 3136.0, 270.000)
    set u=CreateUnit(p, 'h025', 3712.0, - 4928.0, 270.000)
    set u=CreateUnit(p, 'h025', - 6912.0, - 6720.0, 270.000)
    set u=CreateUnit(p, 'h025', - 8896.0, - 4480.0, 270.000)
    set u=CreateUnit(p, 'h026', - 8896.0, - 6848.0, 270.000)
    set u=CreateUnit(p, 'h026', - 2688.0, - 2560.0, 270.000)
    set u=CreateUnit(p, 'h01F', - 5632.0, 1088.0, 270.000)
    set u=CreateUnit(p, 'h025', - 3456.0, - 4096.0, 270.000)
    set u=CreateUnit(p, 'h024', - 2880.0, 832.0, 270.000)
    set u=CreateUnit(p, 'h025', 1472.0, - 2240.0, 270.000)
    set u=CreateUnit(p, 'h01F', - 3072.0, 576.0, 270.000)
    set u=CreateUnit(p, 'h01F', - 4672.0, - 64.0, 270.000)
    set u=CreateUnit(p, 'h025', - 2112.0, 1472.0, 270.000)
    set u=CreateUnit(p, 'h025', 4416.0, 3776.0, 270.000)
    set u=CreateUnit(p, 'h01F', 320.0, 5952.0, 270.000)
    set u=CreateUnit(p, 'h025', 2240.0, 6464.0, 270.000)
    set u=CreateUnit(p, 'h01I', 7616.0, 3520.0, 270.000)
    set u=CreateUnit(p, 'h025', 9024.0, 6272.0, 270.000)
    set u=CreateUnit(p, 'h01F', - 5696.0, 8768.0, 270.000)
    set u=CreateUnit(p, 'h025', - 1536.0, - 4096.0, 270.000)
    set u=CreateUnit(p, 'h01I', 7360.0, - 1088.0, 270.000)
    set u=CreateUnit(p, 'h025', - 3008.0, - 6592.0, 270.000)
    set u=CreateUnit(p, 'h01F', 8896.0, - 2112.0, 270.000)
    set u=CreateUnit(p, 'h024', - 960.0, 4800.0, 270.000)
endfunction

//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u=CreateUnit(p, 'n013', - 12110.9, - 12102.2, 55.260)
    set u=CreateUnit(p, 'n013', - 12392.6, 11233.4, 317.760)
    set u=CreateUnit(p, 'n013', 11091.5, 11214.6, 225.980)
    set u=CreateUnit(p, 'n013', 11170.4, - 12327.9, 134.340)
endfunction

//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
endfunction

//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
endfunction

//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreateNeutralHostileBuildings()
    call CreateNeutralPassiveBuildings()
    call CreatePlayerBuildings()
    call CreateNeutralHostile()
    call CreateNeutralPassive()
    call CreatePlayerUnits()
endfunction

//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************

function CreateRegions takes nothing returns nothing
    local weathereffect we

    set gg_rct_D1_Spawn=Rect(- 4608.0, - 11904.0, - 4512.0, - 11808.0)
    set gg_rct_D2_Spawn=Rect(- 4192.0, - 11904.0, - 4096.0, - 11808.0)
    set gg_rct_discoduck=Rect(160.0, 32.0, 192.0, 64.0)
    set gg_rct_Dualing_Area=Rect(- 5792.0, - 12576.0, - 2912.0, - 11360.0)
    set gg_rct_fish_new_1=Rect(- 9632.0, 2368.0, - 9184.0, 4544.0)
    set gg_rct_fish_new_2=Rect(- 1280.0, 8128.0, - 32.0, 8928.0)
    set gg_rct_fish_new_3=Rect(8736.0, - 1312.0, 9344.0, - 192.0)
    set gg_rct_fish_new_4=Rect(- 352.0, - 6368.0, 544.0, - 5952.0)
    set gg_rct_fish_new_5=Rect(- 8864.0, 6432.0, - 8320.0, 6816.0)
    set gg_rct_fish_new_6=Rect(7680.0, 1856.0, 8896.0, 2592.0)
    set gg_rct_fish_new_7=Rect(8480.0, - 9664.0, 9056.0, - 8672.0)
    set gg_rct_fish_new_8=Rect(- 6176.0, - 9632.0, - 5376.0, - 9056.0)
    set gg_rct_our_5_1=Rect(512.0, - 4320.0, 1344.0, - 3008.0)
    set gg_rct_out_1_1=Rect(- 7040.0, 160.0, - 4160.0, 576.0)
    set gg_rct_out_1_2=Rect(- 3776.0, 1856.0, - 1888.0, 2208.0)
    set gg_rct_out_2_1=Rect(- 3648.0, 1024.0, - 3040.0, 1856.0)
    set gg_rct_out_2_2=Rect(- 1600.0, 2016.0, - 224.0, 2944.0)
    set gg_rct_out_3_1=Rect(- 1216.0, 5216.0, - 96.0, 6752.0)
    set gg_rct_out_3_2=Rect(- 416.0, 3008.0, 704.0, 4352.0)
    set gg_rct_out_4_1=Rect(3552.0, 704.0, 4384.0, 1984.0)
    set gg_rct_out_4_2=Rect(3296.0, - 2336.0, 3936.0, 96.0)
    set gg_rct_out_5_2=Rect(- 256.0, - 5664.0, 704.0, - 4512.0)
    set gg_rct_Rain=Rect(- 800.0, - 1536.0, 1856.0, 928.0)
    set we=AddWeatherEffect(gg_rct_Rain, 'RAlr')
    call EnableWeatherEffect(we, true)
    set gg_rct_revive_1=Rect(- 4160.0, 5728.0, - 3680.0, 6272.0)
    set gg_rct_revive_10=Rect(6688.0, - 1952.0, 7264.0, - 1568.0)
    set gg_rct_revive_11=Rect(6752.0, 5184.0, 7328.0, 5568.0)
    set gg_rct_revive_12=Rect(- 7136.0, 2208.0, - 6560.0, 2592.0)
    set gg_rct_revive_2=Rect(5280.0, - 5376.0, 5856.0, - 4960.0)
    set gg_rct_revive_3=Rect(4544.0, 1920.0, 5088.0, 2432.0)
    set gg_rct_revive_4=Rect(- 5024.0, - 1120.0, - 4448.0, - 736.0)
    set gg_rct_revive_5=Rect(- 992.0, - 2784.0, - 416.0, - 2400.0)
    set gg_rct_revive_6=Rect(576.0, 4448.0, 1152.0, 4832.0)
    set gg_rct_revive_7=Rect(- 1888.0, 896.0, - 1312.0, 1280.0)
    set gg_rct_revive_8=Rect(- 2144.0, - 5408.0, - 1568.0, - 5024.0)
    set gg_rct_revive_9=Rect(- 5696.0, - 6176.0, - 5120.0, - 5792.0)
    set gg_rct_ship_B_1=Rect(192.0, - 5504.0, 288.0, - 5376.0)
    set gg_rct_ship_BL_1=Rect(32.0, - 4128.0, 128.0, - 4032.0)
    set gg_rct_ship_BL_2=Rect(- 1696.0, - 3456.0, - 1600.0, - 3360.0)
    set gg_rct_ship_BL_3=Rect(- 1856.0, - 2784.0, - 1728.0, - 2656.0)
    set gg_rct_ship_BL_4=Rect(- 2112.0, - 2272.0, - 2016.0, - 2176.0)
    set gg_rct_ship_BL_5=Rect(- 3104.0, - 1664.0, - 3008.0, - 1568.0)
    set gg_rct_ship_BL_6=Rect(- 4128.0, 64.0, - 4032.0, 160.0)
    set gg_rct_ship_BO=Rect(- 448.0, - 12128.0, 224.0, - 11584.0)
    set gg_rct_ship_BR_1=Rect(3200.0, - 2048.0, 3360.0, - 1888.0)
    set gg_rct_ship_BR_2=Rect(960.0, - 3136.0, 1088.0, - 3008.0)
    set gg_rct_ship_BR_3=Rect(1120.0, - 4128.0, 1184.0, - 4064.0)
    set gg_rct_ship_L_1=Rect(- 8128.0, 832.0, - 8032.0, 928.0)
    set gg_rct_ship_L_2=Rect(- 6176.0, 224.0, - 6048.0, 352.0)
    set gg_rct_ship_L_3=Rect(- 4160.0, 288.0, - 4064.0, 384.0)
    set gg_rct_ship_LO=Rect(- 12672.0, 736.0, - 12256.0, 1056.0)
    set gg_rct_ship_R_1=Rect(6752.0, - 256.0, 6848.0, - 128.0)
    set gg_rct_ship_R_2=Rect(3648.0, - 640.0, 3776.0, - 512.0)
    set gg_rct_ship_RO=Rect(11008.0, - 1024.0, 11520.0, - 416.0)
    set gg_rct_ship_T_1=Rect(- 512.0, 6368.0, - 384.0, 6496.0)
    set gg_rct_ship_T_2=Rect(- 320.0, 4672.0, - 224.0, 4768.0)
    set gg_rct_ship_T_3=Rect(32.0, 3552.0, 128.0, 3680.0)
    set gg_rct_ship_TL_1=Rect(- 2656.0, 1568.0, - 2496.0, 1696.0)
    set gg_rct_ship_TL_2=Rect(- 1600.0, 2304.0, - 1472.0, 2432.0)
    set gg_rct_ship_TL_3=Rect(- 800.0, 2624.0, - 704.0, 2720.0)
    set gg_rct_ship_TL_4=Rect(- 224.0, 2880.0, - 96.0, 3008.0)
    set gg_rct_ship_TO=Rect(- 1216.0, 10880.0, - 480.0, 11488.0)
    set gg_rct_ship_TR_1=Rect(1248.0, 2752.0, 1344.0, 2848.0)
    set gg_rct_ship_TR_2=Rect(2624.0, 2528.0, 2720.0, 2624.0)
    set gg_rct_ship_TR_3=Rect(3712.0, 1536.0, 3840.0, 1664.0)
    set gg_rct_spawn_area_1_1=Rect(- 9536.0, 992.0, - 4224.0, 9408.0)
    set gg_rct_spawn_area_1_2=Rect(- 4224.0, 2976.0, - 2336.0, 9024.0)
    set gg_rct_spawn_area_1_3=Rect(- 2368.0, 3040.0, - 960.0, 8736.0)
    set gg_rct_spawn_area_2_1=Rect(128.0, 4256.0, 9184.0, 8832.0)
    set gg_rct_spawn_area_2_2=Rect(1376.0, 3232.0, 8864.0, 4416.0)
    set gg_rct_spawn_area_2_3=Rect(5024.0, 416.0, 8864.0, 3232.0)
    set gg_rct_spawn_area_3_1=Rect(4928.0, - 9344.0, 9088.0, - 928.0)
    set gg_rct_spawn_area_3_2=Rect(736.0, - 9408.0, 2272.0, - 5248.0)
    set gg_rct_spawn_area_3_3=Rect(2240.0, - 9248.0, 4928.0, - 2944.0)
    set gg_rct_spawn_area_4_1=Rect(- 9472.0, - 9728.0, - 352.0, 704.0)
    set gg_rct_spawn_area_4_2=Rect(- 160.0, 704.0, 2880.0, 2688.0)
    set gg_rct_spawn_area_4_3=Rect(1632.0, - 1888.0, 3200.0, 704.0)
    set gg_rct_Thief_Bush_NE_A_In=Rect(1504.0, 7392.0, 1632.0, 7552.0)
    set gg_rct_Thief_Bush_NE_A_Out=Rect(1120.0, 7296.0, 1216.0, 7456.0)
    set gg_rct_Thief_Bush_NW_A_In=Rect(- 7872.0, 2176.0, - 7648.0, 2336.0)
    set gg_rct_Thief_Bush_NW_A_Out=Rect(- 8128.0, 2656.0, - 8064.0, 2720.0)
    set gg_rct_Thief_Bush_SE_A_In=Rect(7616.0, - 4448.0, 7776.0, - 4320.0)
    set gg_rct_Thief_Bush_SE_A_Out=Rect(7200.0, - 4512.0, 7264.0, - 4384.0)
    set gg_rct_Thief_Bush_SW_A_In=Rect(- 6400.0, - 3776.0, - 6272.0, - 3616.0)
    set gg_rct_Thief_Bush_SW_A_Out=Rect(- 6272.0, - 4192.0, - 6144.0, - 4128.0)
    set gg_rct_Thief_Bush_SW_C_In=Rect(- 2912.0, - 7712.0, - 2784.0, - 7552.0)
    set gg_rct_Thief_Bush_SW_C_Out=Rect(- 3296.0, - 7776.0, - 3232.0, - 7616.0)
    set gg_rct_vision=Rect(1152.0, - 12160.0, 3200.0, - 10368.0)
    set gg_rct_TheOne=Rect(- 7552.0, - 4736.0, - 6912.0, - 4096.0)
    set gg_rct_Thief_Bush_NE_B_In=Rect(5056.0, 7104.0, 5280.0, 7232.0)
    set gg_rct_Thief_Bush_NE_B_Out=Rect(5024.0, 6656.0, 5312.0, 6784.0)
    set gg_rct_Region_063=Rect(3424.0, - 10912.0, 3456.0, - 10880.0)
    set gg_rct_TheOneCliff=Rect(- 6784.0, - 5632.0, - 6528.0, - 5248.0)
endfunction

//***************************************************************************
//*
//*  Players
//*
//***************************************************************************

function InitCustomPlayerSlots takes nothing returns nothing

    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call ForcePlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(0), true)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)

    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call ForcePlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(1), true)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)

    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(2), true)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)

    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call ForcePlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(3), true)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)

    // Player 4
    call SetPlayerStartLocation(Player(4), 4)
    call ForcePlayerStartLocation(Player(4), 4)
    call SetPlayerColor(Player(4), ConvertPlayerColor(4))
    call SetPlayerRacePreference(Player(4), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(4), true)
    call SetPlayerController(Player(4), MAP_CONTROL_USER)

    // Player 5
    call SetPlayerStartLocation(Player(5), 5)
    call ForcePlayerStartLocation(Player(5), 5)
    call SetPlayerColor(Player(5), ConvertPlayerColor(5))
    call SetPlayerRacePreference(Player(5), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(5), true)
    call SetPlayerController(Player(5), MAP_CONTROL_USER)

    // Player 6
    call SetPlayerStartLocation(Player(6), 6)
    call ForcePlayerStartLocation(Player(6), 6)
    call SetPlayerColor(Player(6), ConvertPlayerColor(6))
    call SetPlayerRacePreference(Player(6), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(6), true)
    call SetPlayerController(Player(6), MAP_CONTROL_USER)

    // Player 7
    call SetPlayerStartLocation(Player(7), 7)
    call ForcePlayerStartLocation(Player(7), 7)
    call SetPlayerColor(Player(7), ConvertPlayerColor(7))
    call SetPlayerRacePreference(Player(7), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(7), true)
    call SetPlayerController(Player(7), MAP_CONTROL_USER)

    // Player 8
    call SetPlayerStartLocation(Player(8), 8)
    call ForcePlayerStartLocation(Player(8), 8)
    call SetPlayerColor(Player(8), ConvertPlayerColor(8))
    call SetPlayerRacePreference(Player(8), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(8), true)
    call SetPlayerController(Player(8), MAP_CONTROL_USER)

    // Player 9
    call SetPlayerStartLocation(Player(9), 9)
    call ForcePlayerStartLocation(Player(9), 9)
    call SetPlayerColor(Player(9), ConvertPlayerColor(9))
    call SetPlayerRacePreference(Player(9), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(9), true)
    call SetPlayerController(Player(9), MAP_CONTROL_USER)

    // Player 10
    call SetPlayerStartLocation(Player(10), 10)
    call ForcePlayerStartLocation(Player(10), 10)
    call SetPlayerColor(Player(10), ConvertPlayerColor(10))
    call SetPlayerRacePreference(Player(10), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(10), true)
    call SetPlayerController(Player(10), MAP_CONTROL_USER)

    // Player 11
    call SetPlayerStartLocation(Player(11), 11)
    call ForcePlayerStartLocation(Player(11), 11)
    call SetPlayerColor(Player(11), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(11), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(11), true)
    call SetPlayerController(Player(11), MAP_CONTROL_USER)

endfunction

function InitCustomTeams takes nothing returns nothing
    // Force: North West Tribe
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(1), 0)
    call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(2), 0)
    call SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(3), 0)
    call SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(4), 0)
    call SetPlayerState(Player(4), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(5), 0)
    call SetPlayerState(Player(5), PLAYER_STATE_ALLIED_VICTORY, 1)

    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)

    // Force: South East Tribe
    call SetPlayerTeam(Player(6), 1)
    call SetPlayerState(Player(6), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(7), 1)
    call SetPlayerState(Player(7), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(8), 1)
    call SetPlayerState(Player(8), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(9), 1)
    call SetPlayerState(Player(9), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(10), 1)
    call SetPlayerState(Player(10), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(11), 1)
    call SetPlayerState(Player(11), PLAYER_STATE_ALLIED_VICTORY, 1)

    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(10), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(10), true)

endfunction

function InitAllyPriorities takes nothing returns nothing

    call SetStartLocPrioCount(0, 11)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 5, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 9, 10, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 10, 11, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(1, 11)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 5, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 9, 10, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 10, 11, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(2, 11)
    call SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 5, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 9, 10, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 10, 11, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(3, 11)
    call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 5, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 9, 10, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 10, 11, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(4, 11)
    call SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 5, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 9, 10, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 10, 11, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(5, 11)
    call SetStartLocPrio(5, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 5, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 9, 10, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 10, 11, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(6, 11)
    call SetStartLocPrio(6, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 5, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 9, 10, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 10, 11, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(7, 11)
    call SetStartLocPrio(7, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 5, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 6, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 9, 10, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 10, 11, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(8, 11)
    call SetStartLocPrio(8, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 5, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 6, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 7, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 9, 10, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 10, 11, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(9, 11)
    call SetStartLocPrio(9, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 5, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 6, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 7, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 8, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 9, 10, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 10, 11, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(10, 11)
    call SetStartLocPrio(10, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(10, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(10, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(10, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(10, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(10, 5, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(10, 6, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(10, 7, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(10, 8, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(10, 9, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(10, 10, 11, MAP_LOC_PRIO_HIGH)

    call SetStartLocPrioCount(11, 11)
    call SetStartLocPrio(11, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(11, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(11, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(11, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(11, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(11, 5, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(11, 6, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(11, 7, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(11, 8, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(11, 9, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(11, 10, 10, MAP_LOC_PRIO_HIGH)
endfunction

//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************

//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 12672.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 12672.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 11648.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 11648.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 12672.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 11648.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 11648.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 12672.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call SetTerrainFogEx(0, 5000.0, 5000.0, 0.000, 0.000, 1.000, 1.000)
    call SetWaterBaseColor(100, 255, 255, 255)
    call NewSoundEnvironment("lake")
    call SetAmbientDaySound("SunkenRuinsDay")
    call SetAmbientNightSound("SunkenRuinsNight")
    call SetMapMusic("Music", true, 0)
    call CreateRegions()
    call CreateAllItems()
    call CreateAllUnits()
    call InitBlizzard()


    call InitGlobals()

endfunction

//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

function config takes nothing returns nothing
    call SetMapName("TRIGSTR_001")
    call SetMapDescription("TRIGSTR_000")
    call SetPlayers(12)
    call SetTeams(12)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)

    call DefineStartLocation(0, 2304.0, - 11200.0)
    call DefineStartLocation(1, 2304.0, - 11200.0)
    call DefineStartLocation(2, 2304.0, - 11200.0)
    call DefineStartLocation(3, 2304.0, - 11200.0)
    call DefineStartLocation(4, 2304.0, - 11200.0)
    call DefineStartLocation(5, 2304.0, - 11200.0)
    call DefineStartLocation(6, 2304.0, - 11200.0)
    call DefineStartLocation(7, 2304.0, - 11200.0)
    call DefineStartLocation(8, 2304.0, - 11200.0)
    call DefineStartLocation(9, 2304.0, - 11200.0)
    call DefineStartLocation(10, 2304.0, - 11200.0)
    call DefineStartLocation(11, 2304.0, - 11200.0)

    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:

