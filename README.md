## Island Troll Tribes Source ##

This is the map source to the Warcraft III custom map Island Troll Tribes.
It is written in JASS, vJass, and ZINC.
If you wish to work on the project you can fork it and issue pull requests.

___To build:___  

    $ ./scripts/compile   # most basic way of calling compile
    $ ./scripts/build # most basic way of building a map

    $ ./scripts/build env:test # will build map and then launch wc3 with map file loaded
    $ ./scripts/build env:pro  # will build map then protect it

    $ ./scripts/deploy # will build map and deploy it to clantwgb.com (if you're on Quazz's list of friendly people)


# Island Troll Tribes Map & Warcraft III Map Tools

## build

Script which takes an unportected ITT map and applies any build settings passed via argv
upon on it then turns it into a working wc3 map file.

    Options______________Default_____________________Description_________________________________________________________
    env                  beta                        map environment: each environment has default build settings
    debug_script         false                       debug this build script
    do_jasshelper        true                        turns vJass & ZINC into JASS
    do_compile           true                        turns ../src into out.j. When false, looks for {map_script_path}
    do_optimizer         false                       uses Vexorian's map optimizer to protect and make the map run faster
    do_widgetizer        false                       uses PitzerMike's map widgetizer to make map load faster
    debug                false                       whether the --debug flag should be passed to jasshelper
    launchwc3            false                       whether the script should launch wc3 with the map loaded on exit
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

