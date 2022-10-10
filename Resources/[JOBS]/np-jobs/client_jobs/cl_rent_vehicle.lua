local vehicleList = {
  { name = "Bison", model = "bison", price = 150 },
  { name = "Futo", model = "futo", price = 200 },
  { name = "Buffalo", model = "buffalo", price = 300 },
  { name = "Jackal", model = "jackal", price = 350 },
  { name = "Sultan", model = "sultan", price = 350 },
  { name = "Youga", model = "youga", price = 200 },
  { name = "Faggio", model = "faggio", price = 75 },
}

RegisterNetEvent("np-rentals:attemptvehiclespawnfail")
AddEventHandler("np-rentals:attemptvehiclespawnfail", function()
    TriggerEvent("DoLongHudText", "Not enough money!", 2)
end)

RegisterNetEvent("np-rentals:vehiclespawn")
AddEventHandler("np-rentals:vehiclespawn", function(data, cb)

  print(data)

  local model = data

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  local rentalVehiclevoidRP = CreateVehicle(model, vector4(117.84,-1079.95,29.23,355.92), true, false)

  Citizen.Wait(100)

  SetEntityAsMissionEntity(rentalVehiclevoidRP, true, true)
  SetModelAsNoLongerNeeded(model)
  SetVehicleOnGroundProperly(rentalVehiclevoidRP)

  TaskWarpPedIntoVehicle(PlayerPedId(), rentalVehiclevoidRP, -1)
  SetVehicleNumberPlateText(rentalVehiclevoidRP, "Rental"..tostring(math.random(1000, 9999)))
  TriggerEvent("vehicle:keys:addNew",rentalVehiclevoidRP,plate)

  local plateText = GetVehicleNumberPlateText(rentalVehiclevoidRP)
  local player = exports["np-base"]:getModule("LocalPlayer")
  
  local information = {
    ["Plate"] = plateText,
    ["Vehicle"] = data,
    ["Rentee"] = ""..player.character.first_name.." "..player.character.last_name,
  }
  
  TriggerEvent("player:receiveItem", "rentalpapers", 1, true, information)


  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(rentalVehiclevoidRP) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end

end)

-- // Cars // --

RegisterNetEvent("np-rentals:attempt_spawn_bison")
AddEventHandler("np-rentals:attempt_spawn_bison", function(data)
  local vehicle = 'bison'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("np-rentals:attemptPurchase",vehicle)
  end 
end)

RegisterNetEvent("np-rentals:attempt_spawn_futo")
AddEventHandler("np-rentals:attempt_spawn_futo", function(data)
  local vehicle = 'futo'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("np-rentals:attemptPurchase",vehicle)
  end 
end)

RegisterNetEvent("np-rentals:attempt_spawn_buffalo")
AddEventHandler("np-rentals:attempt_spawn_buffalo", function(data)
  local vehicle = 'buffalo'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("np-rentals:attemptPurchase",vehicle)
  end 
end)

RegisterNetEvent("np-rentals:attempt_spawn_jackal")
AddEventHandler("np-rentals:attempt_spawn_jackal", function(data)
  local vehicle = 'jackal'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("np-rentals:attemptPurchase",vehicle)
  end 
end)

RegisterNetEvent("np-rentals:attempt_spawn_sultan")
AddEventHandler("np-rentals:attempt_spawn_sultan", function(data)
  local vehicle = 'sultan'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("np-rentals:attemptPurchase",vehicle)
  end 
end)

RegisterNetEvent("np-rentals:attempt_spawn_youga")
AddEventHandler("np-rentals:attempt_spawn_youga", function(data)
  local vehicle = 'youga'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("np-rentals:attemptPurchase",vehicle)
  end 
end)

RegisterNetEvent("np-rentals:attempt_spawn_faggio")
AddEventHandler("np-rentals:attempt_spawn_faggio", function(data)
  local vehicle = 'faggio'
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("np-rentals:attemptPurchase",vehicle)
  end 
end)

-- // Rental Shit // --

RegisterInterfaceCallback("ui_callbacks:rent_bison", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["np-ui"]:hideContextMenu()
	TriggerEvent('np-rentals:attempt_spawn_bison')
end)

RegisterInterfaceCallback("ui_callbacks:rent_futo", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["np-ui"]:hideContextMenu()
	TriggerEvent('np-rentals:attempt_spawn_futo')
end)

RegisterInterfaceCallback("ui_callbacks:rent_buffalo", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["np-ui"]:hideContextMenu()
	TriggerEvent('np-rentals:attempt_spawn_buffalo')
end)

RegisterInterfaceCallback("ui_callbacks:rent_jackal", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["np-ui"]:hideContextMenu()
	TriggerEvent('np-rentals:attempt_spawn_jackal')
end)

RegisterInterfaceCallback("ui_callbacks:rent_sultan", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["np-ui"]:hideContextMenu()
	TriggerEvent('np-rentals:attempt_spawn_sultan')
end)

RegisterInterfaceCallback("ui_callbacks:rent_youga", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["np-ui"]:hideContextMenu()
	TriggerEvent('np-rentals:attempt_spawn_youga')
end)

RegisterInterfaceCallback("ui_callbacks:rent_faggio", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	exports["np-ui"]:hideContextMenu()
	TriggerEvent('np-rentals:attempt_spawn_faggio')
end)

RegisterNetEvent('ui_callbacks:rentals')
AddEventHandler('ui_callbacks:rentals', function()

	local menuData = {
		{
            title = "Bison",
            description = "Rent Bison $500",
            key = "Rent.Bison",
           
			children = {
				{
					title = "Confirm Bison Rental",
					action = "ui_callbacks:rent_bison",
					key = "Rent.Bison",
          icon = "wallet"
				},
            },
        },
		{
            title = "Futo",
            description = "Rent Futo $450",
            key = "Rent.Futo",
           
			children = {
				{
					title = "Confirm Futo Rental",
					action = "ui_callbacks:rent_futo",
					key = "Rent.Futo",
          icon = "wallet"
				},
            },
        },
		{
            title = "Buffalo",
            description = "Rent Buffalo $750",
            key = "Rent.Buffalo",
           
			children = {
				{
					title = "Confirm Buffalo Rental",
					action = "ui_callbacks:rent_buffalo",
					key = "Rent.Buffalo",
          icon = "wallet"
				},
            },
        },
		{
            title = "Jackal",
            description = "Rent Jackal $625",
            key = "Rent.Jackal",
           
			children = {
				{
					title = "Confirm Jackal Rental",
					action = "ui_callbacks:rent_jackal",
					key = "Rent.Jackal",
          icon = "wallet"
				},
            },
        },
		{
            title = "Sultan",
            description = "Rent Sultan $1000",
            key = "Rent.Sultan",
           
			children = {
				{
					title = "Confirm Sultan Rental",
					action = "ui_callbacks:rent_sultan",
					key = "Rent.Sultan",
          icon = "wallet"
				},
            },
        },
		{
            title = "Youga",
            description = "Rent Youga $400",
            key = "Rent.Youga",
           
			children = {
				{
					title = "Confirm Youga Rental",
					action = "ui_callbacks:rent_youga",
					key = "Rent.Youga",
          icon = "wallet"
				},
            },
        },
		{
            title = "Faggio",
            description = "Rent Faggio $350",
            key = "Rent.Faggio",
           
			children = {
				{
					title = "Confirm Faggio Rental",
					action = "ui_callbacks:rent_faggio",
					key = "Rent.Faggio",
          icon = "wallet"
				},
            },
        },
    }
    exports["np-interface"]:showContextMenu(menuData)
end)