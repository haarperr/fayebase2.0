Citizen.CreateThread(function()
    TriggerEvent("inv:playerSpawned");
end)

RegisterServerEvent("server-item-quality-update")
AddEventHandler("server-item-quality-update", function(player, data)
    if data.quality < 1 then
        exports.oxmysql:execute("UPDATE user_inventory2 SET `quality` = @quality WHERE name = @name AND slot = @slot AND item_id = @item_id", {
            ['quality'] = "0", 
            ['name'] = 'ply-' ..player, 
            ['slot'] = data.slot,
            ['item_id'] = data.itemid
        })
    end
end)


RegisterServerEvent('people-search')
AddEventHandler('people-search', function(target)
    local source = source
    local user = exports["np-base"]:getModule("Player"):GetUser(target)
    local characterId = user:getVar("character").id
	TriggerClientEvent("server-inventory-open", source, "1", 'ply-'.. characterId)
end)

RegisterServerEvent('Stealtheybread')
AddEventHandler('Stealtheybread', function(target)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local targetply = exports["np-base"]:getModule("Player"):GetUser(target)
    if (targetply:getCash() >= 1) then
        user:addMoney(targetply:getCash())
        targetply:removeMoney(targetply:getCash())
    end
end)