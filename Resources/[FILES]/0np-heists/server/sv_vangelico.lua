
local CooldownTimer = true

local pIsAvailable = true

RegisterServerEvent('np-heists:start_hitting_upper_vangelico')
AddEventHandler('np-heists:start_hitting_upper_vangelico', function()
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)

    if CooldownTimer then
        print('[np-heists] Someone Robbing Vangelico')
        CooldownTimer = false
        pIsAvailable = false
        TriggerClientEvent('np-jewelry:open_doors', src)
        print('^3[np-heists]: ^2Cooldown started^0')
        Citizen.Wait(3600000)
        print('[np-heists] Vangelico No Longer On Cooldown')
        TriggerClientEvent('np-heists:lock_vangelico_doors_cooldown', src)
        CooldownTimer = true
        pIsAvailable = true
    else
        print('[np-heists] Someone Trying to Rob Vangelico But Already Been Robbed')
        TriggerClientEvent('DoLongHudText', src, 'This Jewelry Store was recently robbed.', 2)
    end
end)

RegisterServerEvent('np-heists:vangelico_loot')
AddEventHandler('np-heists:vangelico_loot', function()
    local src = source
    local EvanVangelicoLoot = math.random(1, 3)

    if EvanVangelicoLoot == 1 then
        TriggerClientEvent('player:receiveItem', src,'valuablegoods', math.random(5, 10))
        TriggerClientEvent('player:receiveItem', src,'goldbar', math.random(1, 5))
        TriggerClientEvent('player:receiveItem', src,'rolexwatch', math.random(10, 20))
    elseif EvanVangelicoLoot == 2 then
        TriggerClientEvent('player:receiveItem', src,'goldcoin', math.random(15, 30))
        TriggerClientEvent('player:receiveItem', src,'stolen8ctchain', math.random(3, 10))
    elseif EvanVangelicoLoot == 3 then
        TriggerClientEvent('player:receiveItem', src,'valuablegoods', math.random(5, 14))
        TriggerClientEvent('player:receiveItem', src,'goldcoin', math.random(15, 50))
        TriggerClientEvent('player:receiveItem', src,'rolexwatch', math.random(40, 60))
    end
end)

RegisterServerEvent('np-heists:get_vangelico_availability')
AddEventHandler('np-heists:get_vangelico_availability', function()
    local src = source

    if pIsAvailable then
        TriggerClientEvent('np-heists:vangelico_available', src)
    else
        TriggerClientEvent('np-heists:vangelico_unavailable', src)
    end
end)