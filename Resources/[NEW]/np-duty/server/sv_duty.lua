local currentCops = 0
local currentEMS = 0

RegisterServerEvent('np-duty:AttemptDuty')
AddEventHandler('np-duty:AttemptDuty', function(pJobType)
	local src = source
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	local job = pJobType
	exports.oxmysql:execute('SELECT callsign FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result)
		jobs:SetJob(user, job, false, function()
			if result[1].callsign ~= nil then
				pCallSign = result[1].callsign
			else
				pCallSign = "000"
			end
			if pJobType == 'police' then
				TriggerClientEvent('np-duty:PDSuccess', src)
				TriggerClientEvent("DoLongHudText", src,"10-41 and Restocked.",17)
				TriggerClientEvent("startSpeedo",src)
				currentCops = currentCops + 1
				TriggerClientEvent("job:policecount", -1, currentCops)
				TriggerEvent('np-eblips:server:registerPlayerBlipGroup', src, job)
				TriggerEvent('np-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
			elseif pJobType == 'sheriff' then
				TriggerClientEvent('np-duty:BCSOSuccess', src)
				TriggerClientEvent("DoLongHudText", src,"10-41 and Restocked.",17)
				TriggerClientEvent("startSpeedo",src)
				currentCops = currentCops + 1
				TriggerClientEvent("job:policecount", -1, currentCops)
				TriggerEvent('np-eblips:server:registerPlayerBlipGroup', src, job)
				TriggerEvent('np-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
			elseif pJobType == 'ranger' then
				TriggerClientEvent('np-duty:SAPRSuccess', src)
				TriggerClientEvent("DoLongHudText", src,"10-41 and Restocked.",17)
				TriggerClientEvent("startSpeedo",src)
				currentCops = currentCops + 1
				TriggerClientEvent("job:policecount", -1, currentCops)
				TriggerEvent('np-eblips:server:registerPlayerBlipGroup', src, job)
				TriggerEvent('np-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
			elseif pJobType == 'state' then
				TriggerClientEvent('np-duty:SASPSuccess', src)
				TriggerClientEvent("DoLongHudText", src,"10-41 and Restocked.",17)
				TriggerClientEvent("startSpeedo",src)
				currentCops = currentCops + 1
				TriggerClientEvent("job:policecount", -1, currentCops)
				TriggerEvent('np-eblips:server:registerPlayerBlipGroup', src, job)
				TriggerEvent('np-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
			elseif pJobType == 'doc' then
				TriggerClientEvent('np-duty:DOCSuccess', src)
				TriggerClientEvent("DoLongHudText", src,"10-41 and Restocked.",17)
				TriggerClientEvent("startSpeedo",src)
				currentCops = currentCops + 1
				TriggerClientEvent("job:policecount", -1, currentCops)
				TriggerEvent('np-eblips:server:registerPlayerBlipGroup', src, job)
				TriggerEvent('np-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
			elseif pJobType == 'dispatcher' then
				TriggerEvent('np-eblips:server:registerPlayerBlipGroup', src, job)
				TriggerEvent('np-eblips:server:registerSourceName', src, pCallSign .." | ".. character.first_name .." ".. character.last_name)
			end
		end)
	end)
end)

RegisterServerEvent('np-duty:AttemptDutyEMS')
AddEventHandler('np-duty:AttemptDutyEMS', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	local job = pJobType and pJobType or 'ems'
	exports.oxmysql:execute('SELECT callsign FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result)
		jobs:SetJob(user, job, false, function()
			TriggerClientEvent('np-duty:EMSSuccess', src)
			TriggerClientEvent("DoLongHudText", src,"On-Duty.",17)
			currentEMS = currentEMS + 1
			TriggerClientEvent("job:emscount", -1, currentEMS)
			TriggerEvent('np-eblips:server:registerPlayerBlipGroup', src, 'ems')
			TriggerEvent('np-eblips:server:registerSourceName', src, result[1].callsign .." | ".. character.first_name .." ".. character.last_name)
		end)
	end)
end)

RegisterServerEvent('np-duty:OffDutyComplete')
AddEventHandler('np-duty:OffDutyComplete', function(pJobType)
	print(pJobType)
	if currentCops ~= 0 then
		currentCops = currentCops - 1
	else
		currentCops = 0
	end
	TriggerClientEvent("job:policecount", -1, currentCops)
	TriggerEvent('np-eblips:server:removePlayerBlipGroup', source, pJobType)
end)

RegisterServerEvent('np-duty:OffDutyCompleteEMS')
AddEventHandler('np-duty:OffDutyCompleteEMS', function()
	if currentEMS ~= 0 then
		currentEMS = currentEMS - 1
	else
		currentEMS = 0
	end
	TriggerClientEvent("job:emscount", -1, currentEMS)
	TriggerEvent('np-eblips:server:removePlayerBlipGroup', source, 'ems')
end)

RegisterServerEvent('np-duty:AttemptDutyJudge')
AddEventHandler('np-duty:AttemptDutyJudge', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'judge'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'judge', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('np-duty:JudgeSuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)

RegisterServerEvent('np-duty:AttemptDutyDA')
AddEventHandler('np-duty:AttemptDutyDA', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'da'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'da', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('np-duty:DASuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)

RegisterServerEvent('np-duty:AttemptDutyPublic')
AddEventHandler('np-duty:AttemptDutyPublic', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'defender'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'defender', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('np-duty:PublicSuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)
		-- Start Tow
RegisterServerEvent('np-duty:AttemptDutyTow')
AddEventHandler('np-duty:AttemptDutyTow', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'towunion'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'towunion', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('np-duty:TowSuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)
		-- End Tow

		-- Start Burgershot
RegisterServerEvent('np-duty:AttemptDutyBurger')
AddEventHandler('np-duty:AttemptDutyBurger', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'burger_shot'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'burger_shot', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('np-duty:BurgerSuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)
		-- End Burgershot

		-- Start ArtGallery
RegisterServerEvent('np-duty:AttemptDutyArt')
AddEventHandler('np-duty:AttemptDutyArt', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'art_gallery'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'art_gallery', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('np-duty:ArtSuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)
		-- End ArtGallery

		--Start PDM
RegisterServerEvent('np-duty:AttemptDutyPDM')
AddEventHandler('np-duty:AttemptDutyPDM', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'pdm'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'pdm', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('np-duty:PDMSuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)
		-- End PDM

		--Start Cosmic Cannabis
RegisterServerEvent('np-duty:AttemptDutyCosmic')
AddEventHandler('np-duty:AttemptDutyCosmic', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'cosmic_cannabis'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'cosmic_cannabis', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clock On!", 1)
				TriggerClientEvent('np-duty:CosmicSuccess', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,"You are not whitelisted for this job!", 2)
		end
	end)
end)
		-- End Cosmic Cannabis

AddEventHandler('playerDropped', function()
	local src = source
	if src ~= nil then
		local steamIdentifier = GetPlayerIdentifiers(src)[1]
		exports.oxmysql:execute('SELECT * FROM characters WHERE owner = ?', {steamIdentifier}, function(result)
			if result[1].job == 'police' or result[1].job == 'sheriff' or result[1].job == 'state' then
				if currentCops ~= 0 then
					currentCops = currentCops - 1
				else
					currentCops = 0
				end
                print('Active PD:', currentCops)
                exports.oxmysql:execute("UPDATE characters SET `job` = @job WHERE `owner` = @owner", {['@owner'] = steamIdentifier, ['@job'] = 'unemployed'})
				TriggerClientEvent("job:policecount", -1, currentCops)
				TriggerEvent('np-eblips:server:removePlayerBlipGroup', src, 'police')
				TriggerClientEvent('np-duty:OffDuty' ,src)
            elseif result[1].job == 'ems' then
                if currentEMS ~= 0 then
					currentEMS = currentEMS - 1
				else
					currentEMS = 0
				end
                print('Active EMS:', currentEMS)
				TriggerClientEvent('np-duty:OffDutyEMS' ,src)
                exports.oxmysql:execute("UPDATE characters SET `job` = @job WHERE `owner` = @owner", {['@owner'] = steamIdentifier, ['@job'] = 'unemployed'})
				TriggerClientEvent("job:emscount", -1, currentEMS)
				TriggerEvent('np-eblips:server:removePlayerBlipGroup', src, 'ems')
			elseif result[1].job == 'judge' then
				local remove = Await(SQL.execute("DELETE FROM doj_duty WHERE src = @src AND job = @job", {
					["src"] = src,
					["job"] = "judge"
				}))
			elseif result[1].job == 'lawyer' then
				local remove = Await(SQL.execute("DELETE FROM doj_duty WHERE src = @src AND job = @job", {
					["src"] = src,
					["job"] = "lawyer"
				}))
			end
		end)
	end
end)


function SignOnRadio(src)

	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()

	local q = [[SELECT id, cid, job, callsign, rank FROM jobs_whitelist WHERE cid = @cid AND (job = 'police' or job = 'doc')]]
	local v = {["cid"] = char.id}

	exports.oxmysql:execute(q, v, function(results)
		if not results then return end
		local callsign = ""
		if results[1].callsign ~= nil and results[1].callsign == "" then callsign = results[1].callsign else callsign = "TBD" end
		if (src ~= nil and char.first_name ~= nil and char.last_name ~= nil) then
			TriggerClientEvent("DoLongHudText", "Sessioned!?", 2)
		else
			TriggerClientEvent("SignOnRadio", src)
		end
	end)
end

RegisterServerEvent('np-duty:AttemptDutySuits')
AddEventHandler('np-duty:AttemptDutySuits', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	local job = pJobType and pJobType or 'suits'
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result)
		if result[1].job == "suits" then
			exports.oxmysql:execute('SELECT callsign FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result2)
				jobs:SetJob(user, job, false, function()
					TriggerClientEvent('np-duty:SuitsSuccess', src)
					TriggerClientEvent("DoLongHudText", src,"On-Duty.",17)
					TriggerClientEvent("job:suitscount", -1, currentSuits)
				end)
			end)
		else
			TriggerClientEvent("DoLongHudText", src,'You are not qualified for this', 2)
		end
	end)
end)

--// In N Out

RegisterServerEvent('np-duty:attempt-in-n-out:duty')
AddEventHandler('np-duty:attempt-in-n-out:duty', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'in-n-out'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'in-n-out', false, function()
				TriggerClientEvent("DoLongHudText", src,"Clocked In As In N Out", 1)
				TriggerClientEvent('np-duty:in-n-out:successful', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src, "You are not whitelisted for this job!", 2)
		end
	end)
end)

--// DOJ

-- Judge

RegisterServerEvent('np-duty:attempt_duty:judge')
AddEventHandler('np-duty:attempt_duty:judge', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'judge'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'judge', false, function()
				TriggerClientEvent("DoLongHudText", src,"Successfully Clocked In As Judge", 1)
				TriggerClientEvent('np-duty:clocked_in:judge_successful', src)
				local insert = Await(SQL.execute("INSERT INTO doj_duty (src, cid, name, status, job, phone) VALUES (@src, @cid, @name, @status, @job, @phone)", {
					["src"] = src,
					["cid"] = character.id,
					["name"] = character.first_name .. " " .. character.last_name,
					["status"] = "Available",
					["job"] = "judge",
					["phone"] = character.phone_number
				}))
			end)
		else
			TriggerClientEvent("DoLongHudText", src, "You are not whitelisted for this job!", 2)
		end
	end)
end)

RegisterServerEvent('np-duty:offDutyJudge')
AddEventHandler('np-duty:offDutyJudge', function()
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local remove = Await(SQL.execute("DELETE FROM doj_duty WHERE cid = @cid AND job = @job", {
		["cid"] = character.id,
		["job"] = "judge"
	}))
end)

-- Public Defender

RegisterServerEvent('np-duty:attempt_duty:public_defender')
AddEventHandler('np-duty:attempt_duty:public_defender', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'public_defender'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'public_defender', false, function()
				TriggerClientEvent("DoLongHudText", src,"Successfully Clocked In As Public Defender", 1)
				TriggerClientEvent('np-duty:clocked_in:public_defender_successful', src)
				local insert = Await(SQL.execute("INSERT INTO doj_duty (src, cid, name, status, job, phone) VALUES (@src, @cid, @name, @status, @job, @phone)", {
					["src"] = src,
					["cid"] = character.id,
					["name"] = character.first_name .. " " .. character.last_name,
					["status"] = "Available",
					["job"] = "public_defender",
					["phone"] = character.phone_number
				}))
			end)
		else
			TriggerClientEvent("DoLongHudText", src, "You are not whitelisted for this job!", 2)
		end
	end)
end)

RegisterServerEvent('np-duty:offDutyDefender')
AddEventHandler('np-duty:offDutyDefender', function()
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local remove = Await(SQL.execute("DELETE FROM doj_duty WHERE cid = @cid AND job = @job", {
		["cid"] = character.id,
		["job"] = "public_defender"
	}))
end)

-- District Attorney

RegisterServerEvent('np-duty:attempt_duty:district_attorney')
AddEventHandler('np-duty:attempt_duty:district_attorney', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'district_attorney'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'district_attorney', false, function()
				TriggerClientEvent("DoLongHudText", src,"Successfully Clocked In As District Attorney", 1)
				TriggerClientEvent('np-duty:clocked_in:district_attorney_successful', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src, "You are not whitelisted for this job!", 2)
		end
	end)
end)

----------------------------------------------------------------------------------------------------------------------------------

-- Burger Shot

RegisterServerEvent('np-duty:attempt_duty:burger_shot')
AddEventHandler('np-duty:attempt_duty:burger_shot', function(src, pJobType)
	if src == nil or src == 0 then src = source end
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local jobs = exports["np-base"]:getModule("JobManager")
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ? AND job = ?', {character.id, 'burger_shot'}, function(result)
		if result[1] ~= nil then
			jobs:SetJob(user, 'burger_shot', false, function()
				TriggerClientEvent("DoLongHudText", src,"Successfully clocked into a 9 to 5", 1)
				TriggerClientEvent('np-duty:clocked_in:burger_shot_successful', src)
			end)
		else
			TriggerClientEvent("DoLongHudText", src, "You don't work at Burgershot dumbass!", 2)
		end
	end)
end)

----------------------------------------------------------------------------------------------------------------------------------

-- PD

RegisterCommand('hirepd', function(source, args)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local cid = user:getCurrentCharacter().id
		exports.oxmysql:execute('SELECT * FROM jobs_whitelist WHERE cid = ?', {cid}, function(result)
			if result[1].job == 'police' or result[1].job == 'state' or result[1].job == 'doc' and result[1].rank >= 7 then
				TriggerClientEvent('np-duty:HireLaw:Menu', src)
			end
		end)
end)

RegisterCommand('firepd', function(source, args)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local cid = user:getCurrentCharacter().id
		exports.oxmysql:execute('SELECT * FROM jobs_whitelist WHERE cid = ?', {cid}, function(result)
			if result[1].job == 'police' or result[1].job == 'state' or result[1].job == 'doc' and result[1].rank >= 7 then
				TriggerClientEvent('np-duty:FireLaw:Menu', src)
			end
		end)
end)

-- EMS

RegisterCommand('hireems', function(source, args)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local cid = user:getCurrentCharacter().id
	exports.oxmysql:execute('SELECT * FROM jobs_whitelist WHERE cid = ? AND job = "ems"', {cid}, function(result)
		if result[1].job == 'ems' and result[1].rank >= 3 then
				TriggerClientEvent('np-duty:HireEMS:Menu', src)
			end
		end)
end)

RegisterCommand('fireems', function(source, args)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local cid = user:getCurrentCharacter().id
	exports.oxmysql:execute('SELECT * FROM jobs_whitelist WHERE cid = ? AND job = "ems"', {cid}, function(result)
		if result[1].job == 'ems' and result[1].rank >= 3 then
				TriggerClientEvent('np-duty:FireEMS:Menu', src)
			end
		end)
end)

RegisterServerEvent('np-duty:tow_trucker')
AddEventHandler('np-duty:tow_trucker', function()
	local src = source
	local user = exports['np-base']:getModule("Player"):GetUser(src)
	local jobs = exports["np-base"]:getModule("JobManager")

	jobs:SetJob(user, 'tow_trucker')
end)

RegisterServerEvent('np-duty:tow_trucker_off')
AddEventHandler('np-duty:tow_trucker_off', function()
	local src = source
	local user = exports['np-base']:getModule("Player"):GetUser(src)
	local jobs = exports["np-base"]:getModule("JobManager")

	jobs:SetJob(user, 'unemployed')
	TriggerClientEvent('DoLongHudText', src, 'You\'re now unemployed.')
end)