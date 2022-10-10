local nearBuy = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("police_buy", vector3(464.53, -1012.86, 28.43), 1.6, 1.45, {
		name="police_buy",
		heading=0,
    }) 
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "police_buy" then
		local job = exports["isPed"]:isPed("myJob")
		if job == 'police' or job == 'state' or job == 'sheriff' then
            nearBuy = true
            AtPoliceBuy()
			exports['np-textui']:showInteraction(("[E] %s"):format("Purchase Vehicle"))
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "police_buy" then
        nearBuy = false
    end
    exports['np-textui']:hideInteraction()
end)

function AtPoliceBuy()
	Citizen.CreateThread(function()
        while nearBuy do
            Citizen.Wait(5)
            local plate = GetVehicleNumberPlateText(vehicle)
            local job = exports["isPed"]:isPed("myJob")
            if job == 'police' or job == 'state' or job == 'sheriff' then
                if IsControlJustReleased(0, 38) then
                    TriggerEvent('np-garages:openBuyMenu')
                end
            end
        end
    end)
end

RegisterNetEvent('np-garages:openBuyMenu')
AddEventHandler('np-garages:openBuyMenu', function()
    TriggerEvent('np-context:sendMenu', {
		{
			id = 1,
			header = "Police Crown Vic",
			txt = "Purchase for $15000",
			params = {
				event = "np-garages:PurchasedVic"
			}
		},
	})
end)
-- RegisterNetEvent('np-garages:openBuyMenu')
-- AddEventHandler('np-garages:openBuyMenu', function()
--     TriggerEvent('np-context:sendMenu', {
-- 		{
-- 			id = 2,
-- 			header = "Police Interceptor Corvette",
-- 			txt = "Purchase for $50000",
-- 			params = {
-- 				event = "np-garages:PurchasedVette"
-- 			}
-- 		},
-- 	})
-- end)

-- RegisterNetEvent('np-garages:openBuyMenu')
-- AddEventHandler('np-garages:openBuyMenu', function()
--     TriggerEvent('np-context:sendMenu', {
-- 		{
-- 			id = 3,
-- 			header = "Police Interceptor Challenger",
-- 			txt = "Purchase for $50000",
-- 			params = {
-- 				event = "np-garages:PurchasedChal"
-- 			}
-- 		},
-- 	})
-- end)

-- RegisterNetEvent('np-garages:openBuyMenu')
-- AddEventHandler('np-garages:openBuyMenu', function()
--     TriggerEvent('np-context:sendMenu', {
-- 		{
-- 			id = 4,
-- 			header = "Police Interceptor Mustang",
-- 			txt = "Purchase for $50000",
-- 			params = {
-- 				event = "np-garages:PurchasedStang"
-- 			}
-- 		},
-- 	})
-- end)

-- RegisterNetEvent('np-garages:openBuyMenu')
-- AddEventHandler('np-garages:openBuyMenu', function()
--     TriggerEvent('np-context:sendMenu', {
-- 		{
-- 			id = 5,
-- 			header = "Police Interceptor Charger",
-- 			txt = "Purchase for $50000",
-- 			params = {
-- 				event = "np-garages:PurchasedChar"
-- 			}
-- 		},
-- 	})
-- end)

RegisterNetEvent('np-garages:openBuyMenu2')
AddEventHandler('np-garages:openBuyMenu2', function()
    TriggerEvent('np-context:sendMenu', {
		{
			id = 1,
			header = "EMS Ambulance",
			txt = "Purchase for $5000",
			params = {
				event = "np-garages:PurchasedAmbo"
			}
		},
	})
end)

RegisterNetEvent('np-garages:PurchasedAmbo')
AddEventHandler('np-garages:PurchasedAmbo', function()
    if exports["isPed"]:isPed("mycash") >= 5000 then
        TriggerServerEvent('np-banking:removeMoney', 5000)
        TriggerEvent('np-garages:PurchasedVeh', 'Ambulance', 'emsnspeedo', '5000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)

RegisterNetEvent('np-garages:PurchasedVette')
AddEventHandler('np-garages:PurchasedVette', function()
    if exports["isPed"]:isPed("mycash") >= 50000 then
        TriggerServerEvent('np-banking:removeMoney', 50000)
        TriggerEvent('np-garages:PurchasedVeh', 'Police Interceptor Corvette', 'npolvette', '50000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)
RegisterNetEvent('np-garages:PurchasedChar')
AddEventHandler('np-garages:PurchasedChar', function()
    if exports["isPed"]:isPed("mycash") >= 50000 then
        TriggerServerEvent('np-banking:removeMoney', 50000)
        TriggerEvent('np-garages:PurchasedVeh', 'Police Charger', 'npolchar', '50000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)
RegisterNetEvent('np-garages:PurchasedChal')
AddEventHandler('np-garages:PurchasedChal', function()
    if exports["isPed"]:isPed("mycash") >= 50000 then
        TriggerServerEvent('np-banking:removeMoney', 50000)
        TriggerEvent('np-garages:PurchasedVeh', 'Police Interceptor Challenger', 'npolchal', '50000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)
RegisterNetEvent('np-garages:PurchasedStang')
AddEventHandler('np-garages:PurchasedStang', function()
    if exports["isPed"]:isPed("mycash") >= 50000 then
        TriggerServerEvent('np-banking:removeMoney', 50000)
        TriggerEvent('np-garages:PurchasedVeh', 'Police Interceptor Mustang', 'npolstang', '50000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)
RegisterNetEvent('np-garages:PurchasedVic')
AddEventHandler('np-garages:PurchasedVic', function()
    if exports["isPed"]:isPed("mycash") >= 15000 then
        TriggerServerEvent('np-banking:removeMoney', 15000)
        TriggerEvent('np-garages:PurchasedVeh', 'Police Vic', 'npolvic', '5000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)

RegisterNetEvent('np-garages:PurchasedVeh')
AddEventHandler('np-garages:PurchasedVeh', function(name, veh, price)
    local ped = PlayerPedId()
    local name = name	
    local vehicle = veh
    local price = price		
    local model = veh
    local colors = table.pack(GetVehicleColours(veh))
    local extra_colors = table.pack(GetVehicleExtraColours(veh))

    local mods = {}

    for i = 0,24 do
        mods[i] = GetVehicleMod(veh,i)
    end

    FreezeEntityPosition(ped,false)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end

    local job = exports["isPed"]:isPed("myJob")
    if job == 'police' or job == 'state' or job == 'sheriff' then
        personalvehicle = CreateVehicle(model,462.81759643555,-1019.5252685547,28.100341796875,87.874015808105,true,false)
        SetEntityHeading(personalvehicle, 87.874015808105)
    elseif job == 'ems' then
        personalvehicle = CreateVehicle(model,333.1516418457,-575.947265625,28.791259765625,340.15747070312,true,false)
        SetEntityHeading(personalvehicle, 340.15747070312)
    end
        
    SetModelAsNoLongerNeeded(model)

    for i,mod in pairs(mods) do
        SetVehicleModKit(personalvehicle,0)
        SetVehicleMod(personalvehicle,i,mod)
    end

    SetVehicleOnGroundProperly(personalvehicle)

    local plate = GetVehicleNumberPlateText(personalvehicle)
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
    TriggerEvent("keys:addNew",personalvehicle, plate)
    TriggerServerEvent('np-garages:FinalizedPur', plate, name, vehicle, price, VehicleProps)
    Citizen.Wait(100)
    exports['np-textui']:hideInteraction()
end)