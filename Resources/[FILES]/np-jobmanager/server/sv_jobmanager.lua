Void.Jobs.CurPlayerJobs = {}

for k,v in pairs(Void.Jobs.ValidJobs) do
    Void.Jobs.CurPlayerJobs[k] = {}
end

function Void.Jobs.IsWhiteListed(self, hexId, characterId, job, callback)
    if not hexId or not characterId then return end

    local q = [[SELECT cid, job, rank FROM jobs_whitelist WHERE cid = @cid AND job = @job LIMIT 1]]
    local v = {["cid"] = characterId, ["job"] = job}

    exports.oxmysql:execute(q, v, function(results)
        if not results then callback(false, false) return end

        local isWhiteListed = (results and results[1]) and results[1] or false
        local rank = (isWhiteListed and results[1].rank) and results[1].rank or false
        callback(isWhiteListed, rank)
    end)
end

function Void.Jobs.JobExists(self, job)
    return Void.Jobs.ValidJobs[job] ~= nil
end

function Void.Jobs.CountJob(self, job)
    if not Void.Jobs:JobExists(job) then return 0 end

    local count = 0
    for k,v in pairs(Void.Jobs.CurPlayerJobs[job]) do
        if job == "ems" then
            if v.isWhiteListed == true then
                count = count + 1
            end
        else
            count = count + 1
        end
    end

    return count
end

function Void.Jobs.CanBecomeJob(self, user, job, callback)
    if not user then callback(false) return end
    if not user:getVar("characterLoaded") then callback(false, "Character not loaded") return end

    local src = user:getVar("source")
    local hexId = user:getVar("hexid")
    local characterId = user:getVar("character").id

    -- if Void.Jobs.ValidJobs[job].requireDriversLicense and not exports["police"]:CheckLicense(characterId, "Drivers License") then
    --     callback(false, "You need a drivers license.")
    --     return
    -- end

    if not hexId or not characterId or not src then callback(false, "Id's don't exist") return end
        if not Void.Jobs.ValidJobs[job] then callback(false, "Job isn't a valid job") return end
        
        TriggerEvent("np-jobmanager:attemptBecomeJob", src, characterId, function(allowed, reason)
            if not allowed then callback(false, reason) return end
        end)

        if WasEventCanceled() then callback(false) return end

        -- if Void.Jobs:CountJob(job) < 1 and Void.Jobs.ValidJobs[job].name == "EMS" then
        --     callback(true)
        --     return
        -- else
        --     callback(false)
        --     return
        -- end

        if Void.Jobs.ValidJobs[job].whitelisted then
            Void.Jobs:IsWhiteListed(hexId, characterId, job, function(whiteListed, rank)
                if not whiteListed then callback(false, "You're not whitelisted for this job") return end
                callback(true, nil, rank)
            end)
            return
        end

        if Void.Jobs:JobExists(job) then
            local jobTable = Void.Jobs.ValidJobs[job]
            if jobTable and jobTable.max then
                if Void.Jobs:CountJob(job) >= jobTable.max then callback(false, "There are too many employees for this job right now, try again later") return end
            end
        end
        callback(true)
end

function Void.Jobs.AddWhiteList(self, user, job, rank)
    local cid = user:getCurrentCharacter().id
    local hexId = user:getVar("hexid")
    local q = [[INSERT INTO jobs_whitelist (cid, job, rank) VALUES (@cid, @job, @rank)]]
    local v = {["cid"] = cid, ["owner"] = hexId, ["job"] = job, ["rank"] = rank}
    exports.oxmysql:execute(q, v)
end

function Void.Jobs.SetRank(self, user, job, rank)
    local q = [[UPDATE jobs_whitelist SET (rank) VALUES (@rank) WHERE cid = @cid]]
    local v = {["cid"] = cid, ["rank"] = rank}
    exports.oxmysql:execute(q, v)
end

function Void.Jobs.SetJob(self, user, job, notify, callback)
    if not user then return false end
    if not job or type(job) ~= "string" then return false end
    if not user:getVar("characterLoaded") then return false end 


    Void.Jobs:CanBecomeJob(user, job, function(allowed, reason, rank)
        if not allowed then
            if reason and type(reason) == "string" then
                TriggerClientEvent("DoLongHudText", user.source, tostring(reason), 2)
            end
            return
        end

        local src = user:getVar("source")
        local oldJob = user:getVar("job")
        local hexId = user:getVar("hexid")
        local characterId = user:getVar("character").id

        if oldJob then
            Void.Jobs.CurPlayerJobs[oldJob][src] = nil
        end

        user:setVar("job", job)
        Void.Jobs.CurPlayerJobs[job][src] = {rank = rank and rank or 0, lastPayCheck = GetGameTimer(),isWhiteListed = false} 

        local name = Void.Jobs.ValidJobs[job].name


        TriggerClientEvent("np-jobmanager:playerBecameJob", src, job, name, false)
        exports.oxmysql:execute("UPDATE characters SET `job` = @job WHERE id = @id", {['@id'] = characterId, ['@job'] = job})
        TriggerClientEvent("np-jobmanager:playerBecomeEvent", src, job, name, notify)

        -- if Void.Jobs:CountJob("trucker") >= 1 then
        --     TriggerEvent("lscustoms:IsTruckerOnline",true)
        -- elseif Void.Jobs:CountJob("trucker") <= 0 then
        --     TriggerEvent("lscustoms:IsTruckerOnline", false)
        -- end

        if callback then callback() end
    end)
end

AddEventHandler("playerDropped", function(reason)
    local src = source

    for j,u in pairs(Void.Jobs.CurPlayerJobs) do
        for k,s in pairs(u) do
            if k == src then Void.Jobs.CurPlayerJobs[j][k] = nil end
        end
    end
end)

AddEventHandler("np-base:characterLoaded", function(user, char)
    Void.Jobs:SetJob(user, "unemployed", false)
end)

-- Need to think of a better way to do this, says no such export when resource is started
AddEventHandler("np-base:exportsReady", function()
    exports["np-base"]:addModule("JobManager", Void.Jobs)
end)

local policebonus = 0
local emsbonus = 0
local civbonus = 0

RegisterServerEvent('updatePays')
AddEventHandler('updatePays', function(policebonus1,emsbonus1,civbonus1)
    policebonus = policebonus1
    emsbonus = emsbonus1
    civbonus = civbonus1
end)

RegisterServerEvent('jobssystem:jobs')
AddEventHandler('jobssystem:jobs', function(job, src)
    if src == nil or src == 0 then src = source end

    local jobs = exports["np-base"]:getModule("JobManager")
    local user = exports["np-base"]:getModule("Player"):GetUser(src)

    if not user then return end
    if not jobs then return end

    jobs:SetJob(user, tostring(job))

end)

RegisterCommand('addwhitelist', function(source, args)
    local user = exports["np-base"]:getModule("Player"):GetUser(tonumber(args[1]))
    local jobs = exports["np-base"]:getModule("JobManager")
    jobs:AddWhiteList(user, args[2], args[3])
end)