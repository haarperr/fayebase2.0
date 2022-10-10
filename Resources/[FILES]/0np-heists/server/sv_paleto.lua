
-- Heist Start --

local pEvanCooldown = false
local pStartedHeist = false

local pThermited = false

local pEvanAvail = true

local pEvanPaletoLoot1 = false
local pEvanPaletoLoot2 = false
local pEvanPaletoLoot3 = false

RegisterServerEvent('np-heists:paleto_sv_code')
AddEventHandler('np-heists:paleto_sv_code', function()
    local src = source

    if not pEvanCooldown then
        if not pStartedHeist then
            TriggerClientEvent('np-heists:start_paleto', src)
        end
    else
        TriggerClientEvent('DoLongHudText', src, 'Paleto was recently robbed.', 2)
    end
end)

RegisterServerEvent('np-heists:evan_bozo_check')
AddEventHandler('np-heists:evan_bozo_check', function()
    pStartedHeist = true
end)

RegisterNetEvent('np-heists:paleto_avail_check')
AddEventHandler('np-heists:paleto_avail_check', function()
    local src = source 

    if pEvanAvail then
        TriggerClientEvent('np-heists:paleto_avail', src)
    else
        TriggerClientEvent('np-heists:paleto_unavailable', src)
    end
end)

RegisterServerEvent('np-heists:shibiz_paleto')
AddEventHandler('np-heists:shibiz_paleto', function()
    local src = source
    
    pEvanCooldown = true
    pEvanAvail = false
    Citizen.Wait(3600000)
    print('[PALETO BANK] PALETO OFF COOLDOWN')
    pEvanCooldown = false
    pEvanAvail = true
    pStartedHeist = false
    pEvanPaletoLoot1 = false
    pEvanPaletoLoot2 = false
    pEvanPaletoLoot3 = false
    TriggerClientEvent('np-heists:cooldown_doors', src)
end)

-- Loot System --

RegisterServerEvent('np-heists:loot_evan_case_1')
AddEventHandler('np-heists:loot_evan_case_1', function()
    local src = source

    if not pEvanPaletoLoot1 then
        if pStartedHeist then
            pEvanPaletoLoot1 = true
            TriggerClientEvent('np-heists:paleto_loot_1_evan', src)
        else
            TriggerClientEvent('DoLongHudText', src, 'Get fucking jebaited man nice fucking try you dumb fuck - Evan :)', 2 )
        end
    else
        TriggerClientEvent('DoLongHudText', src, 'Already looted.', 2)
    end
end)

RegisterServerEvent('np-heists:loot_evan_case_2')
AddEventHandler('np-heists:loot_evan_case_2', function()
    local src = source

    if not pEvanPaletoLoot2 then
        if pStartedHeist then
            pEvanPaletoLoot2 = true
            TriggerClientEvent('np-heists:paleto_loot_2_evan', src)
        else
            TriggerClientEvent('DoLongHudText', src, 'Get fucking jebaited man nice fucking try you dumb fuck - Evan :)', 2 )
        end
    else
        TriggerClientEvent('DoLongHudText', src, 'Already looted.', 2)
    end
end)

RegisterServerEvent('np-heists:loot_evan_case_3')
AddEventHandler('np-heists:loot_evan_case_3', function()
    local src = source

    if not pEvanPaletoLoot3 then
        if pStartedHeist then
            pEvanPaletoLoot3 = true
            TriggerClientEvent('np-heists:paleto_loot_3_evan', src)
        else
            TriggerClientEvent('DoLongHudText', src, 'Get fucking jebaited man nice fucking try you dumb fuck - Evan :)', 2 )
        end
    else
        TriggerClientEvent('DoLongHudText', src, 'Already looted.', 2)
    end
end)

-- Loot Table --

RegisterServerEvent('np-heists:paleto_lootTable')
AddEventHandler('np-heists:paleto_lootTable', function()
    local src = source
    local pPaletoEvanLootCases = math.random(1, 3)

    if pPaletoEvanLootCases == 1 then
        TriggerClientEvent('player:receiveItem', src,'inkedmoneybag', 1)
        TriggerClientEvent('player:receiveItem', src,'inkset', math.random(1, 15))
    elseif pPaletoEvanLootCases == 2 then
        TriggerClientEvent('player:receiveItem', src,'goldbar', math.random(15, 50))
        TriggerClientEvent('player:receiveItem', src,'rolexwatch', math.random(1, 25))
        TriggerEvent('np-mining:get_gem')
    elseif pPaletoEvanLootCases == 3 then
        TriggerClientEvent('player:receiveItem', src,'valuablegoods', math.random(5, 14))
        TriggerClientEvent('player:receiveItem', src,'inkedmoneybag', math.random(1, 2))
        TriggerClientEvent('player:receiveItem', src,'inkset', math.random(5, 14))
    end
end)