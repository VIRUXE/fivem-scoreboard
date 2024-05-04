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
	MaxClients = 48 -- This will only be used if you havent prefixed `sv_maxclients` with `setr` (replicates that convar to the clients
}