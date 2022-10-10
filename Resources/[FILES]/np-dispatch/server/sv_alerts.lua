RegisterServerEvent("np-dispatch:teenA")
AddEventHandler("np-dispatch:teenA",function(targetCoords)
    TriggerClientEvent('np-dispatch:policealertA', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:teenB")
AddEventHandler("np-dispatch:teenB",function(targetCoords)
    TriggerClientEvent('np-dispatch:policealertB', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:teenpanic")
AddEventHandler("np-dispatch:teenpanic",function(targetCoords)
    TriggerClientEvent('np-dispatch:panic', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:empanic")
AddEventHandler("np-dispatch:empanic",function(targetCoords)
    TriggerClientEvent('np-dispatch:epanic', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:gaexplosion")
AddEventHandler("np-dispatch:gaexplosion",function(targetCoords)
    TriggerClientEvent('np-dispatch:gexplosion', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:fourA")
AddEventHandler("np-dispatch:fourA",function(targetCoords)
    TriggerClientEvent('np-dispatch:tenForteenA', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:fourB")
AddEventHandler("np-dispatch:fourB",function(targetCoords)
    TriggerClientEvent('np-dispatch:tenForteenB', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:downperson")
AddEventHandler("np-dispatch:downperson",function(targetCoords)
    TriggerClientEvent('np-dispatch:downalert', -1, targetCoords)
	return
end)

-- RegisterServerEvent("np-dispatch:assistancen")
-- AddEventHandler("np-dispatch:assistancen",function(targetCoords)
--     TriggerClientEvent('np-dispatch:assistance', -1, targetCoords)
-- 	return
-- end)


RegisterServerEvent("np-dispatch:sveh")
AddEventHandler("np-dispatch:sveh",function(targetCoords)
    TriggerClientEvent('np-dispatch:vehiclesteal', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:svCarBoost")
AddEventHandler("np-dispatch:svCarBoost", function(targetCoords)
    TriggerClientEvent("np-dispatch:carBoostBlip", -1, targetCoords)
end)

RegisterServerEvent("np-dispatch:svCarBoostTracker")
AddEventHandler("np-dispatch:svCarBoostTracker", function(targetCoords)
    TriggerClientEvent("np-dispatch:carBoostBlipTracker", -1, targetCoords)
end)

RegisterServerEvent("np-dispatch:shoot")
AddEventHandler("np-dispatch:shoot",function(targetCoords)
    TriggerClientEvent('np-dispatch:gunShot', -1, targetCoords)
	return
end)

-- RegisterServerEvent("np-dispatch:figher")
-- AddEventHandler("np-dispatch:figher",function(targetCoords)
--     TriggerClientEvent('vrp-outlawalert:combatInProgress', -1, targetCoords)
-- 	return
-- end)

RegisterServerEvent("np-dispatch:storerob")
AddEventHandler("np-dispatch:storerob",function(targetCoords)
    TriggerClientEvent('np-dispatch:storerobbery', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:houserob")
AddEventHandler("np-dispatch:houserob",function(targetCoords)
    TriggerClientEvent('np-dispatch:houserobbery2', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:tbank")
AddEventHandler("np-dispatch:tbank",function(targetCoords)
    TriggerClientEvent('np-dispatch:banktruck', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:robjew")
AddEventHandler("np-dispatch:robjew",function()
    TriggerClientEvent('np-dispatch:jewelrobbey', -1)
	return
end)

-- RegisterServerEvent("np-dispatch:bjail")
-- AddEventHandler("np-dispatch:bjail",function()
--     TriggerClientEvent('np-dispatch:jewelrobbey', -1)
-- 	return
-- end)


RegisterServerEvent("np-dispatch:bankrobberyfuck")
AddEventHandler("np-dispatch:bankrobberyfuck",function(targetCoords)
    TriggerClientEvent('np-dispatch:bankrob', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:drugg23")
AddEventHandler("np-dispatch:drugg23",function(targetCoords)
    TriggerClientEvent('np-dispatch:drugdealreport', -1, targetCoords)
	return
end)


RegisterServerEvent("np-dispatch:bobbycat")
AddEventHandler("np-dispatch:bobbycat",function(targetCoords)
    TriggerClientEvent('np-dispatch:bobcatreport', -1, targetCoords)
	return
end)



RegisterServerEvent("np-dispatch:vaulttt")
AddEventHandler("np-dispatch:vaulttt",function(targetCoords)
    TriggerClientEvent('np-dispatch:vaultreport', -1, targetCoords)
	return
end)

RegisterServerEvent("np-dispatch:unauth_plane")
AddEventHandler("np-dispatch:unauth_plane",function(targetCoords)
    TriggerClientEvent('np-dispatch:coke_plane', -1, targetCoords)
	return
end)