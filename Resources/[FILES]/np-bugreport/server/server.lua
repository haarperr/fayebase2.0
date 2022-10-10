local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/931089982758739968/2oDlB5NoP5YSVgmcmNPxqc0Uue2MWp6pHo0G9updjkpCH11UdT6bZU11ICg6hSeNjNLC"

RegisterServerEvent('send')
AddEventHandler('send', function(data)
    local pName = GetPlayerName(source)
    local connect = {
        {
            ["color"] = "255",
            ["title"] = "Bug Report - ".. pName,
            ["description"] = "Bug: (A name for the bug) \n\n `"..data.title.."` \n\n━━━━━━━━━━━━━━━━━━\n\n Description: (A description of what happens and what may cause it) \n\n `"..data.description.."` \n\n━━━━━━━━━━━━━━━━━━\n\n VOD, Clip or Screenshot (URL ONLY | Please use F8 for any console errors) \n\n `"..data.url.."` \n\n━━━━━━━━━━━━━━━━━━\n\n",
	        ["footer"] = {
                ["text"] = "Sent by warp ingame bug report",
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "warp",  avatar_url = "https://cdn.discordapp.com/attachments/928946993840132116/930453062403899472/Untitled-1.png",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

