-- [ Code ] --


-- [ Commands ] --

-- Mercy.Commands.Add('addoutfit', 'Put your current outfit in your closet.', {{name = 'name', help = 'Outfit Name'}}, false, function(source, args)
--     local OutfitName = args[1] ~= nil and args[1] or 'outfit-'..math.random(111111, 999999)
--     if OutfitName then   
--         TriggerClientEvent('np-clothing/client/saveCurrentOutfit', source, OutfitName)
--     else
--         TriggerClientEvent('QBCore:Notify', source, 'You have not given a name for your outfit.', 'error')
--     end
-- end)

-- Mercy.Commands.Add('skin', 'Clothing Menu', {}, false, function(source, args)
--     TriggerClientEvent('np-clothing:client:openMenu', source)
-- end, "admin")

-- [ Events ] --

RegisterNetEvent("np-clothing/saveSkin", function(Model, Skin)
    local src = source
    local Player = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = Player:getCurrentCharacter().id

    if Model ~= nil and Skin ~= nil then

        local delete = MySQL.update.await([[
            DELETE FROM playerskins
            WHERE citizenid = ?
        ]],
        { cid })

        if not delete then return print("error deleteting skin from database") end

        local data2 = MySQL.insert.await([[
            INSERT INTO playerskins (citizenid, model, skin, active)
            VALUES (?, ?, ?, ?)
        ]],
        { cid, Model, Skin, 1 })

        if not data2 then return print("error inserting skin from database") end

        TriggerClientEvent("DoLongHudText", src, "Outfit Saved")
    end
end)

RegisterNetEvent("np-clothes/loadPlayerSkin", function()
    local src = source
    local Player = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = Player:getCurrentCharacter().id

    local result = MySQL.query.await([[
        SELECT *
        FROM playerskins
        WHERE citizenid = ? AND active = ?
    ]], { cid, 1 })

    if result[1] ~= nil then
        TriggerClientEvent("np-clothes:loadSkin", src, false, result[1].model, result[1].skin)
    else
        TriggerClientEvent("np-clothes:loadSkin", src, true)
    end
end)

RegisterNetEvent("np-clothes/saveOutfit", function(outfitName, model, skinData)
    local src = source
    local Player = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = Player:getCurrentCharacter().id

    if model ~= nil and skinData ~= nil then
        local outfitId = "outfit-"..math.random(1, 10).."-"..math.random(1111, 9999)
        local data2 = MySQL.insert.await([[
            INSERT INTO player_outfits (citizenid, outfitname, model, skin, outfitId)
            VALUES (?, ?, ?, ?, ?)
        ]],
        { cid, outfitName, json.encode(skinData), outfitId })

        if not data2 then return print("error inserting outfit in database") end
    end
end)

RegisterNetEvent("np-clothing/server/removeOutfit", function(outfitName, outfitId)
    local src = source
    local Player = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = Player:getCurrentCharacter().id

    local Outfit = nil
    local OutfitIdentifier = nil

    if type(outfitName) == 'table' then
        Outfit = outfitName.name
        OutfitIdentifier = outfitName.id
    else
        Outfit = outfitName
        OutfitIdentifier = outfitId
    end

    local delete = MySQL.update.await([[
        DELETE FROM player_outfits
        WHERE citizenid = ? AND outfitname = ? AND outfitId = ?
    ]],
    { cid, Outfit, OutfitIdentifier })

    if not delete then return print("error deleteting outfit from database") end
end)

-- [ Callbacks ] --
RPC.register("np-clothing/server/pay-for-clothes", function(src, isAdmin)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)

    if not IsAdmin then
        if Player.Functions.RemoveMoney('cash', Config.ClothingPrice) then
            return true
        else
            TriggerClientEvent("DoLongHudText", src, "Not enough money", 2)
            TriggerClientEvent("np-clothes/client/loadPlayerSkin", src)
            return false
        end
    else
        return true
    end
end)

RPC.register("np-clothing/server/getOutfits", function(src)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id

    local Outfits = {}
    local result = MySQL.query.await([[
        SELECT *
        FROM player_outfits
        WHERE citizenid = ?
    ]], { cid })

    if result[1] ~= nil then
        for k, v in pairs(result) do
            result[k].skin = json.decode(result[k].skin)
            Outfits[k] = v
        end
        return Outfits
    end

    return Outfits
end)
-- Mercy.Functions.CreateCallback('np-clothing/server/pay-for-clothes', function(source, cb, IsAdmin)
--     local Player = Mercy.Functions.GetPlayer(source)
--     if not IsAdmin then
--         if Player.Functions.RemoveMoney('cash', Config.ClothingPrice) then
--             cb(true)
--         else
--             cb(false)
--             TriggerClientEvent('QBCore:Notify', source, "Not enough money", "error")
--             TriggerClientEvent("np-clothes/client/loadPlayerSkin", source)
--         end
--     else
--         cb(true)
--     end
-- end)

-- Mercy.Functions.CreateCallback('np-clothing/server/getOutfits', function(source, cb)
--     local Player = Mercy.Functions.GetPlayer(source)
--     local Outfits = {}
--     local result = MySQL.query.await('SELECT * FROM player_outfits WHERE citizenid = ?', { cid })
--     if result[1] ~= nil then
--         for k, v in pairs(result) do
--             result[k].skin = json.decode(result[k].skin)
--             Outfits[k] = v
--         end
--         cb(Outfits)
--     end
--     cb(Outfits)
-- end)
