local driftMod, oldSportMod = {}, {}
local driftCd, sportCd = false, false

totalNos = {}

Citizen.CreateThread( function()
	while true do
        local time = 1
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
            -- Nos
            if IsPedInAnyVehicle(ped) and GetPedInVehicleSeat(vehicle, -1) == ped then
                local plate = GetVehicleNumberPlateText(vehicle)
                if totalNos[plate] ~= nil then	
                    if totalNos[plate] > 9 then
                        local nitroActive = NitroLoop(vehicle, plate)
                        activateNitro()
                    end
                end
            end
            Citizen.Wait(time)
        end
    end)

    NITRO_VEHICLES = {}

    function hasNitro(pVehicle)
        if (NITRO_VEHICLES[pVehicle]) then 
            NITRO_VEHICLES[pVehicle] = NITRO_VEHICLES[pVehicle] 
        else
            NITRO_VEHICLES[pVehicle] = {}
        end
      
        local isActivated = NITRO_VEHICLES[pVehicle].activated or false
      
        return isActivated
      end

    START_TIME = 0

    function activateNitro()
        START_TIME = GetGameTimer()
        local pPlayer = PlayerPedId()
        local pVehicle = GetVehiclePedIsIn(pPlayer)
        local pDriver = GetPedInVehicleSeat(pVehicle, -1)
      
        if pVehicle == false or pVehicle == 0 or pVehicle == "" then return end
        if pDriver ~= pPlayer then return end
      
        if hasNitro(pVehicle) then
          if NITRO_VEHICLES[pVehicle].mode == "boost" then
            -- SetVehicleNitroBoostEnabled(pVehicle, true)
            SetVehicleNitroPurgeEnabled(pVehicle, false)
            TriggerServerEvent('nitro:__sync', true, false, false)
            totalNos[plate] = totalNos[plate] - 1
          elseif NITRO_VEHICLES[pVehicle].mode == "purge" then
            SetVehicleNitroBoostEnabled(pVehicle, false)
            SetVehicleNitroPurgeEnabled(pVehicle, true)
            totalNos[plate] = totalNos[plate] - 1
            TriggerServerEvent('nitro:__sync', false, true, false)
          end
        end
      end



function HowmuchNitro()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local plate = GetVehicleNumberPlateText(vehicle)
    if IsPedInAnyVehicle(PlayerPedId(), false) and nitroactive then
      -- print('Returning Total NOS Left : ' ,totalNos[plate])
  return totalNos[plate] end
    end
  