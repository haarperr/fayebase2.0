local handCuffed = false
local isPolice = false
local isSheriff = false
local isRanger = false
local isState = false
local isEMS = false
local isSuit = false
local currentCallSign = nil
local isInService = false

local isNearPDZone = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_extra_spot", vector3(443.78, -988.09, 25.7), 30, 34.6, {
		name="void_extra_spot",
		heading=0,
		--debugPoly=true,
		minZ=24.7,
		maxZ=28.7
    }) 
end)

RegisterNetEvent('np-police:bill_ply')
AddEventHandler('np-police:bill_ply', function(pAmt, pJob)
	TriggerServerEvent('np-banking:business_money', pAmt, pJob, 'add')
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_extra_spot" then
        local job = exports["isPed"]:isPed("myjob")
        if job == "police" or job == "sheriff" or job == "state" or job == "ranger" then
            isNearPDZone = true
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_extra_spot" then
        isNearPDZone = false
    end
end)

RegisterNetEvent("police:setCallSign")
AddEventHandler("police:setCallSign", function(pCallSign)
	if pCallSign ~= nil then currentCallSign = pCallSign end
end)

RegisterNetEvent("np-jobmanager:playerBecameJob")
AddEventHandler("np-jobmanager:playerBecameJob", function(job, name, notify)
	if isEMS and job ~= "ems" then isEMS = false isInService = false end
	if isPolice and job ~= "police" then isPolice = false isInService = false end
	if isState and job ~= "state" then isState = false isInService = false end
	if isSheriff and job ~= "sheriff" then isSheriff = false isInService = false end
	if isRanger and job ~= "ranger" then isRanger = false isInService = false end
	if isNews and job ~= "news" then isNews = false isInService = false end
	if job == "police" then isPolice = true TriggerServerEvent('police:getRank',"police") isInService = true end
	if job == "state" then isState = true isInService = true end
	if job == "sheriff" then isSheriff = true isInService = true end
	if job == "ranger" then isRanger = true isInService = true end
	if job == "ems" then isEMS = true TriggerServerEvent('police:getRank',"ems") isInService = true end
	if job == "doctor" then isDoctor = true TriggerServerEvent('police:getRank',"doctor") isInService = true end
	if job == "news" then isNews = true isInService = false end
	if job == "suits" then isSuit = true isInService = false end
end)

RegisterNetEvent('police:checkLicenses')
AddEventHandler('police:checkLicenses', function()
	t, distance = GetClosestPlayerIgnoreCar()
	if(distance ~= -1 and distance < 5) then
		TriggerServerEvent("police:getLicenses", GetPlayerServerId(t))
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end
end)

RegisterNetEvent('evidence:dnaSwab')
AddEventHandler('evidence:dnaSwab', function()
    local finished = exports["np-taskbar"]:taskBar(8000,"DNA Testing")
    if finished == 100 then
        t, distance = GetClosestPlayer()
        if(distance ~= -1 and distance < 5) then
            TriggerServerEvent("police:dnaAsk", GetPlayerServerId(t))
        end
    end
end)

RegisterNetEvent('police:checkBank')
AddEventHandler('police:checkBank', function()
	t, distance, closestPed = GetClosestPlayer()
	if(distance ~= -1 and distance < 7) then
		TriggerServerEvent("police:targetCheckBank", GetPlayerServerId(t))
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end
end)

RegisterNetEvent('police:checkInventory')
AddEventHandler('police:checkInventory', function(isFrisk)
	if isFrisk == nil then isFrisk = false end
	t, distance, closestPed = GetClosestPlayer()
	if(distance ~= -1 and distance < 5) then
		TriggerServerEvent("police:targetCheckInventory", GetPlayerServerId(t), isFrisk)
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end
end)


function KneelMedic()
    local player = GetPlayerPed( -1 )
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 

	        loadAnimDict( "amb@medic@standing@tendtodead@enter" )
	        loadAnimDict( "amb@medic@standing@timeofdeath@enter" )
	        loadAnimDict( "amb@medic@standing@tendtodead@idle_a" )
	        loadAnimDict( "random@crash_rescue@help_victim_up" )

			TaskPlayAnim( player, "amb@medic@standing@tendtodead@enter", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
			TaskPlayAnim( player, "amb@medic@standing@tendtodead@idle_a", "idle_b", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
			Wait (3000)
			TaskPlayAnim( player, "amb@medic@standing@tendtodead@exit", "exit_flee", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
            TaskPlayAnim( player, "amb@medic@standing@timeofdeath@enter", "enter", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )  
            Wait (500)
            TaskPlayAnim( player, "amb@medic@standing@timeofdeath@enter", "helping_victim_to_feet_player", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )  

    end
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

RegisterNetEvent('revive')
AddEventHandler('revive', function(t)

	t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 10) then
		TriggerServerEvent("np-death:reviveSV", GetPlayerServerId(t))
		KneelMedic()
		TriggerServerEvent("take100",GetPlayerServerId(t))
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end

end)

RegisterNetEvent('revive2')
AddEventHandler('revive2', function(t)

	t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 10) then
		TriggerServerEvent("np-death:reviveSV", GetPlayerServerId(t))
		KneelMedic()
		TriggerEvent('inventory:removeItem', 'medbeg', 1)
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end

end)

function VehicleInFront()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 3.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local a, b, c, d, result = GetRaycastResult(rayHandle)
    return result
end

-- RegisterNetEvent('police:woxy')
-- AddEventHandler('police:woxy', function()
-- 	local vehFront = VehicleInFront()
-- 	if vehFront > 0 then
--   		loadAnimDict('anim@narcotics@trash')
-- 		TaskPlayAnim(PlayerPedId(),'anim@narcotics@trash', 'drop_front',0.9, -8, 3800, 49, 3.0, 0, 0, 0)		
-- 		local finished = exports["np-taskbar"]:taskBar(4000,"Grabbing Scuba Gear")
-- 	  	if finished == 100 then
-- 	  		loadAnimDict('anim@narcotics@trash')
--     		TaskPlayAnim(PlayerPedId(),'anim@narcotics@trash', 'drop_front',0.9, -8, 1900, 49, 3.0, 0, 0, 0)	  		
-- 			TriggerEvent("UseOxygenTank")
-- 		end
-- 	end
-- end)

RegisterNetEvent('police:remmaskAccepted')
AddEventHandler('police:remmaskAccepted', function()
	TriggerEvent("facewear:adjust", 1, true)
	TriggerEvent("facewear:adjust", 3, true)
	TriggerEvent("facewear:adjust", 4, true)
	TriggerEvent("facewear:adjust", 2, true)
end)

RegisterNetEvent('police:remmask')
AddEventHandler('police:remmask', function(t)
	t, distance = GetClosestPlayer()
	if (distance ~= -1 and distance < 5) then
		if not IsPedInVehicle(t,GetVehiclePedIsIn(t, false),false) then
			TriggerServerEvent("police:remmaskGranted", GetPlayerServerId(t))
			AnimSet = "mp_missheist_ornatebank"
			AnimationOn = "stand_cash_in_bag_intro"
			AnimationOff = "stand_cash_in_bag_intro"
			loadAnimDict( AnimSet )
			TaskPlayAnim( PlayerPedId(), AnimSet, AnimationOn, 8.0, -8, -1, 49, 0, 0, 0, 0 )
			Citizen.Wait(500)
			ClearPedTasks(PlayerPedId())						
		end
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end
end)

RegisterNetEvent("shoes:steal")
AddEventHandler("shoes:steal", function(t)
	t, distance = GetClosestPlayer()
	if (distance ~= -1 and distance < 2) then
		if not IsPedInVehicle(t,GetVehiclePedIsIn(t, false),false) then
  			loadAnimDict('random@domestic')
  			TaskPlayAnim(PlayerPedId(),'random@domestic', 'pickup_low',5.0, 1.0, 1.0, 48, 0.0, 0, 0, 0)
  			Citizen.Wait(1600)
  			ClearPedTasks(PlayerPedId())
  			TriggerServerEvent("police:remShoesBitch", GetPlayerServerId(t))
		end
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end
end)


tryingcuff = false
RegisterNetEvent('police:cuff2')
AddEventHandler('police:cuff2', function(t,softcuff)
	if not tryingcuff then

		
		tryingcuff = true

		t, distance, ped = GetClosestPlayer()

		Citizen.Wait(1500)
		if(distance ~= -1 and #(GetEntityCoords(ped) - GetEntityCoords(PlayerPedId())) < 2.5 and GetEntitySpeed(ped) < 1.0) then
			TriggerEvent('police:cuff2')
			TriggerServerEvent("police:cuffGranted2", GetPlayerServerId(t), softcuff)
		else
			ClearPedSecondaryTask(PlayerPedId())
			TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
		end

		tryingcuff = false

	end
end)

RegisterNetEvent('police:cuff')
AddEventHandler('police:cuff', function(t)
	if not tryingcuff then



		TriggerEvent("Police:ArrestingAnim")
		tryingcuff = true

		t, distance = GetClosestPlayer()
		if(distance ~= -1 and distance < 1.5) then
			TriggerServerEvent("police:cuffGranted", GetPlayerServerId(t))
		else
			TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
		end


		tryingcuff = false
	end
end)

local cuffstate = false


RegisterNetEvent('civ:cuffFromMenu')
AddEventHandler('civ:cuffFromMenu', function()
	TriggerEvent("police:cuffFromMenu",false)
end)

RegisterNetEvent('civ:uncuffFromMenu')
AddEventHandler('civ:uncuffFromMenu', function()
	TriggerEvent("police:uncuffMenu",true)
end)

RegisterNetEvent('police:cuffFromMenu')
AddEventHandler('police:cuffFromMenu', function(softcuff)
	if not cuffstate and not handCuffed and not IsPedRagdoll(PlayerPedId()) and not IsPlayerFreeAiming(PlayerId()) and not IsPedInAnyVehicle(PlayerPedId(), false) then
		cuffstate = true

		t, distance = GetClosestPlayer()
		if(distance ~= -1 and distance < 2 and not IsPedRagdoll(PlayerPedId())) then
			if softcuff then
				TriggerEvent('DoLongHudText', 'You soft cuffed a player!', 1)
			else
				TriggerEvent('DoLongHudText', 'You hard cuffed a player!', 1)
			end
			
			TriggerEvent("police:cuff2", GetPlayerServerId(t),softcuff)
			local finished = exports['np-taskbar']:taskBar(3000, 'Cuffing')
		end

		cuffstate = false
	end
end)

RegisterNetEvent('police:gsr')
AddEventHandler('police:gsr', function(t)
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_MOBILE", 0, 1)
	local finished = exports["np-taskbar"]:taskBar(15000,"GSR Testing")
    if finished == 100 then
		t, distance = GetClosestPlayer()
		if(distance ~= -1 and distance < 7) then
			TriggerServerEvent("police:gsrGranted", GetPlayerServerId(t))
		end
	end
end)

RegisterNetEvent('police:giveweaponlicense')
AddEventHandler('police:giveweaponlicense', function(t)
	t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 7) then
		TriggerServerEvent("np-base:giveLicenses", GetPlayerServerId(t))
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end
end)

RegisterNetEvent('police:removeweaponlicense')
AddEventHandler('police:removeweaponlicense', function(t)
	t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 7) then
		TriggerServerEvent("np-base:removeLicenses", GetPlayerServerId(t))
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end
end)


RegisterNetEvent('police:givehuntinglicense')
AddEventHandler('police:givehuntinglicense', function(t)
	t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 7) then
		TriggerServerEvent("np-base:giveLicenseshunt", GetPlayerServerId(t))
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end
end)

RegisterNetEvent('police:removehuntinglicense')
AddEventHandler('police:removehuntinglicense', function(t)
	t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 7) then
		TriggerServerEvent("np-base:removeLicenseshunt", GetPlayerServerId(t))
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end
end)


RegisterNetEvent('police:givefishinglicense')
AddEventHandler('police:givefishinglicense', function(t)
	t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 7) then
		TriggerServerEvent("np-base:giveLicensesfish", GetPlayerServerId(t))
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end
end)

RegisterNetEvent('police:removeLicensesfish')
AddEventHandler('police:removeLicensesfish', function(t)
	t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 7) then
		TriggerServerEvent("np-base:removeLicensesfish", GetPlayerServerId(t))
	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end
end)


local shotRecently = false

Citizen.CreateThread(function()
	local lastShot = 0
	
	while true do
		Citizen.Wait(5)

		if IsPedShooting(PlayerPedId()) then
			local name = GetSelectedPedWeapon(PlayerPedId())
			if name ~= `WEAPON_STUNGUN` then
				lastShot = GetGameTimer()
				shotRecently = true
			end
		end

		if shotRecently and GetGameTimer() - lastShot >= 1200000 then shotRecently = false end 
	end
end)

RegisterNetEvent("police:hasShotRecently")
AddEventHandler("police:hasShotRecently", function(copId)
	TriggerServerEvent("police:hasShotRecently", shotRecently, copId)
end)

RegisterNetEvent('police:uncuffMenu')
AddEventHandler('police:uncuffMenu', function()
	t, distance = GetClosestPlayer()
	-- error debug fix - syd
	if not IsPedInAnyVehicle(PlayerPedId(), false) then
		if(distance ~= -1 and distance < 2) then
			TriggerEvent("animation:PlayAnimation","uncuff")
			local finished = exports['np-taskbar']:taskBar(3000, 'Uncuffing')
			if finished == 100 then
				TriggerServerEvent("falseCuffs", GetPlayerServerId(t))
				TriggerEvent('DoLongHudText', 'You uncuffed a player!', 1)
			end
		else
			TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
		end
	end
end)

RegisterNetEvent('resetCuffs')
AddEventHandler('resetCuffs', function()
	ClearPedTasksImmediately(PlayerPedId())
	handcuffType = 49
	handCuffed = false
	handCuffedWalking = false
	TriggerEvent("police:currentHandCuffedState",handCuffed,handCuffedWalking)
	TriggerEvent("handcuffed",false)
end)

RegisterNetEvent('falseCuffs')
AddEventHandler('falseCuffs', function()
	ClearPedTasksImmediately(PlayerPedId())
	handcuffType = 49
	handCuffed = false
	handCuffedWalking = false
	TriggerEvent("police:currentHandCuffedState",handCuffed,handCuffedWalking)
	TriggerEvent("handcuffed",false)
end)

RegisterNetEvent('police:getArrested2')
AddEventHandler('police:getArrested2', function(cuffer)

	ClearPedTasksImmediately(PlayerPedId())
	CuffAnimation(cuffer)
	
	local cuffPed = GetPlayerPed(GetPlayerFromServerId(tonumber(cuffer)))

	local finished = 0
	if not exports['np-death']:GetDeathStatus() then
		local taskbar = exports["np-ui"]:taskBarSkill(math.random(950, 1100), math.random(13, 15))
		if taskbar == 100 then
			TriggerEvent('DoLongHudText', 'You slipped out of cuffs !',1)
			TriggerEvent("handcuffed",false)
		return end
	end
	
	if #(GetEntityCoords( PlayerPedId()) - GetEntityCoords(cuffPed)) < 2.5 and finished ~= 100 then
		handcuffType = 16
		handCuffed = true
		handCuffedWalking = false
		TriggerEvent("police:currentHandCuffedState", handCuffed, handCuffedWalking)
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'handcuff', 0.4)
		TriggerEvent('DoLongHudText', 'Cuffed!', 1)
		TriggerEvent("handcuffed",true)
		TriggerEvent("DensityModifierEnable",false)	
	end

end)

function CuffAnimation(cuffer)
	loadAnimDict("mp_arrest_paired")
	local cuffer = GetPlayerPed(GetPlayerFromServerId(tonumber(cuffer)))
	local dir = GetEntityHeading(cuffer)
	SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(cuffer, 0.0, 0.45, 0.0))
	Citizen.Wait(100)
	SetEntityHeading(PlayerPedId(),dir)
	TaskPlayAnim(PlayerPedId(), "mp_arrest_paired", "crook_p2_back_right", 8.0, -8, -1, 32, 0, 0, 0, 0)
end

RegisterNetEvent('police:cuffTransition')
AddEventHandler('police:cuffTransition', function()
	loadAnimDict("mp_arrest_paired")
	Citizen.Wait(100)
	TaskPlayAnim(PlayerPedId(), "mp_arrest_paired", "cop_p2_back_right", 8.0, -8, -1, 48, 0, 0, 0, 0)
	Citizen.Wait(3500)
	ClearPedTasksImmediately(PlayerPedId())
end)

RegisterNetEvent('police:getArrested')
AddEventHandler('police:getArrested', function(cuffer)

		if(handCuffed) then
			Citizen.Wait(3500)
			ClearPedTasksImmediately(PlayerPedId())
			handCuffed = false
			handcuffType = 49
			TriggerEvent("police:currentHandCuffedState",handCuffed,handCuffedWalking)
			TriggerEvent("handcuffed",true)
			TriggerEvent("DensityModifierEnable",true)
		else
			ClearPedTasksImmediately(PlayerPedId())
			CuffAnimation(cuffer) 

			local cuffPed = GetPlayerPed(GetPlayerFromServerId(tonumber(cuffer)))
			if Vdist2( GetEntityCoords( GetPlayerPed(-1) , GetEntityCoords(cuffPed) ) ) < 1.5 then
				handcuffType = 49
				handCuffed = true
				TriggerEvent("police:currentHandCuffedState",handCuffed,handCuffedWalking)
				TriggerEvent("handcuffed",false)
				TriggerEvent("DensityModifierEnable",false)
			end
		end
end)

RegisterNetEvent('police:jailing')
AddEventHandler('police:jailing', function(args)
	Citizen.Trace("Jailing in process.")
	TriggerServerEvent('police:jailGranted', args)
	--TriggerServerEvent('updateJailTime', tonumber(args[2]))
end)

RegisterNetEvent('police:jailing2')
AddEventHandler('police:jailing2', function(pPlayer, time)
	Citizen.Trace("Jailing in process.")
	TriggerServerEvent('police:jailGranted2', pPlayer, time)
	TriggerEvent('np-base:setEverything')
    TriggerEvent('np-hud:EnableHud', true)
end)

RegisterNetEvent('startJail')
AddEventHandler('startJail', function(minutes)
	TriggerServerEvent('updateJailTime', tonumber(minutes))
end)

RegisterNetEvent('police:forceEnter')
AddEventHandler('police:forceEnter', function(id)

	ped, distance, t = GetClosestPedIgnoreCar()
	if(distance ~= -1 and distance < 3) then

		local isInVeh = IsPedInAnyVehicle(ped, true)
		if not isInVeh then
			playerped = PlayerPedId()
	        coordA = GetEntityCoords(playerped, 1)
	        coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
	        v = getVehicleInDirection(coordA, coordB)
	        if GetVehicleEngineHealth(v) < 100.0 then
				TriggerEvent('DoLongHudText', 'That vehicle is too damaged!', 1)
	        	return
	        end
			local netid = NetworkGetNetworkIdFromEntity(v)	
			TriggerEvent('forcedEnteringVeh', GetPlayerServerId(t))
			local SeatPly = exports['np-taskbar']:taskBar(2000, 'Seating In Vehicle')
			if SeatPly == 100 then
				TriggerServerEvent("police:forceEnterAsk", GetPlayerServerId(t), netid)
				TriggerEvent("dr:releaseEscort")
			end
		else
			TriggerEvent("unseatPlayer")
		end

	else
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	end
end)

RegisterNetEvent('police:forcedEnteringVeh')
AddEventHandler('police:forcedEnteringVeh', function(sender)

	local vehicleHandle = NetworkGetEntityFromNetworkId(sender)
    if vehicleHandle ~= nil then
        Citizen.Trace("22")
      if IsEntityAVehicle(vehicleHandle) then
      	TriggerEvent("respawn:sleepanims")
      	Citizen.Wait(1000)
        for i=1,GetVehicleMaxNumberOfPassengers(vehicleHandle) do
            Citizen.Trace("33")
          if IsVehicleSeatFree(vehicleHandle,i) then
		 	TriggerEvent("unEscortPlayer")
			Citizen.Wait(100)
            SetPedIntoVehicle(PlayerPedId(),vehicleHandle,i)
            
            Citizen.Trace("whatsasdsass")
            return true
          end
        end
	    if IsVehicleSeatFree(vehicleHandle,0) then
	    	TriggerEvent("unEscortPlayer") 
			Citizen.Wait(100)
	        SetPedIntoVehicle(PlayerPedId(),vehicleHandle,0)
	        
	    end
      end
    end
end)

function GetStreetAndZone()
    local plyPos = GetEntityCoords(PlayerPedId(),  true)
    local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    zone = tostring(GetNameOfZone(plyPos.x, plyPos.y, plyPos.z))
    local playerStreetsLocation = GetLabelText(zone)
    local street = street1 .. ", " .. playerStreetsLocation
    return street
end

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end

function GetClosestPlayers(targetVector,dist)
	local players = GetPlayers()
	local ply = PlayerPedId()
	local plyCoords = targetVector
	local closestplayers = {}
	local closestdistance = {}
	local closestcoords = {}

	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
			if(distance < dist) then
				valueID = GetPlayerServerId(value)
				closestplayers[#closestplayers+1]= valueID
				closestdistance[#closestdistance+1]= distance
				closestcoords[#closestcoords+1]= {targetCoords["x"], targetCoords["y"], targetCoords["z"]}
				
			end
		end
	end
	return closestplayers, closestdistance, closestcoords
end

function GetClosestPlayerVehicleToo()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = PlayerPedId()
	local plyCoords = GetEntityCoords(ply, 0)
	if not IsPedInAnyVehicle(PlayerPedId(), false) then
		for index,value in ipairs(players) do
			local target = GetPlayerPed(value)
			if(target ~= ply) then
				local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
				local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
				if(closestDistance == -1 or closestDistance > distance) then
					closestPlayer = value
					closestDistance = distance
				end
			end
		end
		return closestPlayer, closestDistance
	end
end

function GetClosestPlayerAny()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = PlayerPedId()
	local plyCoords = GetEntityCoords(ply, 0)


	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
			if(closestDistance == -1 or closestDistance > distance) and not IsPedInAnyVehicle(target, false) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance



end


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

	end
end
function GetClosestPedIgnoreCar()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local closestPlayerId = -1
	local ply = PlayerPedId()
	local plyCoords = GetEntityCoords(ply, 0)
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = target
				closestPlayerId = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance, closestPlayerId
end
function GetClosestPlayerIgnoreCar()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = PlayerPedId()
	local plyCoords = GetEntityCoords(ply, 0)
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
end

handCuffedWalking = false
RegisterNetEvent('handCuffedWalking')
AddEventHandler('handCuffedWalking', function()

	if handCuffedWalking then
		handCuffedWalking = false
		TriggerEvent("handcuffed",false)
		TriggerEvent("animation:PlayAnimation","cancel")
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'handcuff', 0.4)
		TriggerEvent("police:currentHandCuffedState",false,false)
		return
	end
	
	handCuffedWalking = true
	handCuffed = false
	TriggerEvent("handcuffed",true)

	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'handcuff', 0.4)

	TriggerEvent("police:currentHandCuffedState",handCuffed,handCuffedWalking)

end)

local disabledWeapons = false
RegisterNetEvent("disabledWeapons")
AddEventHandler("disabledWeapons", function(sentinfo)
	SetCurrentPedWeapon(PlayerPedId(), `weapon_unarmed`, 1)
	disabledWeapons = sentinfo
end)

Citizen.CreateThread(function() 

  while true do

	Citizen.Wait(5)
	

    if disabledWeapons then
		DisableControlAction(1, 37, true) --Disables INPUT_SELECT_WEAPON (tab) Actions
		DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
    end

    if beingDragged or escort then
		DisableControlAction(1, 23, true)  -- F
		DisableControlAction(1, 106, true) -- VehicleMouseControlOverride
		DisableControlAction(1, 140, true) --Disables Melee Actions
		DisableControlAction(1, 141, true) --Disables Melee Actions
		DisableControlAction(1, 142, true) --Disables Melee Actions	
		DisableControlAction(1, 37, true) --Disables INPUT_SELECT_WEAPON (tab) Actions
		DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
		DisableControlAction(2, 32, true)
		DisableControlAction(1, 33, true)
		DisableControlAction(1, 34, true)
		DisableControlAction(1, 35, true)
		DisableControlAction(1, 37, true) --Disables INPUT_SELECT_WEAPON (tab) Actions
		DisableControlAction(0, 59)
		DisableControlAction(0, 60)
		DisableControlAction(2, 31, true) 
		SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
    end

    if handCuffedWalking or handCuffed then
    	
    	if handCuffed and CanPedRagdoll(PlayerPedId()) then
    		SetPedCanRagdoll(PlayerPedId(), false)
    	end

    	number = 49

    	if handCuffed then 
    		number = 16
		else 
			number = 49
		end

		DisableControlAction(1, 23, true)  -- F
		DisableControlAction(1, 288, true) -- F1
		DisableControlAction(1, 311, true) -- K
		DisableControlAction(1, 243, true) -- ~
		DisableControlAction(1, 106, true) -- VehicleMouseControlOverride
		DisableControlAction(1, 140, true) --Disables Melee Actions
		DisableControlAction(1, 141, true) --Disables Melee Actions
		DisableControlAction(1, 142, true) --Disables Melee Actions	
		DisableControlAction(1, 37, true) --Disables INPUT_SELECT_WEAPON (tab) Actions
		DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
		if (not IsEntityPlayingAnim(PlayerPedId(), "mp_arresting", "idle", 3) and not exports['np-death']:GetDeathStatus()) or (IsPedRagdoll(PlayerPedId()) and not exports['np-death']:GetDeathStatus()) then
	    	RequestAnimDict('mp_arresting')
			while not HasAnimDictLoaded("mp_arresting") do
				Citizen.Wait(1)
			end
			TaskPlayAnim(PlayerPedId(), "mp_arresting", "idle", 8.0, -8, -1, number, 0, 0, 0, 0)
		end
		if exports['np-death']:GetDeathStatus() then
			Citizen.Wait(1000)
		end
    end

	if not handCuffed and not CanPedRagdoll(PlayerPedId()) then
		SetPedCanRagdoll(PlayerPedId(), true)
	end
  end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

handcuffType = 16

RegisterNetEvent('police:isPlayerCuffed')
AddEventHandler('police:isPlayerCuffed', function(requestedID)
	TriggerServerEvent("police:confirmIsCuffed",requestedID,handCuffed)
end)

Citizen.CreateThread(function()
 	while true do
    	Citizen.Wait(10)
		local myJob = exports["isPed"]:isPed("myJob")
		if isPolice or isState or isSheriff or isRanger or myJob == 'doc' then

			if IsControlJustReleased(2,172) and not IsControlPressed(0,19) then
				TriggerEvent("police:cuffFromMenu",false)
				Citizen.Wait(400)
			end

			if IsControlJustReleased(2,172) and IsControlPressed(0,19) then
				TriggerEvent("police:cuffFromMenu",true)
				Citizen.Wait(400)
			end

			if IsControlJustReleased(2,173) then
				TriggerEvent("police:uncuffMenu")
				Citizen.Wait(400)
			end

			if IsControlJustReleased(2,174) then
				TriggerEvent("escortPlayer")
				Citizen.Wait(400)
			end

			if IsControlJustReleased(2,175) then
				TriggerEvent("police:forceEnter")
				Citizen.Wait(400)
			end

		elseif isEMS then
			if IsControlJustReleased(2,172) then
				TriggerEvent("revive")
				Citizen.Wait(400)
			end

			if IsControlJustReleased(2,173) then
				TriggerEvent("ems:heal")
				Citizen.Wait(400)
			end

			if IsControlJustReleased(2,174) then
				TriggerEvent("escortPlayer")
				Citizen.Wait(400)
			end

			if IsControlJustReleased(2,175) then
				TriggerEvent("police:forceEnter")
				Citizen.Wait(400)
			end

		elseif isSuit then
			if IsControlJustReleased(2,172) then
				TriggerEvent("revive")
				Citizen.Wait(400)
			end

			if IsControlJustReleased(2,173) then
				TriggerEvent("ems:heal")
				Citizen.Wait(400)
			end

			if IsControlJustReleased(2,174) then
				TriggerEvent("escortPlayer")
				Citizen.Wait(400)
			end
		end
	end
end)


RegisterNetEvent('binoculars:Activate')
AddEventHandler('binoculars:Activate', function()
	if not handCuffed and not handCuffedWalking then
	   TriggerEvent("binoculars:Activate2")
	end
end)

RegisterNetEvent('camera:Activate')
AddEventHandler('camera:Activate', function()
	if not handCuffed and not handCuffedWalking then
	   TriggerEvent("camera:Activate2")
	end
end)

RegisterNetEvent('clientcheckLicensePlate')
AddEventHandler('clientcheckLicensePlate', function()
	if isPolice or isState or isSheriff or isRanger then
	  playerped = PlayerPedId()
      coordA = GetEntityCoords(playerped, 1)
      coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
      targetVehicle = getVehicleInDirection(coordA, coordB)
     	targetspeed = GetEntitySpeed(targetVehicle) * 3.6
     	herSpeedMph = GetEntitySpeed(targetVehicle) * 2.236936
      licensePlate = GetVehicleNumberPlateText(targetVehicle)
      local vehicleClass = GetVehicleClass(targetVehicle)

      if licensePlate == nil then

		TriggerEvent('DoLongHudText', 'Can not target vehicle!', 2)

      else
			TriggerServerEvent('checkLicensePlate',licensePlate)
		end
	end
end)

RegisterCommand('runplatet', function(source, args)
	if isPolice or isState or isSheriff or isRanger then
		TriggerEvent('clientcheckLicensePlate')
	end
end)

RegisterCommand('911', function(source, args)
	TriggerServerEvent('911', args)
end)

RegisterCommand('911r', function(source, args)
	TriggerServerEvent('911r', args)
end)

RegisterCommand('311', function(source, args)
	TriggerServerEvent('311', args)
end)

RegisterCommand('911a', function(source, args)
	TriggerServerEvent('911a', args)
end)
	
RegisterCommand('311r', function(source, args)
	TriggerServerEvent('311r', args)
end)

RegisterCommand("sc", function(source, args)
	if isPolice or isState or isSheriff or isRanger then
		TriggerServerEvent("police:cuffGranted2", args[1], "softcuff")
	end
end)

RegisterNetEvent('unseatPlayer')
AddEventHandler('unseatPlayer', function()
	t, distance = GetClosestPlayerIgnoreCar()
	if(distance ~= -1 and distance < 10) then
		local ped = PlayerPedId()  
		pos = GetEntityCoords(ped,  true)

		local finished = exports['np-taskbar']:taskBar(2000, 'Unseating From Vehicle')
          if finished == 100 then
			TriggerServerEvent('unseatAccepted',GetPlayerServerId(t),pos["x"], pos["y"], pos["z"])
			Citizen.Wait(100)
		  else
			TriggerEvent('DoLongHudText', 'Try again', 2)
		  end
	else
		TriggerEvent('DoLongHudText', 'No Player Found!', 2)
	end
end)

RegisterNetEvent('unseatPlayerFinish')
AddEventHandler('unseatPlayerFinish', function(x,y,z)
	local ped = PlayerPedId()  
	ClearPedTasksImmediately(ped)
	local veh = GetVehiclePedIsIn(ped, false)
    TaskLeaveVehicle(ped, veh, 256)
	SetEntityCoords(ped, x, y, z)
end)

function LoadAnimationDictionary(animationD) -- Simple way to load animation dictionaries to save lines.
	while(not HasAnimDictLoaded(animationD)) do
		RequestAnimDict(animationD)
		Citizen.Wait(1)
	end
end

otherid = 0
escort = false
keystroke = 49
triggerkey = false

dragging = false
beingDragged = false

escortStart = false
shitson = false

RegisterNetEvent('dragPlayer')
AddEventHandler('dragPlayer', function()
	t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 1.0) then
		if not beingDragged then
			DetachEntity(PlayerPedId(), true, false)
			TriggerServerEvent("police:dragAsk", GetPlayerServerId(t))
		end
	end
end)

RegisterNetEvent('drag:stopped')
AddEventHandler('drag:stopped', function(sentid)
	if tonumber(sentid) == tonumber(otherid) and beingDragged then
		shitson = false
		beingDragged = false
		DetachEntity(PlayerPedId(), true, false)
		TriggerEvent("deathdrop",beingDragged)
	end
end)

RegisterNetEvent('escortPlayer')
AddEventHandler('escortPlayer', function()
	t, distance = GetClosestPlayer()
	if not IsPedInAnyVehicle(PlayerPedId(), false) then
		if(distance ~= -1 and distance < 5) then
			if not escort then
				TriggerEvent("dr:escortingEnabled")
				TriggerServerEvent("police:escortAsk", GetPlayerServerId(t))
			end
		else
			escorting = false
		end
	end
end)

RegisterNetEvent("unEscortPlayer")
AddEventHandler("unEscortPlayer", function()
	escort = false
	beingDragged = false
	ClearPedTasks(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

local escorting = false

RegisterNetEvent("dr:releaseEscort")
AddEventHandler("dr:releaseEscort", function()
	escorting = false
end)

RegisterNetEvent("dr:escort")
AddEventHandler('dr:escort', function(pl)
	otherid = tonumber(pl)
	if not escort and IsPedInAnyVehicle(PlayerPedId(), false) then
		return
	end
	escort = not escort
	if not escort then
		TriggerServerEvent("dr:releaseEscort",otherid)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if escorting or dragging then
			if IsPedRunning(PlayerPedId()) or IsPedSprinting(PlayerPedId()) then
				SetPlayerControl(PlayerId(), 0, 0)
				Citizen.Wait(1000)
				SetPlayerControl(PlayerId(), 1, 1)
			end
		else
			Citizen.Wait(1000)
		end
		Citizen.Wait(5)
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		if IsEntityDead(GetPlayerPed(GetPlayerFromServerId(otherid))) and (escort) then 
			DetachEntity(PlayerPedId(), true, false)
			shitson = false	
			escort = false
			local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(GetPlayerFromServerId(otherid)), 0.0, 0.8, 2.8)
			SetEntityCoords(PlayerPedId(),pos)
		end


		if escort or beingDragged then
			local ped = GetPlayerPed(GetPlayerFromServerId(otherid))
			local myped = PlayerPedId()
			if escort then
				x,y,z = 0.54, 0.44, 0.0
			else
				x,y,z = 0.0, 0.44, 0.0
			end
			if not beingDragged then
				AttachEntityToEntity(myped, ped, 11816, x, y, z, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
			else
				AttachEntityToEntity(myped, ped, 1, -0.68, -0.2, 0.94, 180.0, 180.0, 60.0, 1, 1, 0, 1, 0, 1)
			end
			
			shitson = true
			--escortStart = true
		else
			if not beingDragged and not escort and shitson then
				DetachEntity(PlayerPedId(), true, false)	
				shitson = false	
				Citizen.Trace("no escort or drag")
				ClearPedTasksImmediately(PlayerPedId())
			end
		end

		if dragging then

			if not IsEntityPlayingAnim(PlayerPedId(), "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 3) then
				LoadAnimationDictionary( "missfinale_c2mcs_1" ) 
				TaskPlayAnim(PlayerPedId(), "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 1.0, 1.0, -1, 50, 0, 0, 0, 0)
			end
			if exports['np-death']:GetDeathStatus() or IsControlJustPressed(0, 38) or (`WEAPON_UNARMED` ~= GetSelectedPedWeapon(PlayerPedId())) then
				dragging = false
				ClearPedTasks(PlayerPedId())
				TriggerServerEvent("dragPlayer:disable")
			end

		end

		if beingDragged then
			if not IsEntityPlayingAnim(PlayerPedId(), "amb@world_human_bum_slumped@male@laying_on_left_side@base", "base", 3) then
				LoadAnimationDictionary( "amb@world_human_bum_slumped@male@laying_on_left_side@base" ) 
				TaskPlayAnim(PlayerPedId(), "amb@world_human_bum_slumped@male@laying_on_left_side@base", "base", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
			end
		end
		Citizen.Wait(5)
	end
end)

function getCloestVeh()
    playerped = PlayerPedId()
    coordA = GetEntityCoords(playerped, 1)
    coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
    targetVehicle = getVehicleInDirection(coordA, coordB)
    return targetVehicle
end

RegisterNetEvent('FlipVehicle')
AddEventHandler('FlipVehicle', function()
	local veh = getCloestVeh()
	if DoesEntityExist(veh) and IsEntityAVehicle(veh) and #(GetEntityCoords(veh) - GetEntityCoords(PlayerPedId())) < 5.0 then
		ExecuteCommand('e push')
		FreezeEntityPosition(playerped,true)
	local finished = exports["np-taskbar"]:taskBar(12000,"Flipping Vehicle Over",false,true)	
	if finished == 100 then
		FreezeEntityPosition(PlayerPedId(), false)
		local playerped = PlayerPedId()
	    local coordA = GetEntityCoords(playerped, 1)
	    local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
		local targetVehicle = getVehicleInDirection(coordA, coordB)
		local pPitch, pRoll, pYaw = GetEntityRotation(playerped)
		local vPitch, vRoll, vYaw = GetEntityRotation(targetVehicle)
		SetEntityRotation(targetVehicle, pPitch, vRoll, vYaw, 1, true)
		Wait(10)
		SetVehicleOnGroundProperly(targetVehicle)
	end
end
end)

function deleteVeh(ent)
	SetVehicleHasBeenOwnedByPlayer(ent, true)
	NetworkRequestControlOfEntity(ent)
	local finished = exports["np-taskbar"]:taskBar(1000,"Impounding",false,true)	
	Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(ent))
	DeleteEntity(ent)
	DeleteVehicle(ent)
	SetEntityAsNoLongerNeeded(ent)
end

RegisterNetEvent('impoundVehicle')
AddEventHandler('impoundVehicle', function()
	playerped = PlayerPedId()
    coordA = GetEntityCoords(playerped, 1)
    coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
   	targetVehicle = getVehicleInDirection(coordA, coordB)
	licensePlate = GetVehicleNumberPlateText(targetVehicle)
	TriggerServerEvent("np-imp:NormalImpound",licensePlate)
	TriggerEvent('DoLongHudText', 'Impounded with retrieval price of $100', 1)
	deleteVeh(targetVehicle)
end)

RegisterNetEvent('impoundsc')
AddEventHandler('impoundsc', function()
	playerped = PlayerPedId()
    coordA = GetEntityCoords(playerped, 1)
    coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
    targetVehicle = getVehicleInDirection(coordA, coordB)
	licensePlate = GetVehicleNumberPlateText(targetVehicle)
	TriggerServerEvent("np-imp:ImpoundCar",licensePlate)
	deleteVeh(targetVehicle)
end)

RegisterNetEvent('fullimpoundVehicle')
AddEventHandler('fullimpoundVehicle', function()
	playerped = PlayerPedId()
    coordA = GetEntityCoords(playerped, 1)
    coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
   	targetVehicle = getVehicleInDirection(coordA, coordB)
	licensePlate = GetVehicleNumberPlateText(targetVehicle)
	TriggerServerEvent("np-imp:FullImpound",licensePlate)
	TriggerEvent('DoLongHudText', 'Impounded with retrieval price of $1500', 1)
	deleteVeh(targetVehicle)
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

exports("getVehicleInDirection",getVehicleInDirection)


RegisterNetEvent('police:stealrob')
AddEventHandler('police:stealrob', function()
	if not exports['np-death']:GetDeathStatus() then
		RequestAnimDict("random@shop_robbery")
		while not HasAnimDictLoaded("random@shop_robbery") do
			Citizen.Wait(0)
		end

		local lPed = PlayerPedId()
		ClearPedTasksImmediately(lPed)

		TaskPlayAnim(lPed, "random@shop_robbery", "robbery_action_b", 8.0, -8, -1, 16, 0, 0, 0, 0)
		local finished = exports["np-taskbar"]:taskBar(15000,"Robbing",false,true)	

		if finished == 100 then
			t, distance, closestPed = GetClosestPlayer()
			-- print(t, distance, closestPed)
			-- print(GetClosestPlayer())  -- Working

			if distance ~= -1 and distance < 5 and ( IsEntityPlayingAnim(closestPed, "dead", "dead_d", 3) or IsEntityPlayingAnim(closestPed, "mini@cpr@char_a@cpr_def", "cpr_pumpchest_idle", 3) or IsEntityPlayingAnim(closestPed, "amb@code_human_cower_stand@male@base", "base", 3) or IsEntityPlayingAnim(closestPed, "amb@code_human_cower@male@base", "base", 3) or IsEntityPlayingAnim(closestPed, "random@arrests@busted", "idle_a", 3) or IsEntityPlayingAnim(closestPed, "mp_arresting", "idle", 3) or IsEntityPlayingAnim(closestPed, "random@mugging3", "handsup_standing_base", 3) or IsEntityPlayingAnim(closestPed, "missfbi5ig_22", "hands_up_anxious_scientist", 3) or IsEntityPlayingAnim(closestPed, "missfbi5ig_22", "hands_up_loop_scientist", 3) or IsEntityPlayingAnim(closestPed, "missminuteman_1ig_2", "handsup_base", 3) ) or TaskPlayAnim(lPed, "random@shop_robbery", "robbery_action_b", 8.0, -8, -1, 16, 0, 0, 0, 0) then
				if not IsPedInAnyVehicle(PlayerPedId()) then
					ClearPedTasksImmediately(lPed)
					TriggerServerEvent("police:targetCheckInventory", GetPlayerServerId(t), false)
					TriggerServerEvent("Stealtheybread", GetPlayerServerId(t))
				else
					TriggerEvent('DoLongHudText', 'You are in a vehicle asshole!', 2)
				end
			else
				TriggerEvent('DoLongHudText', 'They need to do /e handsup2 or be dead!', 2)
			end
		end
	else
		TriggerEvent('DoLongHudText', 'You are dead, you can\'t rob people you stupid fuck.', 2)
	end
end)

RegisterCommand('livery', function(source, args, raw)
  local coords = GetEntityCoords(GetPlayerPed(-1))
  local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
  if myJob == 'police' or myJob == 'ems' or myJob == 'state' or myJob == 'sheriff' or myJob == 'ranger' and GetVehicleLiveryCount(vehicle) - 1 >= tonumber(args[1]) then
  	SetVehicleLivery(vehicle, tonumber(args[1]))
	TriggerEvent('DoLongHudText', 'Livery Set', 1)
  else
	TriggerEvent('DoLongHudText', 'You are not a police officer!', 2)
  end
end)

RegisterCommand("extra", function(source, args, rawCommand)
	local myJob = exports["isPed"]:isPed("myJob")
	if myJob == 'police' or myJob == 'ems' or myJob == 'state' or myJob == 'sheriff' or myJob == 'ranger' then	
		if isNearPDZone then
			local ped = PlayerPedId()
			local veh = GetVehiclePedIsIn(ped, false)
			SetVehicleAutoRepairDisabled(veh, true)
			local extraID = tonumber(args[1])
			local extra = args[1]
			local toggle = tostring(args[2])
			if IsPedInAnyVehicle(ped, true) then
			local veh = GetVehiclePedIsIn(ped, false)
				if toggle == "true" then
					toggle = 0
					end
				if veh ~= nil and veh ~= 0 and veh ~= 1 then
					TriggerEvent('DoLongHudText', 'Extra Toggled', 1)
				
				if extra == "all" then
					SetVehicleExtra(veh, 1, toggle)
					SetVehicleExtra(veh, 2, toggle)
					SetVehicleExtra(veh, 3, toggle)
					SetVehicleExtra(veh, 4, toggle)
					SetVehicleExtra(veh, 5, toggle)       
					SetVehicleExtra(veh, 6, toggle)
					SetVehicleExtra(veh, 7, toggle)
					SetVehicleExtra(veh, 8, toggle)
					SetVehicleExtra(veh, 9, toggle)               
					SetVehicleExtra(veh, 10, toggle)
					SetVehicleExtra(veh, 11, toggle)
					SetVehicleExtra(veh, 12, toggle)
					SetVehicleExtra(veh, 13, toggle)
					SetVehicleExtra(veh, 14, toggle)
					SetVehicleExtra(veh, 15, toggle)
					SetVehicleExtra(veh, 16, toggle)
					SetVehicleExtra(veh, 17, toggle)
					SetVehicleExtra(veh, 18, toggle)
					SetVehicleExtra(veh, 19, toggle)
					SetVehicleExtra(veh, 20, toggle)
					TriggerEvent('DoLongHudText', 'Extra All Toggled', 1)
				elseif extraID == extraID then
					SetVehicleExtra(veh, extraID, toggle)
					end
				end
			end
		else
			TriggerEvent('DoLongHudText', 'You need to be in the PD Garage', 2)
		end
	end
end, false)

RegisterCommand("serial", function(source, args)
	local ped = PlayerPedId()
	local dist = #(GetEntityCoords(ped)-vector3(483.9296875,-993.29669189453,30.678344726562))
	if dist <= 2.0 then 
		if isPolice or isState or isSheriff or isRanger then
			TriggerServerEvent('weapons:get:data', args[1])
			exports["np-taskbar"]:taskBar(20000,"Checking Serial")
			end
		else
		TriggerEvent('DoLongHudText', 'You are not near the lab to run this serial!', 2)
	end
end)

RegisterNetEvent('police:tenThirteenA')
AddEventHandler('police:tenThirteenA', function()
	local myJob = exports["isPed"]:isPed("myJob")
	if myJob == 'police' or myJob == 'ems' or myJob == 'state' or myJob == 'sheriff' or myJob == 'ranger' then	
		local pos = GetEntityCoords(PlayerPedId(),  true)
		TriggerServerEvent("dispatch:svNotify", {
			dispatchCode = "10-13A",
			firstStreet = GetStreetAndZone(),
            name = exports["isPed"]:isPed("fullname"),
            number =  currentCallSign,
            priority = 1,
            isDead = true,
			dispatchMessage = "Officer Down URGENT!",
			origin = {
				x = pos.x,
				y = pos.y,
				z = pos.z
            },
        })
		TriggerEvent('np-dispatch:1013A')
	end
end)

RegisterNetEvent('police:tenThirteenB')
AddEventHandler('police:tenThirteenB', function()
	local myJob = exports["isPed"]:isPed("myJob")
	if myJob == 'police' or myJob == 'ems' or myJob == 'state' or myJob == 'sheriff' or myJob == 'ranger' then	
		local pos = GetEntityCoords(PlayerPedId(),  true)
		TriggerServerEvent("dispatch:svNotify", {
			dispatchCode = "10-13B",
			firstStreet = GetStreetAndZone(),
            name = exports["isPed"]:isPed("fullname"),
            number =  currentCallSign,
            priority = 2,
            isDead = true,
			dispatchMessage = "Officer Down",
			origin = {
				x = pos.x,
				y = pos.y,
				z = pos.z
            },
        })
		TriggerEvent('np-dispatch:1013B')
	end
end)

RegisterNetEvent('police:policePanic')
AddEventHandler('police:policePanic', function()
	local myJob = exports["isPed"]:isPed("myJob")
	if myJob == 'police' or myJob == 'ems' or myJob == 'state' or myJob == 'sheriff' or myJob == 'ranger' then	
		local pos = GetEntityCoords(PlayerPedId(),  true)
		TriggerServerEvent("dispatch:svNotify", {
			dispatchCode = "10-78",
			firstStreet = GetStreetAndZone(),
            name = exports["isPed"]:isPed("fullname"),
            number =  currentCallSign,
            priority = 2,
            isDead = false,
			dispatchMessage = "Panic Button",
			origin = {
				x = pos.x,
				y = pos.y,
				z = pos.z
            },
        })
		TriggerEvent('np-dispatch:policepanic')
	end
end)


RegisterNetEvent("police:tenForteenA")
AddEventHandler("police:tenForteenA", function()
	local myJob = exports["isPed"]:isPed("myJob")
	if myJob == 'police' or myJob == 'ems' or myJob == 'state' or myJob == 'sheriff' or myJob == 'ranger' then	
	local pos = GetEntityCoords(PlayerPedId(),  true)
		TriggerServerEvent("dispatch:svNotify", {
			dispatchCode = "10-14A",
			firstStreet = GetStreetAndZone(),
            name = exports["isPed"]:isPed("fullname"),
            number =  currentCallSign,
            priority = 1,
            isDead = true,
			dispatchMessage = "Medic Down URGENT!",
			origin = {
				x = pos.x,
				y = pos.y,
				z = pos.z
            },
        })
		TriggerEvent('np-dispatch:1014A')
	end
end)

RegisterNetEvent("police:tenForteenB")
AddEventHandler("police:tenForteenB", function()
	local myJob = exports["isPed"]:isPed("myJob")
	if myJob == 'police' or myJob == 'ems' or myJob == 'state' or myJob == 'sheriff' or myJob == 'ranger' then	
		local pos = GetEntityCoords(PlayerPedId(),  true)
		TriggerServerEvent("dispatch:svNotify", {
			dispatchCode = "10-14B",
			firstStreet = GetStreetAndZone(),
            name = exports["isPed"]:isPed("fullname"),
            number =  currentCallSign,
            priority = 2,
            isDead = false,
			dispatchMessage = "Medic Down",
			origin = {
				x = pos.x,
				y = pos.y,
				z = pos.z
            },
        })
		TriggerEvent('np-dispatch:1014B')
	end
end)


RegisterNetEvent('ems:panicbutton')
AddEventHandler('ems:panicbutton', function()
	local myJob = exports["isPed"]:isPed("myJob")
	if myJob == 'ems' then
		local pos = GetEntityCoords(PlayerPedId(),  true)
		TriggerServerEvent("dispatch:svNotify", {
			dispatchCode = "10-78",
			firstStreet = GetStreetAndZone(),
            name = exports["isPed"]:isPed("fullname"),
            number =  currentCallSign,
            priority = 2,
            isDead = false,
			dispatchMessage = "EMS Panic Button",
			origin = {
				x = pos.x,
				y = pos.y,
				z = pos.z
            },
        })
		TriggerEvent('np-dispatch:emspanic')
	end
end)

RegisterNetEvent("police:billpd")
AddEventHandler("police:billpd", function(amount)
    TriggerServerEvent("server:GroupPayment","police", amount)
end)

cruisecontrol = false

RegisterNetEvent('toggle:cruisecontrol')
AddEventHandler('toggle:cruisecontrol', function()

	local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	local driverPed = GetPedInVehicleSeat(currentVehicle, -1)

	if driverPed == PlayerPedId() then

		if cruisecontrol then
			SetEntityMaxSpeed(currentVehicle, 999.0)
			cruisecontrol = false
			TriggerEvent("DoLongHudText","Speed Limiter Inactive",5)
		else
			speed = GetEntitySpeed(currentVehicle)
			if speed > 15.0 then
			SetEntityMaxSpeed(currentVehicle, speed)
			cruisecontrol = true
				TriggerEvent("DoLongHudText","Speed Limiter Active",5)
			else
				TriggerEvent("DoLongHudText","Speed Limiter can only activate over 35mph",2)
			end
		end
	end
end)

function vehCruise()
	if GetLastInputMethod(2) then
		local isInVeh = IsPedInAnyVehicle(PlayerPedId(), false)
		if isInVeh then
			TriggerEvent("toggle:cruisecontrol")
		end
	end
end

function plyTackel()
	if GetLastInputMethod(2) then
		local isInVeh = IsPedInAnyVehicle(PlayerPedId(), false)
		if not isInVeh and GetEntitySpeed(PlayerPedId()) > 2.5 then
			TryTackle()
		end
	end
end

function policeCuff()
	if not inmenus and (isPolice or isState or isSheriff) and not IsPauseMenuActive() then
		local isInVeh = IsPedInAnyVehicle(PlayerPedId(), false)
		if isInVeh then
			TriggerEvent("platecheck:frontradar")
		else
			if not IsControlPressed(0,19) then
				TriggerEvent("police:cuffFromMenu",false)
			end
		end
	end
end

function medicRevive()
	if not inmenus and (isMedic or isDoctor or isDoc) and not IsPauseMenuActive() then
		TriggerEvent("revive")
	end
end

function emsHeal()
	if not inmenus and (isMedic or isDoctor or isDoc) and not IsPauseMenuActive() then
		TriggerEvent("ems:heal")
	end
end

function policeEscort()
	if not inmenus and (isMedic or isDoctor or isPolice or isState or isSheriff) and not IsPauseMenuActive() then
		local isInVeh = IsPedInAnyVehicle(PlayerPedId(), false)
		if isInVeh and (isPolice or isState or isSheriff) then
			TriggerEvent("startSpeedo")
		else
			TriggerEvent("escortPlayer") 
		end
	end
end

function policeSeat()
	if not inmenus and (isMedic or isPolice or isState or isSheriff) and not IsPauseMenuActive() then
		TriggerEvent("police:forceEnter")
	end
end

function policeUnCuff()
	if not inmenus and (isPolice or isState or isSheriff) and not IsPauseMenuActive() then
		local isInVeh = IsPedInAnyVehicle(PlayerPedId(), false)
		if isInVeh then
			TriggerEvent("platecheck:rearradar")
		else
			TriggerEvent("police:uncuffMenu")
		end
	end
end

function policeSoft()
	if not inmenus and (isPolice or isState or isSheriff) and not IsPauseMenuActive() then
		local isInVeh = IsPedInAnyVehicle(PlayerPedId(), false)
		if not isInVeh then
			TriggerEvent("police:cuffFromMenu",true)
		end
	end
end

Citizen.CreateThread(function()
	exports["np-binds"]:registerKeyMapping("", "Vehicle", "Cruise Control", "+vehCruise", "-vehCruise", "X")
	RegisterCommand('+vehCruise', vehCruise, false)
	RegisterCommand('-vehCruise', function() end, false)

	exports["np-binds"]:registerKeyMapping("", "Player", "Tackle", "+plyTackel", "-plyTackel")
	RegisterCommand('+plyTackel', plyTackel, false)
	RegisterCommand('-plyTackel', function() end, false)

	exports["np-binds"]:registerKeyMapping("", "Gov", "Cuff / Radar Front", "+policeCuff", "-policeCuff", "UP")
	RegisterCommand('+policeCuff', policeCuff, false)
	RegisterCommand('-policeCuff', function() end, false)

	exports["np-binds"]:registerKeyMapping("", "Gov", "EMS Revive", "+medicRevive", "-medicRevive")
	RegisterCommand('+medicRevive', medicRevive, false)
	RegisterCommand('-medicRevive', function() end, false)

	exports["np-binds"]:registerKeyMapping("", "Gov", "EMS Heal", "+emsHeal", "-emsHeal")
	RegisterCommand('+emsHeal', emsHeal, false)
	RegisterCommand('-emsHeal', function() end, false)

	exports["np-binds"]:registerKeyMapping("", "Gov", "Escort / Speedo", "+policeEscort", "-policeEscort", "LEFT")
	RegisterCommand('+policeEscort', policeEscort, false)
	RegisterCommand('-policeEscort', function() end, false)

	exports["np-binds"]:registerKeyMapping("", "Gov", "Force into Vehicle", "+policeSeat", "-policeSeat", "RIGHT")
	RegisterCommand('+policeSeat', policeSeat, false)
	RegisterCommand('-policeSeat', function() end, false)

	exports["np-binds"]:registerKeyMapping("", "Gov", "UnCuff / Radar Rear", "+policeUnCuff", "-policeUnCuff", "DOWN")
	RegisterCommand('+policeUnCuff', policeUnCuff, false)
	RegisterCommand('-policeUnCuff', function() end, false)

	exports["np-binds"]:registerKeyMapping("", "Gov", "Soft Cuff", "+policeSoft", "-policeSoft")
	RegisterCommand('+policeSoft', policeSoft, false)
	RegisterCommand('-policeSoft', function() end, false)

	exports["np-polytarget"]:AddBoxZone("pd_badge", vector3(484.85, -999.71, 30.69), 0.5, 0.8, {
        heading=0,
        minZ=27.54,
        maxZ=31.09
    })
        exports["np-interact"]:AddPeekEntryByPolyTarget("pd_badge", {{
        event = "police:get:badge",
        id = "pd_badge",
        icon = "id-badge",
        label = "Get PD Badge",
        parameters = {},
    }}, {
        distance = { radius = 3.0 },
        job = {"police"}
    });
	
end)

TimerEnabled = false

function TryTackle()
    if not TimerEnabled then
        t, distance = GetClosestPlayer()
        if(distance ~= -1 and distance < 2) then
            local maxheading = (GetEntityHeading(PlayerPedId()) + 15.0)
            local minheading = (GetEntityHeading(PlayerPedId()) - 15.0)
            local theading = (GetEntityHeading(t))

            TriggerServerEvent('CrashTackle',GetPlayerServerId(t))
            TriggerEvent("animation:tacklelol") 

            TimerEnabled = true
            Citizen.Wait(4500)
            TimerEnabled = false

        else
            TimerEnabled = true
            Citizen.Wait(1000)
            TimerEnabled = false

        end
    end
end

RegisterNetEvent('playerTackled')
AddEventHandler('playerTackled', function()
	SetPedToRagdoll(PlayerPedId(), math.random(8500), math.random(8500), 0, 0, 0, 0) 

	TimerEnabled = true
	Citizen.Wait(1500)
	TimerEnabled = false
end)

RegisterNetEvent('animation:tacklelol')
AddEventHandler('animation:tacklelol', function()

    if not handCuffed and not IsPedRagdoll(GetPlayerPed(-1)) then

        local lPed = GetPlayerPed(-1)

        RequestAnimDict("swimming@first_person@diving")
        while not HasAnimDictLoaded("swimming@first_person@diving") do
            Citizen.Wait(1)
        end
            
        if IsEntityPlayingAnim(lPed, "swimming@first_person@diving", "dive_run_fwd_-45_loop", 3) then
            ClearPedSecondaryTask(lPed)
        else
            TaskPlayAnim(lPed, "swimming@first_person@diving", "dive_run_fwd_-45_loop", 8.0, -8, -1, 49, 0, 0, 0, 0)
            seccount = 3
            while seccount > 0 do
                Citizen.Wait(100)
                seccount = seccount - 1
            end
            ClearPedSecondaryTask(lPed)
            SetPedToRagdoll(GetPlayerPed(-1), 150, 150, 0, 0, 0, 0) 
        end        
    end
end)




local isAllowedStang = true

local isAllowedVette = true

local isAllowedDemon = true 

	RegisterNetEvent("spawnHeat:Demon")
	AddEventHandler("spawnHeat:Demon", function(data)
		if exports["isPed"]:GroupRank("heat") >= 1 then
			if isAllowedDemon == true then
			if data.livery == 'SASP' then
			local vehHash = GetHashKey("npolchal")
			RequestModel(vehHash)
			while not HasModelLoaded(vehHash) do
				RequestModel(vehHash)
				Citizen.Wait(1)
			end
			local spawnCoord = vector3(462.4992, -1019.523, 28.103)
			local vHeading = 85.538
			CreateVehicle(vehHash ,spawnCoord.x, spawnCoord.y, spawnCoord.z, vHeading, true, false) 
			local veh = GetClosestVehicle(spawnCoord.x, spawnCoord.y, spawnCoord.z, 3.0, 0, 127)
			local vehplate = "HEAT"..math.random(10,99) .. "PD"
			SetVehicleNumberPlateText(veh, vehplate)
			TriggerEvent("vehicle:keys:addNew",veh, plate)
	
			SetVehicleModKit(veh, 0)
	
			SetVehicleMod(veh, 46, 4, true)
			SetVehicleMod(veh, 42, 2, true) 
			SetVehicleMod(veh, 44, 0, true) 
			SetVehicleMod(veh, 45, 7, true) 
			SetVehicleMod(veh, 48, 3, false)
	
			SetVehicleWindowTint(veh, 1)
			ToggleVehicleMod(veh,  22, true) 

			SetVehicleMod(veh, 15, 3, true)
	
	
			SetVehicleMod(veh, 6, 0, true) 
			SetVehicleMod(veh, 8, 6, true)
			SetVehicleMod(veh, 9, 9, true) 
	
			SetVehicleExtra(veh, 1, toggle)
			SetVehicleExtra(veh, 2, toggle)
			SetVehicleExtra(veh, 3, toggle)
			SetVehicleExtra(veh, 4, toggle)
			SetVehicleExtra(veh, 5, toggle)       
			SetVehicleExtra(veh, 6, toggle)
			SetVehicleExtra(veh, 7, toggle)
			SetVehicleExtra(veh, 8, toggle)
			isAllowedDemon = false
			TriggerEvent("DoLongHudText","You have spawned a Demon.")

		elseif data.livery == 'BCSO' then 
			local vehHash = GetHashKey("npolchal")
			RequestModel(vehHash)
			while not HasModelLoaded(vehHash) do
				RequestModel(vehHash)
				Citizen.Wait(1)
			end
			local spawnCoord = vector3(462.4992, -1019.523, 28.103)
			local vHeading = 85.538
			CreateVehicle(vehHash ,spawnCoord.x, spawnCoord.y, spawnCoord.z, vHeading, true, false) 
			local veh = GetClosestVehicle(spawnCoord.x, spawnCoord.y, spawnCoord.z, 3.0, 0, 127)
			local vehplate = "HEAT"..math.random(10,99) .. "PD"
			SetVehicleNumberPlateText(veh, vehplate)
			TriggerEvent("vehicle:keys:addNew",veh, plate)
	
			SetVehicleModKit(veh, 0)
	
			SetVehicleMod(veh, 46, 4, true)
			SetVehicleMod(veh, 42, 3, true) 
			SetVehicleMod(veh, 44, 0, true) 
			SetVehicleMod(veh, 45, 1, true) 
			SetVehicleMod(veh, 48, 1, false)
	
	
	
			SetVehicleMod(veh, 15, 3, true)
	
	
			SetVehicleMod(veh, 6, 0, true) 
			SetVehicleMod(veh, 8, 6, true)
			SetVehicleMod(veh, 9, 9, true) 
	
			SetVehicleExtra(veh, 1, toggle)
			SetVehicleExtra(veh, 2, toggle)
			SetVehicleExtra(veh, 3, toggle)
			SetVehicleExtra(veh, 4, toggle)
			SetVehicleExtra(veh, 5, toggle)       
			SetVehicleExtra(veh, 6, toggle)
			SetVehicleExtra(veh, 7, toggle)
			SetVehicleExtra(veh, 8, toggle)
			isAllowedDemon = false
			TriggerEvent("DoLongHudText","You have spawned a Demon.")
		elseif data.livery == 'LSPD' then 
			local vehHash = GetHashKey("npolchal")
			RequestModel(vehHash)
			while not HasModelLoaded(vehHash) do
				RequestModel(vehHash)
				Citizen.Wait(1)
			end
			local spawnCoord = vector3(462.4992, -1019.523, 28.103)
			local vHeading = 85.538
			CreateVehicle(vehHash ,spawnCoord.x, spawnCoord.y, spawnCoord.z, vHeading, true, false) 
			local veh = GetClosestVehicle(spawnCoord.x, spawnCoord.y, spawnCoord.z, 3.0, 0, 127)
			local vehplate = "HEAT"..math.random(10,99) .. "PD"
			SetVehicleNumberPlateText(veh, vehplate)
			TriggerEvent("vehicle:keys:addNew",veh, plate)
	
			SetVehicleModKit(veh, 0)
	
			SetVehicleMod(veh, 46, 4, true)
			SetVehicleMod(veh, 42, 1, true) 
			SetVehicleMod(veh, 44, 0, true) 
			SetVehicleMod(veh, 45, 1, true) 
			SetVehicleMod(veh, 48, 2, false)
	
	
	
			SetVehicleMod(veh, 15, 3, true)
	
	
			SetVehicleMod(veh, 6, 0, true) 
			SetVehicleMod(veh, 8, 6, true)
			SetVehicleMod(veh, 9, 9, true) 
	
			SetVehicleExtra(veh, 1, toggle)
			SetVehicleExtra(veh, 2, toggle)
			SetVehicleExtra(veh, 3, toggle)
			SetVehicleExtra(veh, 4, toggle)
			SetVehicleExtra(veh, 5, toggle)       
			SetVehicleExtra(veh, 6, toggle)
			SetVehicleExtra(veh, 7, toggle)
			SetVehicleExtra(veh, 8, toggle)
			isAllowedDemon = false
			TriggerEvent("DoLongHudText","You have spawned a Demon.")
		end
	else
		TriggerEvent("DoLongHudText","You already took out 1 Demon today!.",2)
	end
	end
	end)

	

RegisterNetEvent("spawnHeat:StangVariants")
AddEventHandler("spawnHeat:StangVariants", function(data)
	if exports["isPed"]:GroupRank("heat") >= 1 then
		if isAllowedStang == true then
		if data.livery == 'SASP' then
		local vehHash = GetHashKey("npolstang")
		RequestModel(vehHash)
		while not HasModelLoaded(vehHash) do
			RequestModel(vehHash)
			Citizen.Wait(1)
		end
		local spawnCoord = vector3(462.4992, -1019.523, 28.103)
		local vHeading = 85.538
		CreateVehicle(vehHash ,spawnCoord.x, spawnCoord.y, spawnCoord.z, vHeading, true, false) 
		local veh = GetClosestVehicle(spawnCoord.x, spawnCoord.y, spawnCoord.z, 3.0, 0, 127)
		local vehplate = "HEAT"..math.random(10,99) .. "PD"
		SetVehicleNumberPlateText(veh, vehplate)
		TriggerEvent("vehicle:keys:addNew",veh, plate)

        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 46, 4, true)	
		
		SetVehicleMod(veh, 42, 2, true)
		SetVehicleMod(veh, 44, 0, true)
		SetVehicleMod(veh, 45, 1, true)

		SetVehicleMod(veh, 48, 3, false)
		
		SetVehicleMod(veh, 6, 0, true)
		SetVehicleMod(veh, 15, 3, true)
		SetVehicleMod(veh, 0, 1, true) 
		SetVehicleMod(veh, 1, 2, true)
		SetVehicleMod(veh, 2, 2, true) 
		SetVehicleMod(veh, 3, 0, true) 
		SetVehicleMod(veh, 7, 4, true) 


		SetVehicleExtra(veh, 1, toggle)
		SetVehicleExtra(veh, 2, toggle)
		SetVehicleExtra(veh, 3, toggle)
		SetVehicleExtra(veh, 4, toggle)
		SetVehicleExtra(veh, 5, toggle)       
		SetVehicleExtra(veh, 6, toggle)
		SetVehicleExtra(veh, 7, toggle)
		SetVehicleExtra(veh, 8, toggle)

		isAllowedStang = false
		TriggerEvent("DoLongHudText","You have spawned a Mustang.")

	elseif data.livery == 'BCSO' then 
		local vehHash = GetHashKey("npolstang")
		RequestModel(vehHash)
		while not HasModelLoaded(vehHash) do
			RequestModel(vehHash)
			Citizen.Wait(1)
		end
		local spawnCoord = vector3(462.4992, -1019.523, 28.103)
		local vHeading = 85.538
		CreateVehicle(vehHash ,spawnCoord.x, spawnCoord.y, spawnCoord.z, vHeading, true, false) 
		local veh = GetClosestVehicle(spawnCoord.x, spawnCoord.y, spawnCoord.z, 3.0, 0, 127)
		local vehplate = "HEAT"..math.random(10,99) .. "PD"
		SetVehicleNumberPlateText(veh, vehplate)
		TriggerEvent("vehicle:keys:addNew",veh, plate)


        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 46, 4, true)	

		SetVehicleMod(veh, 42, 4, true)
		SetVehicleMod(veh, 44, 2, true)
		SetVehicleMod(veh, 45, 0, true)

		SetVehicleMod(veh, 48, 1, false)
		
		SetVehicleMod(veh, 6, 0, true)
		SetVehicleMod(veh, 15, 3, true)
		SetVehicleMod(veh, 0, 1, true) 
		SetVehicleMod(veh, 1, 2, true)
		SetVehicleMod(veh, 2, 2, true) 
		SetVehicleMod(veh, 3, 0, true) 
		SetVehicleMod(veh, 7, 4, true) 


		SetVehicleExtra(veh, 1, toggle)
		SetVehicleExtra(veh, 2, toggle)
		SetVehicleExtra(veh, 3, toggle)
		SetVehicleExtra(veh, 4, toggle)
		SetVehicleExtra(veh, 5, toggle)       
		SetVehicleExtra(veh, 6, toggle)
		SetVehicleExtra(veh, 7, toggle)
		SetVehicleExtra(veh, 8, toggle)

		isAllowedStang = false
		TriggerEvent("DoLongHudText","You have spawned a Mustang.")
	elseif data.livery == 'LSPD' then 
		local vehHash = GetHashKey("npolstang")
		RequestModel(vehHash)
		while not HasModelLoaded(vehHash) do
			RequestModel(vehHash)
			Citizen.Wait(1)
		end
		local spawnCoord = vector3(462.4992, -1019.523, 28.103)
		local vHeading = 85.538
		CreateVehicle(vehHash ,spawnCoord.x, spawnCoord.y, spawnCoord.z, vHeading, true, false) 
		local veh = GetClosestVehicle(spawnCoord.x, spawnCoord.y, spawnCoord.z, 3.0, 0, 127)
		local vehplate = "HEAT"..math.random(10,99) .. "PD"
		SetVehicleNumberPlateText(veh, vehplate)
		TriggerEvent("vehicle:keys:addNew",veh, plate)


        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 46, 4, true)	
		SetVehicleMod(veh, 42, 1, true)
		SetVehicleMod(veh, 44, 0, true)
		SetVehicleMod(veh, 45, 1, true)

        SetVehicleMod(veh, 48, 2, false) 
		
		SetVehicleMod(veh, 6, 0, true)
		SetVehicleMod(veh, 15, 3, true)
		SetVehicleMod(veh, 0, 1, true) 
		SetVehicleMod(veh, 1, 2, true)
		SetVehicleMod(veh, 2, 2, true) 
		SetVehicleMod(veh, 3, 0, true) 
		SetVehicleMod(veh, 7, 4, true) 


		SetVehicleExtra(veh, 1, toggle)
		SetVehicleExtra(veh, 2, toggle)
		SetVehicleExtra(veh, 3, toggle)
		SetVehicleExtra(veh, 4, toggle)
		SetVehicleExtra(veh, 5, toggle)       
		SetVehicleExtra(veh, 6, toggle)
		SetVehicleExtra(veh, 7, toggle)
		SetVehicleExtra(veh, 8, toggle)

		isAllowedStang = false
		TriggerEvent("DoLongHudText","You have spawned a Mustang.")
	end
else
	TriggerEvent("DoLongHudText","You already took out 1 Mustang today!.",2)
end
end
end)



RegisterNetEvent("spawnHeat:VetteVariants")
AddEventHandler("spawnHeat:VetteVariants", function(data)
	if exports["isPed"]:GroupRank("heat") >= 1 then
		if isAllowedVette == true then
		if data.livery == 'SASP' then
		local vehHash = GetHashKey("npolvette")
		RequestModel(vehHash)
		while not HasModelLoaded(vehHash) do
			RequestModel(vehHash)
			Citizen.Wait(1)
		end
		local spawnCoord = vector3(462.4992, -1019.523, 28.103)
		local vHeading = 85.538
		CreateVehicle(vehHash ,spawnCoord.x, spawnCoord.y, spawnCoord.z, vHeading, true, false) 
		local veh = GetClosestVehicle(spawnCoord.x, spawnCoord.y, spawnCoord.z, 3.0, 0, 127)
		local vehplate = "HEAT"..math.random(10,99) .. "PD"
		SetVehicleNumberPlateText(veh, vehplate)
		TriggerEvent("vehicle:keys:addNew",veh, plate)

		SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 46, 4, true)


		SetVehicleMod(veh, 0, 2, true)

		SetVehicleMod(veh, 6, 0, true)
		SetVehicleMod(veh, 15, 3, true)
		SetVehicleMod(veh, 1, 1, true)
		SetVehicleMod(veh, 3, 1, true)
			

		SetVehicleMod(veh, 42, 2, true) 
		SetVehicleMod(veh, 44, 0, true)
		SetVehicleMod(veh, 45, 6, true) 

        SetVehicleMod(veh, 48, 3, false)

		SetVehicleExtra(veh, 1, toggle)
		SetVehicleExtra(veh, 2, toggle)
		SetVehicleExtra(veh, 3, toggle)
		SetVehicleExtra(veh, 4, toggle)
		SetVehicleExtra(veh, 5, toggle)       
		SetVehicleExtra(veh, 6, toggle)
		SetVehicleExtra(veh, 7, toggle)
		SetVehicleExtra(veh, 8, toggle)
		isAllowedVette = false
		TriggerEvent("DoLongHudText","You have spawned a Corvette.")

	elseif data.livery == 'BCSO' then 
		local vehHash = GetHashKey("npolvette")
		RequestModel(vehHash)
		while not HasModelLoaded(vehHash) do
			RequestModel(vehHash)
			Citizen.Wait(1)
		end
		local spawnCoord = vector3(462.4992, -1019.523, 28.103)
		local vHeading = 85.538
		CreateVehicle(vehHash ,spawnCoord.x, spawnCoord.y, spawnCoord.z, vHeading, true, false) 
		local veh = GetClosestVehicle(spawnCoord.x, spawnCoord.y, spawnCoord.z, 3.0, 0, 127)
		local vehplate = "HEAT"..math.random(10,99) .. "PD"
		SetVehicleNumberPlateText(veh, vehplate)
		TriggerEvent("vehicle:keys:addNew",veh, plate)

		SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 46, 4, true)


		SetVehicleMod(veh, 0, 2, true)

		SetVehicleMod(veh, 6, 0, true)
		SetVehicleMod(veh, 15, 3, true)
		SetVehicleMod(veh, 1, 1, true)
		SetVehicleMod(veh, 3, 1, true)
			


		SetVehicleMod(veh, 42, 3, true) 
		SetVehicleMod(veh, 44, 0, true)
		SetVehicleMod(veh, 45, 1, true) 

        SetVehicleMod(veh, 48,1, false)

		SetVehicleExtra(veh, 1, toggle)
		SetVehicleExtra(veh, 2, toggle)
		SetVehicleExtra(veh, 3, toggle)
		SetVehicleExtra(veh, 4, toggle)
		SetVehicleExtra(veh, 5, toggle)       
		SetVehicleExtra(veh, 6, toggle)
		SetVehicleExtra(veh, 7, toggle)
		SetVehicleExtra(veh, 8, toggle)
		isAllowedVette = false
		TriggerEvent("DoLongHudText","You have spawned a Corvette.")
	elseif data.livery == 'LSPD' then 
		local vehHash = GetHashKey("npolvette")
		RequestModel(vehHash)
		while not HasModelLoaded(vehHash) do
			RequestModel(vehHash)
			Citizen.Wait(1)
		end
		local spawnCoord = vector3(462.4992, -1019.523, 28.103)
		local vHeading = 85.538
		CreateVehicle(vehHash ,spawnCoord.x, spawnCoord.y, spawnCoord.z, vHeading, true, false) 
		local veh = GetClosestVehicle(spawnCoord.x, spawnCoord.y, spawnCoord.z, 3.0, 0, 127)
		local vehplate = "HEAT"..math.random(10,99) .. "PD"
		SetVehicleNumberPlateText(veh, vehplate)
		TriggerEvent("vehicle:keys:addNew",veh, plate)

		SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 46, 4, true)


		SetVehicleMod(veh, 0, 2, true)

		SetVehicleMod(veh, 6, 0, true)
		SetVehicleMod(veh, 15, 3, true)
		SetVehicleMod(veh, 1, 1, true)
		SetVehicleMod(veh, 3, 1, true)
			

		SetVehicleMod(veh, 42, 1, true) 
		SetVehicleMod(veh, 44, 0, true)
		SetVehicleMod(veh, 45, 2, true) 

        SetVehicleMod(veh, 48, 2, false)

		SetVehicleExtra(veh, 1, toggle)
		SetVehicleExtra(veh, 2, toggle)
		SetVehicleExtra(veh, 3, toggle)
		SetVehicleExtra(veh, 4, toggle)
		SetVehicleExtra(veh, 5, toggle)       
		SetVehicleExtra(veh, 6, toggle)
		SetVehicleExtra(veh, 7, toggle)
		SetVehicleExtra(veh, 8, toggle)
		isAllowedVette = false
		TriggerEvent("DoLongHudText","You have spawned a Corvette.")
	end
else
	TriggerEvent("DoLongHudText","You already took out 1 Corvette today!.",2)
end
end
end)




	



-----Humane Lab ---------------------------

RegisterNetEvent('humane:lowerFloorTp')
AddEventHandler('humane:lowerFloorTp', function()
  DoScreenFadeOut(1)
  Citizen.Wait(100)
  SetEntityCoords(PlayerPedId(),3540.403, 3674.875, 20.9918)
  DoScreenFadeIn(1000)
  Citizen.Wait(1000)
end)

RegisterNetEvent('humane:upperFloorTp')
AddEventHandler('humane:upperFloorTp', function()
  DoScreenFadeOut(1)
  Citizen.Wait(100)
  SetEntityCoords(PlayerPedId(),3540.722, 3675.159, 28.12114)
  DoScreenFadeIn(1000)
  Citizen.Wait(1000)
end)

-----FIB building ---------------------------

RegisterNetEvent('fib:47FloorTp')
AddEventHandler('fib:47FloorTp', function()
  DoScreenFadeOut(1)
  Citizen.Wait(100)
  SetEntityCoords(PlayerPedId(),136.2636, -761.9683, 234.152)
  DoScreenFadeIn(1000)
  Citizen.Wait(1000)
end)

RegisterNetEvent('fib:GroundFloorTp')
AddEventHandler('fib:GroundFloorTp', function()
  DoScreenFadeOut(1)
  Citizen.Wait(100)
  SetEntityCoords(PlayerPedId(),136.1349, -761.8865, 45.75204)
  DoScreenFadeIn(1000)
  Citizen.Wait(1000)
end)

--// Evidence Room

local isNearvoidPDEvidence = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_evidence_spot", vector3(473.95, -994.79, 26.27), 6, 4.5, {
		name="void_evidence_spot",
		heading=0,
		--debugPoly=true,
		minZ=24.27,
		maxZ=28.27
    }) 
end)


RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_evidence_spot" then
        local job = exports["isPed"]:isPed("myjob")
        if job == "police" or job == "sheriff" or job == "state" or job == "ranger" then
            isNearvoidPDEvidence = true
			exports['np-interface']:showInteraction('/evidence [number]')
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_evidence_spot" then
        isNearvoidPDEvidence = false
    end
	exports['np-interface']:hideInteraction()
end)



RegisterCommand("evidence", function(source, args)
	local job = exports["isPed"]:isPed("myjob")
	if job == 'police' or job == 'state' or job == 'sheriff' or job == 'ranger' then
		if isNearvoidPDEvidence then
			TriggerEvent("server-inventory-open", "1", "CASE ID: "..args[1])
			TriggerServerEvent('np-police:log_evidence_lockers', args[1])
		else
			TriggerEvent("DoLongHudText", "You are not near the evidence spot!", 2)
		end
	end
end)

--// Personal PD Lockers

RegisterNetEvent('void-personal-pd-locker')
AddEventHandler('void-personal-pd-locker', function()
	local cid = exports["isPed"]:isPed("cid")
	TriggerEvent("server-inventory-open", "1", "personalMRPD-"..cid)
end)

RegisterNetEvent('void-pd-options')
AddEventHandler('void-pd-options', function()
	local Police = {
		{
			title = "Personal PD Locker",
			description = "Personal 🔒",
			key = "PD",
			action = 'np-police:lock',
		},
		{
			title = "Clothing Shop",
			description = "Get the PD Drip",
			key = "PD",
			action = 'np-police:cloth',
		}
	}
	exports["np-interface"]:showContextMenu(Police)
end)

RegisterInterfaceCallback('np-police:lock', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('void-personal-pd-locker')
end)

RegisterInterfaceCallback('np-police:cloth', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('np-police:clothing_menu')
end)

RegisterNetEvent('np-police:clothing_menu')
AddEventHandler('np-police:clothing_menu', function()
	TriggerEvent('raid_clothes:police:open', 'clothing_shop')
end)

local isNearPersonalOrClothing = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_mrpd_clothing_or_locker", vector3(461.5, -997.7, 30.69), 4.9, 5.0, {
		name="void_mrpd_clothing_or_locker",
		heading=0,
		--debugPoly=true,
		minZ=28.69,
		maxZ=32.69
    }) 
end)


RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_mrpd_clothing_or_locker" then
        local job = exports["isPed"]:isPed("myjob")
        if job == "police" or job == "sheriff" or job == "state" or job == 'ranger' then
			voidPDShit()
            isNearPersonalOrClothing = true
			exports['np-interface']:showInteraction('[E] Police Changing Room')
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_mrpd_clothing_or_locker" then
        isNearPersonalOrClothing = false
    end
	exports['np-interface']:hideInteraction()
end)

function voidPDShit()
	Citizen.CreateThread(function()
        while isNearPersonalOrClothing do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				TriggerEvent('void-pd-options')
			end
		end
	end)
end

-- Armory

ArmoryCuzzy = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("police_armory_void_rp", vector3(482.66, -995.69, 31.67), 2, 1.6, {
        name="police_armory_void_rp",
        heading=270,
		--debugPoly=true,
		minZ=27.67,
		maxZ=31.67
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "police_armory_void_rp" then
        ArmoryCuzzy = true     
		local myJob = exports["isPed"]:isPed("myJob")
		if myJob == 'police' or myJob == 'state' or myJob == 'sheriff' or myJob == 'ranger' then
			ArmoryPD()
            exports['np-interface']:showInteraction("[E] Armory")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "police_armory_void_rp" then
        ArmoryCuzzy = false
        exports['np-interface']:hideInteraction()
    end
end)

function ArmoryPD()
	Citizen.CreateThread(function()
        while ArmoryCuzzy do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				TriggerEvent('police:general')
			end
		end
	end)
end

-- // State HQ

local StateHQLockerORClothing = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_state_hq_locker", vector3(361.75, -1593.02, 25.45), 3, 2.6, {
		name="void_state_hq_locker",
		heading=320,
		--debugPoly=true,
		minZ=23.45,
		maxZ=27.45
    }) 
end)


RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_state_hq_locker" then
        local job = exports["isPed"]:isPed("myjob")
        if job == "police" or job == "sheriff" or job == "state" or job == 'ranger' then
			voidHQPdShit()
            StateHQLockerORClothing = true
			exports['np-interface']:showInteraction('[E] Police Changing Room')
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_state_hq_locker" then
        StateHQLockerORClothing = false
    end
	exports['np-interface']:hideInteraction()
end)

function voidHQPdShit()
	Citizen.CreateThread(function()
        while StateHQLockerORClothing do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				TriggerEvent('void-pd-options')
			end
		end
	end)
end

--// State HQ Armory

ArmoryCuzzy = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("police_armory_void_rp_2", vector3(364.16, -1603.62, 25.45), 2, 2, {
        name="police_armory_void_rp_2",
		heading=320,
		--debugPoly=true,
		minZ=22.65,
		maxZ=26.65
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "police_armory_void_rp_2" then
        ArmoryCuzzy2 = true     
		local myJob = exports["isPed"]:isPed("myJob")
		if myJob == 'police' or myJob == 'state' or myJob == 'sheriff' or myJob == 'ranger' then
			ArmoryPD2()
            exports['np-interface']:showInteraction("[E] Armory")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "police_armory_void_rp_2" then
        ArmoryCuzzy2 = false
        exports['np-interface']:hideInteraction()
    end
end)

function ArmoryPD2()
	Citizen.CreateThread(function()
        while ArmoryCuzzy2 do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				TriggerEvent('police:general')
			end
		end
	end)
end

--// Sandy PD Armory
local SheriffLockerORClothing = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_sheriff_hq_locker", vector3(1842.25, 3679.6, 34.19), 3.0, 2.4, {
		name="void_sheriff_hq_locker",
		heading=320,
		--debugPoly=true,
		
    }) 
end)


RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_sheriff_hq_locker" then
        local job = exports["isPed"]:isPed("myjob")
        if job == "police" or job == "sheriff" or job == "state" or job == 'ranger' then
			voidHQPdShit()
            SheriffLockerORClothing = true
			exports['np-interface']:showInteraction('[E] Sheriff Changing Room')
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_sheriff_hq_locker" then
        SheriffLockerORClothing = false
    end
	exports['np-interface']:hideInteraction()
end)

function voidHQPdShit()
	Citizen.CreateThread(function()
        while SheriffLockerORClothing do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				TriggerEvent('void-pd-options')
			end
		end
	end)
end
SandyArmory = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("police_armory_sandy",vector3(1836.2984, 3687.0168, 34.189254), 3, 1.1, {
        name="police_armory_void_rp_2",
		heading=30,
		--debugPoly=true,
		minZ=32.02,
		maxZ=36.02
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "police_armory_sandy" then
        SandyArmory = true     
		local myJob = exports["isPed"]:isPed("myJob")
		if myJob == 'police' or myJob == 'state' or myJob == 'sheriff' or myJob == 'ranger' then
			ArmoryPD3()
            exports['np-interface']:showInteraction("[E] Armory")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "police_armory_sandy" then
        SandyArmory = false
        exports['np-interface']:hideInteraction()
    end
end)

function ArmoryPD3()
	Citizen.CreateThread(function()
        while SandyArmory do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				TriggerEvent('police:general')
			end
		end
	end)
end

--// METAL DETECTOR FOR COURT ROOM LOL bored man

local WalkedTrough = true

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("metaldetect_court:1", vector3(241.3, -1079.17, 29.29), 1.0, 1.2, {
        name="metaldetect_court:1",
		heading=271,
		--debugPoly=true,

    })

	exports["np-polyzone"]:AddBoxZone("metaldetect_court:2", vector3(245.65, -1079.15, 29.29), 1.0, 1.0, {
        name="metaldetect_court:2",
		heading=271,
		--debugPoly=true,

    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
	local mycid = exports["isPed"]:isPed("cid")

    if name == "metaldetect_court:1" or name == "metaldetect_court:2" and WalkedTrough == true then
		    WalkedTrough = false  
			-- print('In metal detector : Remove weapons')
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'metaldetector', 0.1)
			TriggerServerEvent('server-jail-item', 'ply-'..mycid, true)
			Wait(5000)
			TriggerEvent('DoLongHudText' , "Your Item's have been placed in a bag , Collect them on the way out ! ",2)
			WalkedTrough = true  
        end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "metaldetect_court:1" or name == "metaldetect_court:2"  then
		Wait(5000)
		WalkedTrough = true 
    end
end)

RegisterNetEvent('courthouse:getitems')
AddEventHandler('courthouse:getitems', function(table)
    local mycid = exports["isPed"]:isPed("cid")
    TriggerServerEvent("server-jail-item", 'ply-'..mycid, false)
    TriggerEvent("DoLongHudText", "You Retrieved Your Item's.")
end)


-- Collect Items

local isNearCourthouseGuy = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_courthouse_guy", vector3(244.88, -1075.6, 29.29), 1, 1, {
		name="void_courthouse_guy",
		heading=330,
		--debugPoly=true,
		minZ=26.29,
		maxZ=30.29
    }) 
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_courthouse_guy" then
		isNearCourthouseGuy = true
		VoidCourthouse()
		exports['np-interface']:showInteraction('[E] Collect Items')
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_courthouse_guy" then
        isNearCourthouseGuy = false
    end
	exports['np-interface']:hideInteraction()
end)

function VoidCourthouse()
	Citizen.CreateThread(function()
        while isNearCourthouseGuy do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
				TriggerEvent('courthouse:getitems')
			end
		end
	end)
end

RegisterNetEvent('police:spawnshitheli')
AddEventHandler('police:spawnshitheli', function()
    if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'ranger' or exports["isPed"]:isPed("myJob") == 'state' then
	    local vehicle = veh
	    local veh = GetVehiclePedIsUsing(ped)

	    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))

	    FreezeEntityPosition(ped,false)
	    RequestModel('polas350')
	    while not HasModelLoaded('polas350') do
		    Citizen.Wait(0)
	    end
	    personalvehicle = CreateVehicle('polas350',449.39340209961, -981.16485595703, 43.686401367188, 87.874015808105,true,false)
	    SetModelAsNoLongerNeeded('polas350')

	    SetVehicleOnGroundProperly(personalvehicle)

	    local plate = GetVehicleNumberPlateText(personalvehicle)
	    local id = NetworkGetNetworkIdFromEntity(personalvehicle)
	    SetNetworkIdCanMigrate(id, true)
	    Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
	    TaskWarpPedIntoVehicle(PlayerPedId(),personalvehicle,-1)
	    SetEntityVisible(ped,true)			
	    TriggerEvent("vehicle:keys:addNew",personalvehicle, plate)
    else
        TriggerEvent('DoShortHudText', 'You are not a cop ',2)
    end
end)

RegisterNetEvent('sheriff:spawnshitheli')
AddEventHandler('sheriff:spawnshitheli', function()
    if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'ranger' or exports["isPed"]:isPed("myJob") == 'state' then
	    local vehicle = veh
	    local veh = GetVehiclePedIsUsing(ped)

	    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))

	    FreezeEntityPosition(ped,false)
	    RequestModel('polas350')
	    while not HasModelLoaded('polas350') do
		    Citizen.Wait(0)
	    end
	    personalvehicle = CreateVehicle('polas350',1852.8284, 3706.5158, 33.974636, 318.3302,true,false)
	    SetModelAsNoLongerNeeded('polas350')

	    SetVehicleOnGroundProperly(personalvehicle)

	    local plate = GetVehicleNumberPlateText(personalvehicle)
	    local id = NetworkGetNetworkIdFromEntity(personalvehicle)
	    SetNetworkIdCanMigrate(id, true)
	    Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
	    TaskWarpPedIntoVehicle(PlayerPedId(),personalvehicle,-1)
	    SetEntityVisible(ped,true)			
	    TriggerEvent("vehicle:keys:addNew",personalvehicle, plate)
    else
        TriggerEvent('DoShortHudText', 'You are not a cop ',2)
    end
end)
RegisterNetEvent('ems:spawnshitheli')
AddEventHandler('ems:spawnshitheli', function()
    if exports["isPed"]:isPed("myJob") == 'ems' then
	    local vehicle = veh
	    local veh = GetVehiclePedIsUsing(ped)

	    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))

	    FreezeEntityPosition(ped,false)
	    RequestModel('emsaw139')
	    while not HasModelLoaded('emsaw139') do
		    Citizen.Wait(0)
	    end
	    personalvehicle = CreateVehicle('emsaw139',351.90618, -588.9981, 74.161788, 20.487018,true,false)
	    SetModelAsNoLongerNeeded('emsaw139')
		vector3(351.90618, -588.9981, 74.161788)
	    SetVehicleOnGroundProperly(personalvehicle)

	    local plate = GetVehicleNumberPlateText(personalvehicle)
	    local id = NetworkGetNetworkIdFromEntity(personalvehicle)
	    SetNetworkIdCanMigrate(id, true)
	    Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
	    TaskWarpPedIntoVehicle(PlayerPedId(),personalvehicle,-1)
	    SetEntityVisible(ped,true)			
	    TriggerEvent("vehicle:keys:addNew",personalvehicle, plate)
    else
        TriggerEvent('DoShortHudText', 'You are not a cop ',2)
    end
end)
-- emsaw139

RegisterNetEvent('np-police:fake_id')
AddEventHandler('np-police:fake_id', function()
	exports['np-interface']:openApplication('textbox', {
		callbackUrl = 'np-police:create_id',
		key = 1,
		items = {
		{
			icon = "id-card-alt",
			label = "First Name",
			name = "FirstName",
		},
		{
			icon = "id-card-alt",
			label = "Second Name",
			name = "SecondName",
		},
		{
			icon = "calendar-alt",
			label = "DOB",
			name = "DateOfBirth",
		},
		{
			icon = "people-arrows",
			label = "Male or Female",
			name = "Gender",
		},
		},
		show = true,
	})
end)

RegisterInterfaceCallback('np-police:create_id', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
	local information = {
		["FirstName"] = data.values.FirstName,
		["Surname"] = data.values.SecondName,
		["dob"] = data.values.DateOfBirth,
		["sex"] = data.values.Gender,
	  }
	TriggerEvent("player:receiveItem", "fakeid", 1, true, information)
end)

RegisterNetEvent('np-police:id_make_yes')
AddEventHandler('np-police:id_make_yes', function()
	TriggerServerEvent('np-police:make_id')
end)

-- RegisterNetEvent('np-police:requestimpound')
-- AddEventHandler('np-police:requestimpound', function()
-- 		TriggerEvent('DoShortHudText', 'You have requested an impound')
-- 		TriggerServerEvent('np-police:requestimpound')
-- end)

-- RegistrerNetEvent('np-police:requestimpound_yes')
-- AddEventHandler('np-police:requestimpound_yes', function()
-- 		TriggerServerEvent('np-police:requestimpound_yes')
-- 		local pd_tow = exports["np-duty"]:LawAmount()
--         if pd_tow >= 1 then
-- 			--TODO WHEN EVAN WAKE UP
-- end)

RegisterNetEvent('police:RifleRack')
AddEventHandler('police:RifleRack', function()
	local rackNumber = GetVehicleNumberPlateText(GetVehiclePedIsUsing(PlayerPedId()))
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'ranger' or exports["isPed"]:isPed("myJob") == 'state' then
		local finished = exports["np-taskbar"]:taskBar(1000,"Unlocking rifle rack..",false,true)
		if finished == 100 then
			TriggerEvent("server-inventory-open", "1", "pdrifle-rack"..rackNumber)
		end
	end
end)

-- PD Boat --

RegisterCommand('pdboat', function()
	if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'ranger' or exports["isPed"]:isPed("myJob") == 'state' then
		local vehicle = veh
		local veh = GetVehiclePedIsUsing(ped)
		local plyCoord = GetEntityCoords(PlayerPedId())

		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
		
		RequestModel('predator')
		while not HasModelLoaded('predator') do
			Citizen.Wait(0)
		end
		personalvehicle = CreateVehicle('predator', plyCoord.x, plyCoord.y, plyCoord.z,true,false)
		SetModelAsNoLongerNeeded('predator')

		SetVehicleOnGroundProperly(personalvehicle)

		local plate = GetVehicleNumberPlateText(personalvehicle)
		local id = NetworkGetNetworkIdFromEntity(personalvehicle)
		SetNetworkIdCanMigrate(id, true)
		Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
		TaskWarpPedIntoVehicle(PlayerPedId(),personalvehicle,-1)
		SetEntityVisible(ped,true)			
		TriggerEvent("vehicle:keys:addNew",personalvehicle, plate)
    end
end)

RegisterNetEvent('np-police:get_percent')
AddEventHandler('np-police:get_percent', function(pNum)
	TriggerServerEvent('zyloz:payout', pNum)
end)