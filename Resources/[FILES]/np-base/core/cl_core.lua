Void.Core.hasLoaded = false


function Void.Core.Initialize(self)
    Citizen.CreateThread(function()
        while true do
            if NetworkIsSessionStarted() then
                TriggerEvent("np-base:playerSessionStarted")
                TriggerServerEvent("np-base:playerSessionStarted")
                break
            end
        end
    end)
end
Void.Core:Initialize()

AddEventHandler("np-base:playerSessionStarted", function()
    while not Void.Core.hasLoaded do
        ---- print"waiting in loop")
        Wait(100)
    end
    ShutdownLoadingScreen()
    Void.SpawnManager:Initialize()
end)

RegisterNetEvent("np-base:waitForExports")
AddEventHandler("np-base:waitForExports", function()
    if not Void.Core.ExportsReady then return end

    while true do
        Citizen.Wait(0)
        if exports and exports["np-base"] then
            TriggerEvent("np-base:exportsReady")
            return
        end
    end
end)

RegisterNetEvent("customNotification")
AddEventHandler("customNotification", function(msg, length, type)

	TriggerEvent("chatMessage","SYSTEM",4,msg)
end)

RegisterNetEvent("base:disableLoading")
AddEventHandler("base:disableLoading", function()
    -- print"player has spawned ")
    if not Void.Core.hasLoaded then
         Void.Core.hasLoaded = true
    end
end)

Citizen.CreateThread( function()
    TriggerEvent("base:disableLoading")
end)


RegisterNetEvent("paycheck:client:call")
AddEventHandler("paycheck:client:call", function()
    local cid = exports["isPed"]:isPed("cid")
    TriggerServerEvent("paycheck:server:send", cid)
end)

RegisterNetEvent("paycheck:collect:log:handler")
AddEventHandler("paycheck:collect:log:handler", function()
    TriggerServerEvent('paycheck:collect:log')
end)

function isCharacter(checkType)
	local checkType = string.lower(checkType)
	local pass = false

    if checkType == "femaleclothes" then
        pass = femaleclothes
    end
    if checkType == "maleclothes" then
        pass = maleclothes
    end


    if checkType == "gender" then
      pass = RPC.execute("np-base:gender")
    end

    if checkType == "countpolice" then
        pass = RPC.execute("voidrp:counts", "police")
    end

    if checkType == "countems" then
        pass = RPC.execute("voidrp:counts", "ems")
    end

    if checkType == "counttaxi" then
        pass = curTaxi
    end

    if checkType == "counttow" then
        pass = curTow
    end

    if checkType == "countdoctors" then
        pass = curDoctors
    end

    if checkType == "intrunk" then
        pass = intrunk
    end

    if checkType == "robbing" then
        pass = robbing
    end

    if checkType == "passes" then
        pass = passes
    end

    if checkType == "myhousekeys" then
        pass = myhousekeys
    end

    if checkType == "dead" then
        pass = dead
    end

    if checkType == "gang" then
        pass = gang
    end

    if checkType == "cid" then
        pass = cid
    end

    if checkType == "incall" then
        pass = incall
    end

    if checkType == "handcuffed" then
        if handcuffedwalking or handcuffed then
            pass = true
        else
            pass = false
        end
    end

    if checkType == "phoneopen" then
        pass = phoneopen
    end

    if checkType == "twitterhandle" then
        pass = "@" .. Firstname .. "_" .. Lastname
    end

    if checkType == "fullname" then
      pass = Firstname .. " " .. Lastname
    end

    if checkType == "myjob" then
	    pass = job
    end

    if checkType == "mybank" then
	    pass = bank
    end

    if checkType == "mycash" then
	    pass = cash
    end

    if checkType == "weaponslicence" then
      if weaponsLicence == 1 then
        pass = 1
      else
        pass = 0
      end
    end

    if checkType == "hud" then
        pass = HudStage
    end
  
    if checkType == "licensestring" then
        pass = licenses
    end

    if checkType == "tasks" then
        pass = activeTasks
    end

    if checkType == "daytime" then
        pass = daytime
    end

    if checkType == "disabled" then
        if handcuffed or dead then
        	pass = true
        end
    end

    if checkType == "corner" then
        pass = gangType
    end

    return pass
    
end