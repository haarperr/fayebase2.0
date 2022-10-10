local weapons = ""
local playerInjury = {}
local bones = {}
local multipledenominators = {}

local firstname = {
    'Mona',
    'Ray',
    'Sonny',
    'Don',
    'Jo',
    'Joe',
    'Dixon',
    'Ben',
    'Hugh G.',
    'Duncan',
    'Mike',
    'Mike',
    'Mike',
    'Ima',
    'Richard'
}

local lastname = {
    'Alott',
    'Gunn',
    'Day',
    'Key',
    'King',
    'Kane',
    'Uranus',
    'Dover',
    'Rection',
    'McOkiner',
    'Hawk',
    'Hunt',
    'Oxlong',
    'Pigg',
    'Head'
}

local logged = {}

RegisterServerEvent('server:takephone')
AddEventHandler('server:takephone', function(target)
    TriggerClientEvent('inventory:removeItem', target, "mobilephone", 1)
end)

RegisterServerEvent('police:multipledenominators')
AddEventHandler('police:multipledenominators', function(hasdenoms)
	local src = source
	if hasdenoms then
		multipledenominators[src] = true
	else
		multipledenominators[src] = nil
	end
end)

RegisterServerEvent('CrashTackle')
AddEventHandler('CrashTackle', function(player)
	TriggerClientEvent('playerTackled', player)
end)

RegisterServerEvent('police:targetCheckBank')
AddEventHandler('police:targetCheckBank', function(target)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(target)
	local char = user:getCurrentCharacter()
	balance = user:getBalance()
  	local strng = " Bank: "..balance
  	TriggerClientEvent("DoLongHudText",src,strng)
end)

RegisterServerEvent('checkLicensePlate')
AddEventHandler('checkLicensePlate', function(oof)
	local source = source
	local user = exports["np-base"]:getModule("Player"):GetUser(source)
	local char = user:getCurrentCharacter()
	local job = "Unemployed"
	local message = ""
	local phonenumber = char.phone_number
	local kekw = oof
	exports.oxmysql:execute('SELECT cid FROM characters_cars WHERE `license_plate` = @plate', { ['@plate'] = kekw }, function(result)
		if result[1] ~= nil then
			exports.oxmysql:execute('SELECT * FROM characters WHERE `id` = @cid', { ['@cid'] = result[1].cid }, function(data)
				exports.oxmysql:execute('SELECT * FROM jobs_whitelist WHERE `cid` = @cid', { ['@cid'] = data[1].id }, function(penis)
				-- TriggerClientEvent('notification', source, 'Dispatch: Vehicle comes back to one ' .. data[1].firstname .. ' ' .. data[1].lastname .. ' Over.')
					if penis[1] ~= nil then
						job = penis[1].job
						if job == "police" then
							job = "Police"
						elseif job == "sheriff" then
							job = "Sheriff"
						elseif job == "state" then
							job = "State"
						elseif job == 'ranger' then
							job = 'Ranger'
						elseif job == "ems" then
							job = "EMS"
						end
						local phoneNumber = string.sub(data[1].phone_number, 0, 3) .. '-' .. string.sub(data[1].phone_number, 4, 6) .. '-' .. string.sub(data[1].phone_number, 7, 10)
						TriggerClientEvent("chatMessage", source, "DISPATCH", 1, "10-60 (Negative) Name: " .. data[1].first_name .. " " .. data[1].last_name .. " Phone #: " .. phoneNumber .. ' Job: ' .. job)
						TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'radioclick', 1.0)
					else
						TriggerClientEvent("chatMessage", source, "DISPATCH", 1, "10-60 (Flagged) Stolen Name: " .. data[1].first_name .. " " .. data[1].last_name .. " Phone #: " .. phoneNumber .. ' Job: ' .. job)
						TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'radioclick', 1.0)
					end
				end)
			end)
		elseif logged[#logged] ~= nil then
			for k,v in ipairs(logged) do
				if v.plate == kekw then
					TriggerClientEvent("chatMessage", source, "DISPATCH", 1, "10-60 (Flagged) Stolen Name: " .. v.firstname .. " " .. v.lastname .. " Phone #: " .. math.random(000, 999) .. '-' .. math.random(000, 999) .. '-' .. math.random(0000, 9999) .. ' Job: Unemployed')
				end
			end
		else
			local insert = {
				plate = kekw,
				firstname = firstname[math.random(1,5)],
				lastname = lastname[math.random(1,5)]
			}
			TriggerClientEvent("chatMessage", source, "DISPATCH", 1, "10-60 (Flagged) Stolen Name: " .. insert.firstname .. " " .. insert.lastname .. " Phone #: " .. math.random(000, 999) .. '-' .. math.random(000, 999) .. '-' .. math.random(0000, 9999) .. ' Job: Unemployed')
			logged[#logged+1] = insert
			TriggerClientEvent('InteractSound_CL:PlayOnOne', source, 'radioclick', 1.0)
		end
	end)
end)

RegisterServerEvent('dragPlayer:disable')
AddEventHandler('dragPlayer:disable', function()
	TriggerClientEvent('drag:stopped', -1, source)
end)

RegisterServerEvent('dr:releaseEscort')
AddEventHandler('dr:releaseEscort', function(releaseID)
	TriggerClientEvent('dr:releaseEscort', tonumber(releaseID))
end)

RegisterServerEvent('police:IsTargetCuffed') -- that is np's code ((sway))
AddEventHandler('police:IsTargetCuffed', function(playerID)
	local src = source
	TriggerClientEvent("police:IsPlayerCuffed", playerID, src)
end)

-- done ((sway))
function CheckLicense(cid, license)
	exports.oxmysql:execute("SELECT @license FROM licenses WHERE cid = @id", {['id'] = cid, ['license'] = license}, function(result)
		if (result[1]) then
			response = result.license
		end
	end)
	Wait(200)
	if response then
		return true
	else
		return false
	end
end

function getmonth(month) -- that is np's code ((sway))
	local months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
	return months[tonumber(month)]
end

function ConvertDate(d) -- that is np's code ((sway))
	local newD = math.ceil(tonumber(d/1000))
	local msgtime = "NA"
	if newD < 0 then
			newD = newD + 4070912400
			local a = os.date("%b %Y", newD)
			msgtime = string.upper(getmonth(a.month) .. " " .. (a.year-129))
	else
		msgtime = os.date("%b &Y", newD)
		msgtime = string.upper(msgtime)
	end
	return msgtime
end

RegisterNetEvent("spawn100k")
AddEventHandler("spawn100k",function ()
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	user:removeMoney(500)
end)

RegisterServerEvent('police:showID')
AddEventHandler('police:showID', function(itemInfo)
	local src = source
	local fuck = json.decode(itemInfo)
	local data = {
		['DOB'] = fuck.DOB,
		['Name'] = fuck.Name,
		['Surname'] = fuck.Surname,
		['Sex'] = fuck.Sex,
		['Identifier'] = fuck.identifier,
		['pref'] = "sex"
	}

	if data.Sex == 0 then
		data = {
			['DOB'] = fuck.DOB,
			['Name'] = fuck.Name,
			['Surname'] = fuck.Surname,
			['Sex'] = "M",
			['Identifier'] = fuck.identifier,
			['pref'] = "Male"
		}
	elseif data.Sex == 1 then
		data = {
			['DOB'] = fuck.DOB,
			['Name'] = fuck.Name,
			['Surname'] = fuck.Surname,
			['Sex'] = "F",
			['Identifier'] = fuck.identifier,
			['pref'] = "Female"
		}
	end
	TriggerClientEvent("chat:showCID", -1, data, src)
end)

RegisterServerEvent("police:targetCheckInventory")
AddEventHandler("police:targetCheckInventory", function(target, status)
	local src = source
	local user2 = exports["np-base"]:getModule("Player"):GetUser(target)
	local char2 = user2:getCurrentCharacter()
	TriggerClientEvent("server-inventory-open", src, "1", "ply-"..char2.id)
	TriggerClientEvent('DoLongHudText', target, 'You are being searched!', 2)
end)

RegisterServerEvent('police:jailGranted')
AddEventHandler('police:jailGranted', function(args)
	local src = source
	reason = " "
	for argscount = 4, #args do
		reason = reason .. " " .. args[argscount]
	end

	local player = tonumber(args[1])
	local target = exports["np-base"]:getModule("Player"):GetUser(player)
	local character = target:getCurrentCharacter()
	local playerName = character.first_name .. ' ' .. character.last_name

	local pdunit = exports["np-base"]:getModule("Player"):GetUser(src)
	if not pdunit:getVar("job") == "police" then
		local steamid, name = pdunit:getVar("name"), pdunit:getVar("steamid")

		DropPlayer(src, "")

		return
	end

	TriggerClientEvent('chatMessage', src, "JAILED ", 1, "" .. playerName .. " has been put in jail for " .. tonumber(args[2]) .. " month(s)")
	
	TriggerClientEvent('beginJail', player, false,args[2], playerName, character.id, date)
	

	local date = os.date("%c")
	TriggerClientEvent("drawScaleformJail", -1,tonumber(args[2]),playerName,character.id,date)

	--TriggerEvent("np:news:newConviction", {name = playerName, duration = time, charges = reason})

	exports["np-base"]:getModule("JobManager"):SetJob(target, "unemployed", true)
end)

RegisterServerEvent('police:jailGranted2')
AddEventHandler('police:jailGranted2', function(target, time)
	TriggerClientEvent("beginJail2", target, time ,true)
end)

RegisterServerEvent('reviveGranted')
AddEventHandler('reviveGranted', function(t)
	TriggerClientEvent('reviveFunction', t)
end)

RegisterServerEvent('police:gsrGranted')
AddEventHandler('police:gsrGranted', function(t)
    local copId = source
	TriggerClientEvent("DoLongHudText", t, 'You have been GSR tested',1)
    TriggerClientEvent('police:hasShotRecently', t, copId)
end)

RegisterServerEvent('police:hasShotRecently')
AddEventHandler('police:hasShotRecently', function(shotRecently, copId)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	local msg = string.format("%s has returned %s for GSR testing", character.first_name .." ".. character.last_name, shotRecently and "positive" or "negative")
	TriggerClientEvent('DoLongHudText', copId, msg, 2)
end)

RegisterServerEvent('police:dnaAsk') -- that is np's code ((sway))
AddEventHandler('police:dnaAsk', function(t)
	local src = source
	local user2 = exports["np-base"]:getModule("Player"):GetUser(t)
	local character2 = user2:getCurrentCharacter()
    TriggerClientEvent("DoLongHudText", t, 'You have been DNA tested!',1)
	TriggerClientEvent('DoLongHudText', src, 'DNA swab comes back to a : ' .. character2.first_name .." ".. character2.last_name, 1)
	TriggerClientEvent('DoLongHudText', src, 'DNA: ' .. character2.id, 2)
end)

RegisterServerEvent('police:remmaskGranted')
AddEventHandler('police:remmaskGranted', function(targetplayer)
    TriggerClientEvent('police:remmaskAccepted', targetplayer)
end)

RegisterServerEvent('police:remShoesBitch')
AddEventHandler('police:remShoesBitch', function(targetplayer)
    TriggerClientEvent('police:shoesAccepted', targetplayer)
end)


RegisterServerEvent('unseatAccepted')
AddEventHandler('unseatAccepted', function(targetplayer,x,y,z)
    TriggerClientEvent('unseatPlayerFinish', targetplayer,x,y,z)
end)

--- POLICE SEXTION -------------------------------

RegisterServerEvent('police:cuffGranted2')
AddEventHandler('police:cuffGranted2', function(t,softcuff)
	local src = source

	TriggerClientEvent('menu:setCuffState', t, true)
	TriggerEvent('police:setCuffState2', t, true)
	if softcuff then
        TriggerClientEvent('handCuffedWalking', t)
    else
		TriggerClientEvent('police:getArrested2', t, src)
		TriggerClientEvent('police:cuffTransition',src)
	end
end)

RegisterServerEvent('police:cuffGranted')
AddEventHandler('police:cuffGranted', function(t)
	local src = source
	
	TriggerEvent('police:setCuffState', t, true)
	TriggerClientEvent('menu:setCuffState', t, true)
	TriggerClientEvent('police:getArrested', t, src)
	TriggerClientEvent('police:cuffTransition',src)
end)

RegisterServerEvent('police:escortAsk')
AddEventHandler('police:escortAsk', function(target)
	TriggerClientEvent('dr:escort', target,source)
end)




RegisterServerEvent('falseCuffs')
AddEventHandler('falseCuffs', function(t)
	TriggerClientEvent('falseCuffs',t)
	TriggerClientEvent('menu:setCuffState', t, false)
end)

RegisterServerEvent('police:setCuffState')
AddEventHandler('police:setCuffState', function(t,state)
	TriggerClientEvent('police:currentHandCuffedState',t,true)
	TriggerClientEvent('menu:setCuffState', t, true)
end)


RegisterServerEvent('police:forceEnterAsk')
AddEventHandler('police:forceEnterAsk', function(target,netid)
	TriggerClientEvent('police:forcedEnteringVeh', target, netid)
	TriggerClientEvent('DoLongHudText', source, "Seating Player!", 2)
end)

RegisterServerEvent('ped:forceTrunkAsk')
AddEventHandler('ped:forceTrunkAsk', function(targettrunk)
	TriggerClientEvent('ped:forcedEnteringVeh', targettrunk)
	return
end)

RegisterServerEvent('Evidence:GetWounds')
AddEventHandler('Evidence:GetWounds', function(t)
	TriggerClientEvent('Evidence:GiveWounds',t,source)
end)

RegisterServerEvent('Evidence:GiveWoundsFinish')
AddEventHandler('Evidence:GiveWoundsFinish', function(CurrentDamageList,id,bones)
	local src = source
	TriggerClientEvent('Evidence:CurrentDamageListTarget',id,CurrentDamageList,bones,src)
end)

RegisterServerEvent('evidence:bleeder')
AddEventHandler('evidence:bleeder', function(isBleeding)
	local src = source
	TriggerClientEvent('bleeder:alter',src,isBleeding)
end)

RegisterServerEvent('ems:healplayer')
AddEventHandler('ems:healplayer', function(t)
	TriggerClientEvent('ems:healpassed',t)
end)

--[[---------------------------------------------------
						Emotes
--]]---------------------------------------------------

RegisterServerEvent('police:setEmoteData')
AddEventHandler('police:setEmoteData', function(emoteTable)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
	local emote = json.encode(emoteTable)
	exports.oxmysql:execute("UPDATE characters SET `emotes` = @emotes WHERE id = @cid", {['emotes'] = emote, ['cid'] = char.id})
end)

RegisterServerEvent('police:setAnimData')
AddEventHandler('police:setAnimData', function(AnimSet)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
	local metaData = json.encode(AnimSet)
	exports.oxmysql:execute("UPDATE characters SET `meta` = @metaData WHERE id = @cid", {['metaData'] = metaData, ['cid'] = char.id})
end)

RegisterServerEvent('police:getAnimData')
AddEventHandler('police:getAnimData', function()
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

	exports.oxmysql:execute("SELECT meta FROM characters WHERE id = @cid", {['cid'] = char.id}, function(result)
		if (result[1]) then
			if not result[1].meta then
				TriggerClientEvent('checkDNA', src)
			else
				local sex = json.decode(result[1].meta)
			if sex == nil then
				TriggerClientEvent('CheckDNA',src)
				return
			end
			TriggerClientEvent('emote:setAnimsFromDB', src, result[1].meta)
			end
		end
	end)
end)

RegisterServerEvent('police:getEmoteData')
AddEventHandler('police:getEmoteData', function()
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

	exports.oxmysql:execute("SELECT emotes FROM characters WHERE id = @cid", {['cid'] = char.id}, function(result)
		if(result[1]) then
			local emotes = json.decode(result[1].emotes)
			if result[1] ~= nil then
				TriggerClientEvent('emote:setEmotesFromDB', src,emotes)
			else
				local emoteTable = {
					{['key'] = {289},["anim"] = "Handsup"},
					{['key'] = {170},["anim"] = "HandsHead"},
					{['key'] = {166},["anim"] = "Drink"},
					{['key'] = {167},["anim"] = "Lean"},
					{['key'] = {168},["anim"] = "Smoke"},
					{['key'] = {56},["anim"] = "FacePalm"},
					{['key'] = {57},["anim"] = "Wave"},

					{['key'] = {289,21},["anim"] = "gangsign1"},
					{['key'] = {170,21},["anim"] = "gangsign3"},
					{['key'] = {166,21},["anim"] = "gangsign2"},
					{['key'] = {167,21},["anim"] = "hug"},
					{['key'] = {168,21},["anim"] = "Cop"},
					{['key'] = {56,21},["anim"] = "Medic"},
					{['key'] = {57,21},["anim"] = "Notepad"},
				}

				local emote = json.encode(emoteTable)
				exports.oxmysql:execute("UPDATE characters SET `emotes` = @emotes WHERE id = @cid", {['emotes'] = emote, ['identifier'] = char.id})
				TriggerClientEvent("emote:setEmotesFromDB", src, emoteTable)
			end
		end
	end)
end)

RegisterServerEvent('police:setServerMeta')
AddEventHandler('police:setServerMeta', function(health, armor, thrist, hungry)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local cid = user:getCurrentCharacter().id
	local q = [[UPDATE characters SET metaData = @meta WHERE id = @cid;]]
	local v = {
		["meta"] = json.encode({["health"] = health, ["armour"] = armor, ["thrist"] = thrist, ["hunger"] = hungry}),
		["cid"] = cid
	}

	if not user then return end
	exports.oxmysql:execute(q, v, function()

    end)
end)

RegisterServerEvent('police:SetMeta')
AddEventHandler('police:SetMeta', function()
    local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local cid = user:getCurrentCharacter().id
	exports.oxmysql:execute("SELECT metaData FROM characters WHERE id = @cid;", {["cid"] = cid}, function(result)
		if (result[1].metaData) then
			metadata = json.decode(result[1].metaData)
			TriggerClientEvent('police:setClientMeta', src, {thirst = metadata.thrist, hunger = metadata.hunger, health = metadata.health, armour = metadata.armour})
		end
    end)
end)

RegisterServerEvent("fire:serverStopFire")
AddEventHandler("fire:serverStopFire", function(x,y,z, radius)
	TriggerClientEvent("fire:stopClientFires", -1, x,y,z, radius)
end)

RegisterServerEvent("911a")
AddEventHandler("911a", function(args)
	local src = source

	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local job = user:getVar("job")
	local message = ""

	local phonenumber = char.phone_number

	for k,v in ipairs(args) do
		message = message .. " " .. v
	end
	local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

	-- TriggerClientEvent("GPSTrack:Create", src)
	TriggerClientEvent("animation:phonecall", src)
	TriggerClientEvent("chatMessage", src, "Anonymous 911", 1, tostring(message))

	local users = exports["np-base"]:getModule("Player"):GetUsers()

	local emergencyPlayers = {}

	for k,v in pairs(users) do
		local user = exports["np-base"]:getModule("Player"):GetUser(v)
		local job = user:getVar("job")

		if job == "ems" or job == "police"  or job == "sheriff" or job == "ranger" or job == "state" or job == "dispatcher" or job == "doc" then
			emergencyPlayers[#emergencyPlayers+1]= v
		end
	end

	for k,v in ipairs(emergencyPlayers) do
		TriggerClientEvent("callsound", v)
		TriggerClientEvent("chatMessage", v, "Anonymous 911 | (" .. tonumber(src) .. ") ", 1, tostring(message))
	end
end)

RegisterServerEvent("911")
AddEventHandler("911", function(args)
	local src = source

	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local job = user:getVar("job")
	local message = ""

	local phonenumber = char.phone_number

	for k,v in ipairs(args) do
		message = message .. " " .. v
	end
	local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

	TriggerClientEvent("animation:phonecall", src)
	TriggerClientEvent("chatMessage", src, "911 | " .. char.first_name .. " | " .. char.last_name .. " # " .. phonenumber, 1, tostring(message))

	local users = exports["np-base"]:getModule("Player"):GetUsers()

	local emergencyPlayers = {}

	for k,v in pairs(users) do
		local user = exports["np-base"]:getModule("Player"):GetUser(v)
		local job = user:getVar("job")

		if job == "ems" or job == "police" or job == "sheriff" or job == "ranger" or job == "state" or job == "dispatcher" or job == "doc" then
			TriggerClientEvent('np-dispatch:911_shibiz', src)	
			emergencyPlayers[#emergencyPlayers+1]= v
		end
	end

	for k,v in ipairs(emergencyPlayers) do
		TriggerClientEvent("callsound", v)
		TriggerClientEvent("chatMessage", v, "911 | (" .. tonumber(src) .. ") " .. char.first_name .. " | " .. char.last_name .. " # " .. phonenumber, 1, tostring(message))
	end
end)

RegisterServerEvent("311")
AddEventHandler("311", function(args)
	local src = source

	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local job = user:getVar("job")
	local message = ""

	local phonenumber = char.phone_number

	for k,v in ipairs(args) do
		message = message .. " " .. v
	end
	local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

	-- TriggerClientEvent("GPSTrack:Create", src)
	TriggerClientEvent("animation:phonecall", src)
	TriggerClientEvent("chatMessage", src, "311 | " .. char.first_name .. " | " .. char.last_name .. " # " .. phonenumber, 4, tostring(message))

	local users = exports["np-base"]:getModule("Player"):GetUsers()

	local emergencyPlayers = {}

	for k,v in pairs(users) do
		local user = exports["np-base"]:getModule("Player"):GetUser(v)
		local job = user:getVar("job")

		if job == "ems" or job == "police"  or job == "sheriff" or job == "state" or job == "ranger" or job == "dispatcher" or job == "doc" then
			emergencyPlayers[#emergencyPlayers+1]= v
		end
	end

	for k,v in ipairs(emergencyPlayers) do
		TriggerClientEvent("callsound", v)
		TriggerClientEvent("chatMessage", v, "311 | (" .. tonumber(src) .. ") " .. char.first_name .. " | " .. char.last_name .. " # " .. phonenumber, 4, tostring(message))
	end
end)

RegisterServerEvent("911r")
AddEventHandler("911r", function(args)
	local src = source
	-- table.remove(args, 1)

	if not args[1] or not tonumber(args[1]) then return end
	local target = args[1]

	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()

	local job = user:getVar("job")

	local canRun = (job == "police" or job == "ems" or job == "sheriff" or job == "state" or job == "ranger" or job == "dispatcher" or job == "doc") and true or false
	if not canRun then return end

	local message = ""

	local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

	for k,v in ipairs(args) do
		if k > 1 then
			message = message .. " " .. v
		end
	end
	TriggerClientEvent("animation:phonecall", src)

	local users = exports["np-base"]:getModule("Player"):GetUsers()

	local emergencyPlayers = {}

	for k,v in pairs(users) do
		local user = exports["np-base"]:getModule("Player"):GetUser(v)
		local job = user:getVar("job")

		if job == "ems" or job == "police" or job == "sheriff" or job == "state" or job == "ranger" or job == "doc" then
			emergencyPlayers[#emergencyPlayers+1]= v
		end
	end

	for k,v in ipairs(emergencyPlayers) do
		TriggerClientEvent("chatMessage", v, "911r -> " .. target .. " | " .. char.first_name .. ' ' .. char.last_name, 1, tostring(message))
	end

	TriggerClientEvent("chatMessage", target, "911r | (" .. tonumber(src) ..")", 1, tostring(message))
end)


RegisterServerEvent("311r")
AddEventHandler("311r", function(args)
	local src = source
	-- table.remove(args, 1)

	if not args[1] or not tonumber(args[1]) then return end
	local target = args[1]

	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()

	local job = user:getVar("job")

	local canRun = (job == "police" or job == "ems" or job == "sheriff" or job == "state" or job == "ranger" or job == "dispatcher" or job == "doc" ) and true or false
	if not canRun then return end

	local message = ""

	local caller = tostring(char.first_name) .. " " .. tostring(char.last_name)

	for k,v in ipairs(args) do
		if k > 1 then
			message = message .. " " .. v
		end
	end
	TriggerClientEvent("animation:phonecall", src)

	local users = exports["np-base"]:getModule("Player"):GetUsers()

	local emergencyPlayers = {}

	for k,v in pairs(users) do
		local user = exports["np-base"]:getModule("Player"):GetUser(v)
		local job = user:getVar("job")

		if job == "ems" or job == "police" or job == "sheriff" or job == "ranger" or job == "state" or job == "doc" then
			emergencyPlayers[#emergencyPlayers+1]= v
		end
	end

	for k,v in ipairs(emergencyPlayers) do
		TriggerClientEvent("chatMessage", v, "311r -> " .. target .. " | " .. char.first_name .. ' ' .. char.last_name, 4, tostring(message))
	end

	TriggerClientEvent("chatMessage", target, "311r | (" .. tonumber(src) ..")", 4, tostring(message))
end)

RegisterServerEvent('np-base:Licenses')
AddEventHandler('np-base:Licenses', function()
    local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
    exports.oxmysql:execute("SELECT * FROM user_licenses WHERE cid = ? AND status = ? AND type = ?", {char.id, "1", "Weapon License"}, function(result)
        if (result[1]) then
            TriggerClientEvent("wtflols", src, "1")
        else
            TriggerClientEvent("wtflols", src, "0")
        end
    end)
end)

RegisterServerEvent('np-base:updatedphoneLicenses')
AddEventHandler('np-base:updatedphoneLicenses', function()
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
	local licenceTable = {}
	exports.oxmysql:execute("SELECT type, status FROM user_licenses WHERE cid = @cid",{['cid'] = char.id}, function(result)
		for i=1, #result do
			table.insert(licenceTable,{
				type = result[i].type,
				status = result[i].status
			})
		end
		TriggerClientEvent('updateLicenseString', src, licenceTable)
	end)
end)

RegisterServerEvent('np-base:addLicenses')
AddEventHandler('np-base:addLicenses', function()
	local src = source
	local user2 = exports["np-base"]:getModule("Player"):GetUser(src)
	local char2 = user2:getCurrentCharacter()
	exports.oxmysql:execute("SELECT * FROM user_licenses WHERE cid = ?", {char2.id}, function(result)
		if result[1] == nil then
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Weapon', ['@status'] = '0'})
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Drivers', ['@status'] = '1'})
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Hunting', ['@status'] = '0'})
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Fishing', ['@status'] = '0'})
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Bar', ['@status'] = '0'})
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Business', ['@status'] = '0'})
			exports.oxmysql:execute("INSERT INTO user_licenses (cid, type, status) VALUES (@cid, @type, @status)", {['@cid'] = char2.id, ['@type'] = 'Pilot', ['@status'] = '0'})
		end
	end)
end)

---- Weapon License ----

RegisterServerEvent('np-base:giveLicenses')
AddEventHandler('np-base:giveLicenses', function(t)
	local src = source
	local user2 = exports["np-base"]:getModule("Player"):GetUser(t)
	local char2 = user2:getCurrentCharacter()
	exports.oxmysql:execute("UPDATE user_licenses SET `status` = @status WHERE cid = @cid AND type = @type", {['@cid'] = char2.id, ['@type'] = 'Weapon License', ['@status'] = '1'})
	user2:removeMoney(10000)
	TriggerClientEvent('DoLongHudText', t, 'You have been granted a weapon license!', 1)
	TriggerClientEvent('DoLongHudText', src, 'Weapon license was given to '.. char2.first_name .. " " .. char2.last_name, 1)
	Citizen.Wait(2000)
	local licenceTable = {}
	exports.oxmysql:execute("SELECT type, status FROM user_licenses WHERE cid = @cid",{['cid'] = char2.id}, function(result)
		for i=1, #result do
			table.insert(licenceTable,{
				type = result[i].type,
				status = result[i].status
			})
		end
		TriggerClientEvent('updateLicenseString', t, licenceTable)
		TriggerClientEvent("wtflols", t, "1")
	end)
end)


RegisterServerEvent('np-base:removeLicenses')
AddEventHandler('np-base:removeLicenses', function(t)
	local src = source
	local user2 = exports["np-base"]:getModule("Player"):GetUser(t)
	local char2 = user2:getCurrentCharacter()
	exports.oxmysql:execute("UPDATE user_licenses SET `status` = @status WHERE cid = @cid AND type = @type", {['@cid'] = char2.id, ['@type'] = 'Weapon License', ['@status'] = '0'})
	TriggerClientEvent('DoLongHudText', t, 'Your weapon license has been revoked!', 2)
	TriggerClientEvent('DoLongHudText', src, 'Weapon license was revoked from '.. char2.first_name .. " " .. char2.last_name, 2)
	Citizen.Wait(2000)
	local licenceTable = {}
	exports.oxmysql:execute("SELECT type, status FROM user_licenses WHERE cid = @cid",{['cid'] = char2.id}, function(result)
		for i=1, #result do
			table.insert(licenceTable,{
				type = result[i].type,
				status = result[i].status
			})
		end
		TriggerClientEvent('updateLicenseString', t, licenceTable)
		TriggerClientEvent("wtflols", t, "0")
	end)
end)

---- Hunting License ----

RegisterServerEvent('np-base:giveLicenseshunt')
AddEventHandler('np-base:giveLicenseshunt', function(t)
	local src = source
	local user2 = exports["np-base"]:getModule("Player"):GetUser(t)
	local char2 = user2:getCurrentCharacter()
	exports.oxmysql:execute("UPDATE user_licenses SET `status` = @status WHERE cid = @cid AND type = @type", {['@cid'] = char2.id, ['@type'] = 'Hunting License', ['@status'] = '1'})
	user2:removeMoney(200)
	TriggerClientEvent('DoLongHudText', t, 'You have been granted a Hunting License!', 1)
	TriggerClientEvent('DoLongHudText', src, 'Hunting license was given to '.. char2.first_name .. " " .. char2.last_name, 1)
	Citizen.Wait(2000)
	local licenceTable = {}
	exports.oxmysql:execute("SELECT type, status FROM user_licenses WHERE cid = @cid",{['cid'] = char2.id}, function(result)
		for i=1, #result do
			table.insert(licenceTable,{
				type = result[i].type,
				status = result[i].status
			})
		end
		TriggerClientEvent('updateLicenseString', t, licenceTable)
	end)
end)

RegisterServerEvent('np-base:removeLicenseshunt')
AddEventHandler('np-base:removeLicenseshunt', function(t)
	local src = source
	local user2 = exports["np-base"]:getModule("Player"):GetUser(t)
	local char2 = user2:getCurrentCharacter()
	exports.oxmysql:execute("UPDATE user_licenses SET `status` = @status WHERE cid = @cid AND type = @type", {['@cid'] = char2.id, ['@type'] = 'Hunting License', ['@status'] = '0'})
	TriggerClientEvent('DoLongHudText', t, 'Your hunting license has been revoked!', 2)
	TriggerClientEvent('DoLongHudText', src, 'Hunting license was revoked from '.. char2.first_name .. " " .. char2.last_name, 2)
	Citizen.Wait(2000)
	local licenceTable = {}
	exports.oxmysql:execute("SELECT type, status FROM user_licenses WHERE cid = @cid",{['cid'] = char2.id}, function(result)
		for i=1, #result do
			table.insert(licenceTable,{
				type = result[i].type,
				status = result[i].status
			})
		end
		TriggerClientEvent('updateLicenseString', t, licenceTable)
	end)
end)




---- Fishing License ----

RegisterServerEvent('np-base:giveLicensesfish')
AddEventHandler('np-base:giveLicensesfish', function(t)
	local src = source
	local user2 = exports["np-base"]:getModule("Player"):GetUser(t)
	local char2 = user2:getCurrentCharacter()
	exports.oxmysql:execute("UPDATE user_licenses SET `status` = @status WHERE cid = @cid AND type = @type", {['@cid'] = char2.id, ['@type'] = 'Fishing License', ['@status'] = '1'})
	user2:removeMoney(200)
	TriggerClientEvent('DoLongHudText', t, 'You have been granted a Fishing License!', 1)
	TriggerClientEvent('DoLongHudText', src, 'Fishing license was given to '.. char2.first_name .. " " .. char2.last_name, 1)
	Citizen.Wait(2000)
	local licenceTable = {}
	exports.oxmysql:execute("SELECT type, status FROM user_licenses WHERE cid = @cid",{['cid'] = char2.id}, function(result)
		for i=1, #result do
			table.insert(licenceTable,{
				type = result[i].type,
				status = result[i].status
			})
		end
		TriggerClientEvent('updateLicenseString', t, licenceTable)
	end)
end)

RegisterServerEvent('np-base:removeLicensesfish')
AddEventHandler('np-base:removeLicensesfish', function(t)
	local src = source
	local user2 = exports["np-base"]:getModule("Player"):GetUser(t)
	local char2 = user2:getCurrentCharacter()
	exports.oxmysql:execute("UPDATE user_licenses SET `status` = @status WHERE cid = @cid AND type = @type", {['@cid'] = char2.id, ['@type'] = 'Fishing License', ['@status'] = '0'})
	TriggerClientEvent('DoLongHudText', t, 'Your fishing license has been revoked!', 2)
	TriggerClientEvent('DoLongHudText', src, 'Fishing license was revoked from '.. char2.first_name .. " " .. char2.last_name, 2)
	Citizen.Wait(2000)
	local licenceTable = {}
	exports.oxmysql:execute("SELECT type, status FROM user_licenses WHERE cid = @cid",{['cid'] = char2.id}, function(result)
		for i=1, #result do
			table.insert(licenceTable,{
				type = result[i].type,
				status = result[i].status
			})
		end
		TriggerClientEvent('updateLicenseString', t, licenceTable)
	end)
end)

----------------------------------------

RegisterServerEvent('police:getLicenses')
AddEventHandler('police:getLicenses', function(t)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(t)
	local char = user:getCurrentCharacter()
	exports.oxmysql:execute("SELECT status FROM user_licenses WHERE cid = ? AND type = ?", {char.id, "Weapon"}, function(result)
		exports.oxmysql:execute("SELECT status FROM user_licenses WHERE cid = ? AND type = ?", {char.id, "Drivers"}, function(result2)
			exports.oxmysql:execute("SELECT status FROM user_licenses WHERE cid = ? AND type = ?", {char.id, "Hunting"}, function(result3)
				exports.oxmysql:execute("SELECT status FROM user_licenses WHERE cid = ? AND type = ?", {char.id, "Fishing"}, function(result4)
					exports.oxmysql:execute("SELECT status FROM user_licenses WHERE cid = ? AND type = ?", {char.id, "Bar"}, function(result5)
						exports.oxmysql:execute("SELECT status FROM user_licenses WHERE cid = ? AND type = ?", {char.id, "Business"}, function(result6)
							exports.oxmysql:execute("SELECT status FROM user_licenses WHERE cid = ? AND type = ?", {char.id, "Pilot"}, function(result7)
								if result[1] ~= nil or result2[1] ~= nil or result3[1] ~= nil or result4[1] ~= nil then
									if result[1].status == 0 then
										idk = 'Invaild'
									else
										idk = 'Good'
									end
									if result2[1].status == 0 then
										idk2 = 'Invaild'
									else
										idk2 = 'Good'
									end
									if result3[1].status == 0 then
										idk3 = 'Invaild'
									else
										idk3 = 'Good'
									end
									if result4[1].status == 0 then
										idk4 = 'Invaild'
									else
										idk4 = 'Good'
									end
									if result5[1].status == 0 then
										idk5 = 'Invaild'
									else
										idk5 = 'Good'
									end
									if result6[1].status == 0 then
										idk6 = 'Invaild'
									else
										idk6 = 'Good'
									end
									if result7[1].status == 0 then
										idk7 = 'Invaild'
									else
										idk7 = 'Good'
									end
									TriggerClientEvent("chatMessage", src, "License Center", 4, "\n Weapon License: [".. idk .."] \n Drivers License: [" .. idk2 .."] \n Hunting License: [".. idk3 .."] \n Fishing License: [".. idk4 .."] \n Bar License: [".. idk5 .."] \n Business License: [".. idk6 .."] \n Pilot License: [".. idk7 .."]")
								end
							end)
						end)
					end)
				end)
			end)
		end)
	end)
end)

RegisterServerEvent("weapons:set:data")
AddEventHandler("weapons:set:data", function(source, weapon)
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
    exports.oxmysql:execute('SELECT * FROM characters WHERE `id`= ?', {character.id}, function(name)
        exports.oxmysql:execute('INSERT INTO weapons_serials (cid, serial, first_name, last_name) VALUES(?, ?, ?, ?)', {character.id, weapon, name[1].first_name, name[1].last_name})
    end)    
end)

RegisterServerEvent("weapons:get:data")
AddEventHandler("weapons:get:data", function(weapon)
    local src = source
    exports.oxmysql:execute('SELECT * FROM weapons_serials WHERE `serial`= ?', {weapon}, function(data)
        TriggerClientEvent("DoLongHudText", src, "Checking ownership for gun with  the serial of: " .. weapon .. "", 1)
        Citizen.Wait(20000)
        TriggerClientEvent("DoLongHudText", src, "Owner of the weapon: " .. data[1].first_name .. " " ..data[1].last_name, 1)
	end)
end)

RegisterCommand('bill', function(source, args)
    local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(tonumber(args[1]))
	local character = user:getCurrentCharacter()
	local user2 = exports["np-base"]:getModule("Player"):GetUser(src)
	local character2 = user2:getCurrentCharacter()
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ?', {character2.id}, function(result)
		if result[1].job == 'police' or result[1].job == 'sheriff' or result[1].job == 'ranger' or result[1].job == 'state' or result[1].job == 'judge' then
			user:removeBank(tonumber(args[2]))
			print(args[2] / 20)
			TriggerClientEvent('DoLongHudText', tonumber(args[1]), 'You have $'.. tonumber(user:getBalance()) .. ' in the bank!')
			TriggerClientEvent('chatMessage', src, 'BILL', 4, 'You have billed them $'.. tonumber(args[2]))
			TriggerClientEvent('np-police:get_percent', src, args[2] / 20)
			TriggerClientEvent("police:billpd", src, tonumber(args[2]))
			TriggerClientEvent('np-police:bill_ply', src, args[2])
			if result[1].job == 'police' then
				TriggerClientEvent('np-police:bill_ply', src, args[2], 'police')
			elseif result[1].job == 'state' then
				TriggerClientEvent('np-police:bill_ply', src, args[2], 'state')
			elseif result[1].job == 'sheriff' then
				TriggerClientEvent('np-police:bill_ply', src, args[2], 'sheriff')
			elseif result[1].job == 'ranger' then
				TriggerClientEvent('np-police:bill_ply', src, args[2], 'ranger')
			end
		end
	end)
end)

RegisterCommand('callsign', function(source, args)
    local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
	exports.oxmysql:execute('SELECT job FROM jobs_whitelist WHERE cid = ?', {character.id}, function(result)
		if result[1].job == 'police' or result[1].job == 'sheriff' or result[1].job == 'ranger' or result[1].job == 'state' or result[1].job == 'ems' or result[1].job == 'doc' then
			exports.oxmysql:execute("UPDATE jobs_whitelist SET `callsign` = @callsign WHERE cid = @cid", {['callsign'] = args[1], ['cid'] = character.id})
			TriggerClientEvent('police:setCallSign',src, args[1])
		else
			TriggerClientEvent('DoLongHudText', src, 'You are not Police or EMS!', 2)
		end
	end)
end)

--// Restore Vehicle // --

RegisterServerEvent('np-police:restore_car')
AddEventHandler("np-police:restore_car", function(plate)
    TriggerClientEvent('DoLongHudText', source, 'The vehicle with the plate: **'.. plate .. '** has been placed back in the garage!', 1)
    exports.oxmysql:execute("UPDATE characters_cars SET `vehicle_state` = @vehicle_state WHERE license_plate = @license_plate", {['vehicle_state'] = 'In', ['license_plate'] = plate})
end)

-- // ID SHIT // --

RegisterServerEvent('np-police:make_id')
AddEventHandler('np-police:make_id', function()
	local src = source
	if GetPlayerIdentifier(source) == 'steam:1100001183fab5a' then
		TriggerClientEvent('np-police:fake_id', src)
	end
end)

-- // Impounding System \\ --                  --- MADE BY SLUMPO BIG MAN 

-- // Full Impound \\ --

RegisterNetEvent('np-imp:FullImpound')
AddEventHandler('np-imp:FullImpound', function(plate)
exports.oxmysql:execute("UPDATE characters_cars SET vehicle_state = @state, current_garage = @garage, coords = @coords WHERE license_plate = @plate", {['garage'] = 'Full Impound', ['state'] = 'In', ['coords'] = nil, ['plate'] = plate})
end)

-- // Impound Vehicle \\ --

RegisterNetEvent('np-imp:NormalImpound')
AddEventHandler('np-imp:NormalImpound', function(plate)
exports.oxmysql:execute("UPDATE characters_cars SET vehicle_state = @state, current_garage = @garage, coords = @coords WHERE license_plate = @plate", {['garage'] = 'Normal Impound', ['state'] = 'In', ['coords'] = nil, ['plate'] = plate})
end)

-- // Scuff Impound \\ --

RegisterNetEvent('np-imp:ScuffImpound')
AddEventHandler('np-imp:ScuffImpound', function(plate)
exports.oxmysql:execute("UPDATE characters_cars SET vehicle_state = @state, coords = @coords WHERE license_plate = @plate", {['state'] = 'In', ['coords'] = nil, ['plate'] = plate})
end)

RegisterServerEvent('np-police:log_evidence_lockers')
AddEventHandler('np-police:log_evidence_lockers', function(pLockerID)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

	local connect = {
		{
			["color"] = "255",
			["title"] = "Evidence Log",
			["description"] = "Character: " ..char.first_name.. ' ' ..char.last_name.. " | Opening Evidence Locker: " ..pLockerID,
		}
	}
	PerformHttpRequest('https://discord.com/api/webhooks/972274893175533709/8HgPv_RASxnYqc6LUPZPQuj5cqf85rqaz-ewYqYFE4OgTHV_RnSKIIalyjzjpBssTjMm', function(err, text, headers) end, 'POST', json.encode({username = "VoidRP",  avatar_url = "https://cdn.discordapp.com/attachments/928946993840132116/930453062403899472/Untitled-1.png",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)