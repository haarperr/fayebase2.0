local RecentlyWashed = false

-- Inkset --

RegisterNetEvent('np-illegalactivites:wash_inkset') -- Spawn Code "inkset"
AddEventHandler('np-illegalactivites:wash_inkset', function()
    exports['np-interface']:openApplication('textbox', {
        callbackUrl = 'np-illegalactivities:wash_inkset',
        key = 1,
        items = {
          {
            icon = "pencil-alt",
            label = "How Many Inked Bags",
            name = "pInkAmt",
          },
        },
        show = true,
      })
end)

RegisterInterfaceCallback('np-illegalactivities:wash_inkset', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['np-inventory']:hasEnoughOfItem('inkset', data.values.pInkAmt) then
        TriggerEvent('inventory:removeItem', 'inkset', data.values.pInkAmt)
        FreezeEntityPosition(PlayerPedId(), true)
        local FinishedCleanInk = exports['np-taskbar']:taskBar(2000*data.values.pInkAmt, 'Cleaning Small Inked Bags')
        if FinishedCleanInk == 100 then 
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerServerEvent('zyloz:payout', data.values.pInkAmt*math.random(150, 175))
        end
    end
end)

-- Band --

RegisterNetEvent('np-illegalactivites:wash_band') -- Spawn Code "band"
AddEventHandler('np-illegalactivites:wash_band', function()
    exports['np-interface']:openApplication('textbox', {
        callbackUrl = 'np-illegalactivities:wash_bands',
        key = 1,
        items = {
          {
            icon = "pencil-alt",
            label = "How Many Band\'s",
            name = "pBandAmt",
          },
        },
        show = true,
      })
end)

RegisterInterfaceCallback('np-illegalactivities:wash_bands', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['np-inventory']:hasEnoughOfItem('band', data.values.pBandAmt) then
        TriggerEvent('inventory:removeItem', 'band', data.values.pBandAmt)
        FreezeEntityPosition(PlayerPedId(), true)
        local FinishedCleanInk = exports['np-taskbar']:taskBar(2000*data.values.pBandAmt, 'Cleaning Bands')
        if FinishedCleanInk == 100 then 
            TriggerServerEvent('zyloz:payout', data.values.pBandAmt*math.random(170, 275))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end)

-- Roll Cash --

RegisterNetEvent('np-illegalactivites:wash_rollcash') -- Spawn Code "rollcash"
AddEventHandler('np-illegalactivites:wash_rollcash', function()
    exports['np-interface']:openApplication('textbox', {
        callbackUrl = 'np-illegalactivities:wash_roll_cash',
        key = 1,
        items = {
          {
            icon = "pencil-alt",
            label = "How Many Roll\'s",
            name = "pRollAmt",
          },
        },
        show = true,
      })
end)

RegisterInterfaceCallback('np-illegalactivities:wash_roll_cash', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    if exports['np-inventory']:hasEnoughOfItem('rollcash', data.values.pRollAmt) then
        TriggerEvent('inventory:removeItem', 'rollcash', data.values.pRollAmt)
        FreezeEntityPosition(PlayerPedId(), true)
        local FinishedCleanInk = exports['np-taskbar']:taskBar(2000*data.values.pRollAmt, 'Cleaning Roll Cash')
        if FinishedCleanInk == 100 then 
            TriggerServerEvent('zyloz:payout', data.values.pRollAmt*math.random(50, 75))
            FreezeEntityPosition(PlayerPedId(), false)
        end
    end
end)

-- Inked Money Bag --

RegisterNetEvent('np-illegalactivities:wash_inkedmoneybag')
AddEventHandler('np-illegalactivities:wash_inkedmoneybag', function() -- Spawn Code "inkedmoneybag"
    if not RecentlyWashed then
        if exports['np-inventory']:hasEnoughOfItem('inkedmoneybag', 1) then
            TriggerEvent('inventory:removeItem', 'inkedmoneybag', 1)
            TriggerServerEvent('zyloz:payout', math.random(15555, 25234))
            RecentlyWashed = true
            Citizen.Wait(1800000)
            RecentlyWashed = false
        end
    else
        TriggerEvent('DoLongHudText', 'You recently washed a bag.', 2)
    end
end)

-- Context Menu --


RegisterNetEvent('np-illegalactivities:wash_menu')
AddEventHandler('np-illegalactivities:wash_menu', function()
    if exports['np-inventory']:hasEnoughOfItem('vpnxj', 1) then 
        local MenuForTingInnit = {
            {
                title = "Inkset",
                description = "Clean Inkset",
                action = "np-illegalactivites:bring_up_inkset",
            },
        }
        exports["np-interface"]:showContextMenu(MenuForTingInnit)
    else
        TriggerEvent('DoLongHudText', 'Fuck off.', 2)
    end
end)

RegisterNetEvent('np-illegalactivities:wash_menuband')
AddEventHandler('np-illegalactivities:wash_menuband', function()
    if exports['np-inventory']:hasEnoughOfItem('vpnxj', 1) then 
        local bandsbruh = {
            {
                title = "Band",
                description = "Wash Band",
                action = "np-illegalactivites:bring_up_band",
            },
        }
        exports["np-interface"]:showContextMenu(bandsbruh)
    else
        TriggerEvent('DoLongHudText', 'Fuck off.', 2)
    end
end)

RegisterNetEvent('np-illegalactivities:wash_menuroll')
AddEventHandler('np-illegalactivities:wash_menuroll', function()
    if exports['np-inventory']:hasEnoughOfItem('vpnxj', 1) then 
        local rollsbruh = {
            {
                title = "Roll Cash",
                description = "Wash Roll Cash",
                action = "np-illegalactivites:wash_rolls",
            },
        }
        exports["np-interface"]:showContextMenu(rollsbruh)
    else
        TriggerEvent('DoLongHudText', 'Fuck off.', 2)
    end
end)

RegisterInterfaceCallback('np-illegalactivites:bring_up_inkset', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-illegalactivites:wash_inkset')
end)

RegisterInterfaceCallback('np-illegalactivites:bring_up_band', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-illegalactivites:wash_band')
end)

RegisterInterfaceCallback('np-illegalactivites:wash_rolls', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-illegalactivites:wash_rollcash')
end)

RegisterNetEvent('moneywash:enter')
AddEventHandler('moneywash:enter', function()
    local player = GetEntityCoords(PlayerPedId())
    local distance = #(vector3(499.18948, -550.2716, 24.751142) - player)  
    if distance < 1.5 then
        if exports["np-inventory"]:hasEnoughOfItem("keya", 1) then
    TriggerEvent('secret:enter')
    TriggerEvent("inventory:DegenLastUsedItem", 5)
        end
    end
end)

