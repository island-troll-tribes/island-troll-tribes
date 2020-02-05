[![CircleCI](https://circleci.com/gh/island-troll-tribes/island-troll-tribes/tree/master.svg?style=svg)](https://circleci.com/gh/island-troll-tribes/island-troll-tribes/tree/master)

# Island Troll Tribes

This is the source for the [Warcraft III](http://us.blizzard.com/en-us/games/war3/) custom map [Island Troll Tribes](https://www.hiveworkshop.com/threads/island-troll-tribes-v2-99f.297609/).

Visit our [Discord server](https://discord.gg/hYzTRYf) for more information on the game.

## Developing

This application requires [WurstScript](https://wurstlang.org/) and [Visual Studio Code](https://code.visualstudio.com/) is recommended.

## Contributing

All contributions must be made via pull requests.

When creating a PR, please include a description of how your changes will affect gameplay and preface these comments with `[$changelog: ]`, as demonstrated in [#406](https://github.com/island-troll-tribes/island-troll-tribes/pull/406).

When merging a PR, please ensure that these comments are kept in the squashed commit, as demonstrated in [9fcc944](https://github.com/island-troll-tribes/island-troll-tribes/commit/9fcc944d078db1a87ca1b68a34ebfb5d77f24ba0).

## Releasing 

The release process for the map is automated via `scripts/release.py`, e.g. `./scripts/release.py --username [username] --patch`. Please see `./release.py -h` for a description of additional arguments that are required.
