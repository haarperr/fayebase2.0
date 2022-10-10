local playerInjury = {}

function GetCharsInjuries(source)
    return playerInjury[source]
end

RegisterServerEvent('np-hospital:server:SyncInjuries')
AddEventHandler('np-hospital:server:SyncInjuries', function(data)
    playerInjury[source] = data
end)