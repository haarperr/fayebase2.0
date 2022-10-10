-- Make Coffee --

exports["np-polytarget"]:AddBoxZone("make_coffee", vector3(-173.14, 294.06, 93.76), 0.5, 0.7, {
    heading=270,
    --debugPoly=true,
    minZ=90.36,
    maxZ=94.36
})

exports["np-interact"]:AddPeekEntryByPolyTarget("make_coffee", {
    {
        event = "voidr-jobs:drink_maker_warrior",
        id = "make_coffee",
        icon = "circle",
        label = "Drink Machine",
        parameters = {},
    },
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('np-jobs:drink_maker_warrior')
AddEventHandler('voidr-jobs:drink_maker_warrior', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("warriors_table")
    if isEmployed then
        local DataShit = {
            {
                title = "Coffee",
                description = "Pour a Cup Of Coffee",
                action = "np-jobs:coffee",
            },
            {
                title = "Bubble Tea",
                description = "Pour Bubble Tea",
                action = "np-jobs:bubble_tea",
            },
            {
                title = "Green Tea",
                description = "Pour Green Tea",
                action = "np-jobs:green_tea",
            },
            {
                title = "Ramune",
                description = "Pour Ramune Soda",
                action = "np-jobs:ramune",
            },
        }
        exports["np-interface"]:showContextMenu(DataShit)
    end
end)

RegisterInterfaceCallback('np-jobs:ramune', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    local isEmployed = exports["np-business"]:IsEmployedAt("warriors_table")
    if isEmployed then
        SetEntityHeading(PlayerPedId(), 95.21379)
        FreezeEntityPosition(PlayerPedId(), true)
        TriggerEvent('animation:PlayAnimation', 'cokecut')
        local finished = exports['np-taskbar']:taskBar(5000, 'Pouring Ramune Soda')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('player:receiveItem', 'ramunesoda', 1)
        end
    end
end)


RegisterInterfaceCallback('np-jobs:coffee', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    local isEmployed = exports["np-business"]:IsEmployedAt("warriors_table")
    if isEmployed then
        SetEntityHeading(PlayerPedId(), 95.21379)
        FreezeEntityPosition(PlayerPedId(), true)
        TriggerEvent('animation:PlayAnimation', 'cokecut')
        local finished = exports['np-taskbar']:taskBar(5000, 'Pouring Coffee')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('player:receiveItem', 'coffee', 1)
        end
    end
end)

RegisterInterfaceCallback('np-jobs:bubble_tea', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    local isEmployed = exports['np-business']:IsEmployedAt('warriors_table')
    if isEmployed then
        SetEntityHeading(PlayerPedId(), 95.21379)
        FreezeEntityPosition(PlayerPedId(), true)
        TriggerEvent('animation:PlayAnimation', 'cokecut')
        local finished = exports['np-taskbar']:taskBar(5000, 'Pouring Bubble Tea')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('player:receiveItem', 'bubbletea', 1)
        end
    end
end)

RegisterInterfaceCallback('np-jobs:green_tea', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    local isEmployed = exports['np-business']:IsEmployedAt('warriors_table')
    if isEmployed then
        SetEntityHeading(PlayerPedId(), 95.21379)
        FreezeEntityPosition(PlayerPedId(), true)
        TriggerEvent('animation:PlayAnimation', 'cokecut')
        local finished = exports['np-taskbar']:taskBar(5000, 'Pouring Green Tea')
        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerEvent('player:receiveItem', 'greentea', 1)
        end
    end
end)

-- Make Food --

RegisterNetEvent('np-jobs:make_food_warrior')
AddEventHandler('np-jobs:make_food_warrior', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("warriors_table")
    if isEmployed then
        local DataShit = {
            {
                title = "Sushi.",
                description = "1x Rice | 1x Fish | 1x Nori | 1x Soy Sauce",
                action = "np-jobs:make_sushi",
            },
            {
                title = "Udon.",
                description = "1x Water | 1x Flour | 1x Salt",
                action = "np-jobs:make_udon",
            },
            {
                title = "Ramen.",
                description = "1x Noodles | 1x Egg | 1x Soy Sauce | 1x Spring Onion | 1x Sesame | 1x Beef",
                action = "np-jobs:make_ramen",
            },
            {
                title = "Tonkatsu.",
                description = "1x Bread Crumbs | 1x Soy Sauce | 1x Egg | 1x Flour | 1x Black Pepper | 1x Pork",
                action = "np-jobs:make_tonkatsu",
            },
        }
        exports["np-interface"]:showContextMenu(DataShit)
    end
end)

RegisterInterfaceCallback('np-jobs:make_sushi', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    local isEmployed = exports['np-business']:IsEmployedAt('warriors_table')
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('rice', 1) and exports['np-inventory']:hasEnoughOfItem('fish', 1) and exports['np-inventory']:hasEnoughOfItem('nori', 1) and exports['np-inventory']:hasEnoughOfItem('soy_sauce', 1) then
            FreezeEntityPosition(PlayerPedId(), true)
            SetEntityHeading(PlayerPedId(), 189.42131)
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            local finished = exports['np-taskbar']:taskBar(5000, 'Preparing Sushi.')
            if finished == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'rice', 1)
                TriggerEvent('inventory:removeItem', 'fish', 1)
                TriggerEvent('inventory:removeItem', 'nori', 1)
                TriggerEvent('inventory:removeItem', 'soy_sauce', 1)
                TriggerEvent('player:receiveItem', 'sushiplate', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        else
            TriggerEvent('DoLongHudText', 'You do not have the required ingridients.', 2)
        end
    end
end)

RegisterInterfaceCallback('np-jobs:make_udon', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    local isEmployed = exports['np-business']:IsEmployedAt('warriors_table')
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('flour', 1) and exports['np-inventory']:hasEnoughOfItem('water', 1) and exports['np-inventory']:hasEnoughOfItem('salt', 1) then
            FreezeEntityPosition(PlayerPedId(), true)
            SetEntityHeading(PlayerPedId(), 189.42131)
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            local finished = exports['np-taskbar']:taskBar(5000, 'Preparing Udon.')
            if finished == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'salt', 1)
                TriggerEvent('inventory:removeItem', 'water', 1)
                TriggerEvent('inventory:removeItem', 'flour', 1)
                TriggerEvent('player:receiveItem', 'udon', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        else
            TriggerEvent('DoLongHudText', 'You dont have the required ingridients.', 2)
        end
    end         
end)

RegisterInterfaceCallback('np-jobs:make_ramen', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    local isEmployed = exports['np-business']:IsEmployedAt('warriors_table')
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('noodles', 1) and exports['np-inventory']:hasEnoughOfItem('egg', 1) and exports['np-inventory']:hasEnoughOfItem('soy_sauce', 1) and exports['np-inventory']:hasEnoughOfItem('spring_onion', 1) and exports['np-inventory']:hasEnoughOfItem('sesame', 1) and exports['np-inventory']:hasEnoughOfItem('beef', 1) then
            FreezeEntityPosition(PlayerPedId(), true)
            SetEntityHeading(PlayerPedId(), 189.42131)
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            local finished = exports['np-taskbar']:taskBar(5000, 'Preparing Ramen.')
            if finished == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'noodles', 1)
                TriggerEvent('inventory:removeItem', 'egg', 1)
                TriggerEvent('inventory:removeItem', 'soy_sauce', 1)
                TriggerEvent('inventory:removeItem', 'spring_onion', 1)
                TriggerEvent('inventory:removeItem', 'sesame', 1)
                TriggerEvent('inventory:removeItem', 'beef', 1)
                TriggerEvent('player:receiveItem', 'ramen', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        else
            TriggerEvent('DoLongHudText', 'You dont have the required ingridients.', 2)
        end
    end
end)

RegisterInterfaceCallback('np-jobs:make_tonkatsu', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = 'done' } })
    local isEmployed = exports['np-business']:IsEmployedAt('warriors_table')
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('bread_crumbs', 1) and exports['np-inventory']:hasEnoughOfItem('soy_sauce', 1) and exports['np-inventory']:hasEnoughOfItem('egg', 1) and exports['np-inventory']:hasEnoughOfItem('flour', 1) and exports['np-inventory']:hasEnoughOfItem('black_pepper', 1) and exports['np-inventory']:hasEnoughOfItem('pork', 1) then
            FreezeEntityPosition(PlayerPedId(), true)
            SetEntityHeading(PlayerPedId(), 189.42131)
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            local finished = exports['np-taskbar']:taskBar(5000, 'Preparing Tonkatsu.')
            if finished == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'bread_crumbs', 1)
                TriggerEvent('inventory:removeItem', 'soy_sauce', 1)
                TriggerEvent('inventory:removeItem', 'egg', 1)
                TriggerEvent('inventory:removeItem', 'flour', 1)
                TriggerEvent('inventory:removeItem', 'black_pepper', 1)
                TriggerEvent('inventory:removeItem', 'pork', 1)
                TriggerEvent('player:receiveItem', 'tonkatsu', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        else
            TriggerEvent('DoLongHudText', 'You dont have the required ingridients.', 2)
        end
    end
end)

exports["np-polytarget"]:AddBoxZone("make_food", vector3(-172.58, 300.56, 97.46), 1, 1.8, {
    heading=0,
    --debugPoly=true,
    minZ=93.66,
    maxZ=97.66
})

exports["np-interact"]:AddPeekEntryByPolyTarget("make_food", {
    {
        event = "np-jobs:make_food_warrior",
        id = "make_food",
        icon = "circle",
        label = "Make Food",
        parameters = {},
    },
}, {
    distance = { radius = 2.5 },
});

exports["np-polytarget"]:AddBoxZone("sushi_fridge", vector3(-177.62, 306.53, 97.46), 1, 1.6, {
    heading=0,
    --debugPoly=true,
    minZ=94.86,
    maxZ=98.86
})

exports["np-interact"]:AddPeekEntryByPolyTarget("sushi_fridge", {
    {
        event = "np-jobs:sushi_ting_fridge",
        id = "sushi_fridge",
        icon = "circle",
        label = "Fridge.",
        parameters = {},
    },
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent('np-jobs:sushi_ting_fridge')
AddEventHandler('np-jobs:sushi_ting_fridge', function()
    local isEmployed = exports['np-business']:IsEmployedAt('warriors_table')
    if isEmployed then
        TriggerEvent('server-inventory-open', '0002', 'Shop')
    end
end)

RegisterNetEvent("np-jobs:warriors_table_tray_1")
AddEventHandler("np-jobs:warriors_table_tray_1", function()
    TriggerEvent("server-inventory-open", "1", "warriors-table-1");
end)

exports["np-polytarget"]:AddBoxZone("warriors_table_tray_1", vector3(-171.22, 293.93, 93.76), 1, 1, {
    heading=0,
    --debugPoly=true,
    minZ=90.36,
    maxZ=94.36
})

exports["np-interact"]:AddPeekEntryByPolyTarget("warriors_table_tray_1", {
    {
        event = "np-jobs:warriors_table_tray_1",
        id = "warriors_table_tray_1",
        icon = "boxes",
        label = "Tray.",
        parameters = {},
    },
}, {
    distance = { radius = 2.5 },
});

RegisterNetEvent("np-jobs:warriors_table_tray_2")
AddEventHandler("np-jobs:warriors_table_tray_2", function()
    TriggerEvent("server-inventory-open", "1", "warriors-table-2");
end)

exports["np-polytarget"]:AddBoxZone("warriors_table_tray_2", vector3(-171.17, 292.56, 93.76), 1, 1, {
    heading=0,
    --debugPoly=true,
    minZ=90.16,
    maxZ=94.16
})

exports["np-interact"]:AddPeekEntryByPolyTarget("warriors_table_tray_2", {
    {
        event = "np-jobs:warriors_table_tray_2",
        id = "warriors_table_tray_2",
        icon = "boxes",
        label = "Tray.",
        parameters = {},
    },
}, {
    distance = { radius = 2.5 },
});