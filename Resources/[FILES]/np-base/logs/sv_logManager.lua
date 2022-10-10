Void.Logs = Void.Logs or {}

Void.Logs.Webhooks = {
    ['Connection'] = 'https://discord.com/api/webhooks/985218814813798461/XiK6yYkwbr3HPu5MJRZlCrj_a6ufDfMD6lYKW4hFQDwiVouFeTctB6CcG61dK_1BRb4l',
    ['Leave'] = 'https://discord.com/api/webhooks/985218864889593937/9cbUFPmf33QsSkjtmWAxMGbcXUaSh7X5vk6nYMWx77eX7jZq8UPtNIXvyTYYTVWnOAFN',
    ['Character'] = 'https://discord.com/api/webhooks/985218918702547015/1i-a01lAXmAm6O_tpVj_KTedPba85F3vT3dzckrzxPmO1kLFlL1GQvEb39B_Cxi77MNj',
    ['DeathLogs'] = 'https://discord.com/api/webhooks/985220670512304158/IqmWu3kqWsZtDIo3cUtqvECd2psFoDLsTN6icuS3XasSmMYKE7PDjBObk4ulVHv1DT13',
    ['Widthdraw'] = 'https://discord.com/api/webhooks/985218983529693194/mzvps8SIOQAWIBqDdfWEDhW6qTlc0DOhyGw2bG2PBrmSA8gnFZxWhlD2vugrp-kvdg1i',
    ['Deposit'] = 'https://discord.com/api/webhooks/985219029432160277/mtdi3ySgHR5T9h_Ha7glv0ktMW8djmSz64dyWO-bYu3B41au6zcEja9W_CcdqtRO7ELB',
    ['Transfer'] = 'https://discord.com/api/webhooks/985219061111717938/7HV-Kjtm2jt7i0KSrgFYk2iviLXHM_600dqGd2CQZPeojP9G78kIzHmi27d_84uPV6vM',
    ['Givecash'] = 'https://discord.com/api/webhooks/985219163096232007/IkqBYsqsBqOZZPr8g16xvDBI9JP2jqMCplXG6A4C3fVyfYqy3gdHSIyZqx7gadHF_TEr',
    ['Fishing'] = 'https://discord.com/api/webhooks/985243066401169463/Cjl1VAyIrbgWJoGxc7Nxer9YpHq2cO9EXBvTuQcJ_fkwyhdWjh6eSL8sHWLVCLatcVep',
    ['Garbage'] = 'https://discord.com/api/webhooks/985243458417594458/98mDSkcGRYR-P1-sORp1AkdhEkuDGR4NKLppyTB-WZ7C9s2cCGhdZzvkcaOBVvEesnNC',
    ['Hunting'] = 'https://discord.com/api/webhooks/985243127830949929/WktJ19im7zYG9FJIrcQcr_x9Q-0hui7Rtz2-QJWzj05kmO1fP0klCE_LqxfK4vMPxzsn',
    ['Mining'] = 'https://discord.com/api/webhooks/985243190972002314/CdZTC7wULsvQYhb-vaB7vqiK44hOinFe5JdK_QnOZrVJ1ydvtbLJslvj6O3HjUfTvNCF',
    ['PostOP'] = 'https://discord.com/api/webhooks/985243396979441694/EO39ZhNJCifKqtYg5mTuqyq70SPt1RfYUKdqY6rt1hlRAjMAFqsr8LjUqzmqhFHOLCUZ',
    ['WaterPower'] = 'https://discord.com/api/webhooks/985243337139294308/heI6fN-4F-8WDLiw5VB-f6zp1mswJHV2R99L3nrrX3ux0jthk1vaTqJuZZntSYv6DHOm',
    ['Chicken'] = 'https://discord.com/api/webhooks/985243251957178398/XixfyBWCXCIWWAWOab76kHdxx27WEyNPWeuDLLVgrcds5Zcc0ocTksBluC4ZFNAL7bTY',
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