RegisterServerEvent('np-keys:attemptLockSV')
AddEventHandler('np-keys:attemptLockSV', function(targetVehicle, plate)
    TriggerClientEvent('lucityrp-keys:attemptLock', source, targetVehicle, plate)
end)