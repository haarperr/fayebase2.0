RegisterNetEvent("np-vehicleSync:updateSyncState")
AddEventHandler("np-vehicleSync:updateSyncState", function(pNetId, pSyncState)
    TriggerClientEvent("np-vehicleSync:updateSyncState", -1, pNetId, pSyncState)
end)