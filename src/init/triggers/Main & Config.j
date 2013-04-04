
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************

//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds( -12672.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -12672.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 11648.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 11648.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -12672.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 11648.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 11648.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -12672.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM) )
    call SetDayNightModels( "Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl" )
    call SetTerrainFogEx( 0, 5000.0, 5000.0, 0.000, 0.000, 0.000, 0.000 )
    call NewSoundEnvironment( "lake" )
    call SetAmbientDaySound( "SunkenRuinsDay" )
    call SetAmbientNightSound( "SunkenRuinsNight" )
    call SetMapMusic( "Music", true, 0 )
    call CreateRegions(  )
    call CreateAllDestructables(  )
    call CreateAllUnits(  )
    call InitBlizzard(  )
    call InitGlobals(  )
    call InitCustomTriggers(  )
    call RunInitializationTriggers(  )

endfunction

//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

function config takes nothing returns nothing
    call SetMapName( "Island Troll Tribes v2.88c" )
    call SetMapDescription( "TRIGSTR_005" )
    call SetPlayers( 12 )
    call SetTeams( 12 )
    call SetGamePlacement( MAP_PLACEMENT_TEAMS_TOGETHER )

    call DefineStartLocation( 0, -4160.0, 2496.0 )
    call DefineStartLocation( 1, -4160.0, 2496.0 )
    call DefineStartLocation( 2, -4160.0, 2496.0 )
    call DefineStartLocation( 3, -4160.0, 2496.0 )
    call DefineStartLocation( 4, 4800.0, 2112.0 )
    call DefineStartLocation( 5, 4800.0, 2112.0 )
    call DefineStartLocation( 6, 4800.0, 2112.0 )
    call DefineStartLocation( 7, 4800.0, 2112.0 )
    call DefineStartLocation( 8, 2048.0, -4544.0 )
    call DefineStartLocation( 9, 2048.0, -4544.0 )
    call DefineStartLocation( 10, 2048.0, -4544.0 )
    call DefineStartLocation( 11, 2048.0, -4544.0 )

    // Player setup
    call InitCustomPlayerSlots(  )
    call InitCustomTeams(  )
    call InitAllyPriorities(  )
endfunction
