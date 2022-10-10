local lockpos = false
local insidePrompt = false
local isDead = false
local taskInProcessId = 0

RegisterNetEvent('pd:deathcheck')
AddEventHandler('pd:deathcheck', function()
  if not isDead then
    isDead = true
  else
    isDead = false
  end
end)

function openGui(sentLength,taskID,namesent,keepWeapon)
    if not keepWeapon then
        TriggerEvent("actionbar:setEmptyHanded")
    end
    guiEnabled = true
    pTaskActive = 1
    exports["np-interface"]:sendAppEvent("taskbar", {
        display = true,
        duration = sentLength,
        taskID = taskID,
        label = namesent,
    })
    --SendNUIMessage({runProgress = true, Length = sentLength, Task = taskID, name = namesent})
end
function updateGui(sentLength,taskID,namesent)
    --SendNUIMessage({runUpdate = true, Length = sentLength, Task = taskID, name = namesent})
    exports["np-interface"]:sendAppEvent("taskbar", {
        update = true,
        value = sentLength,
    })
end
local activeTasks = {}
function closeGuiFail()
    guiEnabled = false
    pTaskActive = 0
    SendNUIMessage({closeFail = true})
    exports["np-interface"]:sendAppEvent("taskbar", {
        display = false,
    })
    ClearPedTasks(PlayerPedId())
end

function closeGui()
    guiEnabled = false
    pTaskActive = 0
    SendNUIMessage({closeProgress = true})
    exports["np-interface"]:sendAppEvent("taskbar", {
        display = false,
    })
end

function closeNormalGui()
    guiEnabled = false
    pTaskActive = 0
end

function taskCancel()
    closeGui()
    local taskIdentifier = taskInProcessId
    activeTasks[taskIdentifier] = 2
end

exports('taskCancel', taskCancel)

RegisterNUICallback('taskCancel', function(data, cb)
  closeGui()
  local taskIdentifier = data.tasknum
  activeTasks[taskIdentifier] = 2
end)

RegisterNUICallback('taskEnd', function(data, cb)
  closeNormalGui()
  
  local taskIdentifier = data.tasknum
  activeTasks[taskIdentifier] = 3
end)
local coffeetimer = 0

RegisterNetEvent('coffee:drink')
AddEventHandler('coffee:drink', function()
    if coffeetimer > 0 then
        coffeetimer = 6000
        TriggerEvent("Evidence:StateSet",27,6000)
        return
    else
        TriggerEvent("Evidence:StateSet",27,6000)
        coffeetimer = 6000
    end

    while coffeetimer > 0 do
        coffeetimer = coffeetimer - 1
        Wait(1000)
    end

end)


-- command is something we do in the loop if we want to disable more, IE a vehicle engine.
-- return true or false, if false, gives the % completed.
local taskInProcess = false

function taskBarFail(maxcount,curTime,length)
    local totaldone = math.ceil(100 - (((maxcount - curTime) / length) * 100))
    totaldone = math.min(100, totaldone)
    taskInProcess = false
    closeGuiFail()
    return totaldone
end

-- RegisterCommand("testtask", function()
--     taskBar(5000, "Test", false, false)
-- end)

function taskBar(length,name,runCheck,keepWeapon,vehicle,vehCheck,cb)
    local playerPed = PlayerPedId()
    if taskInProcess then
        if cb then cb(0) end
        return 0
    end
    if coffeetimer > 0 then
        length = math.ceil(length * 0.66)
    end
    taskInProcess = true
    local taskIdentifier = "taskid" .. math.random(1000000)
    taskInProcessId = taskIdentifier
    openGui(length,taskIdentifier,name,keepWeapon)
    activeTasks[taskIdentifier] = 1

    local maxcount = GetGameTimer() + length
    local curTime
    while activeTasks[taskIdentifier] == 1 do
        Citizen.Wait(1)
        curTime = GetGameTimer()
        if curTime > maxcount or not guiEnabled then
            activeTasks[taskIdentifier] = 2
        end
        local fuck = 100 - (((maxcount - curTime) / length) * 100)
        fuck = math.min(100, fuck)
        updateGui(fuck,taskIdentifier,name)

        if runCheck then
            if IsPedClimbing(PlayerPedId()) or IsPedJumping(PlayerPedId()) or IsPedSwimming(PlayerPedId()) or IsControlJustPressed(1,311,true) then -- IsControlJustPressed(1,311,true) if inventory opened cancel
                SetPlayerControl(PlayerId(), 0, 0)
                local totaldone = taskBarFail(maxcount,curTime,length)
                taskInProcess = false
                closeGuiFail()
                Citizen.Wait(1000)
                SetPlayerControl(PlayerId(), 1, 1)
                Citizen.Wait(1000)
                if cb then cb(totaldone) end
                return totaldone
            end
        end

        if vehicle ~= nil and vehicle ~= 0 then
            local driverPed = GetPedInVehicleSeat(vehicle, -1)
            if driverPed ~= playerPed and vehCheck then
                SetPlayerControl(PlayerId(), 0, 0)
                local totaldone = taskBarFail(maxcount,curTime,length)
                taskInProcess = false
                closeGuiFail()
                Citizen.Wait(1000)
                SetPlayerControl(PlayerId(), 1, 1)
                Citizen.Wait(1000)
                if cb then cb(totaldone) end
                return totaldone
            end

            local model = GetEntityModel(playerVeh)
            if IsThisModelACar(model) or IsThisModelABike(model) or IsThisModelAQuadbike(model) then
                if IsEntityInAir(vehicle) then
                    Wait(1000)
                    if IsEntityInAir(vehicle) then
                        local totaldone = taskBarFail(maxcount,curTime,length)
                        taskInProcess = false
                        closeGuiFail()
                        Citizen.Wait(1000)
                        if cb then cb(totaldone) end
                        return totaldone
                    end
                end
            end
        end
    end

    local resultTask = activeTasks[taskIdentifier]
    if resultTask == 2 then
        --local totaldone = math.ceil(100 - (((maxcount - curTime) / length) * 100))
        --totaldone = math.min(100, totaldone)
        local totaldone = taskBarFail(maxcount,curTime,length)
        --taskInProcess = false
        --closeGuiFail()
        if cb then cb(totaldone) end
        return totaldone
    else
        closeGui()
        taskInProcess = false

        if cb then cb(100) end
        return 100
    end
end

function CheckCancels()
    if IsPedRagdoll(PlayerPedId()) then
        return true
    end
    return false
end
-- trigger this way for the timer with out stopping another thread
RegisterNetEvent('hud:taskBar')
AddEventHandler('hud:taskBar', function(length,name)
    taskBar(length,name)
end)

RegisterNetEvent('hud:insidePrompt')
AddEventHandler('hud:insidePrompt', function(bool)
    insidePrompt = bool
end)

RegisterNetEvent('event:control:taskBar')
AddEventHandler('event:control:taskBar', function(useID)
    if useID == 5 and guiEnabled then 
        closeGuiFail()
    end
end)

function pInInv()
    if pTaskActive == 1 then
        pPogChomp = true
    elseif pTaskActive == 0 then
        pPogChomp = false
    end
    return pPogChomp
end