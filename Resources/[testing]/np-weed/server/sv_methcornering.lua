RPC.register("np-meth:startCorner", function(pSource, pCoords)
    return true, "Started Cornering!"
end)

RPC.register("np-meth:cornerPed", function(pSource, pCoords, pPed, pVehicle)
    TriggerClientEvent("np-meth:cornerPed", pSource, pPed.param, pCoords.param, pVehicle.param)
    return true
end)

RPC.register("np-meth:cornerSyncHandoff", function(pSource, pCoords, pPed)
    TriggerClientEvent("np-meth:cornerSyncHandoff", -1, pPed.param, pCoords.param)
    return true
end)

RPC.register("np-meth:cornerSale", function(pSource, pCoords, pPed, pZone)
    TriggerClientEvent("np-meth:addCorneredPed", pSource, pPed.param)
    return true
end)