--[[

    Variables

]]

local defaultInformations = {
    ["origin_offset"] = vector3(0.0, 0.0, 0.0),
    ["backdoor_coordinates"] = {
        ["internal"] = vector3(0.0, 0.0, 0.0),
        ["external"] = vector3(0.0, 0.0, 0.0),
    },
    ["garage_coordinates"] = vector4(0.0, 0.0, 0.0, 0.0),
    ["charChanger_offset"] = vector3(0.0, 0.0, 0.0),
    ["inventory_offset"] = vector3(0.0, 0.0, 0.0),
}

local housingEditing = {}

--[[

    Events

]]

RegisterNetEvent("np-housing:sell")
AddEventHandler("np-housing:sell", function(pCid, pPropertyId)
    local src = source

    local seller = exports["np-base"]:getChar(src, "id")
    if not seller or seller == 0 then
        TriggerClientEvent("DoLongHudText", src, "seller not found", 2)
        return
    end

    local buyer = exports["np-base"]:getSidWithCid(pCid)
    if not buyer or buyer == 0 then
        TriggerClientEvent("DoLongHudText", src, "buyer not found", 2)
        return
    end

    TriggerClientEvent("np-housing:buy", buyer, pPropertyId, seller)
end)

RegisterNetEvent("CheckFurniture")
AddEventHandler("CheckFurniture", function(pData, pPropertyId)
    local src = source

    if housingEditing[pPropertyId] ~= nil then
        TriggerClientEvent("DoLongHudText", src, "Someone is already decorating this property", 2)
    else
        housingEditing[pPropertyId] = src
        TriggerClientEvent("np-editor:loadEditor", src, pData)
    end
end)

RegisterNetEvent("exitFurniture")
AddEventHandler("exitFurniture", function(pPropertyId)
    if housingEditing[pPropertyId] ~= nil then
        housingEditing[pPropertyId] = nil
    end
end)

AddEventHandler("playerDropped", function()
	local src = source

    TriggerClientEvent('np-housing:reset',src)
    for k, v in pairs(housingEditing) do
        if v == src then
            housingEditing[k] = nil
        end
    end
end)
--[[

    RPCs

]]

RPC.register('np-phone:getHousePrice', function(hid)
    local src = source
    local user = exports['np-base']:getModule('Player'):GetUser(src)
    local hIds = hid
    exports.oxmysql:execute('SELECT * FROM housing WHERE hid = @hid', {['hid'] = hIds}, function(result)
        if result[1] then
            hPrice = Housing.info[hid]["price"]
            local amount = math.floor(hPrice/2) -- else the interger goes to .0 annyoing
            TriggerClientEvent('DoLongHudText', src, "You received $"..amount.." for selling property.")
            exports['np-base']:GetModule('AddCash')(src, amount)
            deleteProperty(src,hIds)
        end
    end)
    Wait(100)
    return hPrice
end)


RPC.register("np-housing:buy", function(pPropertyId, pTotal, pTax, pSeller)
    local src = source
    
    local user = exports['np-base']:getModule('Player'):GetUser(src)

    local userOther2 = exports['np-base']:GetModule('GetPlayer')(pSeller)

    local cid = user:getCurrentCharacter().id
    if not cid or cid == 0 then
        return false, "ID not found"
    end

    local bank = exports['np-base']:GetModule('GetBalance')(src)
    if bank < pTotal then
        return false, "You don't have $" .. pTotal .. " in your account"
    end

    local result = exports.oxmysql:scalarSync('SELECT HID FROM housing WHERE hid = @hid', {['@hid'] = pPropertyId})
    if result == pPropertyId then return false, 'This property is unavailable for purchase!' end

    local comment = "Property rental payment " .. Housing.info[pPropertyId]["street"]

    local priceWithTax = pTotal + pTax

    exports['np-base']:GetModule('RemoveBank')(src, priceWithTax)

    local insertId = SQL([[
        INSERT INTO housing (hid, cid, information, objects, last_payment)
        VALUES (?, ?, ?, ?, UNIX_TIMESTAMP())
    ]],
    { pPropertyId, cid, json.encode(defaultInformations), "{}" })

    TriggerClientEvent('np-housing:refresh', src)
    TriggerClientEvent('housing:phoneContract',src)
     

    return true, ":)"
end)

RPC.register("np-housing:rent", function(pPropertyId, pTotal, pTax)
    local src = source
    local cid = exports["np-base"]:getChar(src, "id")
    if not cid or cid == 0 then
        return false, "ID not found"
    end

    local accountId = exports["np-base"]:getChar(src, "bankid")
    local groupBank = exports["np-groups"]:groupBank("real_estate")

    if not accountId or not groupBank then
        return false, "Error searching account"
    end

    local bank = exports["np-financials"]:getBalance(accountId)
    if bank < pTotal then
        return false, "Error searching account" .. pTotal .. " in your account"
    end

    local comment = "Property rental payment " .. Housing.info[pPropertyId]["street"]
    local success, message = exports["np-financials"]:transaction(accountId, groupBank, pTotal, comment, cid, 5)
    if not success then
        return false, message
    end

    exports["np-financials"]:addTax("Propertys", pTax)

    local insertId = MySQL.insert.await([[
        INSERT INTO housing (hid, cid, information, objects, last_payment)
        VALUES (?, ?, ?, ?, UNIX_TIMESTAMP())
    ]],
    { pPropertyId, cid, json.encode(defaultInformations), "{}" })

    if not insertId or insertId < 1 then
        return false, "Database insert eror"
    end

    TriggerClientEvent("DoLongHudText", src, "you rented " .. Housing.info[pPropertyId]["street"])

    return true, getCurrentOwned(src)
end)

RPC.register("updateCurrentSelected", function(pPropertyId, pInformation, pOrigin)
    local src = source
    if pInformation["id"] then
        pInformation["id"] = nil
    end

    local affectedRows = SQL([[
        UPDATE housing
        SET information = ?
        WHERE hid = ?
    ]],
    { json.encode(pInformation), pPropertyId })

    if not affectedRows or affectedRows < 1 then
        return false
    end

    local info = pInformation
    local name = Housing.info[pPropertyId]["street"]

    local data = {
        ["houseid"] = pPropertyId,
        ["type"] = "car",
        ["pos"] = info.garage_coordinates,
        ["distance"] = 50,
        ["spaces"] = {info.garage_coordinates}
    }

    exports["np-garages"]:setGarage(name, data, nil, false)

    return true
end)

RPC.register("objects:getObjects", function(pName)

    local data = {}
    data["name"] = pName
    data["objects"] = {}

    local result = exports.oxmysql:scalarSync('SELECT objects FROM housing WHERE hid = @hid', {['@hid'] = pName})


    if result and type(result) == "string" then
        data["objects"] = json.decode(result)
    end

    return data
end)

RPC.register("objects:saveObjects", function(pDataToSend)
    local data = {}
    data["name"] = pDataToSend["name"]
    data["objects"] = pDataToSend["objects"]

    local result = SQL([[
        UPDATE housing
        SET objects = ?
        WHERE hid = ?
    ]],
    { json.encode(pDataToSend["objects"]), pDataToSend["name"] })

    return data
end)

RPC.register("np-housing:owned", function()
    local result = SQL([[
        SELECT hid
        FROM housing
    ]])

    local houses = {}
    for i, v in ipairs(result) do
        houses[v.hid] = true
    end

    return houses
end)


RPC.register('property:dropInventory',function(pID, pHud)

end)



--[[

    Threads

]]

-- Citizen.CreateThread(function()
--     local houses = MySQL.query.await([[
--         SELECT hid, information
--         FROM housing
--     ]])

--     for i, v in ipairs(houses) do
--         local info = json.decode(v.information)
--         local name = Housing.info[v.hid]["street"]
--         local vector = vector4(info.garage_coordinates["x"], info.garage_coordinates["y"], info.garage_coordinates["z"], info.garage_coordinates["w"])

--         local data = {
--             ["houseid"] = v.hid,
--             ["type"] = "car",
--             ["pos"] = vector,
--             ["distance"] = 50,
--             ["spaces"] = {vector}
--         }

--         exports["np-garages"]:setGarage(name, data, nil, false)
--     end
-- end)


--[[
    Functions
]]

function deleteProperty(src,hid)
    exports.oxmysql:execute('DELETE FROM housing WHERE hid = @hid LIMIT 1', {
        ['hid'] = hid,
    }, function (result)
        TriggerClientEvent('np-housing:refresh', src)
    end)
end