CurrentDisplayVehicle = nil

function SpawnVehicle(vehicle, pGarage, Fuel, customized, plate, IsViewing)
    exports['np-garages']:DeleteViewedCar()
	local car = GetHashKey(vehicle)
	local customized = json.decode(customized)
    local selectedGarage = Garages[pGarage]
    local ParkingSpot = nil
    local pPlate = plate

    if pGarage == "nomalimpound" or pGarage == "Repo" then
        ParkingSpot = selectedGarage.spawns[1]
    elseif exports['np-menu']:houseGarageCoords() ~= nil and exports['np-menu']:NearHouseGarage() then
        HousingSpawn = exports['np-menu']:houseGarageCoords()
        ParkingSpot = HousingSpawn
    else
        for i=1, #selectedGarage.spawns do
            local RunSpawnCheck = false
            local distance = #(vector3(selectedGarage.spawns[i].x, selectedGarage.spawns[i].y, selectedGarage.spawns[i].z) - GetEntityCoords(PlayerPedId()))
            if distance < 1.6 then
                RunSpawnCheck = true
            elseif distance < 1.8 and not RunSpawnCheck then
                RunSpawnCheck = true
            elseif distance < 2.0 and not RunSpawnCheck then
                RunSpawnCheck = true
            elseif distance < 2.4 and not RunSpawnCheck then
                RunSpawnCheck = true
            elseif distance < 3.0 and not RunSpawnCheck then
                RunSpawnCheck = true
            elseif distance < 3.5 and not RunSpawnCheck then
            end

            if RunSpawnCheck then
                local vehicle = GetClosestVehicle(selectedGarage.spawns[i].x, selectedGarage.spawns[i].y, selectedGarage.spawns[i].z, 2.0, 0, 127)
                if not DoesEntityExist(vehicle) then
                    ParkingSpot = selectedGarage.spawns[i]
                    break
                end
            end
        end
    end
 

	Citizen.CreateThread(function()			
		Citizen.Wait(100)
        RequestModel(car)
        while not HasModelLoaded(car) do
            Citizen.Wait(0)
        end

        veh = CreateVehicle(car, ParkingSpot.x, ParkingSpot.y, ParkingSpot.z, ParkingSpot.h, true, false)
                  
        SetModelAsNoLongerNeeded(car)
    
        DecorSetInt(veh, "CurrentFuel", Fuel)
        
        DecorSetBool(veh, "PlayerVehicle", true)
        SetVehicleOnGroundProperly(veh)
        SetEntityInvincible(veh, false) 
        SetVehicleProps(veh, customized)
        Citizen.Wait(50)
        SetVehicleNumberPlateText(veh, pPlate)
        TriggerEvent("keys:addNew",veh, pPlate)
        SetVehicleHasBeenOwnedByPlayer(veh,true)
        local id = NetworkGetNetworkIdFromEntity(veh)
        SetNetworkIdCanMigrate(id, true)
        
        CurrentDisplayVehicle = veh
        if not IsViewing then    
            CurrentDisplayVehicle = nil
            RPC.execute("np-garages:states", "Out", plate, exports['np-menu']:currentGarage())
        end
    end)
end


function SetVehicleProps(veh, customized)
    SetVehicleModKit(veh, 0)
    if customized ~= nil then
            
        if customized.plate ~= nil then
            SetVehicleNumberPlateText(veh, customized.plate)
        end
    
        if customized.plateIndex ~= nil then
            SetVehicleNumberPlateTextIndex(veh, customized.plateIndex)
        end
    
        if customized.bodyHealth ~= nil then
            SetVehicleBodyHealth(veh, customized.bodyHealth + 0.0)
        end
    
        if customized.engineHealth ~= nil then
            SetVehicleEngineHealth(veh, customized.engineHealth + 0.0)
        end
    
        if customized.dirtLevel ~= nil then
            SetVehicleDirtLevel(veh, customized.dirtLevel + 0.0)
        end
    
        if customized.color1 ~= nil then
            local color1, color2 = GetVehicleColours(veh)
            SetVehicleColours(veh, customized.color1, color2)
        end
    
        if customized.color2 ~= nil then
            local color1, color2 = GetVehicleColours(veh)
            SetVehicleColours(veh, color1, customized.color2)
        end
    
        if customized.pearlescentColor ~= nil then
            local pearlescentColor, wheelColor = GetVehicleExtraColours(veh)
            SetVehicleExtraColours(veh, customized.pearlescentColor, wheelColor)
        end
    
        if customized.wheelColor ~= nil then
            local pearlescentColor, wheelColor = GetVehicleExtraColours(veh)
            SetVehicleExtraColours(veh, pearlescentColor, customized.wheelColor)
        end
    
        if customized.wheels ~= nil then
            SetVehicleWheelType(veh, customized.wheels)
        end
    
        if customized.windowTint ~= nil then
            SetVehicleWindowTint(veh, customized.windowTint)
        end
    
        if customized.neonEnabled ~= nil then
            SetVehicleNeonLightEnabled(veh, 0, customized.neonEnabled[1])
            SetVehicleNeonLightEnabled(veh, 1, customized.neonEnabled[2])
            SetVehicleNeonLightEnabled(veh, 2, customized.neonEnabled[3])
            SetVehicleNeonLightEnabled(veh, 3, customized.neonEnabled[4])
        end
    
        if customized.extras ~= nil then
            for id,enabled in pairs(customized.extras) do
                if enabled then
                    SetVehicleExtra(veh, tonumber(id), 0)
                else
                    SetVehicleExtra(veh, tonumber(id), 1)
                end
            end
        end
    
        if customized.neonColor ~= nil then
            SetVehicleNeonLightsColour(veh, customized.neonColor[1], customized.neonColor[2], customized.neonColor[3])
        end
    
        if customized.modSmokeEnabled ~= nil then
            ToggleVehicleMod(veh, 20, true)
        end
    
        if customized.tyreSmokeColor ~= nil then
            SetVehicleTyreSmokeColor(veh, customized.tyreSmokeColor[1], customized.tyreSmokeColor[2], customized.tyreSmokeColor[3])
        end
    
        if customized.modSpoilers ~= nil then
            SetVehicleMod(veh, 0, customized.modSpoilers, false)
        end
    
        if customized.modFrontBumper ~= nil then
            SetVehicleMod(veh, 1, customized.modFrontBumper, false)
        end
    
        if customized.modRearBumper ~= nil then
            SetVehicleMod(veh, 2, customized.modRearBumper, false)
        end
    
        if customized.modSideSkirt ~= nil then
            SetVehicleMod(veh, 3, customized.modSideSkirt, false)
        end
    
        if customized.modExhaust ~= nil then
            SetVehicleMod(veh, 4, customized.modExhaust, false)
        end
    
        if customized.modFrame ~= nil then
            SetVehicleMod(veh, 5, customized.modFrame, false)
        end
    
        if customized.modGrille ~= nil then
            SetVehicleMod(veh, 6, customized.modGrille, false)
        end
    
        if customized.modHood ~= nil then
            SetVehicleMod(veh, 7, customized.modHood, false)
        end
    
        if customized.modFender ~= nil then
            SetVehicleMod(veh, 8, customized.modFender, false)
        end
    
        if customized.modRightFender ~= nil then
            SetVehicleMod(veh, 9, customized.modRightFender, false)
        end
    
        if customized.modRoof ~= nil then
            SetVehicleMod(veh, 10, customized.modRoof, false)
        end
    
        if customized.modEngine ~= nil then
            SetVehicleMod(veh, 11, customized.modEngine, false)
        end
    
        if customized.modBrakes ~= nil then
            SetVehicleMod(veh, 12, customized.modBrakes, false)
        end
    
        if customized.modTransmission ~= nil then
            SetVehicleMod(veh, 13, customized.modTransmission, false)
        end
    
        if customized.modHorns ~= nil then
            SetVehicleMod(veh, 14, customized.modHorns, false)
        end
    
        if customized.modSuspension ~= nil then
            SetVehicleMod(veh, 15, customized.modSuspension, false)
        end
    
        if customized.modArmor ~= nil then
            SetVehicleMod(veh, 16, customized.modArmor, false)
        end
    
        if customized.modTurbo ~= nil then
            ToggleVehicleMod(veh,  18, customized.modTurbo)
        end
    
        if customized.modXenon ~= nil then
            ToggleVehicleMod(veh,  22, customized.modXenon)
        end
    
        if customized.modFrontWheels ~= nil then
            SetVehicleMod(veh, 23, customized.modFrontWheels, false)
        end
    
        if customized.modBackWheels ~= nil then
            SetVehicleMod(veh, 24, customized.modBackWheels, false)
        end
    
        if customized.modPlateHolder ~= nil then
            SetVehicleMod(veh, 25, customized.modPlateHolder, false)
        end
    
        if customized.modVanityPlate ~= nil then
            SetVehicleMod(veh, 26, customized.modVanityPlate, false)
        end
    
        if customized.modTrimA ~= nil then
            SetVehicleMod(veh, 27, customized.modTrimA, false)
        end
    
        if customized.modOrnaments ~= nil then
            SetVehicleMod(veh, 28, customized.modOrnaments, false)
        end
    
        if customized.modDashboard ~= nil then
            SetVehicleMod(veh, 29, customized.modDashboard, false)
        end
    
        if customized.modDashboardColour ~= nil then
            SetVehicleDashboardColour(veh, customized.modDashboardColour)
        end
    
        if customized.modInteriorColour ~= nil then
            SetVehicleInteriorColour(veh, customized.modInteriorColour)
        end
    
        if customized.modXenonColour ~= nil then
            SetVehicleHeadlightsColour(veh, customized.modXenonColour)
        end
    
        if customized.modDial ~= nil then
            SetVehicleMod(veh, 30, customized.modDial, false)
        end
    
        if customized.modDoorSpeaker ~= nil then
            SetVehicleMod(veh, 31, customized.modDoorSpeaker, false)
        end
    
        if customized.modSeats ~= nil then
            SetVehicleMod(veh, 32, customized.modSeats, false)
        end
    
        if customized.modSteeringWheel ~= nil then
            SetVehicleMod(veh, 33, customized.modSteeringWheel, false)
        end
    
        if customized.modShifterLeavers ~= nil then
            SetVehicleMod(veh, 34, customized.modShifterLeavers, false)
        end
    
        if customized.modAPlate ~= nil then
            SetVehicleMod(veh, 35, customized.modAPlate, false)
        end
    
        if customized.modSpeakers ~= nil then
            SetVehicleMod(veh, 36, customized.modSpeakers, false)
        end
    
        if customized.modTrunk ~= nil then
            SetVehicleMod(veh, 37, customized.modTrunk, false)
        end
    
        if customized.modHydrolic ~= nil then
            SetVehicleMod(veh, 38, customized.modHydrolic, false)
        end
    
        if customized.modEngineBlock ~= nil then
            SetVehicleMod(veh, 39, customized.modEngineBlock, false)
        end
    
        if customized.modAirFilter ~= nil then
            SetVehicleMod(veh, 40, customized.modAirFilter, false)
        end
    
        if customized.modStruts ~= nil then
            SetVehicleMod(veh, 41, customized.modStruts, false)
        end
    
        if customized.modArchCover ~= nil then
            SetVehicleMod(veh, 42, customized.modArchCover, false)
        end
    
        if customized.modAerials ~= nil then
            SetVehicleMod(veh, 43, customized.modAerials, false)
        end
    
        if customized.modTrimB ~= nil then
            SetVehicleMod(veh, 44, customized.modTrimB, false)
        end
    
        if customized.modTank ~= nil then
            SetVehicleMod(veh, 45, customized.modTank, false)
        end
    
        if customized.modWindows ~= nil then
            SetVehicleMod(veh, 46, customized.modWindows, false)
        end
    
        if customized.modLivery ~= nil then
            SetVehicleMod(veh, 48, customized.modLivery, false)
            SetVehicleLivery(veh, customized.modLivery)
        end
    
        if customized.modoldLivery ~= nil then
            SetVehicleLivery(veh, customized.modoldLivery)
        end
    else
        SetVehicleColours(veh, 0, 0)
        SetVehicleExtraColours(veh, 0, 0)
    end
end

exports("DeleteViewedCar", function()
    if DoesEntityExist(CurrentDisplayVehicle) then
		SetEntityAsMissionEntity(CurrentDisplayVehicle, true, true)
		DeleteVehicle(CurrentDisplayVehicle)
		DeleteEntity(CurrentDisplayVehicle)
		CurrentDisplayVehicle = nil
	end
end)

Citizen.CreateThread(function()
    for _, item in pairs(Garages) do
        if item.blip ~= nil then
            Garage = AddBlipForCoord(item.blip.x, item.blip.y, item.blip.z)

            SetBlipSprite (Garage, 357)
            SetBlipDisplay(Garage, 4)
            SetBlipScale  (Garage, 0.65)
            SetBlipAsShortRange(Garage, true)
            SetBlipColour(Garage, 3)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(item.name)
            EndTextCommandSetBlipName(Garage)
        end
    end
end)