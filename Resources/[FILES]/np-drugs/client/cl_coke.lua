local CokePlaneSpawnsDreamsRP = {		
	[1] =  { ['x'] = -1648.8000488281, ['y'] = -3144.8703613281, ['z'] = 13.980224609375, ['h'] = 328.81890869141, ['info'] = ' Cocaine Plane Spawn Location 1' },
    [2] =  { ['x'] = -984.75164794922, ['y'] = -3016.1538085938, ['z'] = 14.283569335938, ['h'] = 53.858268737793, ['info'] = ' Cocaine Plane Spawn Location 2' },
    [3] =  { ['x'] = 1732.3121337891, ['y'] = 3311.3669433594, ['z'] = 41.563354492188, ['h'] = 192.75592041016, ['info'] = ' Cocaine Plane Spawn Location 3' },
}

function DreamsCokeCreatingPlane()
	if DoesEntityExist(DreamsCokePlane) then
	    SetVehicleHasBeenOwnedByPlayer(DreamsCokePlane,false)
		SetEntityAsNoLongerNeeded(DreamsCokePlane)
		DeleteEntity(DreamsCokePlane)
	end

    local plane = GetHashKey("duster")
    RequestModel(plane)
    while not HasModelLoaded(plane) do
        Citizen.Wait(0)
    end

    SpawnPlane = math.random(1,#CokePlaneSpawnsDreamsRP)
    local x = CokePlaneSpawnsDreamsRP[SpawnPlane]["x"]
    local y = CokePlaneSpawnsDreamsRP[SpawnPlane]["y"]
    local z = CokePlaneSpawnsDreamsRP[SpawnPlane]["z"]
    local h = CokePlaneSpawnsDreamsRP[SpawnPlane]["h"]
    print(SpawnPlane)
    SetNewWaypoint(x, y)

    DreamsCokePlane = CreateVehicle(plane, x, y, z, h, true, false)
    local plate = GetVehicleNumberPlateText(DreamsCokePlane)
    TriggerEvent("keys:addNew",plane,plate)

	local pos = GetEntityCoords(DreamsCokePlane, false)
    Citizen.CreateThread(function()
        while true do
          Citizen.Wait(5)
          if GetVehiclePedIsIn(PlayerPedId(), false) == DreamsCokePlane then
            VoidCocaineDropLocation()
            return
          end
        end
    end)
end

local DreamsRPCanDropOffPlane = false

function VoidCocaineDropLocation()
    TriggerEvent('np-dispatch:unauthorised_aircraft')
    TriggerEvent('phone:addJobNotify', "Get in the plane head to the drop location.")
    Citizen.Wait(math.random(20000, 30000))
    TriggerEvent('phone:addJobNotify', "I marked the spot make sure the police aint around.")
    DreamsRPCanDropOffPlane= true
    SetNewWaypoint(-2235.8901367188, 3273.1647949219)
end

--// Polyzones

DreamsCokePlaneDrop = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("dreams_cocaine_plane_drop_off", vector3(-2238.35, 3274.98, 32.81), 20, 21.8, {
        name="dreams_cocaine_plane_drop_off",
        heading=330,
        --debugPoly=true,
        minZ=31.61,
        maxZ=35.61
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "dreams_cocaine_plane_drop_off" and DreamsRPCanDropOffPlane and GetVehiclePedIsIn(PlayerPedId(), false) == DreamsCokePlane then
        DreamsCokePlaneDrop = true     
        DreamsCocaineDrop()
		exports['np-interface']:showInteraction("[E] Drop Off Plane")
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "dreams_cocaine_plane_drop_off" then
        DreamsCokePlaneDrop = false
        exports['np-interface']:hideInteraction()
    end
end)

function DreamsCocaineDrop()
	Citizen.CreateThread(function()
        while DreamsCokePlaneDrop do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local finishedcoke = exports['np-taskbar']:taskBar(7500, 'Dropping off plane')
                if (finishedcoke == 100) then
                    exports['np-interface']:hideInteraction()
                    DeleteEntity(DreamsCokePlane)
                    TriggerEvent('phone:addJobNotify', "Drop Off Successful Take this - Anon")
                    TriggerEvent('player:receiveItem', 'coke50g', math.random(1, 3))
                    DreamsRPCanDropOffPlane = false
                    DreamsCokePlaneDrop = false
                end
			end
		end
	end)
end

--// Start Location

DreamsCocaineStart = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("dreams_cocaine_plane_start", vector3(839.42, 2176.75, 52.29), 1, 1.2, {
        name="dreams_cocaine_plane_start",
        heading=330,
        --debugPoly=true,
        minZ=49.69,
        maxZ=53.69
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "dreams_cocaine_plane_start" then
        DreamsCocaineStart = true     
        DreamsCocaineStart2()
		exports['np-interface']:showInteraction("[E] Talk")
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "dreams_cocaine_plane_start" then
        DreamsCocaineStart = false
        exports['np-interface']:hideInteraction()
    end
end)

function DreamsCocaineStart2()
	Citizen.CreateThread(function()
        while DreamsCocaineStart do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                TriggerServerEvent('dreams-cocaine:plane:start', 25000)
			end
		end
	end)
end

RegisterNetEvent('dreams-cocaine:shitfuckoff')
AddEventHandler('dreams-cocaine:shitfuckoff', function()
    TriggerEvent('phone:addJobNotify', "Ive updated your GPS Head over there !")
    DreamsCokeCreatingPlane()
end)

RegisterNetEvent("cokebaggy:menu")
AddEventHandler("cokebaggy:menu", function()
	TriggerEvent('np-context:sendMenu', {
		{
			id = "1",
			header = "Clean Coke Baggies",
			txt = "Clean your Coke Baggies",
			params = {
				event = "np-jobs:fishing_sell:cokebaggy",
			}
		},
		{
			id = "2",
			header = "Close Menu",
			txt = "Close menu",
			params = {
				event = "",
			}
		},
	})
end)

RegisterNetEvent('sellcoke')
AddEventHandler('sellcoke', function()
    local pSellCokeAmount = exports["np-applications"]:KeyboardInput({
        header = "How Much Coke Baggies you want to sell?",
        rows = {
        {
            id = 0,
            txt = "Input How Much Baggies You Want To Sell"
        }
        }
    })
    if pSellCokeAmount[1] ~= nil then
        if exports['np-inventory']:hasEnoughOfItem('coke5g', pSellCokeAmount[1].input) then
            FreezeEntityPosition(PlayerPedId(), true)
            local finished = exports['np-taskbar']:taskBar(1000*pSellCokeAmount[1].input, 'Selling coke baggies')
            if finished == 100 then
                if exports['np-inventory']:hasEnoughOfItem('coke5g', pSellCokeAmount[1].input) then
                    TriggerEvent('inventory:removeItem', 'coke5g', pSellCokeAmount[1].input)
					TriggerServerEvent( 'zyloz:payout', math.random(315,385)*pSellCokeAmount[1].input)
                    FreezeEntityPosition(PlayerPedId(), false)
                else
                    FreezeEntityPosition(PlayerPedId(), false)
                    TriggerEvent('DoLongHudText', 'Might wanna try again', 2)
                end
            end
        end
    end
end)

-- RegisterNetEvent('sellcoketemp')
-- AddEventHandler('sellcoketemp', function()
--     if exports["np-inventory"]:hasEnoughOfItem("coke5g",5,false) then
--         FreezeEntityPosition(PlayerPedId(), true)
--         local finished = exports["np-taskbar"]:taskBar(1000,"selling coke you criminal SHAME")
--         if finished == 100 then
--             FreezeEntityPosition(PlayerPedId(), false)
--             TriggerEvent('inventory:removeItem', 'coke5g', 5)
--             TriggerServerEvent('zyloz:payout', math.random(315,1925))
--             TriggerEvent('DoLongHudText', 'You successfully sold a baggie', 1)
--         else
--             TriggerEvent('DoLongHudText', 'Cancelled', 2)
--         end

--     else
--         TriggerEvent('DoLongHudText', 'You dont have coke', 2)
--     end
-- end)