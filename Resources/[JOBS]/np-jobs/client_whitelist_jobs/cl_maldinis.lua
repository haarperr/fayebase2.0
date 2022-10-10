RegisterNetEvent('np-jobs:make_pizza_base')
AddEventHandler('np-jobs:make_pizza_base', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('dough', 1) then
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            SetEntityHeading(PlayerPedId(), 87.765464)
            FreezeEntityPosition(PlayerPedId(), true)
            local RollingDough = exports['np-taskbar']:taskBar(5000, 'Rolling Dough into Pizza Base')
            if RollingDough == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'dough', 1)
                TriggerEvent('player:receiveItem', 'pizzabase', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        end
    else
        TriggerEvent('DoLongHudText', 'You dont work at maldinis.', 2)
    end
end)

RegisterNetEvent('np-jobs:make_pepperoni')
AddEventHandler('np-jobs:make_pepperoni', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('pizzabase', 1) and exports['np-inventory']:hasEnoughOfItem('pizzasauce', 1) and exports['np-inventory']:hasEnoughOfItem('pepperoni', 10) and exports['np-inventory']:hasEnoughOfItem('cheese', 1) then
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            SetEntityHeading(PlayerPedId(), 3.2849636)
            FreezeEntityPosition(PlayerPedId(), true)
            local PepperoniPizza1 = exports['np-taskbar']:taskBar(7500, 'Preparing Pepperoni Pizza.')
            if PepperoniPizza1 == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'pizzabase', 1)
                TriggerEvent('inventory:removeItem', 'pizzasauce', 1)
                TriggerEvent('inventory:removeItem', 'pepperoni', 10)
                TriggerEvent('player:receiveItem', 'pepperonipizza', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        else
            TriggerEvent('DoLongHudText', 'You do not have the required ingridients.', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work at Maldinis.', 2)
    end
end)

RegisterNetEvent('np-jobs:make_plain_pizza')
AddEventHandler('np-jobs:make_plain_pizza', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('pizzabase', 1) and exports['np-inventory']:hasEnoughOfItem('pizzasauce', 1) and exports['np-inventory']:hasEnoughOfItem('cheese', 1) then
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            SetEntityHeading(PlayerPedId(), 3.2849636)
            FreezeEntityPosition(PlayerPedId(), true)
            local PepperoniPizza1 = exports['np-taskbar']:taskBar(7500, 'Preparing Margherita Pizza.')
            if PepperoniPizza1 == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'pizzabase', 1)
                TriggerEvent('inventory:removeItem', 'pizzasauce', 1)
                TriggerEvent('inventory:removeItem', 'cheese', 1)
                TriggerEvent('player:receiveItem', 'margheritapizza', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        else
            TriggerEvent('DoLongHudText', 'You dont have the required ingridients.', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work at Maldinis.', 2)
    end
end)

RegisterNetEvent('np-jobs:make_bbq_pizza')
AddEventHandler('np-jobs:make_bbq_pizza', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('pizzabase', 1) and exports['np-inventory']:hasEnoughOfItem('bbqsauce', 1) and exports['np-inventory']:hasEnoughOfItem('cheese', 1) then
            TriggerEvent('animation:PlayAnimation', 'cokecut')
            SetEntityHeading(PlayerPedId(), 3.2849636)
            FreezeEntityPosition(PlayerPedId(), true)
            local PepperoniPizza1 = exports['np-taskbar']:taskBar(7500, 'Preparing BBQ Pizza.')
            if PepperoniPizza1 == 100 then
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerEvent('inventory:removeItem', 'pizzabase', 1)
                TriggerEvent('inventory:removeItem', 'bbqsauce', 1)
                TriggerEvent('inventory:removeItem', 'cheese', 1)
                TriggerEvent('player:receiveItem', 'bbqpizza', 1)
            else
                FreezeEntityPosition(PlayerPedId(), false)
            end
        else
            TriggerEvent('DoLongHudText', 'You dont have the required ingridients.', 2)
        end
    else
        TriggerEvent('DoLongHudText', 'You do not work at Maldinis.', 2)
    end
end)

RegisterNetEvent('np-jobs:make_pizzas')
AddEventHandler('np-jobs:make_pizzas', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        local MakeP = {
            {
                title = "Make Maldini Pizzas",
            },
            {
                title = "Peperoni Pizza",
                description = "Required Ingridients: 10x Pepperonis | 1x Pizza Base | 1x Pizza Sauce | 1x Cheese",
                key = "PP",
                action = 'np-jobs:make_pp',
            },
            {
                title = "Margherita Pizza",
                description = "Required Ingridients: 1x Pizza Base | 1x Pizza Sauce | 1x Cheese",
                key = "MP",
                action = 'np-jobs:make_mp',
            },
            {
                title = "BBQ Pizza",
                description = "Required Ingridients: 1x BBQ Sauce | 1x Pizza Base | 1x Cheese",
                key = "BBQ",
                action = 'np-jobs:make_bbq',
            },
        }
        exports["np-interface"]:showContextMenu(MakeP)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)

RegisterInterfaceCallback('np-jobs:make_pp', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-jobs:make_pepperoni')
end)

RegisterInterfaceCallback('np-jobs:make_mp', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-jobs:make_plain_pizza')
end)

RegisterInterfaceCallback('np-jobs:make_bbq', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-jobs:make_bbq_pizza')
end)
 
-- // Fridge

RegisterNetEvent('np-jobs:maldinis_fridge')
AddEventHandler('np-jobs:maldinis_fridge', function()
    local Maldini = exports['np-business']:IsEmployedAt('maldinis')
    if Maldini then
        TriggerEvent("server-inventory-open", "222", "Shop")
    else
        TriggerEvent('DoLongHudText', 'You do not work here.', 2)
    end
end)



----------------------------------------

RegisterNetEvent('np-jobs:maldinis-drinks')
AddEventHandler('np-jobs:maldinis-drinks', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        local BurgershotDrinks = {
            {
                title = 'Maldinis Drinks',
            },
            {
                title = "Pour Cola",
                description = "Pour a nice refreshing Cola",
                key = "Pour.Cola",
                action = 'np-maldinis:cola',
            },
            {
                title = "Pour Cup Of Water",
                description = "Pour a Cup Of Water",
                key = "Pour.Water",
                action = 'np-maldinis:water',
            },
        }
        exports["np-interface"]:showContextMenu(BurgershotDrinks)
    else
        TriggerEvent('DoLongHudText', 'Fuck off POLITELY', 2)
    end
end)



RegisterNetEvent("np-maldinis:getcola")
AddEventHandler("np-maldinis:getcola", function()
    local isEmployed = exports["np-business"]:IsEmployedAt("maldinis")
    if isEmployed then  
        if exports['np-inventory']:hasEnoughOfItem('sugarbs', 1) then  
        SetEntityHeading(GetPlayerPed(-1), 249.88976287842)
        TriggerEvent("animation:PlayAnimation","browse")
        FreezeEntityPosition(GetPlayerPed(-1),true)
        local finished = exports['np-taskbar']:taskBar(10000, 'Pouring Cola')
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'cola', 1)
            TriggerEvent('inventory:removeItem', 'sugarbs', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasks(GetPlayerPed(-1))
            Citizen.Wait(1000)
            TriggerEvent("animation:PlayAnimation","layspike")
            Citizen.Wait(1000)
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    else
        TriggerEvent('DoLongHudText',"You need more sugar (Required Amount: x1)",2)
    end
else
    TriggerEvent('DoLongHudText', 'You dont work here', 2)
end
end)

RegisterNetEvent('np-maldinis:get_water')
AddEventHandler('np-maldinis:get_water', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("maldinis")
    if isEmployed then
        SetEntityHeading(GetPlayerPed(-1), 249.88976287842)
        TriggerEvent("animation:PlayAnimation","browse")
        FreezeEntityPosition(GetPlayerPed(-1),true)
        local finished = exports['np-taskbar']:taskBar(10000, 'Pouring Water')
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'water', 1)
            FreezeEntityPosition(GetPlayerPed(-1),false)
            ClearPedTasks(GetPlayerPed(-1))
        else
            FreezeEntityPosition(GetPlayerPed(-1),false)
        end
    end
end)

RegisterInterfaceCallback('np-maldinis:cola', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-maldinis:getcola')
end)

RegisterInterfaceCallback('np-maldinis:water', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('np-maldinis:get_water')
end)