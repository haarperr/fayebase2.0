local CraftbenchID = 0 
local ConCoords = 0

RegisterNetEvent("PlaceCraftbench1")
AddEventHandler("PlaceCraftbench1", function(model, coords)
    RequestModel(model)
    CreatedObjects = CreateObject(model, coords)
    FreezeEntityPosition(CreatedObjects, true)
    TriggerServerEvent("craftbench:new", model, coords)
end)

function CraftbenchTarget(distance)
    local Cam = GetGameplayCamCoord()
    local _, Hit, Coords, _, Entity = GetShapeTestResult(StartExpensiveSynchronousShapeTestLosProbe(Cam, GetCoordsFromCam(10.0, Cam), -1, PlayerPedId(), 4))
    return Coords
end

function GetCoordsFromCam(distance, coords)
    local rotation = GetGameplayCamRot()
    local adjustedRotation = vector3((math.pi / 180) * rotation.x, (math.pi / 180) * rotation.y, (math.pi / 180) * rotation.z)
    local direction = vector3(-math.sin(adjustedRotation[3]) * math.abs(math.cos(adjustedRotation[1])), math.cos(adjustedRotation[3]) * math.abs(math.cos(adjustedRotation[1])), math.sin(adjustedRotation[1]))
    return vector3(coords[1] + direction[1] * distance, coords[2] + direction[2] * distance, coords[3] + direction[3] * distance)
end

local hidden = false
scenes = {}
local SpawningCraftBench = false
local coords = {}

RegisterNetEvent("evan-craftbench:place")
AddEventHandler("evan-craftbench:place", function(model)
    exports['np-interface']:showInteraction('[E] To place Bench')
    SetEntityLocallyInvisible(model, true)
    local placement = CraftbenchTarget()
    coords = {}
    SpawningCraftBench = true

    while SpawningCraftBench do
        RequestModel(model)
        DisableControlAction(0, 200, true)
        placement = CraftbenchTarget()
        if placement ~= nil then
            Object = model
            local objTypeKey = GetHashKey(Object)
            curObject = CreateObject(Object,placement,false,false,false)
            Citizen.Wait(0)
            DeleteObject(curObject)
            SetModelAsNoLongerNeeded(objTypeKey)
            SetEntityCollision(curObject, false)
            SetEntityCompletelyDisableCollision(curObject, false, false)
            SetEntityAlpha(Object, 0)
        end
        if IsControlJustReleased(0, 38) then
            SetEntityLocallyInvisible(model, false)
            TriggerEvent("PlaceCraftbench1", model, placement)
            TriggerEvent('DoLongHudText', 'You successfully placed a craft bench, use your 3rd eye to interact with it', 1)
            TriggerEvent('inventory:removeItem', 'craftbench', 1)
            exports['np-interface']:hideInteraction()
            return
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1500)
    TriggerServerEvent("ReceiveCoords")
    break
    end
end)

local infosent = {}
local Crafttt = {}

RegisterNetEvent("SpawnCraftBench")
AddEventHandler("SpawnCraftBench", function(infosent)
    local evan_craft_bench = {}

    Crafttt = evan_craft_bench

    for i=1, #infosent do
        local crafting_evan_loc = infosent[i]
        -- print(crafting_evan_loc['model'])
        evan_craft_bench[#evan_craft_bench+1] = {
            ['coords'] = vector3(crafting_evan_loc['x'], crafting_evan_loc['y'], crafting_evan_loc['z']),
           CreateObject(`gr_prop_gr_bench_03b`, vector3(crafting_evan_loc['x'], crafting_evan_loc['y'], crafting_evan_loc['z'])),
        }
    end
    Crafttt = evan_craft_bench
end)

RegisterNetEvent('evan-craftbench:open')
AddEventHandler('evan-craftbench:open', function()
    local red_circle = exports["isPed"]:GroupRank("red_circle")
    local mpg = exports['isPed']:GroupRank("mpg")
    local LostMC = exports['isPed']:GroupRank("lostmc")

    if red_circle >= 4 then
        TriggerEvent('server-inventory-open', '28', 'Craft')
        print('OPEN RED CIRCLE CRAFT')
    elseif mpg >= 4 then
        TriggerEvent('server-inventory-open', '32', 'Craft')
        print('OPEN MPG CRAFT')
    elseif LostMC >= 4 then
        TriggerEvent('server-inventory-open', '30', 'Craft')
        print('OPEN LOST CRAFT')
    else
        TriggerEvent('DoLongHudText', 'You do not have permission to use this.', 2)
    end
end)

RegisterNetEvent('nicx-craftbench:open')
AddEventHandler('nicx-craftbench:open', function()
    TriggerEvent('server-inventory-open', '28', 'Craft')
end)