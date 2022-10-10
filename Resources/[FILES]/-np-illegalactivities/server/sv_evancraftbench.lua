local Close
local closest

RegisterNetEvent('craftbench:new')
AddEventHandler('craftbench:new', function(model, sentCoords)
    local source = source
    exports.oxmysql:execute("INSERT INTO _craft_benches_ (model, x, y, z) VALUES (@model, @x, @y, @z)", { 
        ['model'] = model,
        ['x'] = sentCoords.x, 
        ['y'] = sentCoords.y,
        ['z'] = sentCoords.z,
    }, function()
end)
end) 

RegisterServerEvent('ReceiveCoords')
AddEventHandler('ReceiveCoords', function()
    exports.oxmysql:execute('SELECT model,x,y,z FROM _craft_benches_', function(data)
        evan_craft_bench = data
        TriggerClientEvent("SpawnCraftBench", -1, evan_craft_bench)
    end)
end)