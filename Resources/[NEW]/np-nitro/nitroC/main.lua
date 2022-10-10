local INPUT_CHARACTER_WHEEL = 21 -- L - Shift
local INPUT_VEH_ACCELERATE = 71 -- W

function NitroLoop(lastVehicle, plate)
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player)
    local driver = GetPedInVehicleSeat(vehicle, -1)

    if lastVehicle ~= 0 and lastVehicle ~= vehicle then
      TriggerServerEvent('nitro:__sync', false, false, true)
    end

    if vehicle == 0 or driver ~= player then
      return false
    end

    local isEnabled = IsControlPressed(0, INPUT_CHARACTER_WHEEL)
    local isDriving = IsControlPressed(0, INPUT_VEH_ACCELERATE)
    local isRunning = GetIsVehicleEngineRunning(vehicle)
    local isBoosting = IsVehicleNitroBoostEnabled(vehicle)
    local isPurging = IsVehicleNitroPurgeEnabled(vehicle)

    if isRunning and isEnabled then
      if isDriving then
        if not isBoosting then
          TriggerServerEvent('nitro:__sync', true, false, false)
          return true
        end
      else
        if not isPurging then
          TriggerServerEvent('nitro:__sync', false, true, false)
        end
      end
    elseif isBoosting or isPurging then
      TriggerServerEvent('nitro:__sync', false, false, false)
    end

    return false
end

RegisterNetEvent('nitro:__update')
AddEventHandler('nitro:__update', function (playerServerId, boostEnabled, purgeEnabled, lastVehicle)
    local playerId = GetPlayerFromServerId(playerServerId)
    if not NetworkIsPlayerConnected(playerId) then
      return
    end

    local player = GetPlayerPed(playerId)
    local vehicle = GetVehiclePedIsIn(player, lastVehicle)
    local driver = GetPedInVehicleSeat(vehicle, -1)

    SetVehicleNitroBoostEnabled(vehicle, boostEnabled)
    SetVehicleLightTrailEnabled(vehicle, boostEnabled)
    SetVehicleNitroPurgeEnabled(vehicle, purgeEnabled)
end)
