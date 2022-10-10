local addCallAmount = 0

local function isAuth(pJob)
    for idx, job in pairs(Config["AuthJobs"]) do
        if pJob == job then
            return true
        end
    end
    return false
end

LoadDreamsVersion = function()
    RegisterServerEvent("dispatch:svNotify", function(data)
        addCallAmount = addCallAmount + 1
        for index, id in pairs(GetPlayers()) do
            local Player = exports['np-base']:getModule("Player"):GetUser(tonumber(id))
            if isAuth(Player.job) then
                TriggerClientEvent("dispatch:clNotify", Player.source, data, data.dispatchCode, source, addCallAmount)
            end
        end
    end)
end

RegisterServerEvent('dispatch:setcallsign')
AddEventHandler('dispatch:setcallsign', function()
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local character = user:getCurrentCharacter()
    exports.oxmysql:execute('SELECT * FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result)
        if result[1] ~= nil then
            TriggerClientEvent('police:setCallSign', src, result[1].callsign)
        end
    end)
end)

Citizen.CreateThread(function()
    if Config["CoreSettings"]["Core"] == "warp" then
        LoadDreamsVersion()
    end
end)