-- local knownCrops, isBusy = {}, false

-- local cropstatus = {
-- 	[1] = { ["info"] = "Looks Good" },
-- 	[2] = { ["info"] = "Needs Water" },
-- 	[3] = { ["info"] = "Needs Fertilizer" },
-- }

-- RegisterNetEvent('np-weed:knownCrops')
-- AddEventHandler('np-weed:knownCrops', function(sentInfo, currentTime)

--     local pCropData = {}

--     DeleteKnownCrops()
--     knownCrops = pCropData

--     for i=1, #sentInfo do
--         local justCuz = sentInfo[i]
--         if justCuz then
--             local huhstatus = 3
--             local currTime = tonumber(justCuz['time'])

--             if tonumber(justCuz['growth']) ~= 0 then
--                 if currTime - currentTime <= 0 then 
--                     huhstatus = 2
--                 else
--                     huhstatus = 1 
--                 end
--             end


--             pCropData[#pCropData+1] = {
--                 ['coords'] = vector3(justCuz['x'], justCuz['y'], justCuz['z']),
--                 ['growth'] = tonumber(justCuz['growth']),
--                 ['type'] = justCuz['type'],
--                 ['knownId'] = tonumber(justCuz['id']),
--                 ['status'] = huhstatus
--             }
--         end
--     end

--     knownCrops = pCropData
-- end)

-- function DeleteKnownCrops()
-- 	for i = 1, #knownCrops do
-- 		local ObjectFound = knownCrops[i]["object"]
-- 		if ObjectFound and DoesEntityExist(ObjectFound) then
-- 			DeleteObject(ObjectFound)
-- 		end
-- 	end
-- end

-- function CreateKnownCrop(sentId)
--     if sentId then
--         local theModel = `bkr_prop_weed_med_01b`
--         local size = 3.55
--         if knownCrops[sentId]['growth'] < 33 then -- 1st Stage.
--             size = 1
--             theModel = `bkr_prop_weed_01_small_01b`
--         elseif knownCrops[sentId]['growth'] > 66 then -- 3rd Stage.
--             theModel = `bkr_prop_weed_lrg_01b`
--         end
    
--         RequestModel(theModel)
--         while not HasModelLoaded(theModel) do
--             Wait(100)
--         end
        
--         local theZ = knownCrops[sentId]['coords']['z']-size
--         local CreatedObject = CreateObject(theModel, knownCrops[sentId]['coords']['x'], knownCrops[sentId]['coords']['y'], theZ, true, false, false)
--         PlaceObjectOnGroundProperly(CreatedObject)
--         SetEntityCollision(CreatedObject, false, false)
--         SetEntityCanBeDamaged(CreatedObject, false)
--         knownCrops[sentId]["object"] = CreatedObject
--     end
-- end

-- RegisterNetEvent('np-weed:plantSeed')
-- AddEventHandler('np-weed:plantSeed', function(sentType)
--     if not isBusy then
--         if exports["np-inventory"]:hasEnoughOfItem("plantpot",1,false) then
--             local veh = GetVehiclePedIsIn(PlayerPedId(), false)
--             if veh == 0 then
--                 local success = true
--                 isBusy = true
--                 local ped = PlayerPedId()
--                 local playerCoord = GetEntityCoords(ped)
        
--                 if not IsEntityInWater(PlayerPedId()) then
--                     ShitFunction(sentType,`bkr_prop_weed_01_small_01b`)
--                 else
--                     TriggerEvent("DoLongHudText", "Unable to place here!", 2)
--                 end
        
--             else
--                 TriggerEvent("DoLongHudText", "You cant place this while in a vehicle!", 2)
--             end
--             isBusy = false
--         else
--             TriggerEvent("DoLongHudText", "You need something to plant it in!", 2)
--         end
--     end
-- end)

-- local function RotationToDirection(rotation)
-- 	local adjustedRotation = 
-- 	{ 
-- 		x = (math.pi / 180) * rotation.x, 
-- 		y = (math.pi / 180) * rotation.y, 
-- 		z = (math.pi / 180) * rotation.z 
-- 	}
-- 	local direction = 
-- 	{
-- 		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
-- 		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
-- 		z = math.sin(adjustedRotation.x)
-- 	}
-- 	return direction
-- end

-- local function RayCastGamePlayCamera(distance)
-- 	local cameraRotation = GetGameplayCamRot()
-- 	local cameraCoord = GetGameplayCamCoord()
-- 	local direction = RotationToDirection(cameraRotation)
-- 	local destination = 
-- 	{ 
-- 		x = cameraCoord.x + direction.x * distance, 
-- 		y = cameraCoord.y + direction.y * distance, 
-- 		z = cameraCoord.z + direction.z * distance 
-- 	}
-- 	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, -1, 1))
-- 	return b, c, e
-- end

-- function ShitFunction(sentType, theModel)
--     TriggerEvent("DoLongHudText", "Press (X) to cancel | (E) Place Down Crop", 1)
--     Citizen.CreateThread(function()
--         local shouldBreak = false
--         local dontPlant = false
--         local pedCoords = GetEntityCoords(PlayerPedId())
--         local CreatedObject = CreateObject(theModel, pedCoords.x, pedCoords.y, pedCoords.z - 10, true, false, false)
--         SetEntityCollision(CreatedObject, false, false)
--         SetEntityCanBeDamaged(CreatedObject, false)
--         SetEntityAlpha(CreatedObject, 150)
--         while true do
--             Citizen.Wait(0)
--             local hit, coords = RayCastGamePlayCamera(1000.0)
--             local dist = #(coords - GetEntityCoords(PlayerPedId()))
--             if dist < 2.5 then
--                 SetEntityCoords(CreatedObject, coords.x, coords.y, coords.z, 0, 0, 0)
--                 PlaceObjectOnGroundProperly(CreatedObject)
--             end
--             TaskTurnPedToFaceEntity(PlayerPedId(), CreatedObject, 0)
--             local successShit = true
--             if IsControlJustPressed(0, 38) then
--                 if hit == 1 then
--                     if knownCrops[1] ~= nil then
--                         for i = 1, #knownCrops do
--                             local dist = #(knownCrops[i]['coords'] - GetEntityCoords(CreatedObject))
--                             if dist < 1.5 then 
--                                 successShit = false 
--                             end
--                         end
--                     end
--                     if successShit then
--                         shouldBreak = true
--                     else
--                         TriggerEvent("DoLongHudText", "You can't place this here.", 2)
--                     end
--                 end
--             end
--             if IsControlJustPressed(0, 73) then
--                 DeleteEntity(CreatedObject)
--                 dontPlant = true
--                 shouldBreak = true
--                 ClearPedTasksImmediately(PlayerPedId())
--             end

--             if shouldBreak == true then
--                 if dontPlant then
--                     break
--                 end
         
--                 TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_GARDENER_PLANT', 0, true)
--                 local coordsShit = vector3(0, 0, 0)
--                 local coordsShit = GetEntityCoords(CreatedObject)
--                 DeleteEntity(CreatedObject)
--                 local finished = exports["np-taskbar"]:taskBar(math.random(8000, 12000),"Planting",false,false)
--                 if (finished == 100) then
--                     if exports["np-inventory"]:hasEnoughOfItem(sentType,1,false) then
--                         TriggerEvent("inventory:removeItem", sentType, 1)
--                         TriggerEvent("inventory:removeItem", "plantpot", 1)
--                         NewPlant(sentType, coordsShit.x, coordsShit.y, coordsShit.z + 0.8)
--                         ClearPedTasks(PlayerPedId())
--                     end
--                 end
--                 break
--             end
--         end
--     end)
-- end

-- RegisterNetEvent('np-weed:destroyPlant')
-- AddEventHandler('np-weed:destroyPlant', function(coords)
--     if not isBusy then
--         isBusy = true

--         local knownInfo = {
--             ['id'] = 0,
--             ['dist'] = 1000
--         }

--         for i=1, #knownCrops do
--             local dist = #(knownCrops[i]['coords'] - coords)

--             if dist < knownInfo['dist'] then
--                 knownInfo['dist'] = dist 
--                 knownInfo['id'] = i
--             end
--         end

--         if knownInfo['id'] > 0 and knownInfo['dist'] < 3 then
--             if knownCrops[knownInfo['id']]['object'] and DoesEntityExist(knownCrops[knownInfo['id']]['object']) and knownCrops[knownInfo['id']]["type"] == "maleseed" then
--                 CreateThread(function()
--                     local coords = vector3(knownCrops[knownInfo['id']]['coords'])
--                     local endTime = GetGameTimer() + math.random(5000, 8000)
--                     while true do
--                         Wait(0)
--                         if GetGameTimer() >= endTime then
--                             TriggerServerEvent("np-weed:killplant", knownCrops[knownInfo['id']]['knownId'])
--                             break
--                         end
--                     end
--                 end)
--             end
--         end
        
--         isBusy = false
--     end
-- end)

-- function NewPlant(sentType, coordsX, coordsY, coordsZ)
-- 	TriggerServerEvent("np-weed:newplant", coordsX, coordsY, coordsZ, sentType)
-- end 

-- RegisterNetEvent('np-weed:updatePlant')
-- AddEventHandler('np-weed:updatePlant', function(updateType, sentId, sentGrowth, sentTime, sentStatus, sentNewInfo, currentTime)
--     if updateType == 0 then
--         for i=1, #knownCrops do
--             if knownCrops[i] ~= nil then
--                 if knownCrops[i]['knownId'] == sentId then
--                     local currObj = knownCrops[i]['object']
--                     table.remove(knownCrops, i)
--                     if currObj and DoesEntityExist(currObj) then
--                         DeleteObject(currObj) 
--                     end
--                     break
--                 end
--             end 
--         end 
--     elseif updateType == 1 then
--         for i=1, #knownCrops do
--             if knownCrops[i] ~= nil then
--                 if knownCrops[i]['knownId'] == sentId then
                    
--                     local huhstatus = 3
--                     local currGrowth = tonumber(sentGrowth)

--                     if currGrowth ~= 0 then
--                         if currGrowth - currentTime <= 0 then 
--                             huhstatus = 2
--                         else
--                             huhstatus = 1 
--                         end
--                     end

--                     local huhstatus = 3
--                     local currTime = tonumber(sentTime)
        
--                     if tonumber(sentGrowth) ~= 0 then
--                         if currTime - currentTime <= 0 then 
--                             huhstatus = 2
--                         else
--                             huhstatus = 1 
--                         end
--                     end

--                     knownCrops[i]['growth'] = sentGrowth
--                     knownCrops[i]['time'] = sentTime
--                     knownCrops[i]['status'] = huhstatus
--                     break 
--                 end 
--             end 
--         end 
--     elseif updateType == 3 and sentNewInfo then
--         knownCrops[#knownCrops+1] = {
--             ['coords'] = vector3(sentNewInfo['x'], sentNewInfo['y'], sentNewInfo['z']),
--             ['growth'] = tonumber(sentNewInfo['growth']),
--             ['type'] = sentNewInfo['type'],
--             ['knownId'] = tonumber(sentId),
--             ['time'] = tonumber(sentTime),
--             ['status'] = tonumber(sentStatus)
--         }
--     end 
-- end)

-- local TyPes = {
--     ['maleseed'] = 'Blue Dream',
--     ['femaleseed'] = 'Grape Ape',
-- }


-- CreateThread(function()
--     local inRange = false
--     while true do
--         Citizen.Wait(0)

--         local closest = 0
--         local distance = 6969.0

--         for i=1, #knownCrops do
--             local knownDistance = #(knownCrops[i]['coords'] - GetEntityCoords(PlayerPedId()))

--             if knownDistance < 75 then
--                 if knownDistance < distance then
--                     distance = knownDistance
--                     closest = i
--                 end

--                 if knownCrops[i]['object'] == nil then
--                     CreateKnownCrop(i)
--                 elseif knownCrops[i]['object'] and not DoesEntityExist(knownCrops[i]['object']) then
--                     CreateKnownCrop(i)
--                 end
--             elseif knownCrops[i]['object'] then
--                 DeleteObject(knownCrops[i]["object"])
--                 knownCrops[i]["object"] = nil
--             end
--         end

--         if knownCrops[closest] then
--             local cropDist = #(knownCrops[closest]['coords'] - GetEntityCoords(PlayerPedId()))
--             if cropDist < 1.8 then
--                 inRange = true
--                 local num = tonumber(knownCrops[closest]["status"])
--                 if knownCrops[closest]["growth"] >= 100 then
--                     if exports['isPed']:isPed("myjob") == "police" or "sheriff" or "state" then 
--                         DrawText3D(knownCrops[closest]['coords'], "  [H] " ..TyPes[knownCrops[closest]["type"]] .. " Strain @ " .. "100" .. "% - " .. "Good For Pick | [~r~G~w~] Destroy Plant")
--                     else
--                         DrawText3D(knownCrops[closest]['coords'], "  [H] " ..TyPes[knownCrops[closest]["type"]] .. " Strain @ " .. "100" .. "% - " .. "Good For Pick")
--                     end  
--                 else
--                     if cropstatus[num]["info"] == "Looks Good" then
--                         if exports['isPed']:isPed("myjob") == "police" or "sheriff" or "state" then 
--                             DrawText3D(knownCrops[closest]['coords'], " " ..TyPes[knownCrops[closest]["type"]] .. " Strain @ " .. knownCrops[closest]["growth"] .. "% - " .. cropstatus[num]["info"].. " | [~r~G~w~] Destroy Plant")
--                         else
--                             DrawText3D(knownCrops[closest]['coords'], " " ..TyPes[knownCrops[closest]["type"]] .. " Strain @ " .. knownCrops[closest]["growth"] .. "% - " .. cropstatus[num]["info"])
--                         end
--                     else
--                         if exports['isPed']:isPed("myjob") == "police" or "sheriff" or "state" then 
--                             DrawText3D(knownCrops[closest]['coords'], " [H] " .. TyPes[knownCrops[closest]["type"]] .. " Strain @ " .. knownCrops[closest]["growth"] .. "% - " .. cropstatus[num]["info"].. " | [~r~G~w~] Destroy Plant")
--                         else
--                             DrawText3D(knownCrops[closest]['coords'], " [H] " .. TyPes[knownCrops[closest]["type"]] .. " Strain @ " .. knownCrops[closest]["growth"] .. "% - " .. cropstatus[num]["info"])
--                         end
--                     end
--                 end
                
--                 if cropDist < 2 then
--                     if IsControlJustReleased(0, 304) then
--                         if knownCrops[closest]["growth"] >= 100 then
--                             local finished = exports["np-taskbar"]:taskBar(1000, "Picking Plant", false, false)
--                             if (finished == 100) then
--                                 TriggerServerEvent('np-weed:killplant', knownCrops[closest]["knownId"])
--                                 if knownCrops[closest]["type"] == 'maleseed' then
--                                     TriggerEvent( "player:receiveItem","weedq", math.random(12,18)) 
--                                     Wait(500)
--                                     if math.random(10) >= math.random(6, 7) then 
--                                         TriggerEvent( "player:receiveItem","maleseed", math.random(1,2))
--                                     elseif math.random(10) >= math.random(4, 6) then 
--                                         TriggerEvent( "player:receiveItem","maleseed", 1)
--                                     end
--                                 elseif knownCrops[closest]["type"] == 'femaleseed' then
--                                     TriggerEvent( "player:receiveItem","weedq", math.random(10,15)) 
--                                     Wait(500)
--                                     if math.random(10) >= math.random(6, 7) then 
--                                         TriggerEvent( "player:receiveItem","femaleseed", math.random(1,2))
--                                     elseif math.random(10) >= math.random(4, 6) then 
--                                         TriggerEvent( "player:receiveItem","femaleseed", 1)
--                                     end
--                                 end
--                             end 
--                         elseif num == 2 then
--                             if exports["np-inventory"]:hasEnoughOfItem("purifiedwater",1,false) then
--                                 TriggerEvent("inventory:removeItem", "purifiedwater", 1)
--                                 local new = math.ceil(knownCrops[closest]["growth"] + math.random(10,15))
--                                 TriggerServerEvent("np-weed:updateStatus", 'update', knownCrops[closest]["knownId"], new, 'water')
--                             else
--                                 TriggerEvent("DoLongHudText", "You need purified water.", 2)
--                             end
               
--                         elseif num == 3 then
--                             if exports["np-inventory"]:hasEnoughOfItem("fertilizer",1,false) then
--                                 TriggerEvent("inventory:removeItem", "fertilizer", 1)
--                                 local new = math.ceil(knownCrops[closest]["growth"] + math.random(10,15))
--                                 TriggerServerEvent("np-weed:updateStatus", 'update', knownCrops[closest]["knownId"], new, 'fertilizer')
--                             else
--                                 TriggerEvent("DoLongHudText", "You need fertilizer.", 2)
--                             end
--                         end
--                     end


--                     if IsControlJustReleased(0, 47) and exports['isPed']:isPed("myjob") == "police" then
--                         TriggerServerEvent('np-weed:killplant', knownCrops[closest]["knownId"])
--                     end
--                 end
--             else
--                 inRange = false
--             end
--         end
--         if not inRange then
--             Citizen.Wait(1000)
--         end
--     end
-- end)

-- function DrawText3D(cCoords, text)
--     local onScreen,_x,_y=World3dToScreen2d(cCoords.x, cCoords.y, cCoords.z)
--     local px,py,pz=table.unpack(GetGameplayCamCoords())
--     SetTextScale(0.35, 0.35)
--     SetTextFont(4)
--     SetTextProportional(1)
--     SetTextColour(255, 255, 255, 215)
--     SetTextEntry("STRING")
--     SetTextCentre(1)
--     AddTextComponentString(text)
--     DrawText(_x,_y)
--     local factor = (string.len(text)) / 370
--     DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)

-- end