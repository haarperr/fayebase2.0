local IsBusy = false

RegisterNetEvent("np-ems:smallheal")
AddEventHandler("np-ems:smallheal", function()
	if IsBusy then return end

    local closestPlayer, closestDistance = GetClosestPlayer()

    if closestPlayer == -1 or closestDistance > 2.0 then
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
	else
					
    	IsBusy = true
 
		local closestPlayerPed = GetPlayerPed(closestPlayer)
		local health = GetEntityHealth(closestPlayerPed)

		if health > 0 then
			local playerPed = PlayerPedId()
	
			IsBusy = true
			TriggerEvent('DoLongHudText', 'Small Healing In Progress.', 1)
			TriggerEvent("animation:PlayAnimation","layspike")
			Citizen.Wait(2000)
			ClearPedTasks(playerPed)
	
			TriggerServerEvent('np-ems:heal', GetPlayerServerId(closestPlayer))

			TriggerEvent('DoLongHudText', 'You have successfully healed player.', 1)
			IsBusy = false
		else
			TriggerEvent('DoLongHudText', 'Player is conscious please take them to pillbox to get further treatment!', 2)
		end
	end
end)

RegisterNetEvent("np-ems:bigheal")
AddEventHandler("np-ems:bigheal", function()
	if IsBusy then return end

    local closestPlayer, closestDistance = GetClosestPlayer()

    if closestPlayer == -1 or closestDistance > 2.0 then
        TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
    else
        
        IsBusy = true
 
		local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetEntityHealth(closestPlayerPed)
        
		if health > 0 then
			local playerPed = PlayerPedId()
	
			IsBusy = true
			TriggerEvent('DoLongHudText', 'Big Healing In Progress.', 1)
			TriggerEvent("animation:PlayAnimation","layspike")
			Citizen.Wait(2000)
			ClearPedTasks(playerPed)
	
			TriggerServerEvent('np-ems:heal2', GetPlayerServerId(closestPlayer))
	
			TriggerEvent('DoLongHudText', 'You have successfully healed player.', 1)
			IsBusy = false
		else
			TriggerEvent('DoLongHudText', 'Player is conscious please take them to pillbox to get further treatment!', 2)
		end
	end
end)


RegisterNetEvent("np-ems:emsRevive")
AddEventHandler("np-ems:emsRevive", function()
	if IsBusy then return end

    local closestPlayer, closestDistance = GetClosestPlayer()
    if closestPlayer == -1 or closestDistance > 2.0 then
		TriggerEvent('DoLongHudText', 'No player near you (maybe get closer)!', 2)
    else
                    
		local closestPlayerPed = GetPlayerPed(closestPlayer)
	
		if IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_a", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_b", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_c", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_d", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_e", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_f", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_g", 3) or IsEntityPlayingAnim(closestPlayerPed, "dead", "dead_h", 3)then
			local playerPed = PlayerPedId()

				IsBusy = true
				TriggerEvent('DoLongHudText', 'Revive in Progress', 1)
	
				TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
				Citizen.Wait(10000)
				ClearPedTasks(playerPed)
				TriggerServerEvent('np-death:reviveSV', GetPlayerServerId(closestPlayer))
				TriggerEvent('DoLongHudText', 'You have revived '.. GetPlayerName(closestPlayer)..' and earned $50', 1)
				TriggerServerEvent('payslip:add', 50)
				TriggerServerEvent("server:GroupPayment", "ems", 50)
				TriggerEvent('DoLongHudText', 'You have successfully revived player.', 1)
				IsBusy = false
			else
			TriggerEvent('DoLongHudText', 'Player is conscious please take them to pillbox to get further treatment!', 2)
		end
    end
end)


RegisterNetEvent('np-ems:heal')
AddEventHandler('np-ems:heal', function(target)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)
    local health = GetEntityHealth(playerPed)
    local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 10))
    SetEntityHealth(playerPed, newHealth)
    TriggerEvent('np-hospital:client:RemoveBleed')
	TriggerEvent('DoLongHudText', 'You have been healed!', 1)
end)


RegisterNetEvent('np-ems:big')
AddEventHandler('np-ems:big', function(target)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)
    local health = GetEntityHealth(playerPed)
    local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 10))
    SetEntityHealth(playerPed, newHealth)
    TriggerEvent('np-hospital:client:RemoveBleed')
    TriggerEvent('np-hospital:client:ResetLimbs')
	TriggerEvent('DoLongHudText', 'You have been healed!', 1)
end)

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
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