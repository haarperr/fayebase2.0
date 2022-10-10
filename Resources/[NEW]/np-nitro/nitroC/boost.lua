local vehicles = {}

function IsVehicleNitroBoostEnabled(vehicle)
  return vehicles[vehicle] == true
end

function SetVehicleNitroBoostEnabled(vehicle, enabled)
  if IsVehicleNitroBoostEnabled(vehicle) == enabled then
    return
  end

  SetVehicleBoostActive(vehicle, enabled)
  vehicles[vehicle] = enabled or nil
end


-- Nos Takma
RegisterCommand('nitro', function(source, args, RawCommand)

  TriggerEvent("carmod:nos")
end)

RegisterNetEvent("carmod:nos") -- Whoever made this shit is dumb asf ngl : ) ¬ Ghost
AddEventHandler("carmod:nos", function()
local playerPed = PlayerPedId()
if IsPedInAnyVehicle(playerPed, false) then
    TriggerEvent('inventory:removeItem', 'nitrous', 1)
    local finished = exports['np-taskbar']:taskBar(5000, 'Hooking up Nitrous')
    if (finished == 100) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)
            local plate = GetVehicleNumberPlateText(vehicle)
            print("done!")
            nitroactive = true
            print(plate)
            totalNos[plate] = 100
        end
        Citizen.CreateThread(function ()
          local ped = PlayerPedId()
          local vehicle = GetVehiclePedIsIn(ped, false)
          local plate = GetVehicleNumberPlateText(vehicle)
          local function BackfireLoop()
            -- TODO: Only do this for nearby vehicles.
            for vehicle in pairs(vehicles) do
              CreateVehicleExhaustBackfire(vehicle, 1.25)
              if totalNos[plate] ~= nil then     
                if totalNos[plate] > 1 then 
                  if nitroactive then 
                  totalNos[plate] = totalNos[plate] - 0.1
                  -- print("total nos : " ..totalNos[plate])
                  if totalNos[plate] < 1 then 
                    SetVehicleNitroBoostEnabled(vehicle, false)
                    print("test nos is gone!")
                   end
                  end
                end
              end
            end
          end
          while true do
            Citizen.Wait(10)
            BackfireLoop()
          end
        end)
        
    else 
        print("cant use")
    end
end)


nitroactive = false
totalNos = {}


Citizen.CreateThread(function ()
  local function BoostLoop()
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player)
    local driver = GetPedInVehicleSeat(vehicle, -1)
    local enabled = IsVehicleNitroBoostEnabled(vehicle)

    if vehicle == 0 or driver ~= player or not enabled then
      return
    end

    -- TODO: Use better math. The effect of nitro is quite extreme for cars with
    -- custom handling, while slow cars have almost no effect from this at all.
    -- Also, maybe torque is not the correct setting to change.
    if not IsVehicleStopped(vehicle) then
      local vehicleModel = GetEntityModel(vehicle)
      local currentSpeed = GetEntitySpeed(vehicle)
      local maximumSpeed = GetVehicleModelMaxSpeed(vehicleModel)
      local multiplier = 1.7 * maximumSpeed / currentSpeed

      SetVehicleEngineTorqueMultiplier(vehicle, multiplier)
    end
  end

  while true do
    Citizen.Wait(0)
    BoostLoop()
  end
end)