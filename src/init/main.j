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
    call CreateAllUnits(  )
    call InitBlizzard(  )
    call InitGlobals(  )
    call InitCustomTriggers()
    call RunInitializationTriggers()

endfunction