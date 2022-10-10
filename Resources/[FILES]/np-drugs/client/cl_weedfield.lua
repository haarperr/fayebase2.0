local Cooldown = false
local PickingWeed = false

-- Picking Weed Event

RegisterNetEvent('np-weed:pick_field')
AddEventHandler('np-weed:pick_field', function()
    if not PickingWeed then
        if not Cooldown then
            PickingWeed = true
            Cooldown = true
            TriggerEvent('animation:PlayAnimation', 'kneel')
            local finished = exports['np-taskbar']:taskBar(10000, 'Picking Weed')
            if finished == 100 then
                PickingWeed = false
                TriggerEvent('player:receiveItem', 'wetbud2', math.random(1, 3))
                TriggerEvent('DoLongHudText', 'Picked Wet Bud', 1)
                TriggerEvent('animation:PlayAnimation', 'e c')
                Citizen.Wait(5000)
                Cooldown = false
            end
        else
            TriggerEvent('DoLongHudText', 'You aint skilled enough for this wait a few more seconds', 2)
        end
    end
end)

-- Polyzone Pick

warpWeedField = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_weed_field", vector3(2225.08, 5577.28, 53.89), 5, 18.4, {
        name="void_weed_field",
        heading=355,
        -- debugPoly=true,
        minZ=51.69,
        maxZ=55.69
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_weed_field" then
        warpWeedField = true     
        warpWeedPick()
		exports['np-interface']:showInteraction("[E] Pick Weed")
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_weed_field" then
        warpWeedField = false
        exports['np-interface']:hideInteraction()
    end
end)

function warpWeedPick()
	Citizen.CreateThread(function()
        while warpWeedField do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                TriggerEvent('np-weed:pick_field')
			end
		end
	end)
end

-- Polyzone Dry

warpWeedDry = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_weed_field_dry", vector3(3802.91, 4443.25, 4.29), 10, 10, {
        name="void_weed_field_dry",
        heading=0,
        --debugPoly=true,
        minZ=2.29,
        maxZ=6.29
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_weed_field_dry" then
        warpWeedDry = true     
        VoidWeedDry()
		exports['np-interface']:showInteraction("[E] Dry Bud")
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_weed_field_dry" then
        warpWeedDry = false
        exports['np-interface']:hideInteraction()
    end
end)

function VoidWeedDry()
	Citizen.CreateThread(function()
        while warpWeedDry do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                TriggerEvent('np-drugs:dry_bud')
			end
		end
	end)
end

RegisterNetEvent('np-drugs:dry_bud')
AddEventHandler('np-drugs:dry_bud', function()
    if exports['np-inventory']:hasEnoughOfItem('wetbud2', 1) then
        local finished = exports['np-taskbar']:taskBar(5000, 'Drying Bud')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('wetbud2', 1) then
                TriggerEvent('inventory:removeItem', 'wetbud2', 1)
                TriggerEvent('DoLongHudText', 'Dried Bud', 1)
                TriggerEvent('player:receiveItem', 'driedbud', 1)
            end
        end
    else
        TriggerEvent('DoLongHudText', 'You dont have any bud to dry', 2)
    end
end)

-- Polyzone Sell

VoidWeedSales = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_weed_sell", vector3(-1171.7, -1571.79, 4.37), 3, 3, {
        name="void_weed_sell",
        heading=35,
        -- debugPoly=true,
        minZ=1.37,
        maxZ=5.37
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_weed_sell" then
        VoidWeedSales = true     
        VoidWeedSell()
		exports['np-interface']:showInteraction("[E] Sell Bud")
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_weed_sell" then
        VoidWeedSales = false
        exports['np-interface']:hideInteraction()
    end
end)

function VoidWeedSell()
	Citizen.CreateThread(function()
        while VoidWeedSales do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                if exports['np-inventory']:hasEnoughOfItem('driedbud', 5) then
                    FreezeEntityPosition(PlayerPedId(), true)
                    local finished = exports['np-taskbar']:taskBar(5000, 'Selling Bud')
                    if finished == 100 then
                        if exports['np-inventory']:hasEnoughOfItem('driedbud', 5) then
                            FreezeEntityPosition(PlayerPedId(), false)
                            TriggerEvent('inventory:removeItem', 'driedbud', 5)
                            TriggerServerEvent('np-drugs:weed_sell')
                        end
                    end
                else
                    TriggerEvent('DoLongHudText', 'You dont got any Dried Bud to sell', 2)
                end
			end
		end
	end)
end
