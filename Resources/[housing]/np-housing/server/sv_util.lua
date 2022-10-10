--[[

    RPCs

]]

RPC.register("housingShouldSetZoneLocations", function(src)
    if #Housing.zone == 0 then
        return true
    else
        return false
    end
end)

RPC.register("setZoneLocations", function(pZones)
    Housing.zone = pZones
end)

RPC.register("np-housing:canRent", function(src, pPropertyId)
    if pPropertyId == nil or Housing.info[pPropertyId] == nil or Housing.info[pPropertyId]["enabled"] == false then
        return false
    end

    local result = SQL([[
        SELECT id
        FROM housing
        WHERE hid = ?
    ]],
    { pPropertyId })

    if result ~= nil then
        return false
    end

    return true
end)

SQL = function(query, parameters, cb)
    local res = nil
    local IsBusy = true
    exports.oxmysql:execute(query, parameters, function(result)
        if cb then
            cb(result)
        else
            res = result
            IsBusy = false
        end
    end)
    while IsBusy do
        Citizen.Wait(0)
    end
    return res
end

function getStreetID (pID)
    if pID == nil or pID == {} then return false end
    return Housing.info[pID]["street"]
end

function getHousePrice (pID)
    if pID == nil or pID == {} then return false end
    return Housing.info[pID]["price"]
end

exports("getHousePrice", getHousePrice)
exports("HouseStreet", getStreetID)