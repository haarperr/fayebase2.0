--[[

    Functions

]]

function joinRace(src, id, alias, cid, dontpay)
    print("MAIN JOIN RACE",src,id,alias,cid,dontpay)
    local srcString = tostring(src)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

   
    if not PendingRaces[id] then
        return
    end

    local inRace, raceId = isPlayerInRace(cid)
    if inRace then
        return
    end
    if PendingRaces[id]["buyIn"] > 0 and not dontpay then
        local bank = char.bank
        print("PUKING INA MO",user:getBalance())
        if tonumber(PendingRaces[id]["buyIn"]) > tonumber(user:getBalance()) then
            TriggerClientEvent("entityLongNotify", src, "You dont have $" .. PendingRaces[id]["buyIn"] .. " in your bank account")
            return
        end
        user:removeBank(PendingRaces[id]["buyIn"])
        print("GET OR REMOVE MONEY")
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

RPC.register("np-racing:createPendingRace", function(src, ids, optionss)
    local options = optionss
    local id = ids
    local srcString = tostring(src)

    if not id or not options then return end

    if PendingRaces[id] or ActiveRaces[id] then
        return
    end
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local cid = char.id
    local alias = getAlias(cid)
    local bank = char.bank
    print("ALIAS", alias)
    if not cid or not alias then
        return
    end
    if isPlayerInRace(cid) then
        return
    end
    options["buyIn"] = tonumber(options["buyIn"])
    if options["buyIn"] > 0 then
        local bank = char.bank
        if options["buyIn"] > bank then
            TriggerClientEvent("entityLongNotify", src, "You do not have $" .. options["buyIn"] .. " in your bank")
            return
        end
        user:removeBank(options["buyIn"])
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
    TriggerClientEvent('np-racing:pendingRacenotif', -1)
    print("GETTING TO JOIN AFTER CREATING RACE",options)
    joinRace(src, id, alias, cid, true)
end)

RPC.register("np-racing:joinRace", function(src, ids, aliass, cids)
    local id = ids
    local alias = aliass
    local cid = cids
    print("JOINING RACE",id,alias,cid)
    joinRace(src, id, alias, cid)

    return
end)

RPC.register("np-racing:leaveRace", function(src)
    local srcString = tostring(src)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local alias = getAlias(char.id)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local cid = char.id

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

RPC.register("np-racing:dnfRace", function(src, ids)
    local id = ids
    local srcString = tostring(src)

    if not ActiveRaces[id] then return end

    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local alias = getAlias(char.id)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local cid = char.id

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

RPC.register("np-racing:startRace", function(src, ids, countdowns, ownerID)

    local id = ids
    local countdown = countdowns
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
    local startTime = 0
    local isStartEnabled = true
    for j,s in pairs(ActiveRaces[id]["players"]) do
        startTime = startTime+1
        if startTime >= 4 then
            isStartEnabled = true
        end
    end
    print(startTime, isStartEnabled)
    for k, v in pairs(ActiveRaces[id]["players"]) do
        print("SERVER ID PLAYERS",v.serverId)
        if isStartEnabled then
            TriggerClientEvent("np-racing:startRace", v.serverId, race, countdown * 1000)
            TriggerClientEvent("np-racing:api:currentRace", v.serverId, race)
        else
            local user = exports['np-base']:getModule("Player"):GetUser(v.serverId)
            local char = user:getCurrentCharacter()
            if char.id == ownerID then
                print(char.id, ownerID)
                TriggerClientEvent("entityLongNotify", v.serverId, "This race cannot be started with less than 4 people.")
            end
        end
    end
end)

RPC.register("np-racing:endRace", function(src)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
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

RPC.register("np-racing:finishedRace", function(src, curRaceids, bestLapTimes, totalTimes)
    local curRaceid = curRaceids
    local bestLapTime = bestLapTimes
    local totalTime = totalTimes
    local srcString = tostring(src)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local alias = getAlias(char.id)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local cid = char.id
    
    if not ActiveRaces[curRaceid] then return true end
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local cid = char.id
    local alias = getAlias(char.id)

    if not cid or not alias then
        return true
    end

    if not ActiveRaces[curRaceid]["positions"] then
        ActiveRaces[curRaceid]["positions"] = 1

        leaderboardAddRaces(curRaceid)
    end

    ActiveRaces[curRaceid]["players"][srcString]["position"] = ActiveRaces[curRaceid]["positions"]
    ActiveRaces[curRaceid]["positions"] = ActiveRaces[curRaceid]["positions"] + 1
    ActiveRaces[curRaceid]["players"][srcString]["fastest"] = bestLapTime
    ActiveRaces[curRaceid]["players"][srcString]["total"] = totalTime

    leaderboardAddFastest(curRaceid, bestLapTime, alias)

    TriggerClientEvent("np-racing:finishedRace", src, ActiveRaces[curRaceid]["players"][srcString]["position"], totalTime, ActiveRaces[curRaceid]["buyIn"])
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