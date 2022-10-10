CnaRob = true
Step1 = false

local Available = true

RegisterServerEvent("step1enable", function()
    local source = source
    Step1 = true
end)

RegisterServerEvent("np-paleto:startCoolDown", function()
    local source = source
    CnaRob = false
    Available = false
    CreateThread(function()
        while true do
            Citizen.Wait(7200000)
            CnaRob = true
            Available = true
            TriggerServerEvent('np-doors:change-lock-state', 45, true) 
        end
    end)
end)

local LootPaleto = false

RegisterServerEvent('np-paleto:tut_tut')
AddEventHandler('np-paleto:tut_tut', function()
    local src = source
    if not LootPaleto then
        LootPaleto = true
        TriggerClientEvent('np-vault:grab', src)
        Citizen.Wait(40000)
        LootPaleto = false
    else
        TriggerClientEvent('DoLongHudText', src,'Fuck off you exploiting prick, CAUGHT IN 4K Ultra HD get logged.', 2)
    end
end)

RegisterServerEvent('np-heists:paleto_avail_check')
AddEventHandler('np-heists:paleto_avail_check', function()
    local src = source
    
    if Available then
        TriggerClientEvent('np-heists:paleto_available', src)
    else
        TriggerClientEvent('np-heists:paleto_unavailable', src)
    end
end)