# Scoreboard - the `ox_lib` way

![Screenshot 2024-05-04 232725](https://github.com/VIRUXE/fivem-scoreboard/assets/1616657/3c4360a7-cf48-4946-86c0-7afce6cd161c)

## Overview

It's a pretty basic scoreboard, utilizing _[Overextended](https://github.com/overextended/ox_lib)_'s `ox_lib` library resource, specifically, it's Context Menu.

All you have to do is specificy in `config.lua` the jobs you want to display a player count for, in the menu.

## Installation

Just clone/download the repo to your `resources` directory, name it however you want, configure `config.lua` to your liking and have it started in your `server.cfg`.

This is the current default configuration, that comes in `config.lua`:
```lua
Config = {
	Jobs = { -- Use internal job names for as table keys
		police = {
			-- title = "",
			icon = "shield-halved",
			iconColor = "blue"
		},
		ambulance = {
			-- title = "",
			icon = "truck-medical",
			iconColor = "red"
		},
		mechanic = {
			-- title = "",
			icon = "wrench"
		}
	},
	CountRequestThreshold = 5000,
	MaxClients = 48, -- This will only be used if you havent prefixed `sv_maxclients` with `setr` (replicates that convar to the clients
	Key = "F9"
}
```
Use a job's internal name as a key inside the `Jobs` property/node, and then set your title (__optional__ - can be seen as a label, if you want text in a different language for example), icon and iconColor (optional).

## Acknowledgments

Thanks to [slicedbrain](https://github.com/slicedbrain/tagus_scoreboard) for the original repository, which gave me the itch to refactor it completely, with a good coding standard.
