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

RegisterNetEvent('aspect:starthacking')
AddEventHandler('aspect:starthacking', function(bankId)
    if (bankId == 1) then
        local usernametest = pinkcageusername
        local passwordtest = pinkcagepassword
        SendNUIMessage({username = usernametest, password = passwordtest, action = "starthack"})
    elseif(bankId == 2) then
        local usernametest = legionusername
        local passwordtest = legionpassword
        SendNUIMessage({username = usernametest, password = passwordtest, action = "starthack"})
    elseif(bankId == 3) then
        local usernametest = hawickusername
        local passwordtest = hawickpassword
        SendNUIMessage({username = usernametest, password = passwordtest, action = "starthack"})
    elseif(bankId == 4) then
        local usernametest = delperrousername
        local passwordtest = delperropassword
        SendNUIMessage({username = usernametest, password = passwordtest, action = "starthack"})
    elseif(bankId == 5) then
        local usernametest = greatoceanusername
        local passwordtest = greatoceanpassword
        SendNUIMessage({username = usernametest, password = passwordtest, action = "starthack"})
    elseif(bankId == 6) then
        local usernametest = route68username
        local passwordtest = route68password
        SendNUIMessage({username = usernametest, password = passwordtest, action = "starthack"})
    end
    SetNuiFocus(true, true)
end)

RegisterNUICallback('failure', function(data, cb)
    SetNuiFocus(false, false)
    TriggerEvent("DoLongHudText", "Try again!", 2)
end)

RegisterNUICallback('closenui', function(data, cb)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('hackingsuccessfull', function(data, cb)
    TriggerEvent('inventory:removeItem', 'heistlaptop3', 1)
    SetNuiFocus(false, false)
    TriggerEvent('fleeca:success:panel')
end)

RegisterNUICallback('incorrectdata', function(data, cb)
    SetNuiFocus(false, false)
    TriggerEvent("DoLongHudText", "Something went wrong try again !", 2)
end)

------- RETRIEVE SERVER SIDE DATA SO EVERYONE CAN USE THE DATA AND SET TO LOCAL VARIABLE -------

RegisterNetEvent('aspect:setlocaldetails')
AddEventHandler('aspect:setlocaldetails', function(bankId, bankuser, bankpass)

    if bankId == 1 then
        pinkcageusername = bankuser
        pinkcagepassword = bankpass
    end
    if bankId == 2 then
        legionusername = bankuser
        legionpassword = bankpass
    end
    if bankId == 3 then
        hawickusername = bankuser
        hawickpassword = bankpass
    end
    if bankId == 4 then
        delperrousername = bankuser
        delperropassword = bankpass
    end
    if bankId == 5 then
        greatoceanusername = bankuser
        greatoceanpassword = bankpass
    end  
    if bankId == 6 then
        route68username = bankuser
        route68password = bankpass
    end  
end)