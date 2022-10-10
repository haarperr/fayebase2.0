--- Gun Shots ---

RegisterNetEvent('np-dispatch:gunShot')
AddEventHandler('np-dispatch:gunShot', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then
		local alpha = 250
		local gunshotBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipScale(gunshotBlip, 1.3)
		SetBlipSprite(gunshotBlip,  110)
		SetBlipColour(gunshotBlip,  4)
		SetBlipAlpha(gunshotBlip, alpha)
		SetBlipAsShortRange(gunshotBlip, true)
		BeginTextCommandSetBlipName("STRING")              -- set the blip's legend caption
		AddTextComponentString('10-71 Shots Fired')              -- to 'supermarket'
		EndTextCommandSetBlipName(gunshotBlip)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(gunshotBlip, alpha)

			if alpha == 0 then
				RemoveBlip(gunshotBlip)
				return
			end
		end
	end
end)

AddEventHandler('np-dispatch:gunshotcl', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:shoot', {x = pos.x, y = pos.y, z = pos.z})
end)

-- ---- Fight ----

-- RegisterNetEvent('vrp-outlawalert:combatInProgress')
-- AddEventHandler('vrp-outlawalert:combatInProgress', function(targetCoords)
-- 	if PlayerData.job.name == 'police' then	
-- 		if Config.gunAlert then
-- 			local alpha = 250
-- 			local knife = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

-- 			SetBlipScale(knife, 1.3)
-- 			SetBlipSprite(knife,  437)
-- 			SetBlipColour(knife,  1)
-- 			SetBlipAlpha(knife, alpha)
-- 			SetBlipAsShortRange(knife, true)
-- 			BeginTextCommandSetBlipName("STRING")              -- set the blip's legend caption
-- 			AddTextComponentString('10-11 Fight In Progress')              -- to 'supermarket'
-- 			EndTextCommandSetBlipName(knife)
-- 			SetBlipAsShortRange(knife,  1)
-- 			PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

-- 			while alpha ~= 0 do
-- 				Citizen.Wait(Config.BlipGunTime * 4)
-- 				alpha = alpha - 1
-- 				SetBlipAlpha(knife, alpha)

-- 				if alpha == 0 then
-- 					RemoveBlip(knife)
-- 					return
-- 				end
-- 			end

-- 		end
-- 	end
-- end)

-- AddEventHandler('np-dispatch:fight', function()
-- 	local pos = GetEntityCoords(PlayerPedId(), true)
-- 	TriggerServerEvent('np-dispatch:figher', {x = pos.x, y = pos.y, z = pos.z})
-- end)

-- ---- 10-13s Officer Down ----

RegisterNetEvent('np-dispatch:policealertA')
AddEventHandler('np-dispatch:policealertA', function(targetCoords)
  if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 250
		local policedown = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(policedown,  489)
		SetBlipColour(policedown,  18)
		SetBlipScale(policedown, 1.5)
		SetBlipAsShortRange(policedown,  true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-13A Officer Down')
		EndTextCommandSetBlipName(policedown)
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'polalert', 0.4)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(policedown, alpha)

		if alpha == 0 then
			RemoveBlip(policedown)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:1013A', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:teenA', {x = pos.x, y = pos.y, z = pos.z})
end)

RegisterNetEvent('np-dispatch:policealertB')
AddEventHandler('np-dispatch:policealertB', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 250
		local policedown2 = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(policedown2,  489)
		SetBlipColour(policedown2,  18)
		SetBlipScale(policedown2, 1.5)
		SetBlipAsShortRange(policedown2,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-13B Officer Down')
		EndTextCommandSetBlipName(policedown2)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(policedown2, alpha)

		if alpha == 0 then
			RemoveBlip(policedown2)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:1013B', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:teenB', {x = pos.x, y = pos.y, z = pos.z})
end)


RegisterNetEvent('np-dispatch:panic')
AddEventHandler('np-dispatch:panic', function(targetCoords)
if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 250
		local panic = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(panic,  126)
		SetBlipColour(panic,  1)
		SetBlipScale(panic, 1.3)
		SetBlipAsShortRange(panic,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-78 Officer Panic Botton')
		EndTextCommandSetBlipName(panic)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'polalert', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(panic, alpha)

		if alpha == 0 then
			RemoveBlip(panic)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:policepanic', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:teenpanic', {x = pos.x, y = pos.y, z = pos.z})
end)


RegisterNetEvent('np-dispatch:epanic')
AddEventHandler('np-dispatch:epanic', function(targetCoords)
if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 250
		local panic = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(panic,  126)
		SetBlipColour(panic,  1)
		SetBlipScale(panic, 1.3)
		SetBlipAsShortRange(panic,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-78 EMS Panic Botton')
		EndTextCommandSetBlipName(panic)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'polalert', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(panic, alpha)

		if alpha == 0 then
			RemoveBlip(panic)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:emspanic', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:empanic', {x = pos.x, y = pos.y, z = pos.z})
end)



RegisterNetEvent('np-dispatch:gexplosion')
AddEventHandler('np-dispatch:gexplosion', function(targetCoords)
if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 250
		local explosion = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(explosion,  361)
		SetBlipColour(explosion,  59)
		SetBlipScale(explosion, 1.3)
		SetBlipAsShortRange(explosion,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Gas Station Explosion')
		EndTextCommandSetBlipName(explosion)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(explosion, alpha)

		if alpha == 0 then
			RemoveBlip(explosion)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:gasexplosion', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:gaexplosion', {x = pos.x, y = pos.y, z = pos.z})
end)



-- ---- 10-14 EMS ----

RegisterNetEvent('np-dispatch:tenForteenA')
AddEventHandler('np-dispatch:tenForteenA', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 250
		local medicDown = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(medicDown,  489)
		SetBlipColour(medicDown,  48)
		SetBlipScale(medicDown, 1.3)
		SetBlipAsShortRange(medicDown,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-14A Medic Down')
		EndTextCommandSetBlipName(medicDown)
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'polalert', 0.4)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(medicDown, alpha)

		if alpha == 0 then
			RemoveBlip(medicDown)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:1014A', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:fourA', {x = pos.x, y = pos.y, z = pos.z})
end)


RegisterNetEvent('np-dispatch:tenForteenB')
AddEventHandler('np-dispatch:tenForteenB', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 250
		local medicDown2 = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(medicDown2,  489)
		SetBlipColour(medicDown2,  48)
		SetBlipScale(medicDown2, 1.3)
		SetBlipAsShortRange(medicDown2,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-14B Medic Down')
		EndTextCommandSetBlipName(medicDown2)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(medicDown2, alpha)

		if alpha == 0 then
			RemoveBlip(medicDown2)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:1014B', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:fourB', {x = pos.x, y = pos.y, z = pos.z})
end)

-- ---- Down Person ----

RegisterNetEvent('np-dispatch:downalert')
AddEventHandler('np-dispatch:downalert', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == "ems" then	
		local alpha = 250
		local injured = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(injured,  126)
		SetBlipColour(injured,  1)
		SetBlipScale(injured, 1.5)
		SetBlipAsShortRange(injured,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-47 Injured Person')
		EndTextCommandSetBlipName(injured)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'dispatch', 0.1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(injured, alpha)

		if alpha == 0 then
			RemoveBlip(injured)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:downguy', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:downperson', {x = pos.x, y = pos.y, z = pos.z})
end)

-- ---- assistance ----
-- RegisterNetEvent('np-dispatch:assistance')
-- AddEventHandler('np-dispatch:assistance', function(targetCoords)
-- if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then	
-- 		local alpha = 250
-- 		local assistance = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

-- 		SetBlipSprite(assistance,  126)
-- 		SetBlipColour(assistance,  18)
-- 		SetBlipScale(assistance, 1.5)
-- 		SetBlipAsShortRange(assistance,  1)
-- 		BeginTextCommandSetBlipName("STRING")
-- 		AddTextComponentString('Assistance Needed')
-- 		EndTextCommandSetBlipName(assistance)
-- 		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'dispatch', 0.1)

-- 		while alpha ~= 0 do
-- 			Citizen.Wait(120 * 4)
-- 			alpha = alpha - 1
-- 			SetBlipAlpha(assistance, alpha)

-- 		if alpha == 0 then
-- 			RemoveBlip(assistance)
-- 		return
--       end
--     end
--   end
-- end)

-- AddEventHandler('np-dispatch:assistanceneeded', function()
-- 	local pos = GetEntityCoords(PlayerPedId(), true)
-- 	TriggerServerEvent('np-dispatch:assistancen', {x = pos.x, y = pos.y, z = pos.z})
-- end)

-- ---- Car Crash ----

-- RegisterNetEvent('np-dispatch:vehiclecrash')
-- AddEventHandler('np-dispatch:vehiclecrash', function()
-- if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then	
-- 		local alpha = 250
-- 		local targetCoords = GetEntityCoords(PlayerPedId(), true)
-- 		local recket = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

-- 		SetBlipSprite(recket,  488)
-- 		SetBlipColour(recket,  1)
-- 		SetBlipScale(recket, 1.5)
-- 		SetBlipAsShortRange(recket,  1)
-- 		BeginTextCommandSetBlipName("STRING")
-- 		AddTextComponentString('10-50 Vehicle Crash')
-- 		EndTextCommandSetBlipName(recket)
-- 		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

-- 		while alpha ~= 0 do
-- 			Citizen.Wait(120 * 4)
-- 			alpha = alpha - 1
-- 			SetBlipAlpha(recket, alpha)

-- 		if alpha == 0 then
-- 			RemoveBlip(recket)
-- 		return
--       end
--     end
--   end
-- end)
-- ---- Vehicle Theft ----

RegisterNetEvent("np-dispatch:carBoost")
AddEventHandler("np-dispatch:carBoost", function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent("np-dispatch:svCarBoost", {x = pos.x, y = pos.y, z = pos.z})
end)

RegisterNetEvent("np-dispatch:carBoostBlip")
AddEventHandler("np-dispatch:carBoostBlip", function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 250
		local thiefBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(thiefBlip,  488)
		SetBlipColour(thiefBlip,  1)
		SetBlipScale(thiefBlip, 1.5)
		SetBlipAsShortRange(thiefBlip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-60 Car Jacking')
		EndTextCommandSetBlipName(thiefBlip)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(thiefBlip, alpha)

		if alpha == 0 then
			RemoveBlip(thiefBlip)
		return
      end
    end

	end
end)

RegisterNetEvent("np-dispatch:carBoostTracker")
AddEventHandler("np-dispatch:carBoostTracker", function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent("np-dispatch:svCarBoostTracker", {x = pos.x, y = pos.y, z = pos.z})
end)

RegisterNetEvent("np-dispatch:carBoostBlipTracker")
AddEventHandler("np-dispatch:carBoostBlipTracker", function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 250
		local thiefBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(thiefBlip,  326)
		SetBlipColour(thiefBlip,  1)
		SetBlipScale(thiefBlip, 1.5)
		SetBlipAsShortRange(thiefBlip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Car Tracker')
		EndTextCommandSetBlipName(thiefBlip)
		-- TriggerServerEvent('InteractSound_SV:PlayOnSource', 'dispatch', 0.2)

		while alpha ~= 0 do
			Citizen.Wait(100)
			alpha = alpha - 1
			SetBlipAlpha(thiefBlip, alpha)

		if alpha == 0 then
			RemoveBlip(thiefBlip)
		return
      end
    end

	end
end)




RegisterNetEvent('np-dispatch:vehiclesteal')
AddEventHandler('np-dispatch:vehiclesteal', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 250
		local thiefBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(thiefBlip,  488)
		SetBlipColour(thiefBlip,  1)
		SetBlipScale(thiefBlip, 1.5)
		SetBlipAsShortRange(thiefBlip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-60 Vehicle Theft')
		EndTextCommandSetBlipName(thiefBlip)
		PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(thiefBlip, alpha)

		if alpha == 0 then
			RemoveBlip(thiefBlip)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:stolenveh', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:sveh', {x = pos.x, y = pos.y, z = pos.z})
end)



-- ---- Store Robbery ----

RegisterNetEvent('np-dispatch:storerobbery')
AddEventHandler('np-dispatch:storerobbery', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 250
		local store = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipHighDetail(store, true)
		SetBlipSprite(store,  52)
		SetBlipColour(store,  4)
		SetBlipScale(store, 1.3)
		SetBlipAsShortRange(store,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-31B Robbery In Progress')
		EndTextCommandSetBlipName(store)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(store, alpha)

		if alpha == 0 then
			RemoveBlip(store)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:robstore', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:storerob', {x = pos.x, y = pos.y, z = pos.z})
end)

-- ---- House Robbery ----

RegisterNetEvent('np-dispatch:houserobbery2')
AddEventHandler('np-dispatch:houserobbery2', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 250
		local burglary = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipHighDetail(burglary, true)
		SetBlipSprite(burglary,  411)
		SetBlipColour(burglary,  4)
		SetBlipScale(burglary, 1.3)
		SetBlipAsShortRange(burglary,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-31A Burglary')
		EndTextCommandSetBlipName(burglary)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(burglary, alpha)

		if alpha == 0 then
			RemoveBlip(burglary)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:robhouse', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:houserob', {x = pos.x, y = pos.y, z = pos.z})
end)

-- ---- Bank Truck ----

RegisterNetEvent('np-dispatch:banktruck')
AddEventHandler('np-dispatch:banktruck', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 250
		local truck = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(truck,  477)
		SetBlipColour(truck,  47)
		SetBlipScale(truck, 1.5)
		SetBlipAsShortRange(Blip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90D Bank Truck In Progress')
		EndTextCommandSetBlipName(truck)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(truck, alpha)

		if alpha == 0 then
			RemoveBlip(truck)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:bankt', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:tbank', {x = pos.x, y = pos.y, z = pos.z})
end)

---- Jewerly Store ----

RegisterNetEvent('np-dispatch:jewelrobbey')
AddEventHandler('np-dispatch:jewelrobbey', function()
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 250
		local jew = AddBlipForCoord(-634.02, -239.49, 38)

		SetBlipSprite(jew,  487)
		SetBlipColour(jew,  4)
		SetBlipScale(jew, 1.8)
		SetBlipAsShortRange(Blip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90 In Progress')
		EndTextCommandSetBlipName(jew)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(jew, alpha)

		if alpha == 0 then
			RemoveBlip(jew)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:jewrob', function()
	TriggerServerEvent('np-dispatch:robjew')
end)

-- ---- Jail Break ----

-- RegisterNetEvent('np-dispatch:jailbreak')
-- AddEventHandler('np-dispatch:jailbreak', function()
-- 	if PlayerData.job.name == 'police' then	
-- 		local alpha = 250
-- 		local jail = AddBlipForCoord(1779.65, 2590.39, 50.49)

-- 		SetBlipSprite(jail,  487)
-- 		SetBlipColour(jail,  4)
-- 		SetBlipScale(jail, 1.8)
-- 		SetBlipAsShortRange(jail,  1)
-- 		BeginTextCommandSetBlipName("STRING")
-- 		AddTextComponentString('10-98 Jail Break')
-- 		EndTextCommandSetBlipName(jail)
-- 		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)

-- 		while alpha ~= 0 do
-- 			Citizen.Wait(120 * 4)
-- 			alpha = alpha - 1
-- 			SetBlipAlpha(jail, alpha)

-- 		if alpha == 0 then
-- 			RemoveBlip(jail)
-- 		return
--       end
--     end
--   end
-- end)

-- AddEventHandler('np-dispatch:jailb', function()
-- 	TriggerServerEvent('np-dispatch:bjail')
-- end)


RegisterNetEvent('np-dispatch:bankrob')
AddEventHandler('np-dispatch:bankrob', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 250
		local jew = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(jew,  487)
		SetBlipColour(jew,  4)
		SetBlipScale(jew, 1.8)
		SetBlipAsShortRange(Blip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90A In Progress')
		EndTextCommandSetBlipName(jew)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(jew, alpha)

		if alpha == 0 then
			RemoveBlip(jew)
		return
      end
    end
  end
end)

AddEventHandler('np-dispatch:bankrobbery', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:bankrobberyfuck', {x = pos.x, y = pos.y, z = pos.z})
end)


RegisterNetEvent('np-dispatch:drugdealreport')
AddEventHandler('np-dispatch:drugdealreport', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 250
		local jew = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(jew,  4)
		SetBlipColour(jew,  4)
		SetBlipScale(jew, 0.5)
		SetBlipAsShortRange(Blip,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Suspicious Activity Reported')
		EndTextCommandSetBlipName(jew)

		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(jew, alpha)

		if alpha == 0 then
			RemoveBlip(jew)
		return
      end
    end
  end
end)


AddEventHandler('np-dispatch:drug', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:drugg23', {x = pos.x, y = pos.y, z = pos.z})
end)



----------- Below is bobcat:

RegisterNetEvent('np-dispatch:bobcatreport')
AddEventHandler('np-dispatch:bobcatreport', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 250
		local jew = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(jew,  500)
		SetBlipColour(jew,  1)
		SetBlipScale(jew, 1.5)
		SetBlipAsShortRange(jew,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90A Bobcat Security Breach')
		EndTextCommandSetBlipName(jew)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)


		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(jew, alpha)

		if alpha == 0 then
			RemoveBlip(jew)
		return
      end
    end
  end
end)


AddEventHandler('np-dispatch:dispatchBobcat', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:bobbycat', {x = pos.x, y = pos.y, z = pos.z})
end)


----------- Vault 

RegisterNetEvent('np-dispatch:vaultreport')
AddEventHandler('np-dispatch:vaultreport', function(targetCoords)
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' then	
		local alpha = 250
		local jew = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

		SetBlipSprite(jew,  500)
		SetBlipColour(jew,  1)
		SetBlipScale(jew, 1.5)
		SetBlipAsShortRange(jew,  1)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('10-90A Robbery In Progress At The Vault')
		EndTextCommandSetBlipName(jew)
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'bankalarm', 0.3)


		while alpha ~= 0 do
			Citizen.Wait(120 * 4)
			alpha = alpha - 1
			SetBlipAlpha(jew, alpha)

		if alpha == 0 then
			RemoveBlip(jew)
		return
      end
    end
  end
end)


AddEventHandler('np-dispatch:DispatchVaultAlert', function()
	local pos = GetEntityCoords(PlayerPedId(), true)
	TriggerServerEvent('np-dispatch:vaulttt', {x = pos.x, y = pos.y, z = pos.z})
end)