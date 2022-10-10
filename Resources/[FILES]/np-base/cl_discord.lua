local onlinePlayers = 0
RegisterNetEvent('rich:TakePlayers')
AddEventHandler('rich:TakePlayers', function(count)
    onlinePlayers = count
    if SetDiscordRichPresenceAction then
        SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/fayzie")
    end
end)


Citizen.CreateThread(function()
    TriggerServerEvent('rich:GetPlayers')
    SetDiscordAppId(1021134932078239866)
 	SetDiscordRichPresenceAsset('big')
    while true do
        Citizen.Wait(2000)
		SetDiscordRichPresenceAssetText("Fayzie.xyz")
        SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/fayzie")
        SetDiscordRichPresenceAction(1,"Forum", "https://fayzie.xyz")
        SetRichPresence(onlinePlayers.."/64 | Fayzie FTW")
        SetBlipAlpha(GetNorthRadarBlip(), 0)
    end
end)