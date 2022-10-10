RegisterNUICallback("showroomPurchaseCurrentVehicle", function(data, cb)
    TriggerServerEvent('showroom:purchaseVehicle', data.model, data.price, data.zoneName)
end)

RegisterNUICallback("showroomTestDriveCurrentVehicle", function(data, cb)
  TriggerServerEvent('showroom:test_drive', data.model, data.price, data.zoneName)
end)

RegisterNetEvent('np-showroom:SpawnVehicle')
AddEventHandler('np-showroom:SpawnVehicle', function(veh, price, plate)
    print(veh, price, plate)
    local name = name	
    local vehicle = veh
    local price = price		
    local veh = GetVehiclePedIsUsing(ped)
    local model = GetHashKey(vehicle)
    local colors = table.pack(GetVehicleColours(veh))
    local extra_colors = table.pack(GetVehicleExtraColours(veh))

    local mods = {}

    for i = 0,24 do
      mods[i] = GetVehicleMod(veh,i)
    end

    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))

    FreezeEntityPosition(ped,false)
    RequestModel(model)
    while not HasModelLoaded(model) do
      Citizen.Wait(0)
    end
    personalvehicle = CreateVehicle(model,143.04008,-3001.06,7.0310249,true,false)  
    SetEntityHeading(personalvehicle, 353.78396)
    SetModelAsNoLongerNeeded(model)

    for i,mod in pairs(mods) do
      SetVehicleModKit(personalvehicle,0)
      SetVehicleMod(personalvehicle,i,mod)
    end

    SetVehicleOnGroundProperly(personalvehicle)

    SetVehicleHasBeenOwnedByPlayer(personalvehicle,true)
    local id = NetworkGetNetworkIdFromEntity(personalvehicle)
    SetNetworkIdCanMigrate(id, true)
    Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
    SetVehicleColours(personalvehicle,colors[1],colors[2])
    SetVehicleExtraColours(personalvehicle,extra_colors[1],extra_colors[2])
    TaskWarpPedIntoVehicle(PlayerPedId(),personalvehicle,-1)
    SetEntityVisible(ped,true)			
    local primarycolor = colors[1]
    local secondarycolor = colors[2]	
    local pearlescentcolor = extra_colors[1]
    local wheelcolor = extra_colors[2]
    local VehicleProps = exports['np-base']:FetchVehProps(personalvehicle)
    local model = GetEntityModel(personalvehicle)
    local vehname = GetDisplayNameFromVehicleModel(model)
    SetVehicleNumberPlateText(personalvehicle, plate)
    TriggerEvent("vehicle:keys:addNew",personalvehicle, plate)
    TriggerServerEvent('np-showroom:purchaseVehicle', plate, name, vehicle, price, VehicleProps)
end)

-- RegisterCommand("cord", function()
--     coords = GetEntityCoords(PlayerPedId())
--     head = GetEntityHeading(PlayerPedId())
--     print(coords, head)
-- end)

RegisterNetEvent('np-showroom:testDrive')
AddEventHandler('np-showroom:testDrive', function(veh, price, plate)
    print(veh, price, plate)
    local name = name	
    local vehicle = veh
    local price = price		
    local veh = GetVehiclePedIsUsing(ped)
    local model = GetHashKey(vehicle)
    local colors = table.pack(GetVehicleColours(veh))
    local extra_colors = table.pack(GetVehicleExtraColours(veh))

    local mods = {}

    for i = 0,24 do
      mods[i] = GetVehicleMod(veh,i)
    end

    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))

    FreezeEntityPosition(ped,false)
    RequestModel(model)
    while not HasModelLoaded(model) do
      Citizen.Wait(0)
    end
    personalvehicle = CreateVehicle(model, 143.04008,-3001.06,7.0310249,true,false)  
    SetEntityHeading(personalvehicle, 353.78396)
    SetModelAsNoLongerNeeded(model)

    for i,mod in pairs(mods) do
      SetVehicleModKit(personalvehicle,0)
      SetVehicleMod(personalvehicle,i,mod)
    end

    SetVehicleOnGroundProperly(personalvehicle)

    SetVehicleHasBeenOwnedByPlayer(personalvehicle,true)
    local id = NetworkGetNetworkIdFromEntity(personalvehicle)
    SetNetworkIdCanMigrate(id, true)
    Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
    SetVehicleColours(personalvehicle,colors[1],colors[2])
    SetVehicleExtraColours(personalvehicle,extra_colors[1],extra_colors[2])
    TaskWarpPedIntoVehicle(PlayerPedId(),personalvehicle,-1)
    SetEntityVisible(ped,true)			
    local primarycolor = colors[1]
    local secondarycolor = colors[2]	
    local pearlescentcolor = extra_colors[1]
    local wheelcolor = extra_colors[2]
    local VehicleProps = exports['np-base']:FetchVehProps(personalvehicle)
    local model = GetEntityModel(personalvehicle)
    local vehname = GetDisplayNameFromVehicleModel(model)
    SetVehicleNumberPlateText(personalvehicle, plate)
    TriggerEvent("vehicle:keys:addNew",personalvehicle, plate)
end)