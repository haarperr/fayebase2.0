local PaycheckLog = '' -- Your Discord webhook for logs

RegisterNetEvent('paycheck:collect:log')
AddEventHandler('paycheck:collect:log', function()
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local hexId = user:getVar("hexid")
    local pName = GetPlayerName(source)
    local pDiscord = GetPlayerIdentifiers(src)[3]
    local LogData = {
        {
            ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n`• Steam: %s`\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "Picked up their paycheck!", src, hexId, pDiscord),
            ['color'] = 2317994,
            ['author'] = {
                ['name'] = "Steam Name: "..pName
            },
        }
    }

    PerformHttpRequest(PaycheckLog, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = LogData}), { ['Content-Type'] = 'application/json' })
end)

function Void.Core.ConsoleLog(self, msg, mod, ply)
	if not tostring(msg) then return end
	if not tostring(mod) then mod = "No Module" end

	local pMsg = string.format("^3[ot LOG - %s]^7 %s", mod, msg)
	if not pMsg then return end

	if ply and tonumber(ply) then
		TriggerClientEvent("np-base:consoleLog", ply, msg, mod)
	end
end

AddEventHandler("onResourceStart", function(resource)
	TriggerClientEvent("np-base:waitForExports", -1)

	if not Void.Core.ExportsReady then return end

	Citizen.CreateThread(function()
		while true do 
			Citizen.Wait(0)
			if Void.Core.ExportsReady then
				TriggerEvent("np-base:exportsReady")
				return
			else
			end
		end
	end)
end)

RegisterNetEvent("np-base:playerSessionStarted")
AddEventHandler("np-base:playerSessionStarted", function()

	local src = source
	local name = GetPlayerName(src)
	local user = Void.Player:GetUser(src)
end)

AddEventHandler("np-base:characterLoaded", function(user, char)
	local src = source
	local hexId = user:getVar("hexid")

	if char.phone_number == 0 then
		Void.Core:CreatePhoneNumber(source, function(phonenumber, err)	
			local q = [[UPDATE characters SET phone_number = @phone WHERE owner = @owner and id = @cid]]
			local v = {
				["phone"] = phoneNumber,
				["owner"] = hexId,
				["cid"] = char.id
			}

			exports.oxmysql:execute(q, v, function()
				char.phone_number = char.phone_number
				user:setCharacter(char)
			end)
		end)
	end
end)


-- Paycheck shit
Citizen.CreateThread(function()
	while true do
		Citizen.Wait((60 * 1000) * 25) -- 25 mins
		TriggerClientEvent('paycheck:client:call', -1)
		print("^1[np-base] Paychecks Sent^0")
	end
end)

RegisterServerEvent('paycheck:server:send')
AddEventHandler('paycheck:server:send', function(cid)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local job = user:getVar("job")
	if user ~= false then

		if job == "unemployed" then -- Bum Jobs 
			TriggerEvent("paycheck:server:add", src, cid, 50)
		elseif job == "police" or job == "sheriff" or job == "state" then -- Police
			TriggerEvent("paycheck:server:add", src, cid, 609)
		elseif job == "best_buds" or job == "burger_shot" or job == "bean_machine" or job == "vanilla_unicorn" then -- Civ Jobs
			TriggerEvent("paycheck:server:add", src, cid, 100)
		elseif job == "auto_bodies" or job == "tuner_shop" or job == "paleto_mech" or job == "auto_exotics" or job == "car_shop" then -- Mechanic Shops
			TriggerEvent("paycheck:server:add", src, cid, 100)
		elseif job == "ems" then -- EMS
			TriggerEvent("paycheck:server:add", src, cid, 700 + 69)
		elseif job == 'judge' or 'public_defender' or 'district_attorney' then -- doj
			TriggerEvent("paycheck:server:add", src, cid, 420 + 420)
		end
		
	end
end)

RegisterServerEvent('paycheck:server:add')
AddEventHandler('paycheck:server:add', function(srcID, cid, amount)
	exports.oxmysql:execute('SELECT `paycheck` FROM characters WHERE `id`= ?', {cid}, function(data)
		local newAmount = data[1].paycheck + tonumber(amount)
		exports.oxmysql:execute("UPDATE characters SET `paycheck` = ? WHERE `id` = ?", {newAmount, cid})
		Citizen.Wait(500)
		TriggerClientEvent('DoLongHudText', srcID, 'A payslip of $'.. tonumber(amount) ..' making a total of $' ..newAmount ..' with $0 tax withheld on your last payment.', 1)
	end)
end)

RegisterServerEvent("paycheck:collect")
AddEventHandler("paycheck:collect", function(cid)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	exports.oxmysql:execute('SELECT `paycheck` FROM characters WHERE `id`= ?', {cid}, function(data)
		local amount = tonumber(data[1].paycheck)
		if amount >= 1 then
			TriggerClientEvent('paycheck:collect:log:handler', -1)
			exports.oxmysql:execute("UPDATE characters SET `paycheck` = ? WHERE `id` = ?", {"0", cid})
			user:addBank(amount)
		else
			TriggerClientEvent("DoLongHudText", src, "You're broke, go work!")
		end
	end)
end)