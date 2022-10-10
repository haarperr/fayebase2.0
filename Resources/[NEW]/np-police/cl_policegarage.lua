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
		if job == 'police' or job == 'state' or job == 'sheriff' or job == 'ranger' then
            nearBuy = true
            AtPoliceBuy()
			exports['np-interface']:showInteraction(("[E] %s"):format("Purchase Vehicle"))
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "police_buy" then
        nearBuy = false
    end
    exports['np-interface']:hideInteraction()
end)

function AtPoliceBuy()
	Citizen.CreateThread(function()
        while nearBuy do
            Citizen.Wait(5)
            local plate = GetVehicleNumberPlateText(vehicle)
            local job = exports["isPed"]:isPed("myJob")
            if job == 'police' or job == 'state' or job == 'sheriff' or job == 'ranger' then
                if IsControlJustReleased(0, 38) then
                    TriggerEvent('np-garages:openBuyMenu')
                end
            end
        end
    end)
end

RegisterNetEvent('np-garages:openBuyMenu')
AddEventHandler('np-garages:openBuyMenu', function()

	local PDBuyData = {
		{
            title = "Police Crown Vic",
            description = "Purchase For $1",
            key = "EVENTS.VIC",
            action = 'np-garage:buy_vic',
        },
        {
            title = "Police Explorer",
            description = "Purchase For $1",
            key = "EVENTS.EXP",
            action = 'np-garage:buy_exp',
        },
        {
            title = "Police Mustang",
            description = "Purchase For $1",
            key = "EVENTS.CHAR",
            action = 'np-garage:buy_stang',
        },
        {
            title = "Police Corvette",
            description = "Purchase For $1",
            key = "EVENTS.VETTE",
            action = 'np-garage:buy_vette',
        },
        {
            title = "Police Challenger",
            description = "Purchase For $1",
            key = "EVENTS.CHA",
            action = 'np-garage:buy_CHA',
        },
        {
            title = "Police Moto",
            description = "Purchase For $1",
            key = "EVENTS.MM",
            action = 'np-garage:buy_MM',
        },
    }
    exports["np-interface"]:showContextMenu(PDBuyData)
end)

RegisterInterfaceCallback('np-garage:buy_exp', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-garages:PurchasedExp')
end)

RegisterInterfaceCallback('np-garage:buy_vic', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-garages:PurchasedVic')
end)

RegisterInterfaceCallback('np-garage:buy_stang', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-garages:PurchasedStang')
end)

RegisterInterfaceCallback('np-garage:buy_vette', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-garages:PurchasedCorvette')
end)
RegisterInterfaceCallback('np-garage:buy_CHA', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-garages:PurchasedChallenger')
end)
RegisterInterfaceCallback('np-garage:buy_MM', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-garages:PurchasedMoto')
end)

RegisterNetEvent('np-garages:openBuyMenu2')
AddEventHandler('np-garages:openBuyMenu2', function()

	local EMSBuyData = {
		{
            title = "Police Ambulance",
            description = "Purchase For $80,000",
            key = "EVENTS.AMB",
            action = 'np-garage:buy_amb',
        },
    }
    exports["np-interface"]:showContextMenu(EMSBuyData)
end)

RegisterInterfaceCallback('np-garage:buy_amb', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-garages:PurchasedAmbo')
end)

RegisterNetEvent('np-garages:PurchasedAmbo')
AddEventHandler('np-garages:PurchasedAmbo', function()
    if exports["isPed"]:isPed("mycash") >= 1 then
        TriggerServerEvent('np-banking:removeMoney', 1)
        TriggerEvent('np-garages:PurchasedVeh', 'Ambulance', 'emsnspeedo', '80000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)

RegisterNetEvent('np-garages:PurchasedVic')
AddEventHandler('np-garages:PurchasedVic', function()
    if exports["isPed"]:isPed("mycash") >= 1 then
        TriggerServerEvent('np-banking:removeMoney', 1)
        TriggerEvent('np-garages:PurchasedVeh', 'Police Vic', 'npolvic', '80000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)

RegisterNetEvent('np-garages:PurchasedExp')
AddEventHandler('np-garages:PurchasedExp', function()
    if exports["isPed"]:isPed("mycash") >= 1 then
        TriggerServerEvent('np-banking:removeMoney', 1)
        TriggerEvent('np-garages:PurchasedVeh', 'Explorer', 'npolexp', '50000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)

RegisterNetEvent('np-garages:PurchasedStang')
AddEventHandler('np-garages:PurchasedStang', function()
    if exports["isPed"]:isPed("mycash") >= 1 then
        TriggerServerEvent('np-banking:removeMoney', 1)
        TriggerEvent('np-garages:PurchasedVeh', 'Police Charger', 'npolstang', '160000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)

RegisterNetEvent('np-garages:PurchasedCorvette')
AddEventHandler('np-garages:PurchasedCorvette', function()
    if exports["isPed"]:isPed("mycash") >= 1 then
        TriggerServerEvent('np-banking:removeMoney', 1)
        TriggerEvent('np-garages:PurchasedVeh', 'Police Corvette', 'npolvette', '100000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)
RegisterNetEvent('np-garages:PurchasedChallenger')
AddEventHandler('np-garages:PurchasedChallenger', function()
    if exports["isPed"]:isPed("mycash") >= 1 then
        TriggerServerEvent('np-banking:removeMoney', 1)
        TriggerEvent('np-garages:PurchasedVeh', 'Police Challenger', 'npolchal', '100000')
    else
        TriggerEvent('DoLongHudText', "You do not have enough money!", 2)
    end
end)
RegisterNetEvent('np-garages:PurchasedMoto')
AddEventHandler('np-garages:PurchasedMoto', function()
    if exports["isPed"]:isPed("mycash") >= 1 then
        TriggerServerEvent('np-banking:removeMoney', 1)
        TriggerEvent('np-garages:PurchasedVeh', 'Police Moto', 'npolmm', '100000')
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
    if job == 'police' or job == 'state' or job == 'sheriff' or job == 'ranger' then
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
    TriggerServerEvent('np-garages:FinalizedPur', plate, name, vehicle, price, VehicleProps)
    TriggerEvent("vehicle:keys:addNew",personalvehicle, plate)
    Citizen.Wait(100)
    exports['np-interface']:hideInteraction()
end)