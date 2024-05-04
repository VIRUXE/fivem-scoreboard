JOBS = {} -- Holds internal names for jobs

-- We extract the internal names onto Jobs
for jobName in pairs(Config.Jobs) do table.insert(JOBS, jobName) end