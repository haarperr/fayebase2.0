-- local DEFAULT_PURGE_CONFIG = {
--   infernus = {
--     [1] = {
--       scale: 0.5,
--       density: 3,
--       color: { 255, 255, 255 },
--       position: { 0.0, 0.0, 0.0 },
--       rotation: { 0.0, 0.0, 0.0 }
--     }
--   }
-- }

--------------------------------------------------------------------------------

-- local modelConfig = {}
-- local entityConfig = {}
--
-- local function AddVehicleModelNitroPurgeNozzle() end
-- local function RemoveVehicleModelNitroPurgeNozzle() end
-- local function SetVehicleModelNitroPurgeNozzleScale() end
-- local function SetVehicleModelNitroPurgeNozzleDensity() end
-- local function SetVehicleModelNitroPurgeNozzleColor() end
-- local function SetVehicleModelNitroPurgeNozzlePosition() end
-- local function SetVehicleModelNitroPurgeNozzleRotation() end
--
-- local function AddVehicleNitroPurgeNozzle() end
-- local function RemoveVehicleNitroPurgeNozzle() end
-- local function SetVehicleNitroPurgeNozzleScale() end
-- local function SetVehicleNitroPurgeNozzleDensity() end
-- local function SetVehicleNitroPurgeNozzleColor() end
-- local function SetVehicleNitroPurgeNozzlePosition() end
-- local function SetVehicleNitroPurgeNozzleRotation() end

--------------------------------------------------------------------------------

local vehicles = {}
local particles = {}

function IsVehicleNitroPurgeEnabled(vehicle)
  return vehicles[vehicle] == true
end

local purgelevels = {0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60}
local current_sex = 10

function SetVehicleNitroPurgeEnabled(vehicle, enabled)
  if IsVehicleNitroPurgeEnabled(vehicle) == enabled then
    return
  end

  if enabled then
    local bone = GetEntityBoneIndexByName(vehicle, 'platelight')
    local pos = GetWorldPositionOfEntityBone(vehicle, bone)
    local off = GetOffsetFromEntityGivenWorldCoords(vehicle, pos.x, pos.y, pos.z)
    local ptfxs = {}

    for i=0,3 do
      local leftPurge = CreateVehiclePurgeSpray(vehicle, off.x - 0.69, off.y + 4.26, off.z - 0.40 , 35.0, -55.0, 0.0, purgelevels[current_sex])
      local rightPurge = CreateVehiclePurgeSpray(vehicle, off.x + 0.69, off.y + 4.26, off.z - 0.40 , 35.0, 55.0, 0.0, purgelevels[current_sex])

      table.insert(ptfxs, leftPurge)
      table.insert(ptfxs, rightPurge)
    end

    vehicles[vehicle] = true
    particles[vehicle] = ptfxs
  else
    if particles[vehicle] and #particles[vehicle] > 0 then
      for _, particleId in ipairs(particles[vehicle]) do
        StopParticleFxLooped(particleId)
      end
    end

    vehicles[vehicle] = nil
    particles[vehicle] = nil
  end
end

-- Citizen.CreateThread(function()
--   local playerPed = PlayerPedId()
--   while true do
--       Citizen.Wait(7)
--           if IsControlJustPressed(1, 19) and nitroactive then
--               current_sex = current_sex + 1
--               if current_sex > 10 then
--                   current_sex = 1
--               end
--               TriggerEvent('DoLongHudText', 'Nitro / Purge rate : '..current_sex..' ' )
--               Citizen.Wait(100)
--             end
--           end
-- end)

RegisterCommand('+SwapUpRateNitrous', function()
    if nitroactive and IsPedInAnyVehicle(PlayerPedId(), true) then
      current_sex = current_sex + 1
      if current_sex > 10 then
          current_sex = 1
      end
      TriggerEvent('DoShortHudText', 'Nitro / Purge rate : '..current_sex..' ' )
      Citizen.Wait(100)
    end
end, false)
RegisterCommand('-Shibizizizi', function() end, false)

Citizen.CreateThread(function()
  exports["np-binds"]:registerKeyMapping("", "Nitrous", "Change Rates", "+SwapUpRateNitrous", "-Shibizizizi", "G")
end)

