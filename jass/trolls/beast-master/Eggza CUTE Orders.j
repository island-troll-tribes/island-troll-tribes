
//
// name=inside joke
// This trigger tells pets to do their order
//===========================================================================
//TESH.scrollpos=120
//TESH.alwaysfold=0
function PetOrdersFilterFunction1 takes nothing returns boolean
  return GetFilterPlayer()==Player(PLAYER_NEUTRAL_PASSIVE) and GetUnitTypeId(GetFilterUnit())!='h01G' and IsUnitType(GetFilterUnit(),UNIT_TYPE_ANCIENT)
endfunction

function PetOrderFilterFunction2 takes nothing returns nothing
  set bj_forLoopBIndex=1
  set bj_forLoopBIndexEnd=6
  loop
    exitwhen bj_forLoopBIndex>bj_forLoopBIndexEnd
    if(GetUnitTypeId(GetEnumUnit())!=UNIT_SCOUTS_BUSH)then
      call UnitRemoveItemFromSlotSwapped(bj_forLoopBIndex,GetEnumUnit())
    endif
    set bj_forLoopBIndex=bj_forLoopBIndex+1
  endloop
endfunction

function PetOrderFilterFunction3 takes nothing returns boolean
  return (GetUnitTypeId(GetFilterUnit())==UNIT_HATCHERY) and (IsUnitAlly(GetFilterUnit(),GetOwningPlayer(GetEnumUnit())))
endfunction

function PetOrderFilterFunction4 takes nothing returns boolean
  return (GetUnitTypeId(GetFilterUnit())==UNIT_HATCHERY) and (IsUnitAlly(GetFilterUnit(),GetOwningPlayer(udg_parameterUnit)))
endfunction


function PetOrderFunction6 takes nothing returns nothing
  if(DistanceBetweenPoints(GetUnitLoc(udg_parameterUnit2),GetUnitLoc(GetEnumUnit()))<=udg_realParameter)then
    set udg_hatchCheck=GetEnumUnit()
    set udg_realParameter=DistanceBetweenPoints(GetUnitLoc(udg_parameterUnit2),GetUnitLoc(GetEnumUnit()))
    set udg_booleanParameter=true
  endif
endfunction


function Trig_eggza_CUTE_orders_Func002A takes nothing returns nothing
  local string t=udg_orders[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]
  if(t!="stop") then
    set udg_parameterUnit=udg_PUnits[(GetPlayerId(GetOwningPlayer(GetEnumUnit())))]
    if(t=="attack")then
      call IssuePointOrderByIdLoc(GetEnumUnit(),851983,GetUnitLoc(udg_PUnits[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]))
    endif
    if(t=="move")then
      call IssuePointOrderByIdLoc(GetEnumUnit(),851986,GetUnitLoc(udg_PUnits[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]))
    endif
    if((t=="start scout")and(GetUnitCurrentOrder(GetEnumUnit())==String2OrderIdBJ("")))then

      //implement rally point system here
      call TriggerExecute( gg_trg_find_nearest_hatchery )
      if ( GetBooleanAnd( GetLocationX(GetUnitRallyPoint(udg_parameterUnit)) == 0.00, GetLocationY(GetUnitRallyPoint(udg_parameterUnit)) == 0.00 )) then
          call IssuePointOrderByIdLoc(GetEnumUnit(),851986,PolarProjectionBJ(GetUnitLoc(GetEnumUnit()),2500.,GetRandomReal(0,360)))
          call PolledWait( ( DistanceBetweenPoints(GetUnitLoc(udg_parameterUnit), GetUnitLoc(GetEnumUnit())) / 522.00 ) )
      else
          call IssuePointOrderById(GetEnumUnit(),851986, GetLocationX(GetUnitRallyPoint(udg_parameterUnit)), GetLocationY(GetUnitRallyPoint(udg_parameterUnit)))
//          call IssuePointOrderByIdLoc(GetEnumUnit(),851986,PolarProjectionBJ(GetUnitLoc(GetEnumUnit()),2500.,GetRandomReal(0,360)))
      endif

      //
      set udg_orders[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]="scout"
      set t="scout"
    endif
    if((t=="scout")and(GetUnitCurrentOrder(GetEnumUnit())==String2OrderIdBJ("")))then
      if(UnitInventoryCount(GetEnumUnit())<UnitInventorySizeBJ(GetEnumUnit()))then
        call IssuePointOrderByIdLoc(GetEnumUnit(),851986,GetRandomLocInRect(RectFromCenterSizeBJ(GetUnitLoc(GetEnumUnit()),(1000.+I2R((GetUnitAbilityLevelSwapped('A03U',GetEnumUnit())*250))),(1000.+I2R((GetUnitAbilityLevelSwapped('A03U',GetEnumUnit())*250))))))
        set udg_orders[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]="get item"
        set t="get item"
      else
        set udg_orders[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]="return items"
        set t="return items"
      endif
      call ForGroupBJ(GetUnitsInRectMatching(RectFromCenterSizeBJ(GetUnitLoc(GetEnumUnit()),1000.,1000.),Condition(function PetOrdersFilterFunction1)),function PetOrderFilterFunction2)
    endif

    if((t=="get item")and(GetUnitCurrentOrder(GetEnumUnit())==String2OrderIdBJ("")))then
      call IssueTargetOrderById(GetEnumUnit(),851971,RandomItemInRectSimpleBJ(RectFromCenterSizeBJ(GetUnitLoc(GetEnumUnit()),(900.+I2R((GetUnitAbilityLevelSwapped('A03T',GetEnumUnit())*300))),(900.+I2R((GetUnitAbilityLevelSwapped('A03T',GetEnumUnit())*300))))))
      if(GetUnitCurrentOrder(GetEnumUnit())==String2OrderIdBJ(""))then
        set udg_orders[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]="scout"
      endif
    endif

    if((t=="drop items")and(GetUnitCurrentOrder(GetEnumUnit())==String2OrderIdBJ(""))) then
      set bj_forLoopBIndex=1
      set bj_forLoopBIndexEnd=UnitInventorySizeBJ(GetEnumUnit())
      loop
        exitwhen bj_forLoopBIndex>bj_forLoopBIndexEnd
        call UnitRemoveItemFromSlotSwapped(bj_forLoopBIndex,GetEnumUnit())
        set bj_forLoopBIndex=bj_forLoopBIndex+1
      endloop
      if( GetUnitTypeId(GetEnumUnit())==UNIT_GREATER_NETHER_DRAGON)then
        call IssueTargetOrderById(GetEnumUnit(),852149,GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(500.,GetUnitLoc(GetEnumUnit()),Condition(function PetOrderFilterFunction3))))
      endif
      set udg_orders[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]="start scout"
      set t="start scout"
    endif


    if((t=="drop stop")and(GetUnitCurrentOrder(GetEnumUnit())==String2OrderIdBJ(""))) then
      set bj_forLoopBIndex=1
      set bj_forLoopBIndexEnd=UnitInventorySizeBJ(GetEnumUnit())
      loop
        exitwhen bj_forLoopBIndex>bj_forLoopBIndexEnd
        call UnitRemoveItemFromSlotSwapped(bj_forLoopBIndex,GetEnumUnit())
        set bj_forLoopBIndex=bj_forLoopBIndex+1
      endloop
      set udg_orders[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]="stop"
      set t="stop"
    endif
    if((t=="return items")and(GetUnitCurrentOrder(GetEnumUnit())==String2OrderIdBJ("")))then
//
      set udg_parameterUnit2=GetEnumUnit()
      set udg_realParameter=999999.
      set udg_booleanParameter=false
      call ForGroupBJ(GetUnitsInRectMatching(bj_mapInitialPlayableArea,Condition(function PetOrderFilterFunction4)),function PetOrderFunction6)
      if(udg_booleanParameter)then
        set udg_parameterUnit=udg_hatchCheck
      endif
//
      call IssuePointOrderByIdLoc(GetEnumUnit(),851986,GetUnitLoc(udg_parameterUnit))
      set udg_orders[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]="drop items"
      set t="drop items"
    endif
    if((t=="return me items")and(GetUnitCurrentOrder(GetEnumUnit())==String2OrderIdBJ("")))then
      call IssuePointOrderByIdLoc(GetEnumUnit(),851986,GetUnitLoc(udg_parameterUnit))
      set udg_orders[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]="drop stop"
      set t="drop stop"
    endif
    if((t=="transiting")and(GetUnitCurrentOrder(GetEnumUnit())==String2OrderIdBJ("")))then
      set udg_orders[GetPlayerId(GetOwningPlayer(GetEnumUnit()))]="stop"
      set t="stop"
    endif
  else
    call IssueImmediateOrderById(GetEnumUnit(),851972)
  endif
endfunction

function checkPetGrowth takes nothing returns nothing
  if(GetRandomReal(0,1)<=udg_PET_GROWTH) then
    set udg_growingPet=GetEnumUnit()
    call TriggerExecute( gg_trg_grow_up )
  endif
endfunction

function Trig_eggza_CUTE_orders_Actions takes nothing returns nothing
  call ForGroupBJ(udg_pets,function Trig_eggza_CUTE_orders_Func002A)
  call ForGroupBJ(udg_midPets,function Trig_eggza_CUTE_orders_Func002A)
  call ForGroupBJ(udg_babyPets,function Trig_eggza_CUTE_orders_Func002A)
  call ForGroupBJ(udg_midPets,function checkPetGrowth)
  call ForGroupBJ(udg_babyPets,function checkPetGrowth)
endfunction



//===========================================================================
function InitTrig_eggza_CUTE_orders takes nothing returns nothing
    set gg_trg_eggza_CUTE_orders = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_eggza_CUTE_orders, 4.00 )
    call TriggerAddAction( gg_trg_eggza_CUTE_orders, function Trig_eggza_CUTE_orders_Actions )
endfunction //===========================================================================
