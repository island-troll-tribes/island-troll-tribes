
scope Hints initializer onInit

  globals
    force   TIP_FORCE = CreateForce()
    string  array TIPS
    integer numTips
  endglobals

  function InitHintArray takes nothing returns nothing
    set TIPS[1]  = "You can attack the Master Crafter in the middle of the map to advertise a duel. You can attack it again to cancel the advertisement."
    set TIPS[2]  = "The Master Crafter in the center of the map can help your team build if you do not have enough inventory slots."
    set TIPS[3]  = "Boats frequently travel up and down the streams. The fur trade is especially lucrative."
    set TIPS[4]  = "Remember to keep a watch on you and your team's stats. Remind someone if they are running low on anything."
    set TIPS[5]  = "Beware the mammoth. He is a strong foe and defeating him is a team effort, but you will be rewarded...."
    set TIPS[6]  = "Try not to sit around in your base the whole game. You can almost always be doing something useful."
    set TIPS[7]  = "If any of your stats hit 0, you die instantly so keep them up at all times."
    set TIPS[8]  = "If it seems you have collected all the items or hunted all the wildlife in one area, move to another. Sometimes fertile land is just an island away."
    set TIPS[9]  = "Fighting the bosses around the edges of the map is a good way to level up and gain valuable items."
    set TIPS[10] = "If you have no hunter, fires can be used to trap elk. They also make cheap lookouts."
    set TIPS[11] = "To toggle hints, type "+HIGHLIGHT_COLOR+"-h|r."
    set TIPS[12] = "Speed, strategy, and meat are crucial to winning wars."
    set TIPS[13] = "Use quickmake skills and unload items to quickly manage the inventories of buildings."
    set numTips = 13
  endfunction

  function RecipeIslandHint takes nothing returns nothing
    local real x = GetRectCenterX(gg_rct_vision)
    local real y = GetRectCenterY(gg_rct_vision)
    call DisplayTimedTextToPlayer(GetEnumPlayer(),0,0,15,GOLD_COLOR+"Hint: |r"+GENERAL_COLOR+"For help on building, refer to these shops or for some basics, the quest log.|r")
    call PingMinimapForForceEx( TIP_FORCE, x, y, 7.00, bj_MINIMAPPINGSTYLE_FLASHY, 100, 100, 100 )
    call PolledWait( 1.00 )
    call PingMinimapForForceEx( TIP_FORCE, x, y, 7.00, bj_MINIMAPPINGSTYLE_FLASHY, 100, 100, 100 )
    call PolledWait( 1.00 )
    call PingMinimapForForceEx( TIP_FORCE, x, y, 
  endfunction

  function DisplayTurnOffHintsHint takes nothing returns nothing
    DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 12,GOLD_COLOR+"Hint: |r"+GENERAL_COLOR+TIPS[11]+"|r")
  endfunction

  function DisplayHintsToPlayers takes nothing returns nothing
    local integer i = GetRandomInt(1,numTips)
    if i == 2 then
        call PingMinimapLocForForceEx( TIP_FORCE, GetUnitLoc(gg_unit_n00N_0017), 7.00, bj_MINIMAPPINGSTYLE_FLASHY, 100, 100, 100 )
    elseif i == 5 then
        call PingMinimapLocForForceEx( TIP_FORCE, GetUnitLoc(Mammoth), 4.00, bj_MINIMAPPINGSTYLE_FLASHY, 100, 100, 100 )
    endif
    call DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 12,GOLD_COLOR+"Hint: |r"+GENERAL_COLOR+TIPS[i]+"|r")
  endfunction

  //===========================================================================
  function onInit takes nothing returns nothing
      local trigger t = CreateTrigger()

      call InitHintArray()

      /* One time call to display certain tips */
      call TimerStart( CreateTimer(), 100., false, function DisplayTurnOffHintsHint )
      call TimerStart( CreateTimer(), 60., false, function RecipeIslandHint )

      /* Repeating hint display */
      call TimerStart( CreateTimer(), 180., true, function DisplayHintsToPlayers )
  endfunction

endscope
