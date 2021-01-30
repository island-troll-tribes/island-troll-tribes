[![island-troll-tribes](https://circleci.com/gh/island-troll-tribes/island-troll-tribes/tree/master.svg?style=svg)](https://app.circleci.com/pipelines/github/island-troll-tribes/island-troll-tribes)

# Island Troll Tribes

This is the source for the [Warcraft III](http://us.blizzard.com/en-us/games/war3/) custom map [Island Troll Tribes](https://www.hiveworkshop.com/threads/island-troll-tribes-v2-99f.297609/).

Visit our [Discord server](https://discord.gg/hYzTRYf) for more information on the game.

## Developing

This application requires [WurstScript](https://wurstlang.org/) and [Visual Studio Code](https://code.visualstudio.com/) is recommended. When working with the World Editor, it should always be set to SD Asset Mode in Preferences.

## Contributing

All contributions must be made via pull requests.

When creating a PR, please include a description of how your changes will affect gameplay and preface these comments with `[$changelog: ]`, as demonstrated in [#406](https://github.com/island-troll-tribes/island-troll-tribes/pull/406).

These changelog comments can be modified after the PR is merged prior to the release, but should not be modified after the release for the sake of transparency.

## Releasing 

The release process for the map is automated via `scripts/release.py`, e.g. `./scripts/release.py --username [username] --patch`. Please see `./release.py -h` for a description of additional arguments that are required.
