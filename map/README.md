# Island Troll Tribes Map & Warcraft III Map Tools

## build

Script which takes an unportected ITT map and applies any build settings passed via argv
upon on it then turns it into a working wc3 map file.

    _Options_            _Default_                   _Description_
    env                  beta                        map environment: each environment has default build settings
    debug_script         false                       debug this build script
    do_jasshelper        true                        turns vJass & ZINC into JASS
    do_compile           true                        turns ../src into out.j. When false, looks for {map_script_path}
    do_optimizer         false                       uses Vexorian's map optimizer to make the map run faster and be protected
    do_widgetizer        false                       uses PitzerMike's map widgetizer to make map load faster
    debug                false                       whether the --debug flag should be passed to jasshelper
    launchwc3            false                       whether the script should launch wc3 with the map loaded upon completion
    map_unpro_path       base-maps/{highest}.w3x     the base map file to inject script into
    map_script_path      ../out.j                    map script path to load into map
    map_output_path      ITT_{commit}_{time}.w3x     path where to put the compiled map

## base-maps

Unprotected map files which will be used as the base to inject the source code into

## compiled-maps

Any map which has gone through the 'build' script

## tools

Where all the map building tools are
 - jasshelper
 - widgetizer
 - optimizer

