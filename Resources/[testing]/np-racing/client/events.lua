previewEnabled = false
local usedItemId, usedItemSlot, usedItemMetadata

RegisterNetEvent("np-racing:addedActiveRace")
AddEventHandler("np-racing:addedActiveRace", function(race)
    print("ADDING ACTIVE RACE")
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
    print("REMOVE ACTIVE RACE")
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
    print("RACE FUCKING END")
    SendNUIMessage({
        showHUD = false
    })

    TriggerEvent("np-racing:api:raceEnded", race)
    TriggerEvent('np-racing:np-racing:api:updatedStat')
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

function round(x, n) 
    return tonumber(string.format("%." .. n .. "f", x))
end

RegisterNetEvent("np-racing:finishedRace")
AddEventHandler("np-racing:finishedRace", function(position, time, pEnterAmt)
    if position == 1 then
        RPC.execute('np-racing:awardPlayer', math.random(40, 50) + round(pEnterAmt / 6, 0))
    elseif position == 2 then
        RPC.execute('np-racing:awardPlayer', math.random(20, 30))
    elseif position == 3 then
        RPC.execute('np-racing:awardPlayer', math.random(10))
    end
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
    TriggerEvent('np-racing:api:updatedState')
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

local function openAliasTextbox()
  exports['np-interface']:openApplication('textbox', {
    callbackUrl = 'np-interface:racing:input:alias',
    key = 1,
    items = {{icon = "pencil-alt", label = "Alias", name = "alias"}},
    show = true
  })
end

AddEventHandler("np-inventory:itemUsed", function(item, metadata, inventoryName, slot)
  if item ~= "racingusb2" then return end
  usedItemId = item
  usedItemSlot = slot
  usedItemMetadata = json.decode(metadata)

  local characterId = exports["isPed"]:isPed("cid")
  if characterId ~= usedItemMetadata.characterId then
    TriggerEvent("entityLongNotify", "You don't own this usb!", 2)
    return
  end

  if usedItemMetadata.Alias then
    TriggerEvent("entityLongNotify", "Alias can't be changed for this usb!", 2)
    return
  end

  openAliasTextbox()
end)

RegisterInterfaceCallback("np-interface:racing:input:alias", function(data, cb)
  cb({data = {}, meta = {ok = true, message = ''}})
  exports['np-interface']:closeApplication('textbox')
  local alias = data.values.alias

  if usedItemMetadata.Alias then return end

  if not alias then
    TriggerEvent("entityLongNotify", "No alias entered!", 2)
    return
  end

  local success, msg = RPC.execute("np-racing:setAlias", usedItemId, usedItemSlot, usedItemMetadata, alias)
  if success then
    exports["np-phone"]:phoneNotification("racen", "Welcome to the underground, " .. alias .. ".", "From the PM", 5000)
  else
    TriggerEvent("entityLongNotify", msg or "Alias could not be set.", 2)
    if msg == "Alias already taken!" then
      openAliasTextbox()
    end
  end
end)

-- RegisterCommand("np-racing:giveRacingUSB", function()
--     RPC.execute("np-racing:giveRacingUSB")
-- end)

AddEventHandler("onResourceStop", function (resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    cleanupProps()
    clearBlips()
    ClearGpsMultiRoute()
end)

RegisterNetEvent('np-racing:api:currentRace')
AddEventHandler("np-racing:api:currentRace", function(currentRace)
    print(json.encode(currentRace))
    -- print("FUCK THIS SHIT HERE******************************************************")
    isRacing = currentRace ~= nil
    if isRacing then
        -- startBubblePopper(currentRace)
    end
end)