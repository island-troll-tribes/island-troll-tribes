[![CircleCI](https://circleci.com/gh/island-troll-tribes/island-troll-tribes/tree/master.svg?style=svg)](https://circleci.com/gh/island-troll-tribes/island-troll-tribes/tree/master)

# Island Troll Tribes

This is the source for the [Warcraft III](http://us.blizzard.com/en-us/games/war3/) custom map [Island Troll Tribes](https://www.hiveworkshop.com/threads/island-troll-tribes-v2-99f.297609/).

Visit our [Discord server](https://discord.gg/vmK3P2) for more information on the game.

## Developing

This application requires [WurstScript](https://wurstlang.org/) and [Visual Studio Code](https://code.visualstudio.com/) is recommended.

## Contributing

All contributions must be made via pull requests.

When creating a PR, please include a description of how your changes will affect gameplay and preface these comments with `[changelog: ]`, as demonstrated in [#406](https://github.com/island-troll-tribes/island-troll-tribes/pull/406).

When merging a PR, please ensure that these comments on kept in the squashed commit, as demonstrated in [9fcc944](https://github.com/island-troll-tribes/island-troll-tribes/commit/9fcc944d078db1a87ca1b68a34ebfb5d77f24ba0).

## Releasing 

The release process for the map is automated via `scripts/release.py`. Because Wurst does not support a CLI, this must be executed in separate steps:

1. Run the update script `./release.py --update`, which will construct the changelog package and modify the configuration to reflect the new version.
2. Build the map within VS Code using the `wurst: Build your map via wurst.build (into /_build)` command.
3. Release the map using `./release.py --release`, which will create a GitHub release for this repository.

Please see `./release.py -h` for a description of additional arguments that are required.
