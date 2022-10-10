

local IsSportModOn = {}
local oldSportModData = {}
local isChiped = {}

RegisterServerEvent('carmod:OpenSportMod')
AddEventHandler('carmod:OpenSportMod', function(plate, data)
    IsSportModOn[plate] = true
    oldSportModData[plate] = data
end)

RegisterServerEvent('carmod:CloseSportMod')
AddEventHandler('carmod:CloseSportMod', function(plate)
    IsSportModOn[plate] = nil
end)

RegisterServerEvent("nitro:__sync")
AddEventHandler("nitro:__sync", function(boostEnabled, purgeEnabled, lastVehicle)
    local src = source
    TriggerClientEvent("nitro:__update", -1, src, boostEnabled, purgeEnabled, lastVehicle)
end)