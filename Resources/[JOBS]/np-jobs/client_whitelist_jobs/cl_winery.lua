local nearPicking = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("winery_picking", vector3(-1887.05, 2108.06, 139.52), 18.8, 46.6,  {
		name="winery_picking",
		heading=177,
    }) 
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "winery_picking" then
        local isEmployed = exports["np-business"]:IsEmployedAt("winery")
        if isEmployed then
            nearPicking = true
            AtPoliceBuy()
			exports['np-interface']:showInteraction(("[E] %s"):format("Start Picking"))
        end
    end
end)


RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "winery_picking" then
        nearPicking = false
    end
    exports['np-interface']:hideInteraction()
end)

function AtPoliceBuy()
	Citizen.CreateThread(function()
        while nearPicking do
            Citizen.Wait(5)
            local plate = GetVehicleNumberPlateText(vehicle)
                if IsControlJustReleased(0, 38) then
                    local ped = PlayerPedId()
                    local isEmployed = exports["np-business"]:IsEmployedAt("winery")
                    if isEmployed then
                        LoadAnim('mp_common_heist')
                        FreezeEntityPosition(ped,true)
                        Citizen.Wait(500)
                        ClearPedTasksImmediately(ped)
                        TaskPlayAnim(ped, "mp_common_heist", 'use_terminal_loop', 2.0, 2.0, -1, 1, 0, true, true, true)
                        local finished = exports['np-taskbar']:taskBar(math.random(5000, 10000), 'Picking Grapes')
                        if (finished == 100) then
                            local chance = math.random(0, 1)
                            FreezeEntityPosition(ped,false)
                            if chance == 0 then
                                TriggerEvent('player:receiveItem', 'green_grapes')
                            elseif chance == 1 then 
                                TriggerEvent('player:receiveItem', 'purple_grapes')
                            end
                        else
                            FreezeEntityPosition(ped,false)
                        end
                    else
                        TriggerEvent('DoLongHudText', 'You cant do that', 2)
                    end
                end
        end
    end)
end


function LoadAnim(animDict)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end

RegisterNetEvent('np-jobs:break-grapes-green:winery')
AddEventHandler('np-jobs:break-grapes-green:winery', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("winery")
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('green_grapes', 10) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 3.5432)
            local cooking = exports['np-taskbar']:taskBar(5000, 'Chopping Purple Grapes')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","green_grapes", 10)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'clunckyg', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 10x Green Grapes')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)

RegisterNetEvent('np-jobs:break-grapes-purple:winery')
AddEventHandler('np-jobs:break-grapes-purple:winery', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("winery")
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('purple_grapes', 10) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 3.5432)
            local cooking = exports['np-taskbar']:taskBar(5000, 'Chopping Green Grapes')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","purple_grapes", 10)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'clunckyp', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 10x Purple Grapes')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)


RegisterNetEvent('np-jobs:cook-grapes-purple:winery')
AddEventHandler('np-jobs:cook-grapes-purple:winery', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("winery")
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('clunckyp', 3) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 274.96063232422)
            local cooking = exports['np-taskbar']:taskBar(5000, 'Cooking Cluncky Purple Grapes')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","clunckyp", 3)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'redwine', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 3x Clunky Purple Grapes')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)


RegisterNetEvent('np-jobs:cook-grapes-green:winery')
AddEventHandler('np-jobs:cook-grapes-green:winery', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("winery")
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('clunckyg', 3) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            SetEntityHeading(GetPlayerPed(-1), 274.96063232422)
            local cooking = exports['np-taskbar']:taskBar(5000, 'Cooking Cluncky Green Grapes')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","clunckyg", 3)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'whitewine', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 3x Clunky Green Grapes')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)

RegisterNetEvent('np-jobs:grabGlass')
AddEventHandler('np-jobs:grabGlass', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("winery")
    if isEmployed then
        TriggerEvent("player:receiveItem","emptywineg", 1)
		Wait(1000)
	end
end)


RegisterNetEvent('np-jobs:pourWhiteWine')
AddEventHandler('np-jobs:pourWhiteWine', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("winery")
    if isEmployed then
        if exports['np-inventory']:hasEnoughOfItem('whitewine', 1) and exports['np-inventory']:hasEnoughOfItem('emptywineg', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local cooking = exports['np-taskbar']:taskBar(5000, 'Pouring White Wine')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","whitewine", 1)
                TriggerEvent("inventory:removeItem","emptywineg", 1)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'glasswhitew', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help!', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x White Wine | x1 Empty Wine Glass')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)

RegisterNetEvent('np-jobs:pourRedWine')
AddEventHandler('np-jobs:pourRedWine', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("winery")
    if isEmployed then 
        if exports['np-inventory']:hasEnoughOfItem('redwine', 1) and exports['np-inventory']:hasEnoughOfItem('emptywineg', 1) then
            FreezeEntityPosition(GetPlayerPed(-1),true)
            TriggerEvent("animation:PlayAnimation","cokecut")
            local cooking = exports['np-taskbar']:taskBar(5000, 'Pouring White Wine')
            if (cooking == 100) then
                TriggerEvent("inventory:removeItem","redwine", 1)
                TriggerEvent("inventory:removeItem","emptywineg", 1)
                Wait(1000)
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('player:receiveItem', 'glassredw', 1)
            else
                FreezeEntityPosition(GetPlayerPed(-1),false)
                TriggerEvent('DoLongHudText', 'You burnt yourself scream for help!', 2)
            end
        else
            TriggerEvent('DoLongHudText', 'Required: 1x Red Wine | x1 Empty Wine Glass')
        end
    else
        TriggerEvent('DoLongHudText', 'You cant do that', 2)
    end
end)

function playerAnim()
	loadAnimDict( "mp_safehouselost@" )
    TaskPlayAnim( PlayerPedId(), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
end

RegisterNetEvent("np-jobs:SellRedWine")
AddEventHandler("np-jobs:SellRedWine", function()
	if exports["np-inventory"]:getQuantity("redwine") >= 5 then
		playerAnim()
		local finished = exports["np-taskbar"]:taskBar(4000,"Selling Red Wine",true,false,playerVeh)
		if finished == 100 then
			if exports["np-inventory"]:getQuantity("redwine") >= 5 then
				ClearPedTasksImmediately(PlayerPedId())
				TriggerEvent('inventory:removeItem', 'redwine', 5)
				TriggerServerEvent('np-banking:addMoney', 35)
			else
                TriggerEvent('DoLongHudText', 'Required: 5x Red Wine', 2)
			end
		end
	else
        TriggerEvent('DoLongHudText', 'Required: 5x Red Wine', 2)
	end
end)

RegisterNetEvent("np-jobs:SellWhiteWine")
AddEventHandler("np-jobs:SellWhiteWine", function()
	if exports["np-inventory"]:getQuantity("whitewine") >= 5 then
		playerAnim()
		local finished = exports["np-taskbar"]:taskBar(4000,"Selling White Wine",true,false,playerVeh)
		if finished == 100 then
			if exports["np-inventory"]:getQuantity("whitewine") >= 5 then
				ClearPedTasksImmediately(PlayerPedId())
				TriggerEvent('inventory:removeItem', 'whitewine', 5)
				TriggerServerEvent('np-banking:addMoney', 35)
			else
                TriggerEvent('DoLongHudText', 'Required: 5x White Wine', 2)
			end
		end
	else
        TriggerEvent('DoLongHudText', 'Required: 5x White Wine', 2)
	end
end)
