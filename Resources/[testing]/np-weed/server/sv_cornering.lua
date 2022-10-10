RPC.register("np-weed:startCorner", function(pSource, pCoords)
    return true, "Started Cornering!"
end)

RPC.register("np-weed:cornerPed", function(pSource, pCoords, pPed, pVehicle)
    TriggerClientEvent("np-weed:cornerPed", pSource, pPed.param, pCoords.param, pVehicle.param)
    return true
end)

RPC.register("np-weed:cornerSyncHandoff", function(pSource, pCoords, pPed)
    TriggerClientEvent("np-weed:cornerSyncHandoff", -1, pPed.param, pCoords.param)
    return true
end)

RPC.register("np-weed:cornerSale", function(pSource, pCoords, pPed, pZone)
    TriggerClientEvent("np-weed:addCorneredPed", pSource, pPed.param)
    return true
end)