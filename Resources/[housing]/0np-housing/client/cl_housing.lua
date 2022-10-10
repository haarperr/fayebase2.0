--[[

    Variables

]]

Housing.currentOwned = {}
Housing.currentKeys = {}
Housing.currentlyEditing = false
Housing.currentHousingInteractions = nil
Housing.currentlyInsideBuilding = false

Housing.currentHousingLocks = {}
Housing.currentHousingLockdown = {}
Housing.currentAccess = nil

Housing.hasEditedOrigin = false

--[[

    Functions

]]

function gatherPlayerInfo()
    Housing.currentOwned = RPC.execute("np-housing:getCurrentOwnedforPlayer")
    Housing.currentKeys = RPC.execute("np-housing:currentKeys")
    Housing.currentHousingLockdown = RPC.execute("getCurrentLockdown")
    updateBuisnessLocations(RPC.execute("getBuisnessLocations"))
end

function updateBuisnessLocations(data)
    local assigned = {}

    for k, v in pairs(Housing.info) do
        if v.assigned then
            assigned[v.assigned] = k
        end
    end

    for k, v in pairs(data) do
        local c = v.coords
        Housing.info[assigned[v.buisness]]["pos"] = vector4(c.x, c.y, c.z, 0.0)
    end
end


function Housing.func.findClosestProperty()
    local playerCoords = GetEntityCoords(PlayerPedId())

    local zone = GetZoneAtCoords(playerCoords)
    local zoneName = GetNameOfZone(playerCoords)

    if Housing.zone[zoneName] == nil then
        return false, "No property found", nil
    end

    local closest = nil
    local closestDist = 9999

    for k,v in pairs(Housing.zone[zoneName].locations) do
        local distance = #(playerCoords - v)
        if distance <= closestDist then
            closestDist = distance
            closest = k
        end
    end

    return true, closest, closestDist, zoneName
end

function getCurrentKeys()
    Housing.currentKeys = RPC.execute("np-housing:currentKeys")
    return Housing.currentKeys
end

function Housing.func.enterBuilding(propertyID,enterOverride,counterPart)
    Housing.currentlyInsideBuilding = true
    DoScreenFadeOut(1)

    TriggerEvent("insideShell", true)

    TriggerEvent('InteractSound_CL:PlayOnOne', 'DoorOpen', 0.7)
    local finished, housingInformation, currentHousingLocks, isResult, housingLockdown, housingRobbed, robTargets, robLocations, alarm, currentAccess = RPC.execute("getCurrentSelected", propertyID)

    if type(housingLockdown) == "table" then
        Housing.currentHousingLockdown = housingLockdown
    end

    if type(currentHousingLocks) == "table" then
        Housing.currentHousingLocks = currentHousingLocks
    end

    if type(housingRobbed) == "table" then
        Housing.housingBeingRobbedClient = housingRobbed
    end

    if type(robTargets) == "table" then
        Housing.housingRobTargets = robTargets
    end

    if type(robLocations) == "table" then
        Housing.robPosLocations = robLocations
    end

    if type(housingInformation) == "table" then
        Housing.currentHousingInteractions = housingInformation
        Housing.currentHousingInteractions.id = propertyID
    end

    if type(currentAccess) == "table" then
        Housing.currentAccess = currentAccess
    end

    if counterPart then
        Housing.alarm = alarm

        local finished, destroyedTable = RPC.execute("getDestroyedTable", propertyID)
        if type(destroyedTable) == "table" then
            Housing.destroyedObjects = destroyedTable
        end
    end

    local model = Housing.info[propertyID].model
    local oldModel = nil
    if counterPart then
        local info = Housing.typeInfo[model]
        if info.robberyCounterpart == nil then return end
        oldModel = model
        model = info.robberyCounterpart
    end

    local spawnBuildingLocation = vector3(Housing.info[propertyID]["pos"].x,Housing.info[propertyID]["pos"].y,Housing.info[propertyID]["pos"].z-60.0)
    if not counterPart then
        if Housing.currentHousingInteractions ~= nil and Housing.currentHousingInteractions.origin_offset ~= vector3(0.0,0.0,0.0) and type(Housing.currentHousingInteractions.origin_offset) == "vector3" then
            local off = Housing.currentHousingInteractions.origin_offset
            spawnBuildingLocation =  vector3(Housing.info[propertyID]["pos"].x+off.x,Housing.info[propertyID]["pos"].y+off.y,Housing.info[propertyID]["pos"].z-60.0)
        end
    end

    local isBuiltCoords, objects = exports["np-build"]:getModule("func").buildRoom(model,spawnBuildingLocation,false,Housing.destroyedObjects,enterOverride,true)
    if counterPart and Housing.staticObjectRobPoints == nil then
        Housing.staticObjectRobPoints = exports["np-build"]:getModule("func").getRobLocationsForObjects(model,spawnBuildingLocation,Housing.housingRobTargets.static)
        buildRobLocations(model,propertyID)
    end

    if isBuiltCoords then
        --DoScreenFadeIn(100)
        SetEntityInvincible(PlayerPedId(), false)
        FreezeEntityPosition(PlayerPedId(),false)
        DoScreenFadeIn(500)

        Housing.currentlyInsideBuilding = true

        if counterPart then
            model = oldModel

            if model == "v_int_16_low" then
                model = "v_int_49_empty"
            elseif model == "v_int_61" then
                model = "v_int_16_mid_empty"
            end
        end

        Housing.func.loadInteractions(model,counterPart,counterPart)

        TriggerServerEvent("np-housing:enterHouse", propertyID)
        if not counterPart then
            TriggerEvent("np-editor:buildName", propertyID, objects)
        end
    else
        Housing.currentHousingInteractions = nil
        Housing.currentlyInsideBuilding = false
        Housing.currentAccess = nil
    end
end

function Housing.func.getPropertyIdFromName(propertyName, isSpawn)
    local housingID = 0
    for k, v in pairs(Housing.info) do
        local street = v.street

        if isSpawn then
            street = street .. " House"
        end

        if propertyName == street then
            housingID = k
            break
        end
    end
    return housingID
end

local function lockdownCheck(propertyID)
    local myjob = exports["np-base"]:CurrentJob()

    if Housing.currentHousingLockdown == nil then
        return true
    end

    if Housing.currentHousingLockdown[propertyID] == nil then
        return true
    end

    if Housing.currentHousingLockdown[propertyID] and (myjob == 'state' or myjob == 'sheriff' or myjob == 'police' or myjob == "judge") then
        return true
    end

    return false
end

function Housing.func.getPropertyZoneFromID(propertyID)
    local zoneName = GetNameOfZone(Housing.info[propertyID]["pos"])
    return zoneName
end

function unlock(propertyID)
    if not isPropertyActive(propertyID) then
        TriggerEvent("DoLongHudText", "Inactive property", 2)
        return
    end

    if not playerInRangeOfProperty(propertyID) then
        TriggerEvent("DoLongHudText", "Too far from property", 2)
        return
    end

    if Housing.currentKeys == nil and Housing.currentOwned == nil then
        TriggerEvent("DoLongHudText", "You do not have the property keys" , 2)
        return
    end

    if Housing.currentKeys[propertyID] == nil and Housing.currentOwned[propertyID] == nil then
        TriggerEvent("DoLongHudText", "You do not have the property keys" , 2)
        return
    end

    if Housing.currentHousingLocks[propertyID] == nil then
        if not lockdownCheck(propertyID) then
            TriggerEvent("DoLongHudText","The property is locked, you cannot change the locks.",2)
            return
        end

        local passed, currentHousingLocks = RPC.execute("unlockProperty", propertyID)
        print('unlockProperty',json.encode(Housing.currentHousingLocks))
        if type(currentHousingLocks) == "table" then
            Housing.currentHousingLocks = currentHousingLocks
        end

        TriggerEvent("DoLongHudText","Property Unlocked",1)
    else
        TriggerEvent("DoLongHudText", "The property is already unlocked.", 2)
    end
end

function lock(propertyID)
    if not isPropertyActive(propertyID) then
        TriggerEvent("DoLongHudText", "inactive property", 2)
        return
    end

    if not playerInRangeOfProperty(propertyID) then
        TriggerEvent("DoLongHudText", "Far from your property", 2)
        return
    end

    if Housing.currentKeys == nil and Housing.currentOwned == nil then
        TriggerEvent("DoLongHudText", "You do not have the property keys" , 2)
        return
    end

    if Housing.currentKeys[propertyID] == nil and Housing.currentOwned[propertyID] == nil then
        TriggerEvent("DoLongHudText", "You do not have the property keys" , 2)
        return
    end

    if Housing.currentHousingLocks[propertyID] == false then
        if not lockdownCheck(propertyID) then
            TriggerEvent("DoLongHudText", "The property is on lockdown, you cannot change the locks.", 2)
            return
        end

        local passed, currentHousingLocks = RPC.execute("lockProperty", propertyID)
        print('lockProperty',json.encode(Housing.currentHousingLocks))

        if type(currentHousingLocks) == "table" then
            Housing.currentHousingLocks = currentHousingLocks
        end

        TriggerEvent("DoLongHudText", "Property Locked",2)
    else
        TriggerEvent("DoLongHudText", "The property is already locked.", 2)
    end
end

function taxCheck(propertyId)
    local taxCheck = RPC.execute("housing:isOverdueOnTaxes", propertyId)
    return taxCheck
end

--[[

    Events

]]

RegisterCommand('housinginfo', function()
    gatherPlayerInfo()
end)

RegisterNetEvent("SpawnEventsClient")
AddEventHandler("SpawnEventsClient", function()
    gatherPlayerInfo()
end)

RegisterNetEvent("np-housing:reset")
AddEventHandler("np-housing:reset", function()
    -- cl_housing
    Housing.currentOwned = {}
    Housing.currentKeys = {}
    Housing.currentlyEditing = false
    Housing.currentHousingInteractions = nil
    Housing.currentlyInsideBuilding = false

    Housing.currentHousingLocks = {}
    Housing.currentHousingLockdown = {}
    Housing.currentAccess = nil

    Housing.hasEditedOrigin = false

    -- cL_houseRobberies
    Housing.housingBeingRobbedClient = {}
    Housing.housingRobTargets = {}
    Housing.currentlyRobInside = false

    Housing.staticObjectRobPoints = nil
    Housing.robPosLocations = nil

    Housing.currentClosestSelected = nil
    Housing.currentlyDisplayingPickup = false
    Housing.destroyedObjects = {}
    Housing.alarm = {}

    Housing.attackedTarget = nil
    Housing.lockpicking = false

    Housing.lockout = false

    -- cl_realtor
    Housing.positions = {}
    Housing.EditOptions = {}

    -- cl_util
    Housing.ClosestObject = {}
    Housing.plyCoords = nil
end)

RegisterNetEvent("np-housing:refresh")
AddEventHandler("np-housing:refresh", function()
    gatherPlayerInfo()
end)

RegisterNetEvent("housing:playerSpawned")
AddEventHandler("housing:playerSpawned", function(housingName) -- DO THIS LATER
    local propertyID = Housing.func.getPropertyIdFromName(housingName, true)
    if propertyID == 0 then return end

    Housing.currentHousingLockdown = RPC.execute("getCurrentLockdown")

    if not Housing.currentHousingLockdown[propertyID] then
        Housing.func.enterBuilding(propertyID)
    end
end)

RegisterNetEvent('housing:toggleClosestLock')
AddEventHandler('housing:toggleClosestLock', function()
    local propertyId = "penis"

    if Housing.currentHousingInteractions ~= nil and Housing.currentHousingInteractions.id ~= nil then
        propertyId = Housing.currentHousingInteractions.id
    else
        local isComplete, _propertyId, dist, zone = Housing.func.findClosestProperty()

        if not isComplete then
            TriggerEvent("DoLongHudText", "too far from the property.", 2)
            return
        end

        propertyId = _propertyId
    end

    if Housing.currentOwned[propertyId] == nil and Housing.currentKeys[propertyId] == nil then
        TriggerEvent("DoLongHudText", "You do not own this property.", 2)
        return
    end

    if isLocked(propertyId, true) then
        unlock(propertyId)
    else
        lock(propertyId)
    end
end)