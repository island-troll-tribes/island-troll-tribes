library InitializeUnits initializer onInit
	private function onInit takes nothing returns nothing
		set MAMMOTH = CreateUnit( Player( PLAYER_NEUTRAL_AGGRESSIVE ), 'n005', 1124.8, 431.4, 180.000 )
		set MASTER_CRAFTER = CreateUnit( Player( PLAYER_NEUTRAL_AGGRESSIVE ), 'n00N', 1216.0, -1216.0, 270.000 )
	endfunction
endlibrary