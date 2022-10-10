local stealing = false
local enterCoords = nil
local lock = true
local coordsx, coordsy, coordsz, t
local coord = false
local alarm = false
local timer = false
local model
local housecoords
local items = {}
local working = false
local interior = {}
local noise = 0
local within = false
local charging = false
local PlayerJob = exports["isPed"]:isPed("myJob")
local firstentry = false


Citizen.CreateThread(function()
	local result = RPC.execute('np-houserobbery:enter_property')
	coordsx, coordsy, coordsz, t = result[1], result[2], result[3], result[4]
	coord = true
	print(result)
end)

Citizen.CreateThread(function()
	while not stealing do
		Citizen.Wait(1000)
	end
	while true do
		local w = 500
		if stealing then
			w = 3			
			if PlayerJob ~= "police" or "state" or "sheriff" then
				for i = 1, #items do
					local objCoords = GetEntityCoords(items[i].objeto)
					if #(GetEntityCoords(PlayerPedId()) - objCoords) <= items[i].dist and not items[i].robado then
						DrawText3D(objCoords.x, objCoords.y, objCoords.z+0.45, 'Press ~r~[E]~w~ to search')
						if IsControlJustPressed(0,38) and not charging then
							items[i].robado = true
							if items[i].anim == 'cajafuerte' then
								TriggerEvent('safecracker:start',false,2,function(res)
									if res then
										TriggerEvent('player:receiveItem', 'bands', math.random(1, 7))
									else
										items[i].robado = false
									end
								end)
							else
								TriggerEvent('np-houserobber:animations',items[i].anim,items[i].delete,i)
							end
						end
					end
				end
			end
			if #(GetEntityCoords(PlayerPedId()) - vector3(housecoords.x, housecoords.y, housecoords.z)) < 1.5 then
				DrawText3D(housecoords.x, housecoords.y, housecoords.z, 'Press ~r~[H]~w~ to exit')
				if IsControlJustPressed(0,74) then
					if PlayerJob ~= "police" or "state" or "sheriff" then	
						if isnight() then
							LeaveHouse()
						else
							LeaveHouse(true)
						end
					else
						LeaveHouse(true)
					end
				end
			end
		end
		Citizen.Wait(w)
	end
end)

RegisterNetEvent('np-houserobbery:getJob')
AddEventHandler('np-houserobbery:getJob', function()
	if not working then
		if exports['np-inventory']:hasEnoughOfItem('vpnxj', 1) then
			if exports['np-inventory']:hasEnoughOfItem('advlockpick', 1) then
				cleanup()
				working = true
				enterCoords = Houses()
				TriggerEvent("phone:addJobNotify", "Boss - Ill have a job for you shortly!")
				Citizen.Wait(math.random(1,2) * 60 * 1000)
				PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", true)
				HouseRobberyLocation = AddBlipForCoord(enterCoords.x, enterCoords.y, enterCoords.z)
				SetBlipSprite(HouseRobberyLocation, 40)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString("House Robbery")
				EndTextCommandSetBlipName(HouseRobberyLocation)
				SetBlipRoute(HouseRobberyLocation, true)
				SetBlipRouteColour(HouseRobberyLocation, 29)
				TriggerEvent("phone:addJobNotify", "Boss - House Robbery On GPS")
				firstentry = true
				entrance()
			else
				TriggerEvent('DoLongHudText', 'You will need an Adv Lockpick to get into the houses', 2)
			end
		else
			TriggerEvent('DoLongHudText', 'You will need a VPN to work here.', 2)
		end
	else
		TriggerEvent('DoLongHudText', 'Chill, the boss is looking for a house')
	end
end)

RegisterNetEvent('np-houserobbery:make_noise')
AddEventHandler('np-houserobbery:make_noise', function()
	local ped = PlayerPedId()
	while stealing do		
		if within then	
			bar(noise)
			if IsPedShooting(ped) then
				noise = noise + 20
			end
			if GetEntitySpeed(ped) > 1.7 then
				noise = noise + 10				
				if GetEntitySpeed(ped) > 2.5 then
					noise = noise + 15
				end
				if GetEntitySpeed(ped) > 3.0 then
					noise = noise + 20
				end
				Citizen.Wait(300)
			else
				noise = noise - 2
				if noise < 0 then
					noise = 0
				end
				Citizen.Wait(1000)
			end
			bar(noise)
			if noise > 100 then
				-- dispatch for pd
				TriggerEvent('np-dispatch:houserobbery')
				Citizen.Wait(300000)
			end
		end
		if #(GetEntityCoords(PlayerPedId()) - vector3(housecoords.x, housecoords.y, housecoords.z)) > 300 then
			cleanup()
		end
		Citizen.Wait(5)		
	end
end)


RegisterCommand('raid', function()
	if PlayerJob == "police" or "state" or "sheriff" then
		TriggerEvent('np-houserobbery:police_enter')	
	end
end)

RegisterNetEvent('np-houserobbery:police_enter')
AddEventHandler('np-houserobbery:police_enter', function()
	if PlayerJob == "police" or "state" or "sheriff" then
		for i = 1, #Config.Houses do
			local casa = Config.Houses[i]
			if #(GetEntityCoords(PlayerPedId()) - vector3(casa.x, casa.y, casa.z)) < 5 then
				enterCoords = casa
				EnterHouse(true)
			end
		end
	end
end)

function Houses()
	local ubicacion = math.random(1, #Config.Houses)		
	local c = Config.Houses[ubicacion]
	return c
end

function entrance()
	while working do
		local espera = 1500
			distancia = #(GetEntityCoords(PlayerPedId()) - vector3(enterCoords.x, enterCoords.y, enterCoords.z))
			if distancia < 3 and isnight() then
				espera = 5
				exports['np-interface']:showInteraction('[H] To Enter House')
					if IsControlJustReleased(0,74) and distancia < 3 and firstentry then
						RemoveBlip(HouseRobberyLocation)
						if exports['np-inventory']:hasEnoughOfItem('advlockpick', 1) then
							local finished = exports["np-ui"]:taskBarSkill(5000,math.random(100, 200))
							if (finished == 100) then
								local finished2 = exports["np-ui"]:taskBarSkill(5000,math.random(200,400))
								if (finished2 == 100) then
									local finished3 = exports["np-ui"]:taskBarSkill(5000,math.random(50,100))
									if (finished3 == 100) then
										local finished4 = exports["np-ui"]:taskBarSkill(5000,math.random(200,400))
										if (finished4 == 100) then
											local finished5 = exports["np-ui"]:taskBarSkill(5000,math.random(200,400))
											if (finished5 == 100) then
											EnterHouse()
											firstentry = false
										end
									end
								end
							end
						end
					end
				elseif IsControlJustReleased(0,74) and not firstentry and distancia < 3 then 
					EnterHouse()
				end	
			else
			exports['np-interface']:hideInteraction()
		end
		Citizen.Wait(espera)
	end		
end


function EnterHouse(police)
	if not stealing then
		if enterCoords.model == 'HighEnd' then
			housecoords, heading, items, interior = HighEnd(enterCoords)
		elseif enterCoords.model == 'MidApt' then
			housecoords, heading, items, interior = MidApt(enterCoords)
		end
		ClearAreaOfPeds(housecoords.x,housecoords.y,housecoords.z, 100.0, 1)
		stealing = true
		if not police then
			TriggerEvent('np-houserobbery:make_noise')
		end
	else
		DoScreenFadeOut(1000)
		Citizen.Wait(1500)
		SetEntityCoords(PlayerPedId(),housecoords.x,housecoords.y,housecoords.z)
		SetEntityHeading(PlayerPedId(),heading)
		Citizen.Wait(2500)
		DoScreenFadeIn(1500)
	end
	within = true
end

RegisterNetEvent('np-houserobber:animations')
AddEventHandler('np-houserobber:animations', function(anim, delete, i)
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	LoadAnim('mp_common_heist')
	LoadAnim("anim@heists@box_carry@")
	if anim == 'tv' then
		FreezeEntityPosition(ped,true)
		TaskPlayAnim(ped, "mp_common_heist", 'use_terminal_loop', 2.0, 2.0, -1, 1, 0, true, true, true)
		Citizen.Wait(10000)
		ClearPedTasksImmediately(ped)
		FreezeEntityPosition(ped,false)
		television = CreateObject(GetHashKey("prop_tv_flat_01"), coords.x, coords.y, coords.z,  true,  true, false)
		AttachEntityToEntity(television, ped, GetPedBoneIndex(ped, 57005), 0.0, 0.0, 0.0, 0.0, 20.0, 0.0, true, true, false, true, 1, true)
		RequestWalking('anim_group_move_ballistic')
		SetPedMovementClipset(ped, 'anim_group_move_ballistic', 0.2)
		DeleteEntity(items[i].objeto)
		charging = true
		while true do
			local w = 50
			if not IsEntityPlayingAnim(ped, "anim@heists@box_carry@", "walk", 3) then
				TaskPlayAnim(ped, 'anim@heists@box_carry@', "walk", 8.0, -8, -1, 49, 0, 0, 0, 0)
			end			
			local ubicacion = GetEntityCoords(PlayerPedId())
			local vehicle = getVehicleInfront(2)
			local d1 = GetModelDimensions(GetEntityModel(vehicle))
			local vehicleCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d1["y"]+0.60,0.0)
			local Distance = GetDistanceBetweenCoords(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, ubicacion.x, ubicacion.y, ubicacion.z, false)
			
			if Distance < 3 then
				w = 3
				DrawText3D(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 'Press ~r~[E]~w~ to put in vehicle')
			end
			if IsControlJustReleased(0, 38) then                           
				if idklol() then	
					Citizen.Wait(400)
					DetachEntity(television, 1, 0)
					DeleteEntity(television)
					television = nil
					ClearPedTasksImmediately(ped)
					RemoveAnimSet('anim_group_move_ballistic')
					ResetPedMovementClipset(ped)
					TriggerEvent('player:receiveItem', 'stolentv', 1)
					charging = false
					break
				end
			end
			Citizen.Wait(w)
		end
	elseif anim == 'telescopio' then
		LoadAnim("anim@heists@narcotics@trash")
		FreezeEntityPosition(ped,true)
		TaskPlayAnim(ped, "mp_common_heist", 'use_terminal_loop', 2.0, 2.0, -1, 1, 0, true, true, true)
		Citizen.Wait(2000)
		ClearPedTasksImmediately(ped)
		FreezeEntityPosition(ped,false)
		telescopioObj = CreateObject(GetHashKey("prop_t_telescope_01b"), coords.x, coords.y, coords.z,  true,  true, false)
		AttachEntityToEntity(telescopioObj, ped, GetPedBoneIndex(ped, 57005), -0.06, 0.0, -0.31, 0.0, 20.0, 0.0, true, true, false, true, 1, true)
		DeleteEntity(items[i].objeto)
		charging = true
		while true do
			local w = 50
			if not IsEntityPlayingAnim(ped, "anim@heists@narcotics@trash", "walk", 3) then
				TaskPlayAnim(ped, "anim@heists@narcotics@trash", "walk", 8.0, 8.0, -1, 50, 0, false, false, false)
			end
			local ubicacion = GetEntityCoords(PlayerPedId())
			local vehicle = getVehicleInfront(2)
			local d1 = GetModelDimensions(GetEntityModel(vehicle))
			local vehicleCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d1["y"]+0.60,0.0)
			local Distance = GetDistanceBetweenCoords(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, ubicacion.x, ubicacion.y, ubicacion.z, false)
			
			if Distance < 3 then
				w = 3
				DrawText3D(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 'Press ~r~[E]~w~ to put in vehicle')
			end
			
			if IsControlJustReleased(0, 38) then                           
				if idklol() then	
					Citizen.Wait(400)
					DetachEntity(telescopioObj, 1, 0)
					DeleteEntity(telescopioObj)
					telescopioObj = nil
					ClearPedTasksImmediately(ped)		
					TriggerEvent('player:receiveItem', 'stolentelescope', 1)
					charging = false
					break
				end
			end
			Citizen.Wait(w)
		end
	elseif anim == 'pintura' then
		FreezeEntityPosition(ped,true)
		TaskPlayAnim(ped, "mp_common_heist", 'use_terminal_loop', 2.0, 2.0, -1, 1, 0, true, true, true)
		Citizen.Wait(2000)
		ClearPedTasksImmediately(ped)
		Citizen.Wait(250)	
		AnimBolso()
		DeleteEntity(items[i].objeto)
		TriggerEvent('player:receiveItem', 'stolenart', 1)
		return true
	elseif anim == 'normal' then
		FreezeEntityPosition(ped,true)	
		AnimBolso()
		TriggerEvent('np-houserobbery:common_items')
		if delete then
			DeleteEntity(items[i].objeto)
		end
	elseif anim == 'mesa' then
		FreezeEntityPosition(ped,true)
		Citizen.Wait(1000)
		ClearPedTasksImmediately(ped)
		FreezeEntityPosition(ped,false)
		local suerte = math.random(1,10)
		if delete then
			DeleteEntity(items[i].objeto)
		end
	elseif anim == 'laptop' then
		FreezeEntityPosition(ped,true)
		AnimBolso()
		DeleteEntity(items[i].objeto)
		TriggerEvent('player:receiveItem', 'stolenlaptop', 1)
	else
		LoadAnim("anim@heists@box_carry@")
		FreezeEntityPosition(ped,true)
		TaskPlayAnim(ped, "mp_common_heist", 'use_terminal_loop', 2.0, 2.0, -1, 1, 0, true, true, true)
		Citizen.Wait(5000)
		ClearPedTasksImmediately(ped)
		FreezeEntityPosition(ped,false)
		local objeto = CreateObject(GetHashKey(anim), coords.x, coords.y, coords.z,  true,  true, false)
		AttachEntityToEntity(objeto, ped, GetPedBoneIndex(ped, 28422), 0.0, -0.1, -0.08, 0.0, 90.0, 0.0, true, true, false, true, 1, true)
		DeleteEntity(items[i].objeto)
		charging = true
		while true do
			local w = 50
			if not IsEntityPlayingAnim(ped, "anim@heists@box_carry@", "idle", 3) then
				TaskPlayAnim(ped, "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
			end
			local ubicacion = GetEntityCoords(PlayerPedId())
			local vehicle = getVehicleInfront(2)
			local d1 = GetModelDimensions(GetEntityModel(vehicle))
			local vehicleCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0,d1["y"]+0.60,0.0)
			local Distance = GetDistanceBetweenCoords(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, ubicacion.x, ubicacion.y, ubicacion.z, false)
			
			if Distance < 3 then
				w = 3
				DrawText3D(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, 'Press ~r~[E]~w~ to put in vehicle')
			end
			
			if IsControlJustReleased(0, 38) then                           
				if idklol() then	
					Citizen.Wait(400)
					DetachEntity(objeto, 1, 0)
					DeleteEntity(objeto)
					objeto = nil
					ClearPedTasksImmediately(ped)		
					TriggerEvent('player:receiveItem', 'stolenmicrowave', 1)
					charging = false
					break
				end
			end
			Citizen.Wait(w)
		end
	end
end)


function LeaveHouse(despawn)
	within = false
	DoScreenFadeOut(1000)
	Citizen.Wait(1500)
	SetEntityCoords(PlayerPedId(),enterCoords.x, enterCoords.y, enterCoords.z)
	h,m,s = NetworkGetGlobalMultiplayerClock()
	NetworkOverrideClockTime(h,m,s)
	Citizen.Wait(800)
	DoScreenFadeIn(2600)
	if despawn then
		cleanup()
	end
	SendNUIMessage({closeProgress = true})
end

function idklol()
	local vehicle = getVehicleInfront(2)
	local model = GetEntityModel(vehicle)
	if vehicle then
		if not IsThisModelABike(model) then
			SetVehicleDoorOpen(vehicle,2,false,false)
			SetVehicleDoorOpen(vehicle,3,false,false)
			SetVehicleDoorOpen(vehicle,5,false,false)
			SetVehicleDoorOpen(vehicle,6,false,false)
			SetVehicleDoorOpen(vehicle,7,false,false)
			return true
		end
	else
		exports['np-interface']:showInteraction('Cannot Place Inside Of Trunk', 'error')
		Citizen.Wait(2500)
		exports['np-interface']:hideInteraction()
	end
	return false
end

function AnimBolso()
	local playerPed = PlayerPedId()
	LoadAnim('anim@heists@ornate_bank@ig_4_grab_gold')
	local fwd, _, _, pos = GetEntityMatrix(playerPed)
	local newPos = (fwd * 0.8) + pos
	SetEntityCoords(playerPed, newPos.xy, newPos.z - 1.5)
	local rot, pos = GetEntityRotation(playerPed), GetEntityCoords(playerPed)
	SetPedComponentVariation(playerPed, 5, -1, 0, 0)
	local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), pos.x, pos.y, pos.z,  true,  true, false)
	local entrance = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, 2, false, false, 1065353216, 0, 1.3)
	local exit = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, 2, false, false, 1065353216, 0, 1.3)
	SetEntityCollision(bag, 0, 1)
	NetworkAddPedToSynchronisedScene(playerPed, entrance, "anim@heists@ornate_bank@ig_4_grab_gold", "enter", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(bag, entrance, "anim@heists@ornate_bank@ig_4_grab_gold", "enter_bag", 4.0, -8.0, 1)
	NetworkAddPedToSynchronisedScene(playerPed, exit, "anim@heists@ornate_bank@ig_4_grab_gold", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
	NetworkAddEntityToSynchronisedScene(bag, exit, "anim@heists@ornate_bank@ig_4_grab_gold", "exit_bag", 4.0, -8.0, 1)
	NetworkStartSynchronisedScene(entrance)
	Citizen.Wait(1500)
	NetworkStartSynchronisedScene(exit)
	Citizen.Wait(1500)
	DeleteEntity(bag)
	SetPedComponentVariation(playerPed, 5, 45, 0, 0)
	NetworkStopSynchronisedScene(entrance)
	NetworkStopSynchronisedScene(exit)
	FreezeEntityPosition(playerPed, false)
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

function LoadAnim(animDict)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end

function RequestWalking(set)
	RequestAnimSet(set)
	while not HasAnimSetLoaded(set) do
		Citizen.Wait(1)
	end 
end

function ganzuar()
	LoadAnim('veh@break_in@0h@p_m_one@')
	TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
	Citizen.Wait(1500)
	ClearPedTasks(PlayerPedId())
	lock = false
	local s = math.random(1,10)
	if s == 2 then
		print('AYO')
	end
	enter()
end

function getVehicleInfront(max)
	local p = PlayerPedId()
	local p_pos = GetEntityCoords(p)
	local p_fwd = GetEntityForwardVector(p)
	local up = vector3(0.0,0.0,1.0)
	local from = p_pos + (up*2)
	local to   = p_pos - (up*2)
	local ent_hit
	for i=0,(max or 3),1 do
		local ray = StartShapeTestRay(from.x + (p_fwd.x*i),from.y + (p_fwd.y*i),from.z + (p_fwd.z*i),to.x + (p_fwd.x*i),to.y + (p_fwd.y*i),to.z + (p_fwd.z*i),2,ignore, 0);
		_,_,_,_,ent_hit = GetShapeTestResult(ray); 
		if ent_hit and ent_hit ~= 0 and ent_hit ~= -1 then
			local type = GetEntityType(ent_hit)
			if GetEntityType(ent_hit) == 2 then
				return ent_hit
			end
		end
	end
  return false
end

function cleanup()
	lock = true
	stealing = false
	working = false
	within = false
	noise = 0
	if #items > 0 then
		for i = 1, #items do
			DeleteEntity(items[i].objeto)
		end
	end
	if #interior > 0 then
		for i = 1, #interior do
			DeleteEntity(interior[i])
		end
	end
	SendNUIMessage({closeProgress = true})
end

function isnight()
	local hora = GetClockHours()
	if hora > 13 or hora < 12 then
		return true
	end
	return true
end

function bar(percentage)
	SendNUIMessage({runProgress = true, Length = percentage})
end

RegisterNetEvent("np-houserobbery:common_items")
AddEventHandler("np-houserobbery:common_items", function()
	local roll = math.random(2)
	if roll == 1 then
		TriggerEvent("player:receiveItem", "stolennokia", 1)
	elseif roll == 2 then
		TriggerEvent("player:receiveItem", "stoleniphone", 1)
	elseif roll == 3 then
		TriggerEvent("player:receiveItem", "stolengameboy", 1)
	elseif roll == 4 then
		TriggerEvent("player:receiveItem", "stolencasiowatch", 1)
	end
end)