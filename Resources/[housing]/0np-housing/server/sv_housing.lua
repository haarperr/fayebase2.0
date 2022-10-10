--[[

    Variables

]]

Housing.currentHousingLocks = {}
Housing.currentHousingLockdown = {}
Housing.BuisnessLocations = {}
Housing.Players = {}

--[[

    Functions

]]

function getCurrentOwned()
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id

    if cid == nil then return {} end

    local result = MySQL.Sync.fetchAll([[
        SELECT hid, status, DATEDIFF(FROM_UNIXTIME(UNIX_TIMESTAMP()), FROM_UNIXTIME(last_payment)) AS last_payment
        FROM housing
        WHERE cid = ?
    ]],
    { cid })

    local owned = {}

    
    for i, v in ipairs(result) do
        local tax = Housing.info[v.hid]["price"]

        owned[v.hid] = {
            hid = v.hid,
            house_name = Housing.info[v.hid]["street"],
            house_price = tax,
            last_payment = v.last_payment,
            status = v.status
        }
    end

    return owned
end

function currentKeys_Server()
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id
    if not cid then return {} end

    local result = MySQL.Async.execute([[
        SELECT k.hid, DATEDIFF(FROM_UNIXTIME(UNIX_TIMESTAMP()), FROM_UNIXTIME(h.last_payment)) AS last_payment
        FROM housing_keys k
        INNER JOIN housing h ON h.hid = k.hid
        WHERE k.cid = ?
    ]],
    { cid })

    local owned = {}

    if result == nil then return owned end
    

    for i, v in ipairs(result) do
        local tax = Housing.info[v.hid]["price"]

        owned[v.hid] = {
            hid = v.hid,
            house_name = Housing.info[v.hid]["street"],
            house_price = tax.total,
            last_payment = v.last_payment
        }
    end

    return owned
end

--[[

    Exports

]]

exports("getCurrentOwned", getCurrentOwned)
exports("currentKeys", currentKeys_Server)

--[[

    Events

]]

RegisterNetEvent("np-housing:enterHouse")
AddEventHandler("np-housing:enterHouse", function(pPropertyId)
    local src = source
    Housing.Players[src] = pPropertyId
end)

RegisterNetEvent("np-housing:leftHouse")
AddEventHandler("np-housing:leftHouse", function(pPropertyId)
    local src = source
    Housing.Players[src] = nil
end)

RegisterNetEvent('housing:getPrice',function(pHouseId)
    if pHouseId == nil or pHouseId == false then return false end
    local price = Housing.info[pHouseId]["price"]
    return price
end)

--[[

    RPCs

]]

RPC.register("np-housing:getCurrentOwnedforPlayer", function()
    local src = source
    return getCurrentOwned(src)
end)

RPC.register("np-housing:currentKeys", function()
    local src = source
    return currentKeys_Server(src)
end)

RPC.register("getCurrentLockdown", function()
    return Housing.currentHousingLockdown
end)

RPC.register("getBuisnessLocations", function()
    return Housing.BuisnessLocations
end)

RPC.register("getCurrentSelected", function(pPropertyId)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id

    local finished = true
    local _information = exports.oxmysql:scalarSync('SELECT information FROM housing WHERE hid = @hid', {['@hid'] = pPropertyId})


    local housingInformation = {}

    if _information and type(_information) == "string" then

        housingInformation = json.decode(_information)
        for k, v in pairs(housingInformation) do
            if k == "backdoor_coordinates" then
                for k2, v2 in pairs(v) do
                    housingInformation[k][k2] = vector3(v2.x, v2.y, v2.z)
                end
            elseif k == "garage_coordinates" then
                if v.w then
                    housingInformation[k] = vector4(v.x, v.y, v.z, v.w)
                else
                    housingInformation[k] = vector3(v.x, v.y, v.z)
                end
            else
                housingInformation[k] = vector3(v.x, v.y, v.z)
            end
        end
    end

    local currentHousingLocks = Housing.currentHousingLocks

    -- local keys = currentKeys_Server(src)
    -- for k, v in pairs(keys) do
    --     currentHousingLocks[k] = false
    -- end

    local _result = SQL([[
        SELECT id
        FROM housing
        WHERE hid = ? AND cid = ?
    ]],
    { pPropertyId, cid })

    local isResult = false
    if _result then
        isResult = true
    end

    local housingLockdown = Housing.currentHousingLockdown

    local housingRobbed = Housing.housingBeingRobbed

    local robTargets = {}
    if Housing.housingRobTargets[pPropertyId] ~= nil then
        robTargets = Housing.housingRobTargets[pPropertyId]
    end

    local robLocations = {}
    if Housing.robPosLocations[pPropertyId] ~= nil then
        robLocations = Housing.robPosLocations[pPropertyId]
    end

    local alarm = false
    if Housing.alarm[pPropertyId] ~= nil then
        alarm = Housing.alarm[pPropertyId]
    end

    local currentAccess = {}

    return finished, housingInformation, currentHousingLocks, isResult, housingLockdown, housingRobbed, robTargets, robLocations, alarm, currentAccess
end)

RPC.register("np-phone:getHouseKeys", function(pHouseId)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id

    if not cid then return {} end

    local keys = SQL([[
        SELECT k.hid as hid, k.cid AS cid, CONCAT(c.first_name," ",c.last_name) as player_name
        FROM housing_keys k
        INNER JOIN characters c ON c.id = k.cid
        WHERE k.hid = ?
    ]],
    { pHouseId })

    for i, v in ipairs(keys) do
        keys[i]["house_name"] = Housing.info[v.hid]["street"]
    end

    return keys
end)

RPC.register("np-phone:giveKey", function(pHouseId, pPlayerId)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id

    if not cid then return false, "ID not found" end

    local playerCid = exports["np-base"]:getModule("Player"):GetUser(pPlayerId)
    if not cid then return false, "ID not found" end

    local hasKey = SQL([[
        SELECT id
        FROM housing_keys
        WHERE hid = ? AND cid = ?
    ]],
    { pHouseId, playerCid })

    if hasKey then
        return false, "The player already has the key to this house."
    end

    local insertId = SQL([[
        INSERT INTO housing_keys (hid, cid)
        VALUES (?, ?)
    ]],
    { pHouseId, playerCid })

    if not insertId or insertId < 1 then
        return false, "Database insert error"
    end

    TriggerClientEvent("np-phone:notification", pPlayerId, "fas fa-key", "Keys", "You received the property key " .. Housing.info[pHouseId]["street"], 5000)
    TriggerClientEvent("np-housing:refresh", pPlayerId)

    return true, "Chave recebida"
end)

RPC.register("np-phone:removeKey", function(pHouseId, pPlayerId)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id

    if not cid then return false end

    local affectedRows = SQL([[
        DELETE FROM housing_keys
        WHERE hid = ? AND cid = ?
    ]],
    { pHouseId, pPlayerId })

    if affectedRows and affectedRows > 0 then
        local pPlayerId = exports["np-base"]:getSidWithCid(pPlayerId)
        if pPlayerId > 0 then
            TriggerClientEvent("np-housing:refresh", pPlayerId)
        end

        return true
    end

    return false
end)

RPC.register("np-phone:payHouse", function(pHouseId)
    local src = source
    if not pHouseId or not src then return false, "pHouseId or src not found" end

    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id

    if not cid then return false, "cid not found" end

    local price = Housing.info[pHouseId]["price"]
    local tax = price

    local accountId = exports["np-base"]:getChar(src, "bankid")

    local user = exports["np-base"]:getModule("Player"):GetUser(src)


    if exports['np-base']:GetModule('GetCash')(src) < tax then
        return false, "You don't have $" .. tax .. " in your account"
    end

    local groupBank = exports["np-groups"]:groupBank("real_estate")

    local comment = "Property rental payment " .. Housing.info[pHouseId]["street"]
    local success, message = exports["np-financials"]:transaction(accountId, groupBank, price, comment, cid, 5)
    if not success then
        return false, message
    end

    exports["np-financials"]:addTax("Propertys", tax.tax)

    local affectedRows = SQL([[
        UPDATE housing
        SET last_payment = last_payment + 604800
        WHERE hid = ?
    ]],
    { pHouseId })

    if not affectedRows or affectedRows < 1 then
        return false, "affectedRows ~= 1"
    end

    return true, ":)"
end)

RPC.register("np-phone:removeSharedKey", function(pHouseId)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id

    if not cid then return false end

    local affectedRows = SQL([[
        DELETE FROM housing_keys
        WHERE hid = ? AND cid = ?
    ]],
    { pHouseId, cid })

    if affectedRows and affectedRows > 0 then
        TriggerClientEvent("np-housing:refresh", src)
        return true
    end

    return false
end)

RPC.register("unlockProperty", function(pHouseId)
    if Housing.currentHousingLocks[pHouseId] ~= nil and Housing.currentHousingLocks[pHouseId] == false then
        return false, Housing.currentHousingLocks
    end

    Housing.currentHousingLocks[pHouseId] = false

    return true, Housing.currentHousingLocks
end)

RPC.register("lockProperty", function(pHouseId)
    if Housing.currentHousingLocks[pHouseId] == nil then
        return false, Housing.currentHousingLocks
    end

    Housing.currentHousingLocks[pHouseId] = nil

    return true, Housing.currentHousingLocks
end)
