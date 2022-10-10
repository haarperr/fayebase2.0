local legionactive = false
local delperroactive = false
local greatoceanactive = false
local pinkcageactive = false
local hawickactive = false
local route68active = false

local legionpassword = ""
local legionusername = ""

local delperropassword = ""
local delperrousername = ""

local greatoceanpassword = ""
local greatoceanusername = ""

local pinkcagepassword = ""
local pinkcageusername = ""

local hawickpassword = ""
local hawickusername = ""

local route68password = ""
local route68username = ""

RegisterServerEvent('aspect:bankstore')
AddEventHandler('aspect:bankstore', function(bankid, isopen)

    if bankid == 1 then
        pinkcageactive = isopen
    end

    if bankid == 2 then
        legionactive = isopen
    end

    if bankid == 3 then
        hawickactive = isopen
    end

    if bankid == 4 then
        delperroactive = isopen
    end

    if bankid == 5 then
        greatoceanactive = isopen
    end

    if bankid == 6 then
        route68active = isopen
    end
end)

RegisterServerEvent('aspect:usernamestore')
AddEventHandler('aspect:usernamestore', function(bankname, username, password)

    if bankname == "Legion Square" then
        legionusername = username
        legionpassword = password
    end

    if bankname == "Boulevard Del Perro" then
        delperrousername = username
        delperropassword = password
    end

    if bankname == "Great Ocean Highway" then
        greatoceanusername = username
        greatoceanpassword = password
    end

    if bankname == "Pink Cage" then
        pinkcageusername = username
        pinkcagepassword = password
    end

    if bankname == "Hawick Avenue" then
        hawickusername = username
        hawickpassword = password
    end

    if bankname == "Route 68" then
        route68username = username
        route68password = password
    end

end)

RegisterServerEvent('aspect:retrievelogindata')
AddEventHandler('aspect:retrievelogindata', function(bankNum)

    if bankNum == 1 then
        TriggerClientEvent('aspect:setlocaldetails', -1, bankNum, pinkcageusername, pinkcagepassword)
    end
    if bankNum == 2 then
        TriggerClientEvent('aspect:setlocaldetails', -1, bankNum, legionusername, legionpassword)
    end
    if bankNum == 3 then
        TriggerClientEvent('aspect:setlocaldetails', -1, bankNum, hawickusername, hawickpassword)
    end
    if bankNum == 4 then
        TriggerClientEvent('aspect:setlocaldetails', -1, bankNum, delperrousername, delperropassword)
    end
    if bankNum == 5 then
        TriggerClientEvent('aspect:setlocaldetails', -1, bankNum, greatoceanusername, greatoceanpassword)
    end  
    if bankNum == 6 then
        TriggerClientEvent('aspect:setlocaldetails', -1, bankNum, route68username, route68password)
    end  
end)