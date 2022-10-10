-- local degHealth = {
-- 	["breaks"] = 0,-- has neg effect
-- 	["axle"] = 0,	-- has neg effect
-- 	["radiator"] = 0, -- has neg effect 
-- 	["clutch"] = 0,	-- has neg effect
-- 	["transmission"] = 0, -- has neg effect
-- 	["electronics"] = 0, -- has neg effect
-- 	["fuel_injector"] = 0, -- has neg effect
-- 	["fuel_tank"] = 0 -- has neg effect
-- }

-- RegisterNetEvent("mech:tools")
-- AddEventHandler("mech:tools", function(material, amount)
--     local shop = exports["isPed"]:isPed("myJob")
--     if exports["np-inventory"]:hasEnoughOfItem(material, amount,false) then
--         TriggerServerEvent("mech:add:materials", material, amount, shop)
--     else
--         TriggerEvent('DoLongHudText', 'You don\'t have the materials', 2)
--     end
-- end)


-- RegisterNetEvent("mech:tools:cl")
-- AddEventHandler("mech:tools:cl", function(materials, amount, deg, plate)
--     local shop = exports["isPed"]:isPed("myJob")
--     TriggerServerEvent("mech:remove:materials", materials, amount, deg, plate, shop)
-- end)

-- RegisterNetEvent("mech:tools:cl2")
-- AddEventHandler("mech:tools:cl2", function(input, input2)
-- 	local isEmployed = exports["np-business"]:IsEmployedAt("harmony_autos")
-- 	if isEmployed then
--         local degname = string.lower(input)
--         local amount = tonumber(input2)
--         local itemname = ""
--         local current = 100

--         if not amount then
--             TriggerEvent('DoLongHudText', 'Error: You need to do re enter a amount!', 2)
--             return
--         end

--         if degname == "body" then
--             TriggerEvent('DoLongHudText', 'This part is not degrading please repair it through the menu!', 2)
--         end

--         if degname == "engine" then
--             TriggerEvent('DoLongHudText', 'This part is not degrading please repair it through the menu!', 2)
--         end

--         if degname == "brakes" then
--             itemname = "rubber"
--             degname = "breaks"
--             current = degHealth["breaks"]
--         end

--         if  degname == "axle" then
--             degname = "axle"
--             itemname = "scrapmetal"
--             current = degHealth["axle"]
--         end

--         if degname == "radiator" then
--             degname = "radiator"
--             itemname = "scrapmetal"
--             current = degHealth["radiator"]
--         end

--         if degname == "clutch" then
--             degname = "clutch"
--             itemname = "scrapmetal"
--             current = degHealth["clutch"]
--         end

--         if degname == "electronics" then
--             degname = "electronics"
--             itemname = "plastic"
--             current = degHealth["electronics"]
--         end

--         if degname == "fuel" then
--             itemname = "steel"
--             degname = "fuel_tank"
--             current = degHealth["fuel_tank"]
--         end

--         if degname == "transmission"then
--             itemname = "aluminium"
--             current = degHealth["transmission"]
--         end

--         if degname == "injector" then
--             itemname = "copper"
--             degname = "fuel_injector"
--             current = degHealth["fuel_injector"]
--         end

--         if amount <= 10 then
--             RequestAnimDict("mp_car_bomb")
--             TaskPlayAnim(PlayerPedId(),"mp_car_bomb","car_bomb_mechanic",8.0, -8, -1, 49, 0, 0, 0, 0)
--             Wait(100)
--             TaskPlayAnim(PlayerPedId(),"mp_car_bomb","car_bomb_mechanic",8.0, -8, -1, 49, 0, 0, 0, 0)
--             FreezeEntityPosition(PlayerPedId(), true)
--             local finished = exports["np-taskbar"]:taskBar(35000,"Repairing")
--             local coordA = GetEntityCoords(PlayerPedId(), 1)
--             local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 5.0, 0.0)
--             local targetVehicle = getVehicleInDirection(coordA, coordB)
--             local plate = GetVehicleNumberPlateText(targetVehicle)
--             if finished == 100 then
--                 FreezeEntityPosition(PlayerPedId(), false)
--                 if targetVehicle ~= 0 then
--                     if itemname ~= "" then
--                         TriggerServerEvent('scrap:towTake', degname, itemname, plate, amount, amount)
--                     else
--                         TriggerEvent('DoLongHudText', 'Vehicle Part does not exist!', 2)
--                     end
--                 else
--                     TriggerEvent('DoLongHudText', 'No Vehicle!', 2)
--                 end
--             else
--                 FreezeEntityPosition(PlayerPedId(), false)
--             end
--         else
--             TriggerEvent('DoLongHudText', 'You cant repair anything higher then 10!', 2)
--         end
       
--     end
-- end)

exports("getVehicleInDirection", function(coordA, coordB)
    return getVehicleInDirection(coordA, coordB)
end)

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

-- RegisterNetEvent('towgarage:repairamount')
-- AddEventHandler('towgarage:repairamount', function(data)
-- 	local playerped = PlayerPedId()
-- 	local coordA = GetEntityCoords(playerped, 1)
-- 	local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
-- 	local targetVehicle = getVehicleInDirection(coordA, coordB)
-- 	local plate = GetVehicleNumberPlateText(targetVehicle)
-- 	local isEmployed = exports["np-business"]:IsEmployedAt("harmony_autos")
-- 	if isEmployed then
-- 	local part = data.part
-- 	if #(vector3(841.25274658203,-974.61096191406,26.482788085938) - GetEntityCoords(PlayerPedId())) < 35 then
-- 			local keyboard = exports["np-applications"]:KeyboardInput({
-- 				header = "Repair: ".. part,
-- 				rows = {
-- 				{
-- 					id = 0, 
-- 					txt = "Amount"
-- 				}
-- 			}
-- 		})
		
-- 		if keyboard ~= nil then
-- 			if keyboard[1].input == nil then return end
-- 				TriggerEvent('mech:tools:cl2', part, keyboard[1].input)
-- 			end
-- 		end
-- 	elseif #(vector3(1181.299, 2639.505, 37.75387) - GetEntityCoords(PlayerPedId())) < 160 then
-- 		local isEmployed = exports["np-business"]:IsEmployedAt("harmony_autos")
-- 		if isEmployed then
-- 			local keyboard = exports["np-applications"]:KeyboardInput({
-- 				header = "Repair: ".. part,
-- 				rows = {
-- 				{
-- 					id = 0, 
-- 					txt = "Amount"
-- 				}
-- 			}
-- 		})
		
-- 		if keyboard ~= nil then
-- 			if keyboard[1].input == nil then return end
-- 				TriggerEvent('mech:tools:cl2', part, keyboard[1].input)
-- 			end
-- 		end
-- 	end
-- end)

-- RegisterNetEvent('np-towjob:StoreMaterialsMain')
-- AddEventHandler('np-towjob:StoreMaterialsMain', function()
-- 	if #(vector3(841.25274658203,-974.61096191406,26.482788085938) - GetEntityCoords(PlayerPedId())) < 35 or #(vector3(1179.3099365234, 2635.9252929688, 184.25196838379) - GetEntityCoords(PlayerPedId())) < 160 then
--         local job = exports["isPed"]:GroupRank('ak_customs')
-- 		if job >= 1 then
-- 			local keyboard = exports["np-applications"]:KeyboardInput({
-- 				header = "Store Materials",
-- 				rows = {
-- 				{
-- 					id = 0, 
-- 					txt = "Material Name"
-- 				},
--                 {
-- 					id = 1, 
-- 					txt = "Amount"
-- 				}
-- 			}
-- 		})
--         if keyboard ~= nil then
-- 			if keyboard[1].input == nil then return end
-- 				TriggerEvent('mech:tools', keyboard[1].input, keyboard[2].input)
-- 			end
-- 		end
-- 	end
-- end)

-- RegisterNetEvent("mech:check:internal:storage")
-- AddEventHandler("mech:check:internal:storage", function()
--     local job = exports["isPed"]:GroupRank('ak_customs')
--     if job >= 1 then
--         TriggerServerEvent("mech:check:materials", 'ak_customs')
--     else
--         TriggerEvent('DoLongHudText', 'You are not a ak customs worker!', 2)
--     end
-- end)

-- function GetPlayers()
--     local players = {}

--     for i = 0, 255 do
--         if NetworkIsPlayerActive(i) then
--             players[#players+1]= i
--         end
--     end

--     return players
-- end

exports("NearVehicle", function(pType)
    if pType == "Distance" then
        local coords = GetEntityCoords(PlayerPedId())
        if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
            return true
        else
            return false
        end
    elseif pType == "plate" then
        local coords = GetEntityCoords(PlayerPedId())
        if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
            return GetVehicleNumberPlateText(vehicle)
        else
            return false
        end
    elseif pType == "Fuel" then
        local coords = GetEntityCoords(PlayerPedId())
        if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
            return  GetVehicleFuelLevel(vehicle)
        else
            return false
        end
    end
end)



RegisterCommand("transfer", function(source, args)
    TriggerEvent("transfer:attempt")
end)

RegisterNetEvent("transfer:attempt")
AddEventHandler("transfer:attempt", function()
    local coords = GetEntityCoords(PlayerPedId())
    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
        if DoesEntityExist(vehicle) then
            t, distance = GetClosestPlayer()
	        if(distance ~= -1 and distance < 2) then
                local plate = GetVehicleNumberPlateText(vehicle)
                TriggerServerEvent("transfer:attempt:send", plate, GetPlayerServerId(t))
            else
                TriggerEvent("DoLongHudText", "You are not near anyone to transfer the vehicle too", 2)
            end
        end
    end
end)

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local closestPed = -1
	local ply = PlayerPedId()
	local plyCoords = GetEntityCoords(ply, 0)
	if not IsPedInAnyVehicle(PlayerPedId(), false) then

		for index,value in ipairs(players) do
			local target = GetPlayerPed(value)
			if(target ~= ply) then
				local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
				local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
				if(closestDistance == -1 or closestDistance > distance) and not IsPedInAnyVehicle(target, false) then
					closestPlayer = value
					closestPed = target
					closestDistance = distance
				end
			end
		end
		
		return closestPlayer, closestDistance, closestPed

	else
		-- TriggerEvent("DoShortHudText","Inside Vehicle.",2)
	end

end

local wearingSeatbelt = false
local wearingHarness = false
local currentVehicle = 0
local isInsideVehicle = 0

CreateThread(function()
  while true do
    Citizen.Wait(0)
    if currentVehicle ~= 0 then
      if wearingHarness then
        DisableControlAction(0, 75, true)
        if IsDisabledControlJustPressed(1, 75) then
          TriggerEvent('DoLongHudText', 'You probably should undo your harness...', 101)
        end
      else
        Citizen.Wait(1000)
      end
    else
      Citizen.Wait(5000)
    end
  end
end)

local function isDriver()
  return GetPedInVehicleSeat(currentVehicle, -1) == PlayerPedId()
end

function toggleSeatbelt()
  currentVehicle = GetVehiclePedIsIn(PlayerPedId())
  isInsideVehicle = currentVehicle ~= 0

  if isInsideVehicle then
    local harnessLevel = exports['np-vehicles']:GetVehicleMetadata(currentVehicle, 'harness') or 0
    local hasHarness = harnessLevel > 0
    if wearingSeatbelt and not wearingHarness then -- Wearing seatbelt but no harness, taking off
      TriggerEvent('InteractSound_CL:PlayOnOne', 'seatbeltoff', 0.7)
      wearingSeatbelt = true
      SetFlyThroughWindscreenParams(10.0, 1.0, 1.0, 1.0)
    elseif wearingSeatbelt and wearingHarness and isDriver() then -- Wearing seatbelt/harness, taking off
      toggleHarness(false)
    elseif not wearingSeatbelt and not wearingSeatbelt and isDriver() and hasHarness then -- Not wearing anything and have harness
      toggleHarness(true)
    elseif not wearingSeatbelt and not wearingHarness then
      TriggerEvent('InteractSound_CL:PlayOnOne', 'seatbelt', 0.7) -- Not wearing anything and have no harness
      wearingSeatbelt = true
      SetFlyThroughWindscreenParams(45.0, 1.0, 1.0, 1.0)
    end
    TriggerEvent('harness', wearingHarness, exports['np-vehicles']:GetVehicleMetadata(currentVehicle, 'harness'))
    TriggerEvent('seatbelt', wearingSeatbelt)
  end
end

function toggleHarness(pState)
  local defaultSteering = GetVehicleHandlingFloat(currentVehicle, 'CHandlingData', 'fSteeringLock')
  local harnessTimer = exports['np-taskbar']:taskBar(5000, (pState and 'Putting on Harness' or 'Taking off Harness'), true)
  if harnessTimer == 100 then
    wearingHarness = pState
    wearingSeatbelt = pState
    TriggerEvent('InteractSound_CL:PlayOnOne', (pState and 'seatbelt' or 'seatbeltoff'), 0.7)
  end
end

AddEventHandler('baseevents:enteredVehicle', function(pCurrentVehicle, currentSeat, vehicleDisplayName)
  currentVehicle = pCurrentVehicle
end)

AddEventHandler('baseevents:leftVehicle', function(pCurrentVehicle, pCurrentSeat, vehicleDisplayName)
  wearingHarness = false
  wearingSeatbelt = false
  currentVehicle = 0
  TriggerEvent('harness', false, 0);
  TriggerEvent('seatbelt', false);
end)

local trackedVehicles = {}
local paused = false
local changingVar = ""

local checkPlayerOwnedVehicles = false

RegisterNetEvent('veh.checkOwner')
AddEventHandler('veh.checkOwner', function(status)
  checkPlayerOwnedVehicles = status
end)

RegisterNetEvent('veh.updateVehicleDegredation')
AddEventHandler('veh.updateVehicleDegredation', function(br,ax,rad,cl,tra,elec,fi,ft)
	local tempReturn = {}
	for k, v in pairs(trackedVehicles) do
		if not IsEntityDead(k) then
			tempReturn[#tempReturn+1] = v
		else
			trackedVehicles[k] = nil
		end
		if #tempReturn > 0 then
			TriggerServerEvent('veh.updateVehicleDegredationServer', v[1],br,ax,rad,cl,tra,elec,fi,ft)
		end		
	end
end)


RegisterNetEvent('veh.randomDegredation')
AddEventHandler('veh.randomDegredation', function(upperLimit,vehicle,spinAmount)
	degHealth = getDegredationArray()
	local plate = GetVehicleNumberPlateText(vehicle)
    if checkPlayerOwnedVehicles then
        local br = degHealth.breaks
        local ax = degHealth.axle
        local rad = degHealth.radiator
        local cl = degHealth.clutch
        local tra = degHealth.transmission
        local elec = degHealth.electronics
        local fi = degHealth.fuel_injector 
        local ft = degHealth.fuel_tank
        for i=1,spinAmount do
            local chance =  math.random(0,150)
             if chance <= 10 and chance >= 0 then
                  br = br - math.random(0,upperLimit)
            elseif chance <= 20 and chance >= 11 then
                 ax = ax - math.random(0,upperLimit)
            elseif chance <= 30 and chance >= 21 then
                 rad = rad - math.random(0,upperLimit)
            elseif chance <= 40 and chance >= 31 then
                 cl = cl - math.random(0,upperLimit)
            elseif chance <= 50 and chance >= 41 then
                 tra = tra - math.random(0,upperLimit)
            elseif chance <= 60 and chance >= 51 then
                 elec = elec - math.random(0,upperLimit)
            elseif chance <= 70 and chance >= 61 then
                 fi = fi - math.random(0,upperLimit)
            elseif chance <= 80 and chance >= 71 then
                 ft = ft - math.random(0,upperLimit)
            end
        end

        if br < 0 then 
            br = 0 
        end
        if ax < 0 then ax = 0 end
        if rad < 0 then rad = 0 end
        if cl < 0 then cl = 0 end
        if tra < 0 then tra = 0 end
        if elec < 0 then elec = 0 end
        if fi < 0 then fi = 0 end
        if ft < 0 then ft = 0 end
        TriggerServerEvent('veh.updateVehicleDegredationServer',plate,br,ax,rad,cl,tra,elec,fi,ft)
        TriggerServerEvent('veh.callDegredation', plate)
	end
end)

RegisterNetEvent('veh.updateVehicleBounce')
AddEventHandler('veh.updateVehicleBounce', function(br,ax,rad,cl,tra,elec,fi,ft,plate)
	if br == 0 then br = nil end
	TriggerServerEvent('veh.updateVehicleDegredationServer',plate,br,ax,rad,cl,tra,elec,fi,ft)
end)

RegisterNetEvent('veh.getSQL')
AddEventHandler('veh.getSQL', function(degredation)
	changingVar = degredation
end)

RegisterNetEvent('veh:requestUpdate')
AddEventHandler('veh:requestUpdate', function()
	local playerped = GetPlayerPed(-1)   
	local coordA = GetEntityCoords(playerped, 1)
	local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
	local targetVehicle = getVehicleInDirection(coordA, coordB)
    local plate = GetVehicleNumberPlateText(targetVehicle)
	TriggerServerEvent('veh.examine',plate,targetVehicle)
end)

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




function getDegredationArray()
		local temp = changingVar:split(",")
		if(temp[1] ~= nil) then	
			local degHealth = {
			["breaks"] = 0,-- has neg effect
			["axle"] = 0,	-- has neg effect
			["radiator"] = 0, -- has neg effect
			["clutch"] = 0,	-- has neg effect
			["transmission"] = 0, -- has neg effect
			["electronics"] = 0, -- has neg effect
			["fuel_injector"] = 0, -- has neg effect
			["fuel_tank"] = 0 
			}

			for i,v in ipairs(temp) do
					if i == 1 then
						degHealth.breaks = tonumber(v)
						if degHealth.breaks == nil then
							degHealth.breaks = 0
						end
					elseif i == 2 then
						degHealth.axle = tonumber(v)
					elseif i == 3 then
						degHealth.radiator = tonumber(v)
					elseif i == 4 then
						degHealth.clutch = tonumber(v)
					elseif i == 5 then
						degHealth.transmission = tonumber(v)
					elseif i == 6 then
						degHealth.electronics = tonumber(v)
					elseif i == 7 then
						degHealth.fuel_injector = tonumber(v)
					elseif i == 8 then	
						degHealth.fuel_tank = tonumber(v)
					end
			end
		return degHealth
	end
end


RegisterNetEvent('veh.getVehicleDegredation')
AddEventHandler('veh.getVehicleDegredation', function(currentVehicle,tick)
		degHealth = getDegredationArray()
		if IsPedInVehicle(PlayerPedId(),currentVehicle,false) then
			if checkPlayerOwnedVehicles then
				if GetVehicleClass(currentVehicle) ~= 13 and GetVehicleClass(currentVehicle) ~= 21 and GetVehicleClass(currentVehicle) ~= 16 and GetVehicleClass(currentVehicle) ~= 15 and GetVehicleClass(currentVehicle) ~= 14 then
					if degHealth.fuel_injector <= 45 then
						local decayChance = math.random(10,100)
						if degHealth.fuel_injector <= 45 and degHealth.fuel_injector >= 25 then	
							if decayChance > 99 then
								fuelInjector(currentVehicle,50)
							end
						elseif degHealth.fuel_injector <= 24 and degHealth.fuel_injector >= 15 then	
							if decayChance > 98 then
								fuelInjector(currentVehicle,400)

							end
						elseif degHealth.fuel_injector <= 14 and degHealth.fuel_injector >= 9 then	
							if decayChance > 97 then
								fuelInjector(currentVehicle,600)

							end
						elseif  degHealth.fuel_injector <= 8 and degHealth.fuel_injector >= 0 then	
							if decayChance > 90 then
								fuelInjector(currentVehicle,1000)

							end
						end
					end

					if degHealth.radiator <= 35 and tick >= 15 then
						local engineHealth = GetVehicleEngineHealth(currentVehicle)
						if degHealth.radiator <= 35 and degHealth.radiator >= 20 then
							if engineHealth <= 1000 and engineHealth >= 700 then
								SetVehicleEngineHealth(currentVehicle, engineHealth-10)
							end
						elseif degHealth.radiator <= 19 and degHealth.radiator >= 10 then
							if engineHealth <= 1000 and engineHealth >= 500 then
								SetVehicleEngineHealth(currentVehicle, engineHealth-20)
							end
						elseif degHealth.radiator <= 9 and degHealth.radiator >= 0 then
							if engineHealth <= 1000 and engineHealth >= 200 then
								SetVehicleEngineHealth(currentVehicle, engineHealth-30)
							end
						end
					end

					if degHealth.axle <= 35 and tick >= 15 then
						local Chance = math.random(1,100)
						if degHealth.axle <= 35 and degHealth.axle >= 20 and Chance > 90 then
							for i=0,360 do					
								SetVehicleSteeringScale(currentVehicle,i)
								Citizen.Wait(5)
							end
						elseif degHealth.axle <= 19 and degHealth.axle >= 10 and Chance > 70 then
							for i=0,360 do	
								Citizen.Wait(10)
								SetVehicleSteeringScale(currentVehicle,i)
							end
						elseif degHealth.axle <= 9 and degHealth.axle >= 0 and Chance > 50 then
							for i=0,360 do
								Citizen.Wait(15)
								SetVehicleSteeringScale(currentVehicle,i)
							end
						end
					end

					if degHealth.transmission <= 35 and tick >= 15 then
						local speed = GetEntitySpeed(currentVehicle)
						local Chance = math.random(1,100)
						if degHealth.transmission <= 35 and degHealth.transmission >= 20 and Chance > 90 then
							for i=0,3 do
								if not IsPedInVehicle(PlayerPedId(),currentVehicle,false) then
									return
								end
								Citizen.Wait(5)
								SetVehicleHandbrake(currentVehicle,true)
								Citizen.Wait(math.random(1000))
								SetVehicleHandbrake(currentVehicle,false)
							end
						elseif degHealth.transmission <= 19 and degHealth.transmission >= 10 and Chance > 70 then
							for i=0,5 do
								if not IsPedInVehicle(PlayerPedId(),currentVehicle,false) then
									return
								end							
								Citizen.Wait(10)
								SetVehicleHandbrake(currentVehicle,true)
								Citizen.Wait(math.random(1000))
								SetVehicleHandbrake(currentVehicle,false)
							end
						elseif degHealth.transmission <= 9 and degHealth.transmission >= 0 and Chance > 50 then
							for i=0,11 do
								if not IsPedInVehicle(PlayerPedId(),currentVehicle,false) then
									return
								end							
								Citizen.Wait(20)
								SetVehicleHandbrake(currentVehicle,true)
								Citizen.Wait(math.random(1000))
								SetVehicleHandbrake(currentVehicle,false)
							end
						end
					end

					if degHealth.electronics <= 35 and tick >= 15 then
						local Chance = math.random(1,100)
						if degHealth.electronics <= 35 and degHealth.electronics >= 20 and Chance > 90 then
							for i=0,10 do
								Citizen.Wait(50)
								electronics(currentVehicle)
							end
						elseif degHealth.electronics <= 19 and degHealth.electronics >= 10 and Chance > 70 then
							for i=0,10 do
								Citizen.Wait(100)
								electronics(currentVehicle)
							end
						elseif degHealth.electronics <= 9 and degHealth.electronics >= 0 and Chance > 50 then
							for i=0,10 do
								Citizen.Wait(200)
								electronics(currentVehicle)
							end
						end
					end

					if degHealth.breaks <= 35 and tick >= 15 then
						local Chance = math.random(1,100)
						if degHealth.breaks <= 35 and degHealth.breaks >= 20 and Chance > 90 then
								SetVehicleHandbrake(currentVehicle,true)
								Citizen.Wait(1000)
								SetVehicleHandbrake(currentVehicle,false)
						elseif degHealth.breaks <= 19 and degHealth.breaks >= 10 and Chance > 70 then
								SetVehicleHandbrake(currentVehicle,true)
								Citizen.Wait(4500)
								SetVehicleHandbrake(currentVehicle,false)
						elseif degHealth.breaks <= 9 and degHealth.breaks >= 0 and Chance > 50 then
								SetVehicleHandbrake(currentVehicle,true)
								Citizen.Wait(7000)
								SetVehicleHandbrake(currentVehicle,false)
						end
					else
						SetVehicleHandbrake(currentVehicle,false)
					end

					if degHealth.clutch <= 35 and tick >= 15 then
						local Chance = math.random(1,100)
						if degHealth.clutch <= 35 and degHealth.clutch >= 20 and Chance > 90 then
								SetVehicleHandbrake(currentVehicle,true)
								fuelInjector(currentVehicle,50)
								for i=1,360 do
									SetVehicleSteeringScale(currentVehicle,i)
									Citizen.Wait(5)
								end
								Citizen.Wait(2000)
								SetVehicleHandbrake(currentVehicle,false)
						elseif degHealth.clutch <= 19 and degHealth.clutch >= 10 and Chance > 70 then
								SetVehicleHandbrake(currentVehicle,true)
								fuelInjector(currentVehicle,100)
								for i=1,360 do
									SetVehicleSteeringScale(currentVehicle,i)
									Citizen.Wait(5)
								end
								Citizen.Wait(5000)
								SetVehicleHandbrake(currentVehicle,false)
						elseif degHealth.clutch <= 9 and degHealth.clutch >= 0 and Chance > 50 then
								SetVehicleHandbrake(currentVehicle,true)
								fuelInjector(currentVehicle,200)
								for i=1,360 do
									SetVehicleSteeringScale(currentVehicle,i)
									Citizen.Wait(5)
								end
								Citizen.Wait(7000)
								SetVehicleHandbrake(currentVehicle,false)
						end
					end

					if degHealth.fuel_tank <= 35 and tick >= 15 then
						if degHealth.clutch <= 35 and degHealth.clutch >= 20 then
							TriggerEvent("carHud:FuelMulti",20)
						elseif degHealth.clutch <= 19 and degHealth.clutch >= 10 then
							TriggerEvent("carHud:FuelMulti",10)
						elseif degHealth.clutch <= 9 and degHealth.clutch >= 0 then
							TriggerEvent("carHud:FuelMulti",20)
						end
					else
						TriggerEvent("carHud:FuelMulti",1)
					end	
				end			
			end
		end
		-- add in actions for vechile when health is low 
end)
function fuelInjector(currentVehicle,wait)
	SetVehicleEngineOn(currentVehicle,0,0,1)
	SetVehicleUndriveable(currentVehicle,true)
	Citizen.Wait(wait)
	SetVehicleEngineOn(currentVehicle,1,0,1)
	SetVehicleUndriveable(currentVehicle,false)
end

function electronics(currentVehicle)
	SetVehicleLights(currentVehicle,1)
	Citizen.Wait(600)
	SetVehicleLights(currentVehicle,0)
end

function trackVehicleHealth()
	local tempReturn = {}
	for k, v in pairs(trackedVehicles) do
		if not IsEntityDead(k) then
			v[2] = math.ceil(GetVehicleEngineHealth(k))
			v[3] = math.ceil(GetVehicleBodyHealth(k))
			v[4] = DecorGetInt(k, "CurrentFuel")
			if v[4] == nil then
				v[4] = 50
			end
			tempReturn[#tempReturn+1] = v
		else
			trackedVehicles[k] = nil
		end
	end
	if #tempReturn > 0 then
		TriggerServerEvent('veh.updateVehicleHealth', tempReturn)
	end
end

RegisterNetEvent('veh.setVehicleHealth')
AddEventHandler('veh.setVehicleHealth', function(eh, bh, Fuel, veh)
	Citizen.CreateThread(function()
		setPlayerOwnedVehicle()
		paused = true
		smash = false
		damageOutside = false
		damageOutside2 = false 
		local engine = eh + 0.0
		local body = bh + 0.0

		if engine < 200.0 then
			engine = 200.0
		end

		if body < 900.0 then
			body = 900.0
		end
		if body < 950.0 then
			smash = true
		end

		if body < 920.0 then
			damageOutside = true
		end

		local currentVehicle = (veh and IsEntityAVehicle(veh)) and veh or GetVehiclePedIsIn(PlayerPedId(), false)

		SetVehicleEngineHealth(currentVehicle, engine)


		if smash then
			SmashVehicleWindow(currentVehicle, 0)
			SmashVehicleWindow(currentVehicle, 1)
			SmashVehicleWindow(currentVehicle, 2)
			SmashVehicleWindow(currentVehicle, 3)
			SmashVehicleWindow(currentVehicle, 4)
		end

		if damageOutside then
			SetVehicleDoorBroken(currentVehicle, 1, true)
			SetVehicleDoorBroken(currentVehicle, 6, true)
			SetVehicleDoorBroken(currentVehicle, 4, true)
		end


		SetVehicleBodyHealth(currentVehicle, body)

		DecorSetInt(currentVehicle, "CurrentFuel", Fuel)

		paused = false
	end)
end)


function string:split(delimiter)
  local result = { }
  local from  = 1
  local delim_from, delim_to = string.find( self, delimiter, from  )
  while delim_from do
    table.insert( result, string.sub( self, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( self, delimiter, from  )
  end
  table.insert( result, string.sub( self, from  ) )
  return result
end

enteredveh = false

RegisterNetEvent('deg:EnteredVehicle')
AddEventHandler('deg:EnteredVehicle', function()
	enteredveh = true
end)

local calledplate = nil
Citizen.CreateThread(function()
	Citizen.Wait(1000)
	local tick = 0
	local rTick = 0
	local vehicleNewBodyHealth = 0
	local vehicleNewEngineHealth = 0
	local exitveh = true
	local lastvehicle = 0
	while true do
		Citizen.Wait(1000)
        local playerPed = PlayerPedId()
        local currentVehicle = GetVehiclePedIsIn(playerPed, false)
		if IsPedInVehicle(PlayerPedId(),currentVehicle, false) then
			tick = tick + 1
			rTick = rTick + 1

			local driverPed = GetPedInVehicleSeat(currentVehicle, -1)
            if playerPed == driverPed then
                if calledplate ~= GetVehicleNumberPlateText(currentVehicle) then
                    TriggerServerEvent("enteredMyVehicle", GetVehicleNumberPlateText(currentVehicle))
                    TriggerServerEvent('veh.callDegredation', GetVehicleNumberPlateText(currentVehicle)) 
                    calledplate = GetVehicleNumberPlateText(currentVehicle) 
                else
                    TriggerServerEvent('veh.callDegredation', GetVehicleNumberPlateText(currentVehicle)) 
                end
				local plate = GetVehicleNumberPlateText(currentVehicle)
				local engineHealth = math.ceil(GetVehicleEngineHealth(currentVehicle))
				local bodyHealth = math.ceil(GetVehicleBodyHealth(currentVehicle))
				if checkPlayerOwnedVehicles then
					trackedVehicles[currentVehicle] = {plate, engineHealth, bodyHealth}
				end
			end

            if enteredveh and checkPlayerOwnedVehicles then
				currentVehicle = GetVehiclePedIsIn(playerPed, false)
				lastvehicle = currentVehicle
				enteredveh = false
				exitveh = false
				tick = 13
				rTick = 55
			end

			if tick >= 15 then
				TriggerEvent('veh.getVehicleDegredation',currentVehicle,tick)
                trackVehicleHealth()
         
				tick = 0
			end

			if rTick >= 60 then
                TriggerEvent('veh.randomDegredation',1,currentVehicle,3)
				rTick = 0
			end

		else
			if not exitveh then	
                TriggerEvent('veh.getVehicleDegredation',lastvehicle,15)
				tick = 0
				rTick = 0
				lastvehicle = 0
				currentVehicle = 0
				exitveh = true
			end
		end
	end
end)


RegisterNetEvent('veh.isPlayers')
AddEventHandler('veh.isPlayers', function(veh,cb)
	if checkPlayerOwnedVehicles then
		cb(true)
	else
		cb(false)
	end	
end)


RegisterNetEvent('veh.getDegredation')
AddEventHandler('veh.getDegredation', function(veh,cb)
	deghealth = getDegredationArray()
	local plate = GetVehicleNumberPlateText(veh)
	if checkPlayerOwnedVehicles then
        TriggerServerEvent('veh.callDegredation', plate)
        cb(deghealth)
	end
	if not checkPlayerOwnedVehicles  then
		TriggerServerEvent('veh.callDegredation', plate)
	end
	Citizen.Wait(100)
end)
local engineHealth = 0
local bodyHealth = 0

RegisterNetEvent('towgarage:triggermenu')
AddEventHandler('towgarage:triggermenu', function(degradation,eHealth,bHealth)
	local degHealth = {
		["breaks"] = 0,-- has neg effect
		["axle"] = 0,	-- has neg effect
		["radiator"] = 0, -- has neg effect
		["clutch"] = 0,	-- has neg effect
		["transmission"] = 0, -- has neg effect
		["electronics"] = 0, -- has neg effect
		["fuel_injector"] = 0, -- has neg effect
		["fuel_tank"] = 0 
	}
	local engineHealth = eHealth
	local bodyHealth = bHealth
	local temp = degradation:split(",")
	if(temp[1] ~= nil) then	
		for i,v in ipairs(temp) do
			if i == 1 then
				degHealth.breaks = tonumber(v)
				if degHealth.breaks == nil then
					degHealth.breaks = 0
				end
			elseif i == 2 then
				degHealth.axle = tonumber(v)
			elseif i == 3 then
				degHealth.radiator = tonumber(v)
			elseif i == 4 then
				degHealth.clutch = tonumber(v)
			elseif i == 5 then
				degHealth.transmission = tonumber(v)
			elseif i == 6 then
				degHealth.electronics = tonumber(v)
			elseif i == 7 then
				degHealth.fuel_injector = tonumber(v)
			elseif i == 8 then	
				degHealth.fuel_tank = tonumber(v)
			end
		end
	end

	local playerped = PlayerPedId()
	local coordA = GetEntityCoords(playerped, 1)
	local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
	local targetVehicle = getVehicleInDirection(coordA, coordB)


	if targetVehicle ~= nil  and targetVehicle ~= 0 then
		engineHealth = GetVehicleEngineHealth(targetVehicle) 
		bodyHealth = GetVehicleBodyHealth(targetVehicle)
		currentVeh = targetVehicle
		local strng = "\n Brakes (Rubber) - " .. round(degHealth["breaks"] / 10,2) .. "/10.0" .. " \n Axle (Scrap) - " .. round(degHealth["axle"] / 10,2) .. "/10.0" .. " \n Radiator (Scrap) - " .. round(degHealth["radiator"] / 10,2) .. "/10.0" .. " \n Clutch (Scrap) - " .. round(degHealth["clutch"] / 10,2) .. "/10.0" .. " \n Transmission (Aluminium) - " .. round(degHealth["transmission"] / 10,2) .. "/10.0" .. " \n Electronics (Plastic) - " .. round(degHealth["electronics"] / 10,2) .. "/10.0" .. " \n Injector (Copper) - " .. round(degHealth["fuel_injector"] / 10,2) .. "/10.0" .. " \n Fuel (Steel) - " .. round(degHealth["fuel_tank"] / 10,2) .. "/10.0" .. " \n Body (Glass) - " .. round((bodyHealth / 10) / 10,2) .. "/10.0" .. " \n Engine (Scrap) - " .. round((engineHealth / 10) / 10,2) .. "/10.0"
		TriggerEvent("customNotification", strng)
	end
end)

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end