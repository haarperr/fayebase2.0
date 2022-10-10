RegisterNetEvent('np-illegalactivities:check_availability')
AddEventHandler('np-illegalactivities:check_availability', function()

	local WholeMenuKekw = {
		{
            title = "Fleeca Bank",
            description = "Check Fleeca Bank Availability",
            action = "np-illegalactivities:avail_fleeca",
        },
        {
            title = "Jewelry Store",
            description = "Check Jewelry Store Availability",
            action = "np-illegalactivities:avail_jewel",
        },
        {
            title = "Paleto Bank",
            description = "Check Paleto Bank Availability",
            action = "np-illegalactivities:avail_paleto",
        },
    }
    exports["np-interface"]:showContextMenu(WholeMenuKekw)
end)

RegisterInterfaceCallback('np-illegalactivities:avail_fleeca', function()
    TriggerServerEvent('voidrp-heists:fleeca_availability')
end)

RegisterInterfaceCallback('np-illegalactivities:avail_jewel', function()
    TriggerServerEvent('np-heists:get_vangelico_availability')
end)

RegisterInterfaceCallback('np-illegalactivities:avail_paleto', function()
    TriggerServerEvent('np-heists:paleto_avail_check')
end)

RegisterInterfaceCallback('np-illegalactivities:buylaptop2', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('zyloz-paletousb')
end)

RegisterInterfaceCallback('np-illegalactivities:buylaptop1', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('zyloz-fleecausb')
    TriggerServerEvent('aspect-hacking:generate_info')
end)

RegisterNetEvent('zyloz-fleecausb')
AddEventHandler('zyloz-fleecausb', function()
    if exports['np-inventory']:hasEnoughOfItem('usbdevice', 1) then
        if exports["isPed"]:isPed("mycash") >= 20000 then
        TriggerEvent('inventory:removeItem', 'usbdevice', 1)
        FreezeEntityPosition(PlayerPedId(), true)
        local finished = exports['np-taskbar']:taskBar(5000, 'You got the stuff?')
        if finished == 100 then
            TriggerServerEvent('moneybruh2')
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('player:receiveItem', "heistlaptop3", 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont got the stuff.', 2)
    end
end
end)

RegisterNetEvent('zyloz-paletousb')
AddEventHandler('zyloz-paletousb', function()
    if exports['np-inventory']:hasEnoughOfItem('heistusb1', 1) then
        if exports["isPed"]:isPed("mycash") >= 25000 then
        TriggerEvent('inventory:removeItem', 'heistusb1', 1)
        FreezeEntityPosition(PlayerPedId(), true)
        local finished = exports['np-taskbar']:taskBar(5000, 'Progress')
        if finished == 100 then
            TriggerServerEvent('moneybruh')
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('player:receiveItem', "heistlaptop2", 1)
        end
    else
        TriggerEvent('DoLongHudText', 'You dont got the stuff.', 2)
    end
end
end)

