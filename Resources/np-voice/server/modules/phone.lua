function StartPhoneCall(callerId, targetId, callId)
    TriggerClientEvent("ev:voice:phone:call:start", callerId, targetId, callId)
    TriggerClientEvent("ev:voice:phone:call:start", targetId, callerId, callId)
end

function StopPhoneCall(callerId, targetId, callId)
    TriggerClientEvent("ev:voice:phone:call:end", callerId, targetId, callId)
    TriggerClientEvent("ev:voice:phone:call:end", targetId, callerId, callId)
end

function LoadPhoneModule()
    exports('StartPhoneCall', StartPhoneCall)
    exports('StopPhoneCall', StopPhoneCall)

    AddEventHandler("np-inventory:droppedItem", function(pServerId, pItemName)
        Wait(2000)
        if pItemName == "mobilephone" then
            local phoneCount = exports["np-inventory"]:getQuantity(pServerId, pItemName)
            if phoneCount < 0 then
                TriggerClientEvent('np-inventory:itemCheck', playpServerIderId, pItemName, false, 0)
            end
        end
    end)

    AddEventHandler("ev:voice:phone:call:start", StartPhoneCall)
    AddEventHandler("ev:voice:phone:call:end", StopPhoneCall)

    TriggerEvent("ev:voice:phone:ready")

    Debug("[Phone] Module Loaded")
end
