
local DreamsCocainePlaneCanBeStarted = true

RegisterServerEvent('dreams-cocaine:plane:start')
AddEventHandler('dreams-cocaine:plane:start', function(money)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)

	if user:getCash() >= money then
        
        if DreamsCocainePlaneCanBeStarted then
            user:removeMoney(money)
            DreamsCocainePlaneCanBeStarted = false
            TriggerClientEvent('dreams-cocaine:shitfuckoff', src)
            Citizen.Wait(3600000)
            DreamsCocainePlaneCanBeStarted = true
        else
            TriggerClientEvent('DoLongHudText', src, 'Someone is already out on a job cuz or im leaving this shit a bit to cool off', 2)
        end
    else
        TriggerClientEvent('DoLongHudText', src, 'You do not have enough cash for this !', 2)
    end
end)