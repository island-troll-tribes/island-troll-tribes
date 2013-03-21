## Island Troll Tribes Source ##

This is the map source to the Warcraft III custom map Island Troll Tribes.
It is written in JASS, vJass, and ZINC.
If you wish to work on the project you can fork it and issue pull requests.

___To build:___  

    $ ./compile   # most basic way of calling compile
    $ ./map/build # most basic way of building a map

    $ ./map/build env:test # will build map and then launch wc3 with map file loaded
    $ ./map/build env:pro  # will build map then protect it

    $ ./scripts/deploy # will build map and deploy it to clantwgb.com (if you're on Quazz's list of friendly people)
