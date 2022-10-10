function addPlayerToRadio(channel, netId)
	local serverID = netId or source

	if channel then

		TriggerClientEvent('ev:fiber:voice-event', serverID, 'radioPowerState', true)
		TriggerClientEvent('ev:fiber:voice-event', serverID, 'radioFrequency', channel)
	end
end

exports("addPlayerToRadio", addPlayerToRadio)

RegisterNetEvent("TokoVoip:addPlayerToRadio")
AddEventHandler("TokoVoip:addPlayerToRadio", addPlayerToRadio)

function removePlayerFromRadio(channel, netId)
	local serverID = netId or source

	if channel then

		TriggerClientEvent('ev:fiber:voice-event', serverID, 'radioPowerState', false)
		TriggerClientEvent('ev:fiber:voice-event', serverID, 'radioFrequency', -1)
	end
end

exports("removePlayerFromRadio", removePlayerFromRadio)

RegisterServerEvent("TokoVoip:removePlayerFromRadio")
AddEventHandler("TokoVoip:removePlayerFromRadio", removePlayerFromRadio)

function removePlayerFromAllRadio(netId)
	local serverID = netId or source

	TriggerClientEvent('ev:fiber:voice-event', serverID, 'radioPowerState', false)
	TriggerClientEvent('ev:fiber:voice-event', serverID, 'radioFrequency', -1)
end

exports("removePlayerFromAllRadio", removePlayerFromAllRadio)

RegisterServerEvent("TokoVoip:removePlayerFromAllRadio")
AddEventHandler("TokoVoip:removePlayerFromAllRadio", removePlayerFromAllRadio)