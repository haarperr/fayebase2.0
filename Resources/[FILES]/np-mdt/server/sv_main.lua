local MDTDispatchData = {}
local AttachedUnits = {}
local usersRadios = {}

SQL = function(query, parameters, cb)
    local res = nil
    local IsBusy = true
    if Config["SQLWrapper"] == "mysql-async" then
        if string.find(query, "SELECT") then
            MySQL.Async.fetchAll(query, parameters, function(result)
                if cb then
                    cb(result)
                else
                    res = result
                    IsBusy = false
                end
            end)
        else
            MySQL.Async.execute(query, parameters, function(result)
                if cb then
                    cb(result)
                else
                    res = result
                    IsBusy = false
                end
            end)
        end
    elseif Config["SQLWrapper"] == "oxmysql" then
        exports.oxmysql:execute(query, parameters, function(result)
            if cb then
                cb(result)
            else
                res = result
                IsBusy = false
            end
        end)
    elseif Config["SQLWrapper"] == "ghmattimysql" then
        exports.oxmysql:execute(query, parameters, function(result)
            if cb then
                cb(result)
            else
                res = result
                IsBusy = false
            end
        end)
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return res
end

-- function pCallSign(callsign)
--     local result = SQL('SELECT callsign FROM jobs_whitelist WHERE cid = @cid', {['@cid'] = callsign})
--     if result[1] ~= nil then
--         return result[1].callsign
--     else
--         return '000'
--     end
-- end

-- RegisterServerEvent('np-dispatch:GrabRadioChannel')
-- AddEventHandler("np-dispatch:GrabRadioChannel", function(radio)
-- 	local src = source
-- 	local user = exports["np-base"]:getModule("Player"):GetUser(src)
-- 	local char = user:getCurrentCharacter()
--     if radio > 0 then
--         usersRadios[char.id] = tonumber(radio)
--     else
--         usersRadios[char.id] = 'Off Radio'
--     end
--     for k, v in pairs(GetPlayers()) do
--         UpdateUnits(v)
--     end
-- end)

RegisterServerEvent('np-mdt:OpenMDT')
AddEventHandler("np-mdt:OpenMDT", function()
	local src = source
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
    local userjob = user:getVar("job")
	local rankfinel = "Police Officer"
	if userjob == "police" or userjob == "sheriff" or userjob == "state" or userjob == "ems" or userjob == "judge" or userjob == "district_attorney" or userjob == "public_defender" then
        TriggerClientEvent('np-mdt:open', src, userjob, char.last_name, char.first_name)
        TriggerClientEvent('np-voice:getRadioChannel', src)
	end
end)

-- RegisterServerEvent("np-mdt:opendashboard")
-- AddEventHandler("np-mdt:opendashboard", function()
--     local src = source
-- 	UpdateUnits(src)	
-- end) 

LoadDreamsVersion = function()
    GetUserByCid = function(cid)
        for index, value in pairs(GetPlayers()) do
            local Player = exports["np-base"]:getModule("Player"):GetUser(tonumber(value))
            local char = Player:getCurrentCharacter()
            if char.id == tonumber(cid) then
                return Player
            end
        end
    end
    GetCharData = function(source)
        local Player = exports["np-base"]:getModule("Player"):GetUser(source)
        local char = Player:getCurrentCharacter()
        local result = SQL('SELECT * FROM characters WHERE id = @id', {['@id'] = char.id})
        return result[1]
    end
    GetCharDataCID = function(cid)
        local result = SQL('SELECT * FROM characters WHERE id = @id', {['@id'] = cid})
        return result[1]
    end
    GetFullNameFromIdentifier = function(identifier)
        local result = SQL('SELECT * FROM characters WHERE id = @id', {['@id'] = identifier})
        return result[1].first_name..' '..result[1].last_name
    end
    GetBulletinIdFromName = function(name)
        local result = SQL('SELECT * FROM mdt_bulletins WHERE title = @title', {['@title'] = name})
        return result[1].id
    end
    GetAllBulletinData = function()
        local results = SQL('SELECT * FROM mdt_bulletins', {})
        return results
    end
    -- GetAllMessages = function()
    --     local results = SQL('SELECT * FROM mdt_dashmessage', {})
    --     return results
    -- end
    GetPlayerVehicles = function(cid)
        local VehicleTable = {}
        local results = SQL('SELECT * FROM characters_cars WHERE cid = @cid', {['@cid'] = cid})
        for index, data in pairs(results) do
            table.insert(VehicleTable, {
                plate = data.license_plate,
                model = data.model
            })
        end
        return VehicleTable
    end
    GetPlayerProfilePicture = function(identifier)
        local result = SQL('SELECT * FROM characters WHERE id = @id', {['@id'] = identifier})
        if result[1].pp == nil or result[1].pp == "" then
            if result[1].gender == "Male" or result[1].gender == "M" or result[1].gender == "0" or result[1].gender == 0 or result[1].gender == "m" then
                return "https://cdn.discordapp.com/attachments/769245887654002782/890279531959693312/male.png"
            elseif result[1].gender == "Female" or result[1].gender == "F" or result[1].gender == "1" or result[1].gender == 1 or result[1].gender == "f" then
                return "https://cdn.discordapp.com/attachments/769245887654002782/890279637953953822/female.png"
            end
        else
            return result[1].pp
        end
    end
    GetVehicleImage = function(plate)
        local result = SQL('SELECT * FROM mdt_vehicleinfo WHERE plate = @plate', {['@plate'] = plate})
        if result[1] and result[1].image and result[1].image ~= "" then
            return result[1].image
        else
            return "https://cdn.discordapp.com/attachments/769245887654002782/890579805798531082/not-found.jpg"
        end
    end
    GetVehicleInformation = function(plate)
        local result = SQL('SELECT * FROM mdt_vehicleinfo WHERE plate = @plate', {['@plate'] = plate})
        if result[1] then
            return result[1].info
        end
    end
    GetVehicleCodeStatus = function(plate)
        local result = SQL('SELECT * FROM mdt_vehicleinfo WHERE plate = @plate', {['@plate'] = plate})
        if result[1] then
            if tonumber(result[1].code5) == 1 then
                return true
            else
                return false
            end
        end
    end
    GetVehicleStolenStatus = function(plate)
        local result = SQL('SELECT * FROM mdt_vehicleinfo WHERE plate = @plate', {['@plate'] = plate})
        if result[1] then
            if tonumber(result[1].stolen) == 1 then
                return true
            else
                return false
            end
        end
    end
    CreateStuffLog = function(type, time, ...)
        local currentLog = Config["StaffLogs"][type]:format(...)
        SQL('INSERT INTO mdt_logs (log, time) VALUES (@log, @time)', {['@log'] = currentLog, ['@time'] = time})
    end
    CheckType = function(src)
        local Player = exports["np-base"]:getModule("Player"):GetUser(src)
        for index, job in pairs(Config["PoliceJobs"]) do
            for index2, job2 in pairs(Config["EMSJobs"]) do
                if Player.job == job then
                    return Player.job
                elseif Player.job == job2 then
                    return Player.job
                end
            end
        end
    end
    CheckBoloStatus = function(plate)
        local BolosData = SQL("SELECT * FROM mdt_bolos", {})
        for index = 1, #BolosData, 1 do
            if string.lower(BolosData[index].plate) == string.lower(plate) then
                return true
            else
                return false
            end
        end
    end
    CheckIfMissing = function(cid)
        local data = SQL("SELECT * FROM mdt_missing", {})
        for idx, data in pairs(data) do
            if data.identifier == cid then
                return true
            end
        end
        return false
    end
    RPC.register("np-mdt:getInfo", function()
        return {firstname = GetCharData(source).first_name, lastname = GetCharData(source).last_name}
    end)
    RPC.register("np-mdt:dashboardbulletin", function()
        return GetAllBulletinData()
    end)
    -- RPC.register("np-mdt:dashboardMessages", function()
    --     return GetAllMessages()
    -- end)
    RPC.register("np-mdt:getWarrants", function()
        local WarrantData = {}
        local data = SQL("SELECT * FROM mdt_incidents", {})
        for index = 1, #data, 1 do
            local associatedData = json.decode(data[index].associated)
            for _, value in pairs(associatedData) do
                if value.Warrant then
                    table.insert(WarrantData, {
                        cid = value.Cid,
                        linkedincident = data[index].id,
                        name = GetFullNameFromIdentifier(value.Cid),
                        reporttitle = data[index].title,
                        time = data[index].time
                    })
                end
            end
        end
        return WarrantData
    end)
    -- function UpdateUnits(src)	
    --     local lspd, bcso, sasp, ems = {},{},{},{}
        
    --     for k, v in pairs(GetPlayers()) do
    --     local user = exports["np-base"]:getModule("Player"):GetUser(tonumber(v))
    --         if user then
    --             local userjob = user:getVar("job")
    --             if userjob == "police" or userjob == "ems" or userjob == "sheriff" or userjob == "state"then
    --                 local char = user:getCurrentCharacter()
    --                 local rank = user:getVar("jobRank") and user:getVar("jobRank") or 0
    --                 local name = char.first_name .. " " .. char.last_name
    --                 -- local callSign = pCallSign(char.id)
    --                 if userjob == "police" then
    --                     lspds = #lspd + 1
    --                     lspd[lspds] = {}
    --                     lspd[lspds].duty = GetPlayerRadio(user.source)
    --                     lspd[lspds].cid = char.id
    --                     lspd[lspds].radio = usersRadios[char.id]
    --                     lspd[lspds].callsign = callSign
    --                     lspd[lspds].name = name
    --                 elseif userjob == "sheriff" then
    --                     bcsos = #bcso + 1
    --                     bcso[bcsos] = {}
    --                     bcso[bcsos].duty = GetPlayerRadio(user.source)
    --                     bcso[bcsos].cid = char.id
    --                     bcso[bcsos].radio = usersRadios[char.id]
    --                     bcso[bcsos].callsign = callSign
    --                     bcso[bcsos].name = name
    --                 elseif userjob == "state" then
    --                     sasps = #sasp + 1
    --                     sasp[sasps] = {}
    --                     sasp[sasps].duty = GetPlayerRadio(user.source)
    --                     sasp[sasps].cid = char.id
    --                     sasp[sasps].radio = usersRadios[char.id]
    --                     sasp[sasps].callsign = callSign
    --                     sasp[sasps].name = name
    --                 elseif userjob == "ems" then
    --                     emss = #ems + 1
    --                     ems[emss] = {}
    --                     ems[emss].duty = GetPlayerRadio(user.source)
    --                     ems[emss].cid = char.id
    --                     ems[emss].radio = usersRadios[char.id]
    --                     ems[emss].callsign = callSign
    --                     ems[emss].name = name
    --                 end
    --             end
    --         end
    --     end	
    --     TriggerClientEvent("np-mdt:getActiveUnits", src, lspd, bcso, sasp, ems)
    -- end	    
    GetProfileConvictions = function(cid)
        local Convictions = {}
        local data = SQL("SELECT * FROM mdt_incidents", {})
        for index = 1, #data, 1 do
            local associatedData = json.decode(data[index].associated)
            for index, value in pairs(associatedData) do
                if value.Cid == cid then
                    if #value.Charges > 0 then
                        for _, name in pairs(value.Charges) do
                            table.insert(Convictions, name)
                        end
                    end
                end
            end
        end
        return json.encode(Convictions)
    end
    GetPlayerWeapons = function(cid)
        local Weapons = {}
        local data = SQL("SELECT * FROM weapons_serials", {})
        for index = 1, #data, 1 do
            if data[index].cid == cid then
                table.insert(Weapons, data[index].serial)
            end
        end
        return Weapons
    end
    RPC.register("np-mdt:getProfileData", function(identifier)
        local ReturnData = {}
        local result = SQL('SELECT * FROM characters WHERE id = @id', {['@id'] = identifier})
        ReturnData.vehicles = GetPlayerVehicles(identifier)
        ReturnData.firstname = result[1].first_name
        ReturnData.lastname = result[1].last_name
        ReturnData.phone = result[1].phone_number
        ReturnData.cid = result[1].id
        ReturnData.dateofbirth = result[1].dob
        ReturnData.profilepic = GetPlayerProfilePicture(result[1].id)
        ReturnData.policemdtinfo = result[1].policemdtinfo
        ReturnData.Weapon = GetPlayerLicenses(result[1].id, "weapon")
        ReturnData.Drivers = GetPlayerLicenses(result[1].id, "drivers")
        ReturnData.Hunting = GetPlayerLicenses(result[1].id, "hunting")
        ReturnData.Fishing = GetPlayerLicenses(result[1].id, "fishing")
        ReturnData.Pilot = GetPlayerLicenses(result[1].id, "pilot")
        ReturnData.Bar = GetPlayerLicenses(result[1].id, "bar")
        ReturnData.Business = GetPlayerLicenses(result[1].id, "business")
        ReturnData.tags = result[1].tags
        ReturnData.gallery = result[1].gallery
        ReturnData.convictions = GetProfileConvictions(result[1].id)
        ReturnData.weapons = GetPlayerWeapons(result[1].id)
        return ReturnData
    end)
    RPC.register("np-mdt:JailPlayer", function(cid, time)
        JailPlayer(source, cid, time)
    end)
    RPC.register("np-mdt:saveProfile", function(profilepic, information, cid)
        SQL("UPDATE characters SET pp = @profilepic, policemdtinfo = @policemdtinfo WHERE id = @id", {
            ['@profilepic'] = profilepic,
            ['@policemdtinfo'] = information, 
            ['@id'] = cid
        })
    end)
    RPC.register("np-mdt:addGalleryImg", function(cid, url)
        SQL("SELECT * FROM `characters` WHERE id = @id", {
            ['@id'] = cid
        }, function(result)
            local NewGallery = {}
            table.insert(NewGallery, url)
            if result[1].gallery ~= nil and result[1].gallery ~= "" then
                for index, data in pairs(json.decode(result[1].gallery)) do
                    table.insert(NewGallery, data)
                end
            end
            SQL("UPDATE characters SET gallery = @gallery WHERE id = @id", {
                ['@gallery'] = json.encode(NewGallery),
                ['@id'] = cid
            })
        end)
    end)
    RPC.register("np-mdt:addWeapon", function(cid, serialnumber)
        local Player = GetUserByCid(cid)
        local owner = GetCharData(Player.source).first_name..' '..GetCharData(Player.source).last_name
        SQL('INSERT INTO mdt_weapons (identifier, serialnumber, owner) VALUES (@identifier, @serialnumber, @owner)', {['@identifier'] = cid, ['@serialnumber'] = serialnumber, ['@owner'] = owner})
    end)
    RPC.register("np-mdt:removeGalleryImg", function(cid, url)
        SQL("SELECT * FROM `characters` WHERE id = @id", {
            ['@id'] = cid
        }, function(result)
            local NewGallery = {}
            if result[1].gallery ~= nil and result[1].gallery ~= "" then
                for index, data in pairs(json.decode(result[1].gallery)) do
                    if data ~= url then
                        table.insert(NewGallery, data)
                    end
                end
            end
            SQL("UPDATE characters SET gallery = @gallery WHERE id = @id", {
                ['@gallery'] = json.encode(NewGallery),
                ['@id'] = cid
            })
        end)
    end)
    RPC.register("np-mdt:newTag", function(identifier, tag)
        SQL("SELECT * FROM `characters` WHERE id = @id", {
            ['@id'] = identifier
        }, function(result)
            local NewTags = {}
            table.insert(NewTags, tag)
            if result[1].tags ~= nil and result[1].tags ~= "" then
                for index, data in pairs(json.decode(result[1].tags)) do
                    table.insert(NewTags, data)
                end
            end
            SQL("UPDATE characters SET tags = @tags WHERE id = @id", {
                ['@tags'] = json.encode(NewTags),
                ['@id'] = identifier
            })
        end)
    end)
    RPC.register("np-mdt:removeProfileTag", function(cid, tagtext)
        SQL("SELECT * FROM `characters` WHERE id = @id", {
            ['@id'] = cid
        }, function(result)
            local NewTags = {}
            if result[1].tags ~= nil and result[1].tags ~= "" then
                for index, data in pairs(json.decode(result[1].tags)) do
                    if data ~= tagtext then
                        table.insert(NewTags, data)
                    end
                end
            end
            SQL("UPDATE characters SET tags = @tags WHERE id = @id", {
                ['@tags'] = json.encode(NewTags),
                ['@id'] = cid
            })
        end)
    end)
    RPC.register("np-mdt:updateLicence", function(type, status, cid)
        local src = source
        local user = exports["np-base"]:getModule("Player"):GetUser(src)	
        local char = user:getCurrentCharacter()

        if status == "revoke" then
            exports.oxmysql:execute("UPDATE user_licenses SET `status` = @status WHERE cid = @cid AND type = @type", {['status'] = '0', ['cid'] = cid, ['type'] = type})
        elseif status == 'give' then
            exports.oxmysql:execute("UPDATE user_licenses SET `status` = @status WHERE cid = @cid AND type = @type", {['status'] = '1', ['cid'] = cid, ['type'] = type})
        end
    end)
    RPC.register("np-mdt:deleteBulletin", function(id, time)
        local src = source
        local Player = exports["np-base"]:getModule("Player"):GetUser(src)
        SQL("DELETE FROM mdt_bulletins WHERE id = @id", {['@id'] = id}, function(isSec)
            CreateStuffLog("DeleteBulletin", time, GetCharData(src).first_name..' '..GetCharData(src).last_name)
            return src, id, Player.job
        end)
    end)
    RPC.register("np-mdt:newBulletin", function(title, info, time)
        local src = source
        local Player = exports["np-base"]:getModule("Player"):GetUser(src)
        local Author = GetCharData(src).first_name..' '..GetCharData(src).last_name
        SQL('INSERT INTO mdt_bulletins (author, title, info, time) VALUES (@author, @title, @info, @time)', {['@author'] = Author, ['@title'] = title, ['@info'] = info, ['@time'] = time}, function(isSec)
            if isSec then
                CreateStuffLog("NewBulletin", time, Author)
                local SendData = {}
                SendData.id = GetBulletinIdFromName(title)
                SendData.title = title
                SendData.info = info
                SendData.author = Author
                SendData.time = time
                return src, SendData, Player.job
            end
        end)
    end)
    RPC.register("np-mdt:searchProfile", function(name)
        local Matches = {}
        local users = SQL("SELECT * FROM characters", {})
        for index = 1, #users, 1 do
            local firstname = string.lower(users[index].first_name)
            local lastname = string.lower(users[index].last_name)
            local fullname = firstname..' '..lastname
            local identifier = string.lower(users[index].id)
            if string.find(firstname, string.lower(name)) or string.find(lastname, string.lower(name)) or string.find(fullname, string.lower(name)) or string.find(identifier, string.lower(name)) then
                table.insert(Matches, {
                    id = users[index].id,
                    firstname = users[index].first_name,
                    lastname = users[index].last_name,
                    Weapon = GetPlayerLicenses(users[index].id, "weapon"),
                    Drivers = GetPlayerLicenses(users[index].id, "drivers"),
                    Hunting = GetPlayerLicenses(users[index].id, "hunting"),
                    Fishing = GetPlayerLicenses(users[index].id, "fishing"),
                    Pilot = GetPlayerLicenses(users[index].id, "pilot"),
                    Bar = GetPlayerLicenses(users[index].id, "bar"),
                    Business = GetPlayerLicenses(users[index].id, "business"),
                    pp = GetPlayerProfilePicture(users[index].id)
                })
            end
        end
        return Matches
    end)
    RPC.register("np-mdt:searchIncidents", function(incident)
        local Matches = {}
        local incidents = SQL('SELECT * FROM mdt_incidents', {})
        for index = 1, #incidents, 1 do 
            if string.find(string.lower(incidents[index].title), string.lower(incident)) or string.find(string.lower(incidents[index].id), string.lower(incident)) then
                table.insert(Matches, incidents[index])
            end
        end
        return Matches
    end)
    RPC.register("np-mdt:saveIncident", function(ID, title, information, tags, officers, civilians, evidence, associated, time)
        local src = source
        local result = SQL('SELECT * FROM mdt_incidents WHERE id = @id', {['@id'] = ID})
        if result[1] then
            SQL("UPDATE mdt_incidents SET title = @title, information = @information, tags = @tags, officers = @officers, civilians = @civilians, evidence = @evidence, associated = @associated, time = @time, author = @author WHERE id = @id", {
                ['@id'] = ID,
                ['@title'] = title, 
                ['@information'] = information, 
                ['@tags'] = json.encode(tags),
                ['@officers'] = json.encode(officers),
                ['@civilians'] = json.encode(civilians), 
                ['@evidence'] = json.encode(evidence), 
                ['@associated'] = json.encode(associated), 
                ['@time'] = time,
                ['@author'] = GetCharData(src).first_name..' '..GetCharData(src).last_name
            })
            CreateStuffLog("EditIncident", time, GetCharData(src).first_name..' '..GetCharData(src).last_name)
        else
            SQL('INSERT INTO mdt_incidents (title, information, tags, officers, civilians, evidence, associated, time, author) VALUES (@title, @information, @tags, @officers, @civilians, @evidence, @associated, @time, @author)', {
                ['@title'] = title, 
                ['@information'] = information, 
                ['@tags'] = json.encode(tags),
                ['@officers'] = json.encode(officers),
                ['@civilians'] = json.encode(civilians), 
                ['@evidence'] = json.encode(evidence), 
                ['@associated'] = json.encode(associated), 
                ['@time'] = time,
                ['@author'] = GetCharData(src).first_name..' '..GetCharData(src).last_name
            })
            CreateStuffLog("NewIncident", time, GetCharData(src).first_name..' '..GetCharData(src).last_name)
        end
    end)
    RPC.register("np-mdt:getAllIncidents", function()
        local Tables = {}
        local results = SQL('SELECT * FROM mdt_incidents', {})
        for index, data in pairs(results) do
            table.insert(Tables, data)
        end
        return Tables
    end)
    RPC.register("np-mdt:getIncidentData", function(id)
        local result = SQL('SELECT * FROM mdt_incidents WHERE id = @id', {['@id'] = id})
        local convictions = {}
        local associatedData = json.decode(result[1].associated)
        for index, data in pairs(associatedData) do
            table.insert(convictions, {
                cid = data.Cid,
                name = GetFullNameFromIdentifier(data.Cid),
                warrant = data.Warrant,
                guilty = data.Guilty,
                processed = data.Processed,
                associated = data.Isassociated,
                fine = data.Fine,
                sentence = data.Sentence,
                recfine = data.recfine,
                recsentence = data.recsentence,
                charges = data.Charges
            })
        end
        return result[1], convictions
    end)
    RPC.register("np-mdt:incidentSearchPerson", function(name)
        local Matches = {}
        local users = SQL("SELECT * FROM characters", {})
        for index = 1, #users, 1 do
            local firstname = string.lower(users[index].first_name)
            local lastname = string.lower(users[index].last_name)
            local fullname = firstname..' '..lastname
            if string.find(firstname, string.lower(name)) or string.find(lastname, string.lower(name)) or string.find(fullname, string.lower(name)) then
                table.insert(Matches, {
                    firstname = firstname,
                    lastname = lastname,
                    id = users[index].id,
                    profilepic = GetPlayerProfilePicture(users[index].id),
                })
            end
        end
        return Matches
    end)
    RPC.register("np-mdt:removeIncidentCriminal", function(cid, incidentId)
        local result = SQL('SELECT * FROM mdt_incidents WHERE id = @id', {['@id'] = incidentId})
        if result[1] then
            local Table = {}
            for index, data in pairs(json.decode(result[1].associated)) do
                if data.Cid ~= cid then
                    table.insert(Table, data)
                end
            end
            SQL("UPDATE mdt_incidents SET associated = @associated WHERE id = @id", {
                ['@associated'] = json.encode(Table),
                ['@id'] = incidentId
            })
        end
    end)
    RPC.register("np-mdt:getPenalCode", function()
        return Config['OffensesTitels'], Config["Offenses"]
    end)
    -- RPC.register("np-mdt:missingCitizen", function(cid, time)
    --     local result = SQL('SELECT * FROM characters WHERE id = @id', {['@id'] = cid})
    --     if not CheckIfMissing(cid) then 
    --         SQL('INSERT INTO mdt_missing (identifier, name, date, age, lastseen) VALUES (@identifier, @name, @date, @age, @lastseen)', {
    --             ['@identifier'] = cid, 
    --             ['@name'] = result[1].first_name..' '..result[1].last_name, 
    --             ['@date'] = time,
    --             ['@age'] = result[1].dob,
    --             ['@lastseen'] = time
    --         })
    --     end
    -- end)
    -- RPC.register("np-mdt:getAllMissing", function()
    --     local Tables = {}
    --     local MissingCitizens = SQL("SELECT * FROM mdt_missing", {})
    --     for index = 1, #MissingCitizens, 1 do
    --         MissingCitizens[index].image = GetPlayerProfilePicture(MissingCitizens[index].identifier)
    --         table.insert(Tables, MissingCitizens[index])
    --     end
    --     return Tables
    -- end)
    -- RPC.register("np-mdt:deleteMissing", function(id, time)
    --     local src = source
    --     CreateStuffLog("DeleteMissing", time, GetCharData(src).first_name..' '..GetCharData(src).last_name)
    --     SQL("DELETE FROM mdt_missing WHERE id = @id", {['@id'] = id})
    -- end)
    -- RPC.register("np-mdt:saveMissingInfo", function(id, imageurl, notes)
    --     SQL("UPDATE mdt_missing SET image = @image, notes = @notes WHERE id = @id", {
    --         ['@id'] = id,
    --         ['@image'] = imageurl, 
    --         ['@notes'] = notes
    --     })
    -- end)
    -- RPC.register("np-mdt:searchMissing", function(name)
    --     local ReturnData = {}
    --     local Missing =  SQL('SELECT * FROM mdt_missing', {})
    --     for index = 1, #Missing, 1 do
    --         if string.find(string.lower(Missing[index].name), string.lower(name)) then
    --             Missing[index].image = GetPlayerProfilePicture(Missing[index].identifier)
    --             table.insert(ReturnData, Missing[index])
    --         end
    --     end
    --     return ReturnData
    -- end)
    -- RPC.register("np-mdt:getMissingData", function(id)
    --     local result = SQL('SELECT * FROM mdt_missing WHERE id = @id', {['@id'] = id})
    --     if result[1] then
    --         result[1].image = GetPlayerProfilePicture(result[1].identifier)
    --         return result[1]
    --     end
    -- end)
    RPC.register("np-mdt:searchBolos", function(searchVal)
        local Matches = {}
        local BolosData = SQL("SELECT * FROM mdt_bolos", {})
        for index = 1, #BolosData, 1 do
            if string.find(string.lower(BolosData[index].title), string.lower(searchVal)) then
                table.insert(Matches, BolosData[index])
            end
        end
        return Matches
    end)
    RPC.register("np-mdt:getAllBolos", function()
        local Tables = {}
        local BolosData = SQL("SELECT * FROM mdt_bolos", {})
        for index = 1, #BolosData, 1 do
            table.insert(Tables, BolosData[index])
        end
        return Tables
    end)
    RPC.register("np-mdt:getBoloData", function(id)
        local result = SQL('SELECT * FROM mdt_bolos WHERE id = @id', {['@id'] = id})
        return result[1]
    end)
    RPC.register("np-mdt:newBolo", function(existing, id, title, plate, owner, individual, detail, tags, gallery, officers, time)
        local src = source
        local Player = exports["np-base"]:getModule("Player"):GetUser(src)
        if not existing then
            SQL('INSERT INTO mdt_bolos (title, plate, owner, individual, detail, tags, gallery, officers, time, author, type) VALUES (@title, @plate, @owner, @individual, @detail, @tags, @gallery, @officers, @time, @author, @type)', {
                ['@title'] = title, 
                ['@plate'] = plate, 
                ['@owner'] = owner,
                ['@individual'] = individual,
                ['@detail'] = detail, 
                ['@tags'] = json.encode(tags), 
                ['@gallery'] = json.encode(gallery), 
                ['@officers'] = json.encode(officers),
                ['@time'] = time,
                ['@author'] = GetCharData(src).first_name..' '..GetCharData(src).last_name,
                ['@type'] = Player.job
            })
            CreateStuffLog("NewBolo", time, GetCharData(src).first_name..' '..GetCharData(src).last_name)
            return id
        else
            SQL("UPDATE mdt_bolos SET title = @title, plate = @plate, owner = @owner, individual = @individual, detail = @detail, tags = @tags, gallery = @gallery, officers = @officers, time = @time, author = @author, type = @type WHERE id = @id", {
                ['@id'] = id,
                ['@title'] = title, 
                ['@plate'] = plate, 
                ['@owner'] = owner,
                ['@individual'] = individual,
                ['@detail'] = detail, 
                ['@tags'] = json.encode(tags), 
                ['@gallery'] = json.encode(gallery), 
                ['@officers'] = json.encode(officers),
                ['@time'] = time,
                ['@author'] = GetCharData(src).first_name..' '..GetCharData(src).last_name,
                ['@type'] = Player.job
            })
            CreateStuffLog("EditBolo", time, GetCharData(src).first_name..' '..GetCharData(src).last_name)
            return id
        end
    end)
    RPC.register("np-mdt:deleteBolo", function(id, time)
        local src = source
        CreateStuffLog("DeleteBolo", time, GetCharData(src).first_name..' '..GetCharData(src).last_name)
        SQL("DELETE FROM mdt_bolos WHERE id = @id", {['@id'] = id})
    end)
    RPC.register("np-mdt:deleteReport", function(id, time)
        local src = source
        CreateStuffLog("DeleteReport", time, GetCharData(src).first_name..' '..GetCharData(src).last_name)
        SQL("DELETE FROM mdt_report WHERE id = @id", {['@id'] = id})
    end)
    RPC.register("np-mdt:deleteIncident", function(id, time)
        local src = source
        CreateStuffLog("DeleteIncident", time, GetCharData(src).first_name..' '..GetCharData(src).last_name)
        SQL("DELETE FROM mdt_incidents WHERE id = @id", {['@id'] = id})
    end)
    RPC.register("np-mdt:deleteICU", function(id)
        SQL("DELETE FROM mdt_bolos WHERE id = @id", {['@id'] = id})
    end)
    RPC.register("np-mdt:getAllReports", function()
        local Tables = {}
        local results = SQL('SELECT * FROM mdt_report', {})
        for index = 1, #results, 1 do
            table.insert(Tables, results[index])
        end
        return Tables
    end)
    RPC.register("np-mdt:getReportData", function(id)
        local result = SQL('SELECT * FROM mdt_report WHERE id = @id', {['@id'] = id})
        return result[1]
    end)
    RPC.register("np-mdt:searchReports", function(name)
        local Matches = {}
        local ReportsData = SQL('SELECT * FROM mdt_report', {})
        for index = 1, #ReportsData, 1 do
            if string.find(string.lower(ReportsData[index].title), string.lower(name)) then
                table.insert(Matches, ReportsData[index])
            end
        end
        return Matches
    end)
    RPC.register("np-mdt:newReport", function(existing, id, title, reporttype, detail, tags, gallery, officers, civilians, time)
        local src = source
        if not existing then
            SQL('INSERT INTO mdt_report (title, reporttype, author, detail, tags, gallery, officers, civilians, time, type) VALUES (@title, @reporttype, @author, @detail, @tags, @gallery, @officers, @civilians, @time, @type)', {
                ['@title'] = title, 
                ['@reporttype'] = reporttype, 
                ['@author'] = GetCharData(src).first_name..' '..GetCharData(src).last_name,
                ['@detail'] = detail,
                ['@tags'] = json.encode(tags), 
                ['@gallery'] = json.encode(gallery), 
                ['@officers'] = json.encode(officers), 
                ['@civilians'] = json.encode(civilians),
                ['@time'] = time,
                ['@type'] = CheckType(src)
            })
            CreateStuffLog("NewReport", time, GetCharData(src).first_name..' '..GetCharData(src).last_name)
            return id
        else
            SQL("UPDATE mdt_report SET title = @title, reporttype = @reporttype, author = @author, detail = @detail, tags = @tags, gallery = @gallery, officers = @officers, civilians = @civilians, time = @time, type = @type WHERE id = @id", {
                ['@id'] = id,
                ['@title'] = title, 
                ['@reporttype'] = reporttype, 
                ['@author'] = GetCharData(src).first_name..' '..GetCharData(src).last_name,
                ['@detail'] = detail,
                ['@tags'] = json.encode(tags), 
                ['@gallery'] = json.encode(gallery), 
                ['@officers'] = json.encode(officers), 
                ['@civilians'] = json.encode(civilians),
                ['@time'] = time,
                ['@type'] = CheckType(src)
            })
            CreateStuffLog("EditReport", time, GetCharData(src).first_name..' '..GetCharData(src).last_name)
            return id
        end
    end)
    RPC.register("np-mdt:searchVehicles", function(name)
        local ReturnData = {}
        local VehiclesData =  SQL('SELECT * FROM characters_cars', {})
        for index = 1, #VehiclesData, 1 do
            if string.find(string.lower(VehiclesData[index].license_plate), string.lower(name)) then
                table.insert(ReturnData, {
                    model = VehiclesData[index].model,
                    plate = VehiclesData[index].license_plate,
                    id = index,
                    owner = GetCharDataCID(VehiclesData[index].cid).first_name..' '..GetCharDataCID(VehiclesData[index].cid).last_name,
                    bolo = CheckBoloStatus(name),
                    impound = CheckImpoundStatus(name),
                    image = GetVehicleImage(name),
                    code = GetVehicleCodeStatus(name),
                    stolen = GetVehicleStolenStatus(name)
                })
            end
        end
        return ReturnData
    end)
    RPC.register("np-mdt:searchWeapon", function(name)
        local ReturnData = {}
        local Weapons =  SQL('SELECT * FROM weapons_serials WHERE serial = ?', {name})
        if Weapons ~= nil then
            for index = 1, #Weapons, 1 do
                table.insert(ReturnData, Weapons[index])
            end
        end
        return ReturnData
    end)
    RPC.register("np-mdt:getWeaponData", function(serialnumber)
        local result = SQL('SELECT * FROM weapons_serials WHERE serial = @serial', {['@serial'] = serialnumber})
        if result[1] then
            return result[1]
        end
    end)
    RPC.register("np-mdt:saveWeaponInfo", function(serialnumber, imageurl, brand, type, notes)
        SQL("UPDATE mdt_weapons SET image = @image, brand = @brand, type = @type, information = @information WHERE serialnumber = @serialnumber", {
            ['@serialnumber'] = serialnumber,
            ['@image'] = imageurl, 
            ['@brand'] = brand,
            ['@type'] = type,
            ['@information'] = notes
        })
    end)
    RPC.register("np-mdt:getVehicleData", function(plate)
        local result = SQL('SELECT * FROM characters_cars WHERE license_plate = @plate', {['@plate'] = plate})
        if result[1] then
            result[1].bolo = CheckBoloStatus(plate)
            result[1].impound = CheckImpoundStatus(plate)
            result[1].name = GetCharDataCID(tostring(result[1].cid)).first_name..' '..GetCharDataCID(tostring(result[1].cid)).last_name
            result[1].image = GetVehicleImage(plate)
            result[1].information = GetVehicleInformation(plate)
            result[1].code = GetVehicleCodeStatus(plate)
            result[1].stolen = GetVehicleStolenStatus(plate)
            return result[1]
        end
    end)
    RPC.register("np-mdt:saveVehicleInfo", function(plate, imageurl, notes)
        local result = SQL('SELECT * FROM mdt_vehicleinfo WHERE plate = @plate', {['@plate'] = plate})
        if result[1] then
            SQL("UPDATE mdt_vehicleinfo SET info = @info, image = @image WHERE plate = @plate", {
                ['@info'] = notes,
                ['@image'] = imageurl, 
                ['@plate'] = plate
            })
        else
            SQL('INSERT INTO mdt_vehicleinfo (plate, info, image) VALUES (@plate, @info, @image)', {
                ['@plate'] = plate, 
                ['@info'] = notes, 
                ['@image'] = imageurl
            })
        end
    end)
    RPC.register("np-mdt:knownInformation", function(type, status, plate)
        local result = SQL('SELECT * FROM mdt_vehicleinfo WHERE plate = @plate', {['@plate'] = plate})
        if result[1] then
            if type == "code5" then
                SQL("UPDATE mdt_vehicleinfo SET code5 = @code5 WHERE plate = @plate", {
                    ['@code5'] = status,
                    ['@plate'] = plate
                })
            elseif type == "stolen" then
                SQL("UPDATE mdt_vehicleinfo SET stolen = @stolen WHERE plate = @plate", {
                    ['@stolen'] = status,
                    ['@plate'] = plate
                })
            end
        else
            if type == "code5" then
                SQL('INSERT INTO mdt_vehicleinfo (plate, code5) VALUES (@plate, @code5)', {
                    ['@plate'] = plate, 
                    ['@code5'] = status
                })
            elseif type == "stolen" then
                SQL('INSERT INTO mdt_vehicleinfo (plate, stolen) VALUES (@plate, @stolen)', {
                    ['@plate'] = plate, 
                    ['@stolen'] = status
                })
            end
        end
    end)
    RPC.register("np-mdt:getAllLogs", function()
        local MDTLogs = {}
        return MDTLogs
    end)
    RPC.register("np-mdt:toggleDuty", function(cid, status)
        local src = source
        ChangePlayerDuty(src, status)
    end)
    RegisterServerEvent("np-mdt:setCallsign", function(cid, callsign)
        exports.oxmysql:execute("UPDATE jobs_whitelist SET `callsign` = @callsign WHERE cid = @cid", {['callsign'] = callsign, ['cid'] = cid})
    end)
    RegisterServerEvent("dispatch:svNotify", function(data)
        MDTDispatchData[data.dispatchCode] = data
    end)
    RPC.register("np-mdt:callDetach", function(callid)
        local src = source
        local NewTable = {}
        for index, data in pairs(AttachedUnits) do
            if data.Source == src then
                table.remove(AttachedUnits, index)
            end
        end
        return callid
    end)
    RPC.register("np-mdt:removeCall", function(callid)
        MDTDispatchData[callid] = nil
        return source, callid
    end)
    RPC.register("np-mdt:callAttach", function(callid)
        local src = source
        for _, data in pairs(AttachedUnits) do
            if data.CallId == callid then
                if data.Source == src then
                    table.remove(AttachedUnits, _)
                end
            end
        end
        table.insert(AttachedUnits, {
            CallId = callid,
            Source = src
        })
        return callid
    end)
    RPC.register("np-mdt:attachedUnits", function(callid)
        local ReturnData = {}
        for index, data in pairs(AttachedUnits) do
            if data.CallId == callid then
                local Player = exports["np-base"]:getModule("Player"):GetUser(data.Source)
                local char = Player:getCurrentCharacter()
                table.insert(ReturnData, {
                    cid = char.id,
                    job = Player.job,
                    -- callsign = pCallSign(tonumber(char.id)) or "No Callsign",
                    fullname = GetCharData(Player.source).first_name..' '..GetCharData(Player.source).last_name
                })
            end
        end
        return ReturnData, callid
    end)
    RPC.register("np-mdt:callDispatchDetach", function(callid, cid)
        local Player = GetUserByCid(tostring(cid))
        for index, data in pairs(AttachedUnits) do
            if data.CallId == callid and data.Source == Player.source then
                table.remove(AttachedUnits, index)
            end
        end
    end)
    RPC.register("np-mdt:setDispatchWaypoint", function(callid)
        return MDTDispatchData[callid]
    end)
    RPC.register("np-mdt:callDragAttach", function(callid, cid)
        local Player = GetUserByCid(tostring(cid))
        for _, data in pairs(AttachedUnits) do
            if data.CallId == callid then
                if data.Source == Player.source then
                    table.remove(AttachedUnits, _)
                end
            end
        end
        table.insert(AttachedUnits, {
            CallId = callid,
            Source = Player.source
        })
    end)
    -- RPC.register("np-mdt:sendMessage", function(message, time)
    --     local src = source
    --     local Player = exports["np-base"]:getModule("Player"):GetUser(src)
    --     local char = Player:getCurrentCharacter()
    --     local ReturnData = {}
    --     SQL('INSERT INTO mdt_dashmessage (message, time, author, profilepic, job) VALUES (@message, @time, @author, @profilepic, @job)', {
    --         ['@message'] = message, 
    --         ['@time'] = time, 
    --         ['@author'] = GetCharData(src).first_name..' '..GetCharData(src).last_name,
    --         ['@profilepic'] = GetPlayerProfilePicture(char.id),
    --         ['@job'] = Player.job
    --     })
    --     ReturnData.message = message
    --     ReturnData.time = time
    --     ReturnData.name = GetCharData(src).first_name..' '..GetCharData(src).last_name
    --     ReturnData.profilepic = GetPlayerProfilePicture(char.id)
    --     ReturnData.job = Player.job
    --     return ReturnData
    -- end)
    -- RPC.register("np-mdt:refreshDispatchMsgs", function()
    --     return GetAllMessages()
    -- end)
    RPC.register("np-mdt:setWaypoint:unit", function(cid)
        local Player = GetUserByCid(cid)
        local PlayerCoords = GetEntityCoords(GetPlayerPed(Player.source))
        return PlayerCoords
    end)
    RPC.register("np-mdt:isLimited", function()
        local Player = exports["np-base"]:getModule("Player"):GetUser(source)
        for index, policejob in pairs(Config["PoliceJobs"]) do
            for index, emsjob in pairs(Config["EMSJobs"]) do
                if Player.job == emsjob then
                    return true
                elseif Player.job == policejob then
                    return false
                end
            end
        end
        return true
    end)
end

Citizen.CreateThread(function()
    if Config["CoreSettings"]["Core"] == "drpbase" then
        LoadDreamsVersion()
    end
end)