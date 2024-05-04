-- * Note: this directive must be set as "setr", in order for the clients to have access to it
-- If you don't want to, then just set the default to how many slots you have
local MAX_PLAYERS = GetConvarInt('sv_maxclients', Config.MaxClients)

local Options = {
	players = {
		title       = 'Players Online',
		description = ('Total: 1/%d'):format(MAX_PLAYERS),
		icon        = 'user',
		iconColor   = 'white',
		readOnly    = true,
		disabled    = true
	}
}

-- Generate options for the context menu
for jobName, jobData in pairs(Config.Jobs) do
	local option = {
		title       = jobData.title or jobName:sub(1, 1):upper() .. jobName:sub(2),
		description = 0 .. " Online",
		icon        = jobData.icon or "user",
		readOnly    = true,
		disabled    = true
	}

	-- Insert the icon color if specified in the configuration for that job
	if jobData.iconColor then option.iconColor = jobData.iconColor end

	Options[jobName] = option
end

RegisterCommand('scoreboard', function()
	if lib.getOpenContextMenu() then lib.hideContext(false) end -- In case they press the key again

	-- Query the server for the job count
	ESX.TriggerServerCallback('scoreboard:getCount', function(count)
		-- Update the player count
		Options.players.description = ('Total: %d/%d'):format(#GetActivePlayers(), MAX_PLAYERS)

		if count then -- Meaning we actually got data back
			for jobName, jobCount in pairs(count) do -- Update the count on the options
				Options[jobName].description = jobCount .. " Online"
				Options[jobName].disabled    = jobCount == 0
			end
		end

		-- Parse options for use in the context menu
		local options = {}

		options[1] = Options.players

		for o = 2, #JOBS + 1 do table.insert(options, Options[JOBS[o - 1]]) end

		lib.registerContext({
			id      = 'scoreboard',
			title   = 'Scoreboard',
			options = options
		})

		lib.showContext('scoreboard')
	end)
end, false)

RegisterKeyMapping('scoreboard', 'Score Board', 'keyboard', 'F9')