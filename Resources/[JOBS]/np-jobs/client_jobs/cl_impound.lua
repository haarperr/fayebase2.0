local pPlate = nil

RegisterNetEvent('np-jobs:impound')
AddEventHandler('np-jobs:impound', function()
    local ImpoundMenu = {
		{
      title = "Release Vehicle",
      description = "Release a vehicle from the impound lot",
      key = "ReleaseVehicle",
      children = {
          {
            title = "Browse by Plate",
            description = "Release a vehicle from impound by plate",
            action = "np-jobs:browse_plate",
          },
        },
      }
    }
    exports["np-interface"]:showContextMenu(ImpoundMenu)
end)

RegisterInterfaceCallback('np-jobs:browse_plate', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
    exports['np-interface']:openApplication('textbox', {
        callbackUrl = 'np-jobs:pPlateBrowse',
        key = 1,
        items = {
          {
            icon = "car",
            label = "Vehicle Plate.",
            name = "pVehPlate",
          },
        },
      show = true,
    })
end)

RegisterInterfaceCallback('np-jobs:pPlateBrowse', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  pPlate = data.values.pVehPlate
  
  TriggerServerEvent('np-impound:select_plate', pPlate)
end)

RegisterNetEvent('np-impound:show_car')
AddEventHandler('np-impound:show_car', function(pVehicleModel, pVehiclePlate, pState)
    local pVehicle = {
		  {
        title = "Vehicle Model: "..pVehicleModel,
        description = "Vehicle Plate: "..pVehiclePlate,
      },
      {
        title = "Release Vehicle",
        disabled = pState,
        action= "np-jobs:release_vehicle",
      }
    }
    exports["np-interface"]:showContextMenu(pVehicle)
end)

RegisterInterfaceCallback('np-jobs:release_vehicle', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  print(pPlate)
  TriggerServerEvent('np-impound:release_car', pPlate)
end)