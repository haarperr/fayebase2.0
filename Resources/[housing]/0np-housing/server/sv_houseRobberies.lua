--[[

    Variables

]]

Housing.housingBeingRobbed = {}
Housing.housingRobTargets = {}
Housing.alarm = {}
Housing.destroyedObjects = {}
Housing.robPosLocations = {}

--[[

    Events

]]

RegisterNetEvent("np-base:sessionStarted", function()
    local src = source
    TriggerClientEvent("np-housing:beingRobbed", src, Housing.housingBeingRobbed)
end)

--[[

    RPCs

]]

RPC.register("housing:robbery:pickedLock", function(pHouseId)
    if Housing.housingBeingRobbed[pHouseId] ~= nil then
        return true, Housing.housingBeingRobbed, Housing.housingRobTargets[pHouseId], Housing.alarm[pHouseId]
    end

    Housing.housingBeingRobbed[pHouseId] = true
    TriggerClientEvent("np-housing:beingRobbed", -1, pHouseId)

    local model = Housing.info[pHouseId]["model"]
    local counterpart = Housing.typeInfo[model]["robberyCounterpart"]
    local robInfo = Housing.robInformation["staticLocations"][counterpart]

    Housing.housingRobTargets[pHouseId] = {}
    Housing.housingRobTargets[pHouseId]["static"] = robInfo["staticObjects"]
    Housing.housingRobTargets[pHouseId]["pos"] = robInfo["staticPositions"]

    Housing.alarm[pHouseId] = true

    Housing.destroyedObjects[pHouseId] = {}

    return false, Housing.housingBeingRobbed, Housing.housingRobTargets[pHouseId], Housing.alarm[pHouseId]
end)

RPC.register("getDestroyedTable", function(pHouseId)
    if Housing.destroyedObjects[pHouseId] ~= nil then
        return Housing.destroyedObjects[pHouseId]
    end

    return {}
end)

RPC.register("housing:robbery:robLocationsGenerated", function(pRobLocations, pHouseId)

    local src = source
    if Housing.robPosLocations[pHouseId] ~= nil then
        return false, Housing.robPosLocations[pHouseId]
    end

    local _locations = pRobLocations
    local locations = {}
    for i = 1, 5 do
        local rnd = math.random(#_locations)
        table.insert(locations, _locations[rnd])
        _locations[rnd] = nil
    end

    Housing.robPosLocations[pHouseId] = locations

    return true, Housing.robPosLocations[pHouseId]
end)

RPC.register("housing:robbery:searchedPoint", function(pHouseId, pSelected)
    local src = source
    if pHouseId == nil or pSelected == nil or Housing.robPosLocations[pHouseId] == nil or Housing.robPosLocations[pHouseId][pSelected] == nil or Housing.robPosLocations[pHouseId][pSelected]["completed"] == true then
        return false
    end

    Housing.robPosLocations[pHouseId][pSelected]["completed"] = true

    return true
end)

RPC.register("property:alarmDisabled", function(pHouseId, pFail)
    local src = source
    Housing.alarm[pHouseId] = false

    for k, v in pairs(Housing.Players) do
        if v == pHouseId then
            TriggerClientEvent("property:updateAlarms", src, Housing.alarm[pHouseId])

            if pFail then
                TriggerClientEvent("np-housing:alarm", src, pHouseId)
            end
        end
    end

    return true
end)

RPC.register("housing:robbery:targetRemovePlayer", function(pHouseId)
    local src = source
    Housing.Players[src] = nil
    TriggerClientEvent("housing:robbery:targetRemovePlayer", src)
    return true
end)