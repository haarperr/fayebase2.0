--[[

    Variables

]]

local showMenu = false
local scenes = {}
local closestScenes = {}

local creationLaser = false
local deletionLaser = false

--[[

    Functions

]]

function OpenMenu()
    showMenu = true
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "open"})
end

function CloseMenu()
    showMenu = false
    SetNuiFocus(false, false)
end

function ToggleCreationLaser(data)
    deletionLaser = false
    creationLaser = not creationLaser

    if creationLaser then
        CreateThread(function()
            while creationLaser do
                local hit, coords = DrawLaser("PRESS ~g~E~w~ TO PLACE\nPUSH ~g~G~w~ TO EDIT", {r = 2, g = 241, b = 181, a = 200})

                data.coords = coords
                DrawScene(data)

                if IsControlJustReleased(0, 38) then
                    creationLaser = false
                    if hit then
                        TriggerServerEvent("np-scenes:server:CreateScene", data)
                    else
                        TriggerEvent("DoLongHudText", "Laser didn't hit anything.", 2)
                    end
                elseif IsControlJustReleased(0, 47) then
                    creationLaser = false
                    OpenMenu()
                end

                Wait(0)
            end
        end)
    end
end

function ToggleDeletionLaser()
    creationLaser = false
    deletionLaser = not deletionLaser

    if deletionLaser then
        CreateThread(function()
            while deletionLaser do
                local hit, coords = DrawLaser("PRESS ~r~E~w~ TO DELETE\nPUSH ~r~G~w~ TO CANCEL", {r = 255, g = 0, b = 0, a = 200})

                if IsControlJustReleased(0, 38) then
                    deletionLaser = false
                    if hit then
                        DeleteScene(coords)
                    else
                        TriggerEvent("DoLongHudText", "Laser didn't hit anything.", 2)
                    end
                elseif IsControlJustReleased(0, 47) then
                    deletionLaser = false
                end

                Wait(0)
            end
        end)
    end
end

function DeleteScene(coords)
    local closestScene = nil
    local shortestDistance = nil
    for i=1,#scenes do
        local currentScene = scenes[i]
        local distance =  #(coords - currentScene.coords)
        if distance < 1 and (closestDistance == nil or distance < shortestDistance) then
            closestScene = currentScene.id
            shortestDistance = distance
        end
    end

    if closestScene then
        TriggerEvent("DoLongHudText", "Deleted scene!")
        TriggerServerEvent("np-scenes:server:DeleteScene", closestScene)
    else
        TriggerEvent("DoLongHudText", "No scene was close enough.", 2)
    end
end

function DrawLaser(message, color)
    local hit, coords = RayCastGamePlayCamera(Config.MaxPlacementDistance)
    Draw2DText(message, 4, {255, 255, 255}, 0.4, 0.43, 0.888 + 0.025)

    if hit then
        local position = GetEntityCoords(PlayerPedId())
        DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
        DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, color.r, color.g, color.b, color.a, false, true, 2, nil, nil, false)
    end

    return hit, coords
end

function DrawScene(currentScene)
    local onScreen, screenX, screenY = World3dToScreen2d(currentScene.coords.x, currentScene.coords.y, currentScene.coords.z)
    if onScreen then
        local camCoords = GetGameplayCamCoords()
        local distance = #(currentScene.coords - camCoords)
        local fov = (1 / GetGameplayCamFov()) * 75
        local scale = (1 / distance) * (4) * fov * (currentScene.fontsize)
        local r,g,b=rgbToHex(currentScene.color)

        SetTextScale(0.0, scale)
        SetTextFont(currentScene.fontstyle)
        SetTextProportional(true)
        SetTextColour(r, g, b, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(currentScene.text)
        DrawText(screenX, screenY)
    end
end

--[[

    Events

]]

RegisterNetEvent("np-scenes:client:UpdateAllScenes", function(_scenes)
    scenes = _scenes
end)

--[[

    NUI

]]

RegisterNUICallback("CloseMenu", function()
    CloseMenu()
end)

RegisterNUICallback("DeleteLaser", function()
    CloseMenu()
    ToggleDeletionLaser()
end)

RegisterNUICallback("CreateScene", function(data, cb)
    creationLaser = false
    Wait(100)
    ToggleCreationLaser(data)
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    exports["np-binds"]:registerKeyMapping("", "Scenes", "Start / Place Scene", "+startScene", "-startScene")
    exports["np-binds"]:registerKeyMapping("", "Scenes", "Delete Closest Scene", "+deleteScene", "-deleteScene")

    RegisterCommand("+startScene", function()
        OpenMenu()
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "monkeyopening", 0.05)
    end, false)
    RegisterCommand("-startScene", function() end, false)

    RegisterCommand("+deleteScene", function()
        ToggleDeletionLaser()
    end, false)
    RegisterCommand("-deleteScene", function() end, false)

    Citizen.Wait(3000)

    scenes = RPC.execute("np-scenes:getScenes")
end)

Citizen.CreateThread(function()
    while true do
        closestScenes = {}

        for i=1, #scenes do
            local currentScene = scenes[i]
            local plyPosition = GetEntityCoords(PlayerPedId())
            local distance = #(plyPosition - currentScene.coords)

            if distance < Config.MaxPlacementDistance then
                closestScenes[#closestScenes+1] = currentScene
            end
        end

        Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 1000

        if #closestScenes > 0 then
            wait = 0

            for i=1, #closestScenes do
                local currentScene = closestScenes[i]
                local plyPosition = GetEntityCoords(PlayerPedId())
                local distance = #(plyPosition - currentScene.coords)

                if distance <= currentScene.viewdistance then
                    DrawScene(closestScenes[i])
                end
            end
        end

        Wait(wait)
    end
end)