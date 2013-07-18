
function DisplayStatsWarningMessages takes nothing returns nothing
  if IsPlayerInForce( GetOwningPlayer( GetEnumUnit() ), Hints.players ) then
    if R2I( GetUnitState( GetEnumUnit(), UNIT_STATE_LIFE ) ) == 20 then
      call DisplayTimedTextToPlayer( GetOwningPlayer( GetEnumUnit() ), 0, 0, 5.00, COLOR_RED + "Your health is low, eat some meat!" )
    endif
    if R2I( GetUnitState( GetEnumUnit(), UNIT_STATE_MANA ) ) == 20 then
      call DisplayTimedTextToPlayer( GetOwningPlayer( GetEnumUnit() ), 0, 0, 5.00, COLOR_RED + "Your energy is low, get some sleep!" )
    endif
    if GetPlayerState( GetOwningPlayer( GetEnumUnit() ), PLAYER_STATE_RESOURCE_GOLD ) == 20 then
      call DisplayTimedTextToPlayer( GetOwningPlayer( GetEnumUnit() ), 0, 0, 5.00, COLOR_RED + "Your heat is low, go stand by a fire!" )
    endif
  endif
endfunction

function InitTrig_stat_display takes nothing returns nothing
  set gg_trg_stat_display = CreateTrigger(  )
  call TriggerAddAction( gg_trg_stat_display, function DisplayStatsWarningMessages )
endfunction
