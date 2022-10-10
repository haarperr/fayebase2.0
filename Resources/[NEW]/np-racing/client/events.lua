previewEnabled = false

RegisterNetEvent("np-racing:addedActiveRace")
AddEventHandler("np-racing:addedActiveRace", function(race)
    activeRaces[race.id] = race

    if not config.nui.hudOnly then
        SendNUIMessage({
            activeRaces = activeRaces
        })
    end

    TriggerEvent("np-racing:api:addedActiveRace", race, activeRaces)
    TriggerEvent("np-racing:api:updatedState", { activeRaces = activeRaces })
end)

RegisterNetEvent("np-racing:removedActiveRace")
AddEventHandler("np-racing:removedActiveRace", function(id)
    activeRaces[id] = nil

    if not config.nui.hudOnly then
        SendNUIMessage({
            activeRaces = activeRaces
        })
    end

    TriggerEvent("np-racing:api:removedActiveRace", activeRaces)
    TriggerEvent("np-racing:api:updatedState", { activeRaces = activeRaces })
end)

RegisterNetEvent("np-racing:updatedActiveRace")
AddEventHandler("np-racing:updatedActiveRace", function(race)
    if activeRaces[race.id] then
        activeRaces[race.id] = race
    end

    if not config.nui.hudOnly then
        SendNUIMessage({
            activeRaces = activeRaces
        })
    end

    TriggerEvent("np-racing:api:updatedActiveRace", activeRaces)
    TriggerEvent("np-racing:api:updatedState", { activeRaces = activeRaces })
end)

RegisterNetEvent("np-racing:endRace")
AddEventHandler("np-racing:endRace", function(race)
    SendNUIMessage({
        showHUD = false
    })

    TriggerEvent("np-racing:api:raceEnded", race)

    cleanupRace()
end)

RegisterNetEvent("np-racing:raceHistory")
AddEventHandler("np-racing:raceHistory", function(race)
    finishedRaces[#finishedRaces + 1] = race

    if race then
        if not config.nui.hudOnly then
            SendNUIMessage({
                leaderboardData = race
            })
        end
    end

    TriggerEvent("np-racing:api:raceHistory", race)
    TriggerEvent("np-racing:api:updatedState", { finishedRaces = finishedRaces })
end)

RegisterNetEvent("np-racing:startRace")
AddEventHandler("np-racing:startRace", function(race, startTime)
    TriggerEvent("np-racing:api:startingRace", startTime)

    -- Wait for race countdown
    Citizen.Wait(startTime - 3000)

    SendNUIMessage({
        type = "countdown",
        start = 3,
    })

    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
    Citizen.Wait(1000)
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
    Citizen.Wait(1000)
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
    Citizen.Wait(1000)
    PlaySoundFrontend(-1, "Oneshot_Final", "MP_MISSION_COUNTDOWN_SOUNDSET")

    if not curRace then
        initRace(race)
        TriggerEvent("np-racing:api:raceStarted", race)
    end
end)

RegisterNetEvent("np-racing:updatePosition")
AddEventHandler("np-racing:updatePosition", function(position)
    -- print("Position is now: " .. position)
    SendNUIMessage({
        HUD = { position = position }
    })
end)

RegisterNetEvent("np-racing:dnfRace")
AddEventHandler("np-racing:dnfRace", function()
    SendNUIMessage({
        HUD = { dnf = true }
    })

    TriggerEvent("np-racing:api:dnfRace", race)
end)

RegisterNetEvent("np-racing:startDNFCountdown")
AddEventHandler("np-racing:startDNFCountdown", function(dnfTime)
    SendNUIMessage({
        HUD = { dnfTime = dnfTime }
    })
end)

RegisterNetEvent("np-racing:finishedRace")
AddEventHandler("np-racing:finishedRace", function(position, time)
    SendNUIMessage({
        HUD = {
            position = position,
            finished = time,
        }
    })
end)

RegisterNetEvent("np-racing:joinedRace")
AddEventHandler("np-racing:joinedRace", function(race)
    race.start.pos = tableToVector3(race.start.pos)
    spawnCheckpointObjects(race.start, config.startObjectHash)
end)

RegisterNetEvent("np-racing:leftRace")
AddEventHandler("np-racing:leftRace", function()
    cleanupProps()
end)

RegisterNetEvent("np-racing:playerJoinedYourRace")
AddEventHandler("np-racing:playerJoinedYourRace", function(characterId, name)
    if characterId == getCharacterId() then return end

    TriggerEvent("np-racing:api:playerJoinedYourRace", characterId, name)
end)

RegisterNetEvent("np-racing:playerLeftYourRace")
AddEventHandler("np-racing:playerLeftYourRace", function(characterId, name)
    if characterId == getCharacterId() then return end

    TriggerEvent("np-racing:api:playerLeftYourRace", characterId, name)
end)

RegisterNetEvent("np-racing:addedPendingRace")
AddEventHandler("np-racing:addedPendingRace", function(race)
    pendingRaces[race.id] = race

    if not config.nui.hudOnly then
        SendNUIMessage({
            pendingRaces = pendingRaces
        })
    end

    TriggerEvent("np-racing:api:addedPendingRace", race, pendingRaces)
    TriggerEvent("np-racing:api:updatedState", { pendingRaces = pendingRaces })
end)

RegisterNetEvent("np-racing:removedPendingRace")
AddEventHandler("np-racing:removedPendingRace", function(id)
    pendingRaces[id] = nil

    SendNUIMessage({ pendingRaces = pendingRaces })

    TriggerEvent("np-racing:api:removedPendingRace", pendingRaces)
    TriggerEvent("np-racing:api:updatedState", {pendingRaces=pendingRaces})
end)

RegisterNetEvent("np-racing:startCreation")
AddEventHandler("np-racing:startCreation", function()
    startRaceCreation()
end)

RegisterNetEvent("np-racing:addedRace")
AddEventHandler("np-racing:addedRace", function(newRace, newRaces)
    if not races then return end
    races = newRaces

    SendNUIMessage({
        races = newRaces
    })

    TriggerEvent("np-racing:api:addedRace")
    TriggerEvent("np-racing:api:updatedState", {races=races})
end)

AddEventHandler("onResourceStop", function (resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    cleanupProps()
    clearBlips()
    ClearGpsMultiRoute()
end)
