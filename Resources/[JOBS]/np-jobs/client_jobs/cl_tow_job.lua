-- ##################
-- ## Made By Evan ##
-- ##################

local Evan = {}

clockedon = false
towedavehicle = false
local CanImp = false
local setimpoundveh = ""

RegisterNetEvent('np-jobs:tow_trucker_duty')
AddEventHandler('np-jobs:tow_trucker_duty', function()
	if not clockedon then
		clockedon = true
		TriggerEvent('DoLongHudText', 'Go grab your towtruck from the garage and await a job.', 1)
		TriggerServerEvent('np-duty:tow_trucker')
		-- print('AWAIT')
		Citizen.Wait(math.random(60000, 300000))
		-- print('AWAIT PASSED')
		GiveTowJobWanker()
	else
		TriggerEvent('DoLongHudText', 'You\'re already clocked in.', 2)
	end
end)

RegisterNetEvent('np-jobs_tow_trucker_off_duty')
AddEventHandler('np-jobs_tow_trucker_off_duty', function()
	if clockedon then
		TriggerEvent('DoLongHudText', 'Clocked Out!', 2)
		TriggerServerEvent('np-duty:tow_trucker_off')
		clockedon = false
	else
		TriggerEvent('DoLongHudText', 'You aint on duty chief?', 2)
	end
end)

-- #################
-- ### Functions ###
-- #################

function getVehicleInDirection(coordFrom, coordTo)
	local offset = 0
	local rayHandle
	local vehicle

	for i = 0, 100 do
		rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)	
		a, b, c, d, vehicle = GetRaycastResult(rayHandle)
		
		offset = offset - 1

		if vehicle ~= 0 then break end
	end
	
	local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
	
	if distance > 25 then vehicle = nil end

    return vehicle ~= nil and vehicle or 0
end

--###################################################

function deleteVeh(ent)
	SetVehicleHasBeenOwnedByPlayer(ent, true)
	NetworkRequestControlOfEntity(ent)
	Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(ent))
	DeleteEntity(ent)
	DeleteVehicle(ent)
	SetEntityAsNoLongerNeeded(ent)
end

--###################################################

function GiveTowJobWanker()
	local fuckyouputa = math.random(1, 100)
	local locations = {
		[1] = {
			["x"] = 1780.4293212891, 
			["y"] = 3347.5656738281, 
			["z"] = 40.598194122314, 
			["h"] = 29.283344268799
		},
		[2] = {
			["x"] = 1913.896484375, 
			["y"] = 2509.1208496094, 
			["z"] = 54.544578552246, 
			["h"] = 142.74772644043
		},
		[3] = { 
			["x"] = 1401.9534912109, 
			["y"] = 717.19586181641, 
			["z"] = 78.307861328125, 
			["h"] = 142.46832275391
		},
		[4] = {
			["x"] = 878.08532714844, 
			["y"] = 282.68029785156, 
			["z"] = 86.619430541992, 
			["h"] = 141.57322692871
		},
		[5] = {
			["x"] = 839.71820068359, 
			["y"] = -98.327613830566, 
			["z"] = 80.399070739746, 
			["h"] = 240.2437286377
		},
		[6] = {
			["x"] = 1160.0949707031, 
			["y"] = -559.45196533203, 
			["z"] = 64.362022399902, 
			["h"] = 185.07582092285
		},
		[7] = {
			["x"] = 789.85327148438, 
			["y"] = -840.5517578125, 
			["z"] = 43.122009277344, 
			["h"] = 91.725814819336
		},
		[8] = {
			["x"] = 80.740493774414, 
			["y"] = -1028.9412841797, 
			["z"] = 29.276815414429, 
			["h"] = 159.46659851074
		}
	}
	local vehicle = exports['np-vehicles']:GetVehicleTable()
	local vehiclehash = vehicle[math.random(1, #vehicle)].model
	if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("flatbed")) then
		-- print(vehiclehash)
		TriggerEvent("addEmail", {title = "TOW HQ", subject = "Headquarters", message = "Make your way over to the vehicle."})
		Evan.Location = locations[math.random(1, #locations)]
		SetNewWaypoint(Evan.Location.x, Evan.Location.y)
		Evan.Chosen = false
		towedavehicle = true
		while not Evan.Chosen do
			Citizen.Wait(10000)
			fuckyouputa = math.random(1, 100)
			if fuckyouputa >= 80 then
				Evan.Chosen = true
			end
		end
		if fuckyouputa >= 80 then
			Evan.Chosen = true
			SetNewWaypoint(Evan.Location.x, Evan.Location.y)
			Evan.Looking = true
			Citizen.CreateThread(function()
				while Evan.Looking do
					Citizen.Wait(2000)
					if #(vector3(Evan.Location.x, Evan.Location.y, Evan.Location.z) - GetEntityCoords(PlayerPedId())) <= 320 then
						-- print('[DEBUG] REQUESTING MODEL')
						isAbleImp = 1
						RequestModel(vehiclehash)

						while not HasModelLoaded(vehiclehash) do
							Citizen.Wait(0)
						end
						
						TriggerEvent('phone:addJobNotify', 'Get the car hooked up.')
						CanImp = true
						Evan.VehicleID = CreateVehicle(vehiclehash, Evan.Location.x, Evan.Location.y, Evan.Location.z, true, false)
						SetEntityHeading(Evan.VehicleID, Evan.Location.h)
						local plate = GetVehicleNumberPlateText(Evan.VehicleID)
						setimpoundveh = plate
						DecorSetInt(Evan.VehicleID, "CurrentFuel", 100)
						SetVehicleOnGroundProperly(Evan.VehicleID)
						SetModelAsNoLongerNeeded(vehiclehash)
						Citizen.Wait(100)
						local netid = NetworkGetNetworkIdFromEntity(Evan.VehicleID)
						SetNetworkIdCanMigrate(netid, true)
						NetworkRegisterEntityAsNetworked(VehToNet(Evan.VehicleID))	
						SetEntityVisible(Evan.VehicleID, true)
						SetVehicleEngineHealth(Evan.VehicleID, 850)
						SmashVehicleWindow(Evan.VehicleID, 0)
						SmashVehicleWindow(Evan.VehicleID, 1)
						SmashVehicleWindow(Evan.VehicleID, 2)
						SmashVehicleWindow(Evan.VehicleID, 3)
						SmashVehicleWindow(Evan.VehicleID, 4)
						
						SetVehicleDoorBroken(Evan.VehicleID, math.random(1,2), true)
						SetVehicleDoorBroken(Evan.VehicleID, math.random(3,4), true)
						SetVehicleDoorBroken(Evan.VehicleID, math.random(5,6), true)
						
						SetVehicleTyreBurst(Evan.VehicleID, 1, false, 990.0)
						SetVehicleTyreBurst(Evan.VehicleID, 2, false, 990.0)
						SetVehicleTyreBurst(Evan.VehicleID, 3, false, 990.0)
						SetVehicleTyreBurst(Evan.VehicleID, 4, false, 990.0)
						Evan.Looking = false
						return
					end
				end
			end)
		end
	else
		TriggerEvent('DoLongHudText', 'You need to be inside of a flatbed to get a job', 2)
		TriggerEvent('np-jobs:give_tow_job')
	end
end

RegisterNetEvent('np-jobs:give_tow_job')
AddEventHandler('np-jobs:give_tow_job', function()
	-- print('[DEBUG] AWAITING JOB')
	Citizen.Wait(math.random(60000, 600000))
	-- print('PASSED')
	GiveTowJobWanker()
end)

-- Poly --

VoidPolyImp = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_imp_loc", vector3(-236.51, -1172.86, 37.6), 20, 27.6, {
        name="void_imp_loc",
        heading=270,
		-- debugPoly=true,
		minZ=22.2,
		maxZ=26.2
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_imp_loc" then
        VoidPolyImp = true     
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_imp_loc" then
        VoidPolyImp = false
        exports['np-interface']:hideInteraction()
    end
end)

RegisterNetEvent('np-jobs:impound_confirm_shit_idk_anymore')
AddEventHandler('viudrp-jobs:impound_confirm_shit_idk_anymore', function()
	if VoidPolyImp and CamImp then
		TriggerEvent('np-jobs:towing_imp')
	end
end)

RegisterNetEvent('np-jobs:impound_accept')
AddEventHandler('np-jobs:impound_accept', function()
	coordA = GetEntityCoords(PlayerPedId(), 1)
	coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 100.0, 0.0)
	vehicle = getVehicleInDirection(coordA, coordB)
	if DoesEntityExist(vehicle) and NetworkHasControlOfEntity(vehicle) then
		licensePlate = GetVehicleNumberPlateText(vehicle)
		if licensePlate == setimpoundveh then
			isAbleImp = 0
			CanImp = false
			DeleteEntity(vehicle)
			TriggerEvent('phone:addJobNotify', 'Impound Request Accepted.')
			TriggerServerEvent('zyloz:payout', math.random(100, 432))
			TriggerEvent('np-jobs:give_tow_job')
		else
			TriggerEvent('DoLongHudText', 'Incorrect Vehicle.', 2)
		end
	end
end)

RegisterNetEvent('np-jobs:imp_decline')
AddEventHandler('np-jobs:imp_decline', function()
	TriggerEvent('DoLongHudText', 'Impound Offer Declined')
	isAbleImp = 0
	CanImp = false
	TriggerEvent('np-jobs:give_tow_job')
end)

-- Imp Veh --

RegisterNetEvent('np-jobs:towing_imp')
AddEventHandler('np-jobs:towing_imp', function()
	CoordX = GetEntityCoords(PlayerPedId(), 1)
	CoordY = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 100.0, 0.0)
	veh = getVehicleInDirection(CoordX, CoordY)
	if DoesEntityExist(veh) and NetworkHasControlOfEntity(veh) then
		licensePlate = GetVehicleNumberPlateText(veh)
		if licensePlate == setimpoundveh then
			if CanImp then
				TriggerEvent('np-jobs_tow_menu')
			end
		else
			TriggerEvent('DoLongHudText', 'Wrong vehicle', 2)
		end
	end
end)

RegisterNetEvent('np-jobs_tow_menu')
AddEventHandler('np-jobs_tow_menu', function()
	local TowMenu = {
		{
			title = "Impound",
			Description = "Impound Offer"
		},
		{
			title = "Accept",
			action = "np-jobs:accept_impound_req",
		},
		{
			title = "Decline",
			action = "np-jobs:decline_impound_req",
		},
	}
	exports["np-interface"]:showContextMenu(TowMenu)
end)

RegisterInterfaceCallback('np-jobs:accept_impound_req', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('np-jobs:impound_accept')
end)

RegisterInterfaceCallback('np-jobs:decline_impound_req', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('np-jobs:imp_decline')
end)

-- export --

function IsAbleImp()
    if isAbleImp == 1 then
        impPogShit = true
    elseif isAbleImp == 0 then
        impPogShit = false
    end
    return impPogShit
end