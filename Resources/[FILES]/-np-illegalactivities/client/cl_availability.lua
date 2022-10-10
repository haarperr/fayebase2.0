RegisterNetEvent('np-illegalactivities:check_availability')
AddEventHandler('np-illegalactivities:check_availability', function()
    TriggerEvent('np-context:sendMenu', {
        {
            id = 1,
            header = "Heist Availability",
            txt = "",
        },
        {
            id = 2,
            header = "Fleeca Bank",
            txt = "Check Fleeca Bank Availability",
            params = {
                event = 'np-illegalactivities:avail_fleeca',
            }
        },
        {
            id = 3,
            header = "Jewelry Store",
            txt = "Check Jewelry Store Availability",
            params = {
                event = 'np-illegalactivities:avail_jewel',
            }
        },
        {
            id = 4,
            header = "Paleto Bank",
            txt = "Check Paleto Bank Availability",
            params = {
                event = 'np-illegalactivities:avail_paleto',
            }
        },
    })
end)

RegisterNetEvent('np-illegalactivities:avail_fleeca')
AddEventHandler('np-illegalactivities:avail_fleeca', function()
    TriggerServerEvent('np-heists:fleeca_availability')
end)

RegisterNetEvent('np-illegalactivities:avail_jewel')
AddEventHandler('np-illegalactivities:avail_jewel', function()
    TriggerServerEvent('np-heists:get_vangelico_availability')
end)

RegisterNetEvent('np-illegalactivities:avail_paleto')
AddEventHandler('np-illegalactivities:avail_paleto', function()
    TriggerServerEvent('np-heists:paleto_avail_check')
end)