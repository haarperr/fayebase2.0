RegisterNetEvent("np-garages:open")
AddEventHandler("np-garages:open", function()
    local pJob = exports["isPed"]:isPed("myJob")
    local pGarage = exports['np-menu']:currentGarage()
    RPC.execute("np-garages:selectMenu", pGarage, pJob)
end)

RegisterNetEvent("np-garages:openSharedGarage")
AddEventHandler("np-garages:openSharedGarage", function()
    local pJob = exports["isPed"]:isPed("myJob")
    exports['np-garages']:DeleteViewedCar()
    RPC.execute("np-garages:selectSharedGarage", exports['np-menu']:currentGarage(), pJob)
end)

RegisterNetEvent("np-garages:openPersonalGarage")
AddEventHandler("np-garages:openPersonalGarage", function()
    exports['np-garages']:DeleteViewedCar()
    RPC.execute("np-garages:select", exports['np-menu']:currentGarage())
end)

RegisterNetEvent("np-garages:attempt:spawn", function(data, pRealSpawn)
    if not pRealSpawn then
        RPC.execute("np-garages:attempt:sv", data)
        SpawnVehicle(data.model, exports['np-menu']:currentGarage(), data.fuel, data.customized, data.plate, true)
    else
        SpawnVehicle(data.model, exports['np-menu']:currentGarage(), data.fuel, data.customized, data.plate, false)
    end
end)

RegisterNetEvent("np-garages:takeout", function(pData)
    RPC.execute("np-garages:spawned:get", pData.pVeh)
end)

RegisterNetEvent("np-garages:store", function()
    local pos = GetEntityCoords(PlayerPedId())
    local Stored = RPC.execute("np-garages:states", "In", exports["np-vehicles"]:NearVehicle("plate"), exports['np-menu']:currentGarage(), exports["np-vehicles"]:NearVehicle("Fuel"))
    local coordA = GetEntityCoords(PlayerPedId(), 1)
    local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 100.0, 0.0)
    local curVeh = exports['np-vehicles']:getVehicleInDirection(coordA, coordB)
    if DoesEntityExist(curVeh) then
        if Stored then
            DeleteVehicle(curVeh)
            DeleteEntity(curVeh)
            TriggerEvent('keys:remove', exports["np-vehicles"]:NearVehicle("plate"))
            TriggerEvent('DoLongHudText', "Vehicle stored in garage: " ..exports['np-menu']:currentGarage(), 1)
        else
            TriggerEvent('DoLongHudText', "You cant store local cars!", 2)
        end
    else
        TriggerEvent("DoLongHudText", "No vehicle near by!" , 2)
    end
end)