--[[

    Functions

]]

function joinRace(src, id, alias, cid, dontpay)
    local srcString = tostring(src)

    if not PendingRaces[id] then
        return
    end

    local inRace, raceId = isPlayerInRace(cid)
    if inRace then
        return
    end

    if PendingRaces[id]["buyIn"] > 0 and not dontpay then
        local user = exports["np-base"]:getModule("Player"):GetUser(src)
        local bank = user:getBalance()
        if PendingRaces[id]["buyIn"] > bank then
            TriggerClientEvent("DoLongHudText", src, "You dont have $" .. PendingRaces[id]["buyIn"] .. " in your bank account")
            return
        end

        local success = user:removeBank(100)
        if not success then
            TriggerClientEvent("DoLongHudText", src, 'kiri poooli')
            return
        end

        PendingRaces[id]["prize"] = PendingRaces[id]["prize"] + PendingRaces[id]["buyIn"]
    end

    PendingRaces[id]["players"][srcString] = {
        serverId = src,
        characterId = cid,
        name = alias,
        fastest = 0,
        total = 0,
        totalDist = 0,
        position = 0,
    }

    TriggerClientEvent("np-racing:joinedRace", src, Races[id])
    TriggerClientEvent("np-racing:addedPendingRace", -1, PendingRaces[id])

    for k, v in pairs(PendingRaces[id]["players"]) do
        TriggerClientEvent("np-racing:playerJoinedYourRace", v.serverId, cid, alias)
    end
end

--[[

    Events

]]

RegisterNetEvent("np-racing:updatePositionInfo")
AddEventHandler("np-racing:updatePositionInfo", function(curRaceid, totalDist)
    local src = source
    local srcString = tostring(src)

    if not ActiveRaces[curRaceid] then return end

    ActiveRaces[curRaceid]["players"][srcString]["totalDist"] = totalDist

    local position = 1
    local players = ActiveRaces[curRaceid]["players"]

    for k, v in pairs(players) do
        if v.serverId ~= src then
            if v.totalDist > totalDist then
                position = position + 1
            end
        end
    end

    TriggerClientEvent("np-racing:updatePosition", src, position)
end)

--[[

    RPCs

]]

function getIdentity(src)
	local owner = GetPlayerIdentifiers(src)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM characters WHERE owner = @owner", {['@owner'] = owner})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			firstname = identity['first_name'],
			lastname = identity['last_name'],
			
		}
	else
		return nil
	end
end

RPC.register("np-racing:createPendingRace", function(src, id, options)
    local srcString = tostring(src)

    if not id or not options then return end

    if PendingRaces[id] or ActiveRaces[id] then
        return
    end

    local player = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = player:getCurrentCharacter()
    local cid = char.id
    local name = getIdentity(src)
    local alias = name.firstname .. " " .. name.lastname

    if not cid or not alias then
        return
    end

    if isPlayerInRace(cid) then
        return
    end

    options["buyIn"] = tonumber(options["buyIn"])
    if options["buyIn"] > 0 then
        local accountId = exports["np-base"]:getModule("Player"):GetUser(src)
        local bank = user:getBalance()
        if options["buyIn"] > bank then
            TriggerClientEvent("DoLongHudText", src, "Você não tem $" .. options["buyIn"] .. " na sua conta do banco")
            return
        end

        local success = user:removeBank(100)
        if not success then
            TriggerClientEvent("DoLongHudText", src, 'message')
            return
        end
    end

    PendingRaces[id] = {}

    options["mapDistance"] = Races[id]["distance"]
    options["owner"] = cid
    options["eventCreator"] = alias
    options["players"] = {}
    options["prize"] = options["buyIn"]
    options["laps"] = tonumber(options["laps"])
    options["countdown"] = tonumber(options["countdown"])
    options["dnfPosition"] = tonumber(options["dnfPosition"])
    options["dnfCountdown"] = tonumber(options["dnfCountdown"])

    PendingRaces[id] = options
    TriggerClientEvent("np-racing:addedPendingRace", -1, options)

    joinRace(src, id, alias, cid, true)
end)

RPC.register("np-racing:joinRace", function(src, id, alias, cid)
    joinRace(src, id, alias, cid)

    return
end)

RPC.register("np-racing:leaveRace", function(src)
    local srcString = tostring(src)
    local player = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = player:getCurrentCharacter()
    local cid = char.id
    local name = getIdentity(src)
    local alias = name.firstname .. " " .. name.lastname

    if not cid or not alias then
        return
    end

    local inRace, raceId = isPlayerInRace(cid)
    if not inRace then return end

    if cid == PendingRaces[raceId]["owner"] then
        for k, v in pairs(PendingRaces[raceId]["players"]) do
            TriggerClientEvent("np-racing:endRace", v.serverId)
        end

        PendingRaces[raceId] = nil
        TriggerClientEvent("np-racing:removedPendingRace", -1, raceId)
    else
        PendingRaces[raceId]["players"][srcString] = nil
        TriggerClientEvent("np-racing:leftRace", src)
        TriggerClientEvent("np-racing:addedPendingRace", -1, PendingRaces[raceId])

        for k, v in pairs(PendingRaces[raceId]["players"]) do
            TriggerClientEvent("np-racing:playerLeftYourRace", v.serverId, cid, alias)
        end
    end
end)

RPC.register("np-racing:dnfRace", function(src, id)
    local srcString = tostring(src)

    if not ActiveRaces[id] then return end

    local player = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = player:getCurrentCharacter()
    local cid = char.id
    local name = getIdentity(src)
    local alias = name.firstname .. " " .. name.lastname

    if not cid or not alias then
        return
    end

    ActiveRaces[id]["players"][srcString] = nil

    TriggerClientEvent("np-racing:leftRace", src)
    TriggerClientEvent("np-racing:updatedActiveRace", -1, ActiveRaces[id])

    for k, v in pairs(ActiveRaces[id]["players"]) do
        TriggerClientEvent("np-racing:playerLeftYourRace", v.serverId, cid, alias)
    end

    Citizen.Wait(1000)

    local countPlayers = 0
    for k, v in pairs(ActiveRaces[id]["players"]) do
        countPlayers = countPlayers + 1
    end

    if ActiveRaces[id]["positions"] > countPlayers then
        FinishedRaces[#FinishedRaces + 1] = ActiveRaces[id]
        TriggerClientEvent("np-racing:raceHistory", -1, ActiveRaces[id])

        for k, v in pairs(ActiveRaces[id]["players"]) do
            TriggerClientEvent("np-racing:endRace", v.serverId)
        end

        ActiveRaces[id] = nil
        TriggerClientEvent("np-racing:removedActiveRace", -1, id)
    end
end)

RPC.register("np-racing:startRace", function(src, id, countdown)
    if not PendingRaces[id] then
        return
    end

    ActiveRaces[id] = PendingRaces[id]
    TriggerClientEvent("np-racing:addedActiveRace", -1, ActiveRaces[id])

    PendingRaces[id] = nil
    TriggerClientEvent("np-racing:removedPendingRace", -1, id)

    local race = Races[id]
    race["laps"] = ActiveRaces[id]["laps"]
    race["players"] = ActiveRaces[id]["players"]

    for k, v in pairs(ActiveRaces[id]["players"]) do
        TriggerClientEvent("np-racing:startRace", v.serverId, race, countdown * 1000)
    end
end)

RPC.register("np-racing:endRace", function(src)
    local player = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = player:getCurrentCharacter()
    local cid = char.id
    if not cid then return end

    local raceId = ""
    for k, v in pairs(ActiveRaces) do
        if v.owner == cid then
            raceId = k
            break
        end
    end

    if raceId == "" then return end

    for k, v in pairs(ActiveRaces[raceId]["players"]) do
        TriggerClientEvent("np-racing:endRace", v.serverId)
    end

    ActiveRaces[raceId] = nil
    TriggerClientEvent("np-racing:removedActiveRace", -1, raceId)
end)

RPC.register("np-racing:finishedRace", function(src, curRaceid, bestLapTime, totalTime)
    local srcString = tostring(src)

    if not ActiveRaces[curRaceid] then return true end

    local player = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = player:getCurrentCharacter()
    local cid = char.id
    local name = getIdentity(src)
    local alias = name.firstname .. " " .. name.lastname

    if not cid or not alias then
        return true
    end

    if not ActiveRaces[curRaceid]["positions"] then
        ActiveRaces[curRaceid]["positions"] = 1


        local success = user:removeBank(100)
        if not success then
            TriggerClientEvent("DoLongHudText", src, 'message')
        end

        leaderboardAddRaces(curRaceid)
    end

    ActiveRaces[curRaceid]["players"][srcString]["position"] = ActiveRaces[curRaceid]["positions"]
    ActiveRaces[curRaceid]["positions"] = ActiveRaces[curRaceid]["positions"] + 1
    ActiveRaces[curRaceid]["players"][srcString]["fastest"] = bestLapTime
    ActiveRaces[curRaceid]["players"][srcString]["total"] = totalTime

    leaderboardAddFastest(curRaceid, bestLapTime, alias)

    TriggerClientEvent("np-racing:finishedRace", src, ActiveRaces[curRaceid]["players"][srcString]["position"], totalTime)
    TriggerClientEvent("np-racing:updatedActiveRace", -1, ActiveRaces[curRaceid])

    local countPlayers = 0
    for k, v in pairs(ActiveRaces[curRaceid]["players"]) do
        countPlayers = countPlayers + 1
    end

    if ActiveRaces[curRaceid]["players"][srcString]["position"] == countPlayers then
        FinishedRaces[#FinishedRaces + 1] = ActiveRaces[curRaceid]
        TriggerClientEvent("np-racing:raceHistory", -1, ActiveRaces[curRaceid])

        for k, v in pairs(ActiveRaces[curRaceid]["players"]) do
            TriggerClientEvent("np-racing:endRace", v.serverId)
        end

        ActiveRaces[curRaceid] = nil
        TriggerClientEvent("np-racing:removedActiveRace", -1, curRaceid)
    elseif ActiveRaces[curRaceid]["dnfPosition"] > 0 and ActiveRaces[curRaceid]["dnfPosition"] == ActiveRaces[curRaceid]["players"][srcString]["position"] then
        local countdown = ActiveRaces[curRaceid]["dnfCountdown"] * 1000

        for k, v in pairs(ActiveRaces[curRaceid]["players"]) do
            TriggerClientEvent("np-racing:startDNFCountdown", v.serverId, countdown)
        end

        Citizen.Wait(countdown)

        for k, v in pairs(ActiveRaces[curRaceid]["players"]) do
            if v.position == 0 then
                TriggerClientEvent("np-racing:dnfRace", v.serverId)
            end
        end

        Citizen.Wait(1000)

        for k, v in pairs(ActiveRaces[curRaceid]["players"]) do
            TriggerClientEvent("np-racing:endRace", v.serverId)
        end

        FinishedRaces[#FinishedRaces + 1] = ActiveRaces[curRaceid]
        TriggerClientEvent("np-racing:raceHistory", -1, ActiveRaces[curRaceid])

        ActiveRaces[curRaceid] = nil
        TriggerClientEvent("np-racing:removedActiveRace", -1, curRaceid)
    end

    return true
end)