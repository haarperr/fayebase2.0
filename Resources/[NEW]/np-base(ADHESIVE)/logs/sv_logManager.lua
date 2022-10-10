Void.Logs = Void.Logs or {}

Void.Logs.Webhooks = {
    ['Connection'] = 'https://discord.com/api/webhooks/979802617901379624/YVNbxvzZH60L39QbblyHh8YVtN4rqUtqM7i_E2hNWl4fnn9WcKes1BOlNFT96J8S70BL',
    ['Leave'] = 'https://discord.com/api/webhooks/979802731982258186/grG2QPJgZBHqKhX0kXMnT0cd6u8UeayQn7bMQZ6SkMl27dwkmFgTni-WXvkv8QsUlQ_G',
    ['Character'] = 'https://discord.com/api/webhooks/979802826039496805/cdA1YQ27McqsVnzH9lWWFWy7w5X_sIr05uLZIwehDBm8AsG8WQSEA-OfdKuDDZAjxdIJ',
    ['DeathLogs'] = 'https://discord.com/api/webhooks/979802959414181889/_zvw4-MV_1YhDRwpFS7PxPexdYhPsIkxrt968mvaj22SrfAEbT0kvxg4drC9X4LzAxQo',
    ['Widthdraw'] = 'https://discord.com/api/webhooks/979803195889057874/o8Fmfsxzlk2p0BRR0NjfRULzji0Aqzo-fUWSvdRrNhwjNOt3ThF6uCHh-hsDIQbVTBwz',
    ['Deposit'] = 'https://discord.com/api/webhooks/979803389259042896/2Tmf7Pn0dfOuPt98k2_K6_2ct881U5ZNQJQbXtpSNs5AJ-MgMs3rTwY2nUDSp3TRX7ts',
    ['Transfer'] = 'https://discord.com/api/webhooks/979803460746756106/Xek2CKcks5-wo8vaWjqO-TPa6BZBNQcV0a5Gkh9UVOSFWSkQQk6sKlCs5TmmlCRA-jhT',
    ['Givecash'] = 'https://discord.com/api/webhooks/979803538119069767/XnjODm7vjuggMDFlWnr9G_L4CjOMxVnBOuc-ZKcCd-AOamAQl3EaKmftgSdSnM5UFzev',
    ['Fishing'] = 'https://discord.com/api/webhooks/979803608583385118/Qqt56ieIF8x238VoRgT7XnLe--UGjVsHnFIx15CYfN7IdBOkYbAviRhDz2QnDTaoyklA',
    ['Farming'] = 'https://discord.com/api/webhooks/979804038856069200/vXTXggsNLDYn26fbu5Irv3WeQaWWDsWPxMmZfmFRedLYDgZhxyvLcxcrx0WkGBRd0rI4',
    ['Garbage'] = 'https://discord.com/api/webhooks/979804143013203998/89Gs6SG_o1o1eijtYzVAcQzrSSi9s9xDBPRu0Yo2sqMYEwX_XzEvoq6B0gLOzwqJ5TKg',
    ['Hunting'] = 'https://discord.com/api/webhooks/979804210625392640/ATO_ChCXJc8W5jynLVAVJU0zOUkzWBcQlLY_vaiw8tXdndTceOfYDr7ya7UKgIcBVPgg',
    ['Mining'] = 'https://discord.com/api/webhooks/979804270247436350/BZp9g91Fxe61clZ-tC3dcuIgradKqNP5Yeaev9cpQ3g-7uGH62YEEuWM5n37nvGasUvK',
    ['PostOP'] = 'https://discord.com/api/webhooks/979804343148609586/y_RhxlKjPDNEj9lyOgZfgVC1sEG2_cn-WxgZ852XkfwuEhCPhi_nNyO5sDLfbaaoi-X-',
    ['WaterPower'] = 'https://discord.com/api/webhooks/979804425059205220/aNLO-ekSLkvvLmJora_KdCn-Qy2HqktSlGpAMIraQeuCUEoBtKGZVf5O133jNB-ukC3w',
    ['Chicken'] = 'https://discord.com/api/webhooks/979804498480476271/ehMf51OkkIAvqNvUxf5mcMYZ7Tu_3CGM_7ennJbFbi1kVRIYorWZ1K5QH-Kdud9EYi0l',
}

Void.Logs.JoinLog = function(self, pName, pSteam, pDiscord)
    local embed = {
        {
            ['description'] = string.format("`User is joining!`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", pSteam, pDiscord),
            ['color'] = 3124231,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Connection'], function(err, text, headers) end, 'POST', json.encode({username = 'Connection Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.ExitLog = function(self, dReason, pName, pSteam, pDiscord)
    local embed = {
        {
            ['description'] = string.format("`User has left!`\n\n`• Reason: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", dReason, pSteam, pDiscord),
            ['color'] = 14038582,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Leave'], function(err, text, headers) end, 'POST', json.encode({username = 'Connection Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.UserCreate = function(self, uId, pName, pSteam, pDiscord, firstname, lastname, dob, gender)
    local embed = {
        {
            ['description'] = string.format("`User Profile Created.`\n\n`• User Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• First Name: %s`\n\n`• Last Name: %s`\n\n`• Date of Birth: %s`\n\n`• Gender: %s`\n━━━━━━━━━━━━━━━━━━", uId, pSteam, pDiscord, firstname, lastname, dob, gender),
            ['color'] = 2317994,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Character'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.DeathLogs = function(self, uId, message)
    local embed = {
        {
            ['description'] = string.format("`Death Log Created.`\n\n━━━━━━━━━━━━━━━━━━\n`• ".. message .. "`\n━━━━━━━━━━━━━━━━━━"),
            ['color'] = 3593942,
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['DeathLogs'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.BankingWidthdraw = function(self, uId, pName, pSteam, pDiscord, pulled, cashleft, bankleft)
    local embed = {
        {
            ['description'] = string.format("`Bank Log Widthdraw Created.`\n\n`• User Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Amount Withdrawn: $%s`\n\n`• Cash Balance: $%s`\n\n`• Bank Balance: $%s`\n━━━━━━━━━━━━━━━━━━", uId, pSteam, pDiscord, pulled, cashleft, bankleft),
            ['color'] = 8795862,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Widthdraw'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.BankingDeposit = function(self, uId, pName, pSteam, pDiscord, pulled, cashleft, bankleft)
    local embed = {
        {
            ['description'] = string.format("`Bank Deposit Log Created.`\n\n`• User Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Steam: %s`\n\n`• Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Amount Deposited: $%s`\n\n`• Cash Balance: $%s`\n\n`• Bank Balance: $%s`\n━━━━━━━━━━━━━━━━━━", uId, pSteam, pDiscord, pulled, cashleft, bankleft),
            ['color'] = 8795862,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Deposit'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.BankingTransfer = function(self, uId, uId2, pName, pName2, pSteam, pDiscord, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2)
    local embed = {
        {
            ['description'] = string.format("`Bank Transfer Log Created.`\n\n`• Player User Id: %s`\n\n`• Target User Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Player Steam: %s`\n\n`• Player Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Target Steam: %s`\n\n`• Target Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Player Amount Transfered: $%s`\n\n`• Player Cash Balance: $%s`\n\n`• Player Bank Balance: $%s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Target Amount Received: $%s`\n\n`• Target Cash Balance: $%s`\n\n`• Target Bank Balance: $%s`\n━━━━━━━━━━━━━━━━━━", uId, uId2, pSteam, pDiscord, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2),
            ['color'] = 8795862,
            ['author'] = {
                ['name'] = "Player : " .. pName .. " | Target : ".. pName2
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Transfer'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.BankingGiveCash = function(self, uId, uId2, pName, pName2, pSteam, pDiscord, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2)
    local embed = {
        {
            ['description'] = string.format("`Cash Given Log Created.`\n\n`• Player User Id: %s`\n\n`• Target User Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Player Steam: %s`\n\n`• Player Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Target Steam: %s`\n\n`• Target Discord: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Player Amount Transfered: $%s`\n\n`• Player Cash Balance: $%s`\n\n`• Player Bank Balance: $%s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Target Amount Received: $%s`\n\n`• Target Cash Balance: $%s`\n\n`• Target Bank Balance: $%s`\n━━━━━━━━━━━━━━━━━━", uId, uId2, pSteam, pDiscord, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2),
            ['color'] = 8795862,
            ['author'] = {
                ['name'] = "Player : " .. pName .. " | Target : ".. pName2
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Givecash'], function(err, text, headers) end, 'POST', json.encode({username = 'User Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.FishingLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Fishing Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Fishing'], function(err, text, headers) end, 'POST', json.encode({username = 'Fishing Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.FarmingLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Farmer Job Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Farming'], function(err, text, headers) end, 'POST', json.encode({username = 'Farming Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.GarbageLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Garbage Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Garbage'], function(err, text, headers) end, 'POST', json.encode({username = 'Garbage Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.HuntingLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Hunting Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Hunting'], function(err, text, headers) end, 'POST', json.encode({username = 'Hunting Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.MiningLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Mining Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Mining'], function(err, text, headers) end, 'POST', json.encode({username = 'Mining Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.PostOPLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`PostOP Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['PostOP'], function(err, text, headers) end, 'POST', json.encode({username = 'PostOP Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.WaterPowerLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Water & Power Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['WaterPower'], function(err, text, headers) end, 'POST', json.encode({username = 'Water & Power Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Void.Logs.ChickenLog = function(self, uId, pName, pSteam, pDiscord, amount)
    local embed = {
        {
            ['description'] = string.format("`Chicken Payment Log Created.`\n\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━\n\n`• User ID: %s`\n\n`• Payment Amount: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n", pSteam, pDiscord, uId, amount),
            ['color'] = 0128128,
            ['author'] = {
                ['name'] = pName
            }
        }
    }
    PerformHttpRequest(Void.Logs.Webhooks['Chicken'], function(err, text, headers) end, 'POST', json.encode({username = 'Chicken Logs', embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('np-base:charactercreate')
AddEventHandler('np-base:charactercreate',function(firstname, lastname, dob, gender)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs:UserCreate(source, pName, pSteam, pDiscord, firstname, lastname, dob, gender)
end)


RegisterServerEvent('np-base:bankwidthdraw')
AddEventHandler('np-base:bankwidthdraw',function(source, pulled, cashleft, bankleft)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs:BankingWidthdraw(source, pName, pSteam, pDiscord, pulled, cashleft, bankleft)
end)

RegisterServerEvent('np-base:bankdeposit')
AddEventHandler('np-base:bankdeposit',function(source, pulled, cashleft, bankleft)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs:BankingDeposit(source, pName, pSteam, pDiscord, pulled, cashleft, bankleft)
end)

RegisterServerEvent('np-base:banktransfer')
AddEventHandler('np-base:banktransfer',function(source, number, pName2, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs:BankingTransfer(source, number, pName, pName2, pSteam, pDiscord, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2)
end)

RegisterServerEvent('np-base:bankgivecash')
AddEventHandler('np-base:bankgivecash',function(source, number, pName2, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs:BankingGiveCash(source, number, pName, pName2, pSteam, pDiscord, pSteam2, pDiscord2, pulled, cashleft, bankleft, pulled2, cashleft2, bankleft2)
end)

RegisterServerEvent('np-base:deathlogs')
AddEventHandler('np-base:deathlogs',function(message)
    Void.Logs:DeathLogs(source, message)
end)

RegisterServerEvent('np-base:fishingLog')
AddEventHandler('np-base:fishingLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs.FishingLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('np-base:farmingLog')
AddEventHandler('np-base:farmingLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs.FarmingLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('np-base:garbageLog')
AddEventHandler('np-base:garbageLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs.GarbageLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('np-base:huntingLog')
AddEventHandler('np-base:huntingLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs.HuntingLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('np-base:miningLog')
AddEventHandler('np-base:miningLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs.MiningLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('np-base:postopLog')
AddEventHandler('np-base:postopLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs.PostOPLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('np-base:waterpowerLog')
AddEventHandler('np-base:waterpowerLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs.WaterPowerLog(source, source, pName, pSteam, pDiscord, amount)
end)

RegisterServerEvent('np-base:chickenLog')
AddEventHandler('np-base:chickenLog',function(source, amount)
    local pSteam = 'None'
    local pDiscord = 'None'
    local pName = GetPlayerName(source)
    local pIdentifiers = GetPlayerIdentifiers(source)
    for k, v in pairs(pIdentifiers) do
        if string.find(v, 'steam') then pSteam = v end
        if string.find(v, 'discord') then pDiscord = v end
    end
    Void.Logs.ChickenLog(source, source, pName, pSteam, pDiscord, amount)
end)