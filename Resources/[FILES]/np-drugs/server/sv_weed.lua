-- local knownData = {}

-- CreateThread(function()
--     Wait(5000)
--     while true do
--         local currTime = os.time()
--         exports.oxmysql:execute('DELETE FROM weed WHERE `time` - '..currTime..' < -86400', {}, function(res)
--             exports.oxmysql:execute("SELECT `id`, `x`, `y`, `z`, `growth`, `type`, `time` FROM weed", {}, function(data)
--                 knownData = data
--                 TriggerClientEvent('np-weed:knownCrops', -1, data, currTime)
--             end)
--         end)
--         Wait(90000)
--     end
-- end)

-- RegisterNetEvent('playerJoining')
-- AddEventHandler('playerJoining', function()
--     TriggerClientEvent('np-weed:knownCrops', source, knownData, os.time()) 
-- end)

-- RegisterNetEvent('np-weed:killplant')
-- AddEventHandler('np-weed:killplant', function(sentId) 
--     exports.oxmysql:execute("DELETE FROM weed WHERE id = @id", {['@id'] = sentId}, function()
--             TriggerClientEvent('np-weed:updatePlant', -1, 0, sentId)
--     end) 
-- end)

-- RegisterNetEvent('np-weed:newplant')
-- AddEventHandler('np-weed:newplant', function(x, y, z, sentType)
--     local source = source
--     local time = (os.time() - 86400) + 300
--     exports.oxmysql:execute("INSERT INTO weed (x, y, z, type, time) VALUES (@x, @y, @z, @type, @time)", { 
--         ['x'] = x, 
--         ['y'] = y,
--         ['z'] = z,
--         ['type'] = sentType,
--         ['time'] = time
--     }, function(affectedRows)
--         if affectedRows.affectedRows > 0 then
--             if affectedRows.insertId then
--                 local sentNewInfo = {
--                     ['x'] = x, 
--                     ['y'] = y,
--                     ['z'] = z,
--                     ['growth'] = 0,
--                     ['type'] = sentType,
--                     ['status'] = 3,
--                     ['time'] = time
--                 }
--                 TriggerClientEvent('np-weed:updatePlant', -1, 3, affectedRows.insertId, 0, 0, 3, sentNewInfo, os.time())
--                 TriggerClientEvent("DoLongHudText", source, "Planted!", 1)
--             end
--         end
--     end)
-- end)

-- RegisterNetEvent('np-weed:updateStatus')
-- AddEventHandler('np-weed:updateStatus', function(updateType, sentId, sentData, sentItem)
--     if updateType == 'update' and sentData then
--         local newTime = 0

--         if sentItem == 'water' then
--             newTime = os.time() + 12*60*60
--         end

--         exports.oxmysql:execute("UPDATE weed SET growth = @growth, time = @time WHERE id = @id", { 
--             ['@id'] = sentId, 
--             ['@growth'] = sentData,
--             ['@time'] = newTime-- 12 hours
--         }, function(sentInfo)
--                 TriggerClientEvent('np-weed:updatePlant', -1, 1, sentId, sentData, newTime, 1, {}, tonumber(os.time()))
--         end)
--     end
-- end)

 -- Weed Field Payemnt

RegisterServerEvent('np-drugs:weed_sell')
AddEventHandler('np-drugs:weed_sell', function()
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cash = math.random(450, 565)
        user:addMoney(cash)
end)