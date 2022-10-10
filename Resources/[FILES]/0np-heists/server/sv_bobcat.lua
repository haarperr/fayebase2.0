canloot = false
legit = false

RegisterServerEvent("np-bobcat:effect")
AddEventHandler("np-bobcat:effect", function(method)
    TriggerClientEvent("lumo:effectoutside", -1, method)
end)

RegisterServerEvent("np-bobcat:effect2")
AddEventHandler("np-bobcat:effect2", function(method)
    TriggerClientEvent("lumo:effectinside", -1, method)
end)

RegisterServerEvent("np-bobcat:bubbles")
AddEventHandler("np-bobcat:bubbles", function()
    TriggerClientEvent("np-bobcat:bubbles", -1)
end)

RegisterServerEvent("np-bobcat:request_door")
AddEventHandler("np-bobcat:request_door", function()
    local src = source

    if not legit then
        TriggerClientEvent('DoLongHudText', src, 'Nice Bro', 2)
    elseif legit then
        TriggerClientEvent("walk", -1)
    end
end)

RegisterServerEvent("createped")
AddEventHandler("createped", function()
    canloot = true
    legit = true
    TriggerClientEvent("createped", -1)
end)

local searched1 = false
local searched2 = false
local searched3 = false

RegisterServerEvent("np-bobcat:search_crate_1")
AddEventHandler("np-bobcat:search_crate_1", function()
    local source = source
    
    if searched1 then
        TriggerClientEvent("DoLongHudText", source, "Already Searched")
    elseif canloot then
        TriggerClientEvent("np-bobcat:search_crate_1", source)
        searched1 = true
    end
end)

RegisterServerEvent("np-bobcat:search_crate_2")
AddEventHandler("np-bobcat:search_crate_2", function()
    local source = source
    
    if searched2 then
        TriggerClientEvent("DoLongHudText", source, "Already Searched")
    elseif canloot then
        TriggerClientEvent("np-bobcat:search_crate_2", source)
        searched2 = true
    end
end)

RegisterServerEvent("np-bobcat:search_crate_3")
AddEventHandler("np-bobcat:search_crate_3", function()
    local source = source
    
    if searched3 then
        TriggerClientEvent("DoLongHudText", source, "Already Searched")
    elseif canloot then
        TriggerClientEvent("np-bobcat:search_crate_3", source)
        searched3 = true
    end
end)