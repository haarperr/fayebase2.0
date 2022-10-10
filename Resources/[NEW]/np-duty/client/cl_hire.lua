-- POLICE HIRE/FIRE --

RegisterNetEvent("np-duty:HireLaw:Menu")
AddEventHandler("np-duty:HireLaw:Menu", function()
    exports['np-interface']:openApplication('textbox', {
        callbackUrl = 'np-duty:police_menu',
        key = 1,
        items = {
          {
            icon = "pencil-alt",
            label = "Enter State ID.",
            name = "pStateID",
          },
          {
            icon = "pencil-alt",
            label = "Enter Department.",
            name = "pDepartment",
          },
          {
            icon = "pencil-alt",
            label = "Enter Rank.",
            name = "pRank",
          },
        },
        show = true,
      })
end)

RegisterInterfaceCallback('np-duty:police_menu', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
   TriggerServerEvent("np-duty:HireLaw", data.values.pStateID, data.values.pDepartment, data.values.pRank)
end)

RegisterNetEvent("np-duty:FireLaw:Menu")
AddEventHandler("np-duty:FireLaw:Menu", function()
    exports['np-interface']:openApplication('textbox', {
        callbackUrl = 'np-duty:fire_pd',
        key = 1,
        items = {
          {
            icon = "pencil-alt",
            label = "Enter State ID.",
            name = "pStateID",
          },
        },
        show = true,
      })
end)

RegisterInterfaceCallback('np-duty:fire_pd', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerServerEvent("np-duty:FireLaw", data.values.pStateID)
end)

-- END POLICE HIRE/FIRE --

-- EMS HIRE/FIRE --

RegisterNetEvent("np-duty:HireEMS:Menu")
AddEventHandler("np-duty:HireEMS:Menu", function()
    exports['np-interface']:openApplication('textbox', {
        callbackUrl = 'np-duty:hire_ems',
        key = 1,
        items = {
          {
            icon = "pencil-alt",
            label = "Enter State ID.",
            name = "pStateID",
          },
          {
            icon = "pencil-alt",
            label = "Enter Rank.",
            name = "pRankEMS",
          },
        },
        show = true,
      })
end)

RegisterInterfaceCallback('np-duty:hire_ems', function(data,cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerServerEvent("np-duty:HireEMS", data.values.pStateID, data.values.pRankEMS)
end)

RegisterNetEvent("np-duty:FireEMS:Menu")
AddEventHandler("np-duty:FireEMS:Menu", function()
        exports['np-interface']:openApplication('textbox', {
        callbackUrl = 'np-duty:fire_ems',
        key = 1,
        items = {
          {
            icon = "pencil-alt",
            label = "Enter State ID.",
            name = "pStateID",
          },
        },
        show = true,
      })
end)

RegisterInterfaceCallback('np-duty:fire_ems', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerServerEvent("np-duty:FireEMS", data.values.pStateID)
end)

-- END EMS HIRE/FIRE --