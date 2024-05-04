local JOBS = {} -- Holds internal names for jobs

local LastRequest = {} -- Holds when was a player's last request for "job count"

ESX.RegisterServerCallback('scoreboard:getCount', function(playerId, cb)
	local requestTime = GetGameTimer()

	if not LastRequest[playerId] then LastRequest[playerId] = nil end

	-- Basic flood prevention
	if LastRequest[playerId] and requestTime - LastRequest[playerId] < Config.CountRequestThreshold then cb(false) end

	LastRequest[playerId] = requestTime

	cb(ESX.GetNumPlayers("job", JOBS))
end)

ESX.RegisterServerCallback("scoreboard:getJobs", function(_, cb) cb(JOBS) end)

-- We extract the internal names onto Jobs
for jobName in pairs(Config.Jobs) do
	if ESX.DoesJobExist(jobName, 1) then
		table.insert(JOBS, jobName)
	else
		lib.print.warn(('"%s" does not exist.'):format(jobName))
	end
end