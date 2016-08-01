library InitializeUnits initializer onInit
	private function onInit takes nothing returns nothing
		set MAMMOTH = CreateUnit( Player( PLAYER_NEUTRAL_AGGRESSIVE ), 'n005', 1124.8, 431.4, 180.000 )
		set MASTER_CRAFTER = CreateUnit( Player( PLAYER_NEUTRAL_PASSIVE ), 'n00N', 1216.0, -1216.0, 270.000 )
		set gg_dest_ZTsx_3140 = CreateDestructable( 'ZTsx', 1088.0, -576.0, 270.000, 1.000, 0 )
		set gg_unit_n019_0145 = CreateUnit( Player( PLAYER_NEUTRAL_PASSIVE ), 'n019', 192.0, 3136.0, 270.000 )
		set gg_unit_o003_0157 = CreateUnit( Player( PLAYER_NEUTRAL_PASSIVE ), 'o003', 2368.0, -10816.0, 270.000 )
		set gg_unit_o00I_0173 = CreateUnit( Player( PLAYER_NEUTRAL_PASSIVE ), 'o00I', 1728.0, -11456.0, 270.000 )
		set gg_unit_o00K_0174 = CreateUnit( Player( PLAYER_NEUTRAL_PASSIVE ), 'o00K', 1600.0, -11136.0, 270.000 )
		set gg_unit_o005_0176 = CreateUnit( Player( PLAYER_NEUTRAL_PASSIVE ), 'o005', 1728.0, -10880.0, 270.000 )
		set gg_unit_o004_0179 = CreateUnit( Player( PLAYER_NEUTRAL_PASSIVE ), 'o004', 2048.0, -10816.0, 270.000 )
		set gg_unit_h000_0181 = CreateUnit( Player( PLAYER_NEUTRAL_PASSIVE ), 'h000', 2048.0, -11200.0, 270.000 )
		set gg_unit_O00B_0180 = CreateUnit( Player( PLAYER_NEUTRAL_PASSIVE ), 'O00B', 2309.0, -11213.2, 172.169 )
	endfunction
endlibrary