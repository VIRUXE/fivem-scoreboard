JOBS = {} -- Holds internal names for jobs

-- We extract the internal names onto Jobs
for jobName in pairs(Config.Jobs) do
	if ESX.DoesJobExist(jobName, 1) then
		table.insert(JOBS, jobName)
	else
		lib.print.warn(('"%s" does not exist.'):format(jobName))
	end
end