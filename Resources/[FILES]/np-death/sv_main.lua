RegisterServerEvent('np-death:reviveSV')
AddEventHandler('np-death:reviveSV', function(t)
	TriggerClientEvent('np-death:revive', t)
    TriggerClientEvent('np-hospital:client:RemoveBleed', t) 
    TriggerClientEvent('np-hospital:client:ResetLimbs', t)
end)

RegisterServerEvent('np-death:reviveSV2')
AddEventHandler('np-death:reviveSV2', function()
	TriggerClientEvent('np-death:revive', source)
end)

RegisterNetEvent('baseevents:onPlayerDied')
AddEventHandler('baseevents:onPlayerDied', function(killerId, data)
    local src = source
    local pSteamName = GetPlayerName(src)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    exports['np-admin']:addPlayerLog('Player Died', GetPlayerIdentifier(src, 0), pSteamName..' ['..char.first_name..' '..char.last_name..'] died to '..killerId, char.id, 'None')
end)

RegisterNetEvent('baseevents:onPlayerKilled')
AddEventHandler('baseevents:onPlayerKilled', function(killerId, data)
    local src = source
    local pSteamName = GetPlayerName(src)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    print(json.encode(data))
    exports['np-admin']:addPlayerLog('Player Killed', GetPlayerIdentifier(src, 0), pSteamName..' ['..char.first_name..' '..char.last_name..'] died to '..data.weaponhash, char.id, 'None')
end)