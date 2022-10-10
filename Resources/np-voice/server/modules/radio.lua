function AddPlayerToRadio(radioID, serverID)
    if not RadioChannels[radioID] then
        RegisterRadioChannel(radioID)
    end

    local channel = RadioChannels[radioID]

    if channel:subscriberExists(serverID) then return false end

    local authorized = channel:hasAuthorization(serverID)

    if authorized then
        if not Config.enableMultiFrequency then
            RemovePlayerFromAllRadios(serverID)
        end

        channel:addSubscriber(serverID)
    end

    Debug("[Radio] Player Added to Radio | Radio ID: %s | Player: %s", radioID, serverID)

    return authorized
end

function RemovePlayerFromRadio(radioID, serverID)
    local channel = RadioChannels[radioID]

    if channel and channel:subscriberExists(serverID) then
        channel:removeSubscriber(serverID)

        Debug("[Radio] Player Removed From Radio | Radio ID: %s | Player: %s", radioID, serverID)
    end
end

function RemovePlayerFromAllRadios(serverID)
    for _, channel in pairs(RadioChannels) do
        channel:removeSubscriber(serverID)
    end
end

function SetPlayerRadioPowerState(serverID, state)
    TriggerClientEvent("ev:voice:radio:power", serverID, state)
end

function SetPlayerRadioVolume(serverID, state)
    TriggerClientEvent("ev:voice:radio:volume", serverID, state)
end

function LoadRadioModule()
    AddEventHandler("playerDropped", function()
        RemovePlayerFromAllRadious(source)
    end)

    AddEventHandler("np-inventory:droppedItem", function(pServerId, pItemName)
        Wait(2000)
        if pItemName == "radio" then
            local radioCount = exports["np-inventory"]:getQuantity(pServerId, pItemName)
            if radioCount < 0 then
                SetPlayerRadioPowerState(pServerId, false)
            end
        end
    end)

    exports('AddPlayerToRadio', AddPlayerToRadio)
    RegisterNetEvent('AddPlayerToRadio')
    AddEventHandler('AddPlayerToRadio', AddPlayerToRadio)

    exports('RemovePlayerFromRadio', RemovePlayerFromRadio)
    exports('RemovePlayerFromAllRadios', RemovePlayerFromAllRadios)
    exports('RegiserRadioChannel', RegisterRadioChannel)
    exports('SetPlayerRadioPowerState', SetPlayerRadioPowerState)
    exports('SetPlayerRadioVolume', SetPlayerRadioVolume)

    TriggerEvent("ev:voice:radio:ready")

    Debug("[Radio] Module Loaded")
end