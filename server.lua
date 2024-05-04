local LastRequest = {} -- Holds when was a player's last request for "job count"

ESX.RegisterServerCallback('scoreboard:getCount', function(playerId, cb)
	local requestTime = GetGameTimer()

	if not LastRequest[playerId] then LastRequest[playerId] = nil end

	-- Basic flood prevention
	if LastRequest[playerId] and requestTime - LastRequest[playerId] < Config.CountRequestThreshold then cb(false) end

	LastRequest[playerId] = requestTime

	cb(ESX.GetNumPlayers("job", JOBS))
end)