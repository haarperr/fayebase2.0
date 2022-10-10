RegisterNetEvent("np-vehicleSync:updateSirenState")
AddEventHandler("np-vehicleSync:updateSirenState", function(pNetId, pSirenState, pSirenPreset)
    TriggerClientEvent("np-vehicleSync:updateSirenState", -1, pNetId, pSirenState, pSirenPreset)
end)