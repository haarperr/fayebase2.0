-- ------------------------- VOID RP ------------------------------------------------------------------------------
-- local hackAnimDict = "anim@heists@ornate_bank@hack"

-- local function loadDicts()
--     RequestAnimDict(hackAnimDict)
--     RequestModel("hei_prop_hst_laptop")
--     RequestModel("hei_p_m_bag_var22_arm_s")
--     RequestModel("hei_prop_heist_card_hack_02")
--     while not HasAnimDictLoaded(hackAnimDict)
--         or not HasModelLoaded("hei_prop_hst_laptop")
--         or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
--         or not HasModelLoaded("hei_prop_heist_card_hack_02") do
--         Wait(0)
--     end
-- end


-- RegisterNetEvent('np-vault:firstdoor')
-- AddEventHandler('np-vault:firstdoor', function()
--     local player = GetEntityCoords(PlayerPedId())
--     local distance = #(vector3(256.84341, 220.15713, 106.28618) - player)
--     if distance < 1.5 then
--         if exports["np-duty"]:LawAmount() >= 0 then
--             if exports["np-inventory"]:hasEnoughOfItem("thermal_charge", 1) then
--                 TriggerEvent('np-hud:show_hackerman')
--                 TriggerEvent("client:newStress",true, 150)
--                 frontdoorvault()
--                 exports['np-thermite']:OpenThermiteGame(function(success)
--                     if success then
--                         TriggerEvent('phone:addJobNotify', "Great job now do the next door")
--                         TriggerEvent('np-hud:hide_hackerman')
--                         TriggerEvent("inventory:removeItem", "thermal_charge", 1)
--                         TriggerServerEvent('np-doors:change-lock-state', 46, false) 
--                         TriggerEvent('np-dispatch:bobcat_robbery')
--                         Citizen.Wait(3000)
--                         FreezeEntityPosition(PlayerPedId(), false)
--                     else
--                         TriggerEvent('np-dispatch:bobcat_robbery')
--                         TriggerEvent('np-hud:hide_hackerman')
--                         TriggerEvent('inventory:removeItem', 'thermal_charge', 1)
--                     end
--                 end)
--             end
--         else
--             TriggerEvent('DoLongHudText', 'Not Enough Cops on Duty', 2)
--         end
--     end
-- end)

-- RegisterNetEvent('np-vault:seconddoor')
-- AddEventHandler('np-vault:seconddoor', function()
--     local player = GetEntityCoords(PlayerPedId())
--     local distance = #(vector3(261.68984, 222.0194, 106.28388) - player)
--     if distance < 1.5 then
--         if exports["np-duty"]:LawAmount() >= 0 then
--             if exports["np-inventory"]:hasEnoughOfItem("thermal_charge", 1) then
--                 TriggerEvent('np-hud:show_hackerman')
--                 TriggerEvent("client:newStress",true, 150)
--                 seconddoorvault()
--                 exports['np-thermite']:OpenThermiteGame(function(success)
--                     if success then
--                         TriggerEvent('phone:addJobNotify', "Good Shit head down stairs and hack the vault")
--                         TriggerEvent('np-hud:hide_hackerman')
--                         TriggerEvent("inventory:removeItem", "thermal_charge", 1)
--                         TriggerServerEvent('np-doors:change-lock-state', 48, false) 
--                         TriggerEvent('np-dispatch:bobcat_robbery')
--                         Citizen.Wait(3000)
--                         FreezeEntityPosition(PlayerPedId(), false)
--                     else
--                         TriggerEvent('np-dispatch:bobcat_robbery')
--                         TriggerEvent('np-hud:hide_hackerman')
--                         TriggerEvent('inventory:removeItem', 'thermal_charge', 1)
--                     end
--                 end)
--             end
--         else
--             TriggerEvent('DoLongHudText', 'Not Enough Cops on Duty', 2)
--         end
--     end
-- end)


-- RegisterNetEvent('np-vault:startvault')
-- AddEventHandler('np-vault:startvault', function()
--     local player = GetEntityCoords(PlayerPedId())
--     local distance = #(vector3(253.25254, 228.45343, 101.68377) - player)
--     if distance < 1.5 then
--         if exports["np-duty"]:LawAmount() >= 0 then
--             if exports["np-inventory"]:hasEnoughOfItem("heistlaptop4", 1) then
--                 StartVaultKid()
--                 TriggerEvent('np-hud:show_hackerman')
--                 TriggerEvent("client:newStress",true, 150)
--                 exports['hacking']:OpenHackingGame(15, 6, 6, function(Success)
--                     OnHackDone(Success)
--                     DeleteObject(bag)
--                     DeleteObject(laptop)
--                     FreezeEntityPosition(ped, false)
--                 end)
--                 TriggerEvent("inventory:removeItem", "heistlaptop4", 1)
--                 Citizen.Wait(1000)
--             end 
--         end
--     end
-- end)


-- function OnHackDone(success)
--     if success then
--         TriggerEvent('vault:success:panel', closestBank, true)
--         CreatenBrakeCrates()
--     end
-- end


-- RegisterNetEvent('np-vault:lowerfirstdoor')
-- AddEventHandler('np-vault:lowerfirstdoor', function()
--     local player = GetEntityCoords(PlayerPedId())
--     local distance = #(vector3(252.56506, 221.22116, 101.68394) - player)
--     if distance < 1.5 then
--         if exports["np-duty"]:LawAmount() >= 0 then
--             if exports["np-inventory"]:hasEnoughOfItem("thermal_charge", 1) then
--                 TriggerEvent('np-hud:show_hackerman')
--                 TriggerEvent("client:newStress",true, 150)
--                 thirddoorvault()
--                 exports['np-thermite']:OpenThermiteGame(function(success)
--                     if success then
--                         TriggerEvent('phone:addJobNotify', "Great Job Get through those doors and grab the money")
--                         TriggerEvent('np-hud:hide_hackerman')
--                         TriggerEvent("inventory:removeItem", "thermal_charge", 1)
--                         TriggerServerEvent('np-doors:change-lock-state', 49, false) 
--                         TriggerEvent('np-dispatch:bobcat_robbery')
--                         Citizen.Wait(3000)
--                         FreezeEntityPosition(PlayerPedId(), false)
--                     else
--                         TriggerEvent('np-dispatch:bobcat_robbery')
--                         TriggerEvent('np-hud:hide_hackerman')
--                         TriggerEvent('inventory:removeItem', 'thermal_charge', 1)
--                     end
--                 end)
--             end
--         else
--             TriggerEvent('DoLongHudText', 'Not Enough Cops on Duty', 2)
--         end
--     end
-- end)

-- RegisterNetEvent('np-vault:lowerseconddoor')
-- AddEventHandler('np-vault:lowerseconddoor', function()
--     local player = GetEntityCoords(PlayerPedId())
--     local distance = #(vector3(261.23635, 215.26144, 101.68384) - player)
--     if distance < 1.5 then
--         if exports["np-duty"]:LawAmount() >= 0 then
--             if exports["np-inventory"]:hasEnoughOfItem("thermal_charge", 1) then
--                 TriggerEvent('np-hud:show_hackerman')
--                 TriggerEvent("client:newStress",true, 150)
--                 fourthdoorvault()
--                 exports['np-thermite']:OpenThermiteGame(function(success)
--                     if success then
--                         TriggerEvent('phone:addJobNotify', "Grab the cash and thermite the door")
--                         TriggerEvent('np-hud:hide_hackerman')
--                         TriggerEvent("inventory:removeItem", "thermal_charge", 1)
--                         TriggerServerEvent('np-doors:change-lock-state', 50, false) 
--                         TriggerEvent('np-dispatch:bobcat_robbery')
--                         Citizen.Wait(3000)
--                         FreezeEntityPosition(PlayerPedId(), false)
--                     else
--                         TriggerEvent('np-dispatch:bobcat_robbery')
--                         TriggerEvent('np-hud:hide_hackerman')
--                         TriggerEvent('inventory:removeItem', 'thermal_charge', 1)
--                     end
--                 end)
--             end
--         else
--             TriggerEvent('DoLongHudText', 'Not Enough Cops on Duty', 2)
--         end
--     end
-- end)


                
-- ---- animations lol


-- function frontdoorvault() -- FRONT DOOR ANIMATION
--     RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
--     RequestModel("hei_p_m_bag_var22_arm_s")
--     RequestNamedPtfxAsset("scr_ornate_heist")
--     while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
--         Citizen.Wait(50)
--     end
--     local ped = PlayerPedId()

--     SetEntityHeading(ped, 333.24514)
--     Citizen.Wait(100)
--     local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
--     local bagscene = NetworkCreateSynchronisedScene(256.84341, 220.15713, 106.28618, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
--     local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 256.84341, 220.15713, 106.28618,  true,  true, false)

--     SetEntityCollision(bag, false, true)
--     NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
--     NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
--     SetPedComponentVariation(ped, 5, 0, 0, 0)
--     NetworkStartSynchronisedScene(bagscene)
--     Citizen.Wait(1500)
--     local x, y, z = table.unpack(GetEntityCoords(ped))
--     local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

--     SetEntityCollision(bomba, false, true)
--     AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
--     Citizen.Wait(2000)
--     DeleteObject(bag)
--     SetPedComponentVariation(ped, 5, 45, 0, 0)
--     DetachEntity(bomba, 1, 1)
--     FreezeEntityPosition(bomba, true)
--     TriggerServerEvent("lumo:particleserver", method)
--     SetPtfxAssetNextCall("scr_ornate_heist")
--     local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

--     NetworkStopSynchronisedScene(bagscene)
--     TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
--     TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
--     Citizen.Wait(5000)
--     ClearPedTasks(ped)
--     DeleteObject(bomba)
--     StopParticleFxLooped(effect, 0)
-- end

-- function seconddoorvault() -- FRONT DOOR ANIMATION
--     RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
--     RequestModel("hei_p_m_bag_var22_arm_s")
--     RequestNamedPtfxAsset("scr_ornate_heist")
--     while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
--         Citizen.Wait(50)
--     end
--     local ped = PlayerPedId()

--     SetEntityHeading(ped, 248.24514)
--     Citizen.Wait(100)
--     local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
--     local bagscene = NetworkCreateSynchronisedScene(261.73904, 221.86761, 106.28404, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)  
--     local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 261.73904, 221.86761, 106.28404,  true,  true, false)                                                  

--     SetEntityCollision(bag, false, true)
--     NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
--     NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
--     SetPedComponentVariation(ped, 5, 0, 0, 0)
--     NetworkStartSynchronisedScene(bagscene)
--     Citizen.Wait(1500)
--     local x, y, z = table.unpack(GetEntityCoords(ped))
--     local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

--     SetEntityCollision(bomba, false, true)
--     AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
--     Citizen.Wait(2000)
--     DeleteObject(bag)
--     SetPedComponentVariation(ped, 5, 45, 0, 0)
--     DetachEntity(bomba, 1, 1)
--     FreezeEntityPosition(bomba, true)
--     TriggerServerEvent("lumo:particleserver", method)
--     SetPtfxAssetNextCall("scr_ornate_heist")
--     local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

--     NetworkStopSynchronisedScene(bagscene)
--     TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
--     TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
--     Citizen.Wait(5000)
--     ClearPedTasks(ped)
--     DeleteObject(bomba)
--     StopParticleFxLooped(effect, 0)
-- end


-- function thirddoorvault() -- FRONT DOOR ANIMATION
--     RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
--     RequestModel("hei_p_m_bag_var22_arm_s")
--     RequestNamedPtfxAsset("scr_ornate_heist")
--     while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
--         Citizen.Wait(50)
--     end
--     local ped = PlayerPedId()

--     SetEntityHeading(ped, 160.62071)
--     Citizen.Wait(100)
--     local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
--     local bagscene = NetworkCreateSynchronisedScene(252.79815, 221.04006, 101.68394, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)  
--     local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 252.79815, 221.04006, 101.68394,  true,  true, false)                                                  

--     SetEntityCollision(bag, false, true)
--     NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
--     NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
--     SetPedComponentVariation(ped, 5, 0, 0, 0)
--     NetworkStartSynchronisedScene(bagscene)
--     Citizen.Wait(1500)
--     local x, y, z = table.unpack(GetEntityCoords(ped))
--     local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

--     SetEntityCollision(bomba, false, true)
--     AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
--     Citizen.Wait(2000)
--     DeleteObject(bag)
--     SetPedComponentVariation(ped, 5, 45, 0, 0)
--     DetachEntity(bomba, 1, 1)
--     FreezeEntityPosition(bomba, true)
--     TriggerServerEvent("lumo:particleserver", method)
--     SetPtfxAssetNextCall("scr_ornate_heist")
--     local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

--     NetworkStopSynchronisedScene(bagscene)
--     TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
--     TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
--     Citizen.Wait(5000)
--     ClearPedTasks(ped)
--     DeleteObject(bomba)
--     StopParticleFxLooped(effect, 0)
-- end


-- function fourthdoorvault() -- FRONT DOOR ANIMATION
--     RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
--     RequestModel("hei_p_m_bag_var22_arm_s")
--     RequestNamedPtfxAsset("scr_ornate_heist")
--     while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
--         Citizen.Wait(50)
--     end
--     local ped = PlayerPedId()

--     SetEntityHeading(ped, 249.56549)
--     Citizen.Wait(100)
--     local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
--     local bagscene = NetworkCreateSynchronisedScene(261.23635, 215.26144 ,101.68384, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)  
--     local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 261.23635, 215.26144, 101.68384,  true,  true, false)                                                  

--     SetEntityCollision(bag, false, true)
--     NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
--     NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
--     SetPedComponentVariation(ped, 5, 0, 0, 0)
--     NetworkStartSynchronisedScene(bagscene)
--     Citizen.Wait(1500)
--     local x, y, z = table.unpack(GetEntityCoords(ped))
--     local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

--     SetEntityCollision(bomba, false, true)
--     AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
--     Citizen.Wait(2000)
--     DeleteObject(bag)
--     SetPedComponentVariation(ped, 5, 45, 0, 0)
--     DetachEntity(bomba, 1, 1)
--     FreezeEntityPosition(bomba, true)
--     TriggerServerEvent("lumo:particleserver", method)
--     SetPtfxAssetNextCall("scr_ornate_heist")
--     local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

--     NetworkStopSynchronisedScene(bagscene)
--     TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
--     TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
--     Citizen.Wait(5000)
--     ClearPedTasks(ped)
--     DeleteObject(bomba)
--     StopParticleFxLooped(effect, 0)
-- end


-- function StartVaultKid()
--     local ply = PlayerPedId()
--     local plyCoords = GetEntityCoords(ply)
--     ClearPedTasksImmediately(ply)
--     Wait(0)
--     TaskGoStraightToCoord(ply, 253.60346984863, 228.20530700684, 101.68351745605-0.9, 2.0, -1, 0.0)
--     loadDicts()
--     Wait(0)
--     while GetIsTaskActive(ply, 35) do
--         Wait(0)
--     end
--     ClearPedTasksImmediately(ply)
--     Wait(0)
--     SetEntityHeading(ply, 71.801795959473)
--     Wait(0)
--     TaskPlayAnimAdvanced(ply, "anim@heists@ornate_bank@hack", "hack_enter", 253.60346984863, 228.20530700684, 101.68351745605 -0.9, 0, 0, 0, 1.0, 0.0, 8300, 0, 0.3, false, false, false)
--     Wait(0)
--     SetEntityHeading(ply, 71.801795959473)
--     while IsEntityPlayingAnim(ply, "anim@heists@ornate_bank@hack", "hack_enter", 3) do
--         Wait(0)
--     end
--     laptop = CreateObject(`hei_prop_hst_laptop`, GetOffsetFromEntityInWorldCoords(ply, 0.2, 0.6, 0.0), 1, 1, 0)
--     Wait(0)
--     SetEntityRotation(laptop, GetEntityRotation(ply, 2), 2, true)
--     PlaceObjectOnGroundProperly(laptop)
--     Wait(0)
--     TaskPlayAnim(ply, "anim@heists@ornate_bank@hack", "hack_loop", 1.0, 0.0, -1, 1, 0, false, false, false)

-- end


-- ---------------------------------------------------------------- vault open i think


--  -- VAULT DOOR SHIT NOBODY REALLY CARES
--  RegisterNetEvent("utk_oh:openvault_c")
--  AddEventHandler("utk_oh:openvault_c", function(method)
--      TriggerEvent("utk_oh:vault", method)
--      TriggerEvent("utk_oh:vaultsound")
--  end)
--  RegisterNetEvent("utk_oh:vault")
--  AddEventHandler("utk_oh:vault", function(method)
--      local obj = GetClosestObjectOfType(UTK.vault.x, UTK.vault.y, UTK.vault.z, 2.0, GetHashKey(UTK.vault.type), false, false, false)
--      local count = 0
 
--      if method == 1 then
--          repeat
--              local rotation = GetEntityHeading(obj) - 1.00
 
--              SetEntityHeading(obj, 1.00)
--              count = count + 1
--              Citizen.Wait(10)
--          until count == 3600000
--      else
--          repeat
--              local rotation = GetEntityHeading(obj) + 1.00
 
--              SetEntityHeading(obj, 1.00)
--              count = count + 1
--              Citizen.Wait(10)
--          until count == 3600000
--      end
--      FreezeEntityPosition(obj, true)
--  end)

--  UTK = {
--     doorchecks = {
--         {x = 253.92, y = 224.56, z = 101.88, he = 160.000, h = GetHashKey("v_ilev_bk_vaultdoor"), status = 0,}
--     },
--     disableinput = false, -- don't change anything else unless you know what you are doing
--     info = {},
--     vault = {x = 253.92, y = 224.56, z = 101.88, type = "v_ilev_bk_vaultdoor"},
--     cur = 7,
-- }

-- RegisterNetEvent("vault:success:panel", function()
--     TriggerEvent('DoLongHudText', "Success!", 1)
--     TriggerServerEvent("utk_oh:openvault", 1)
--     DeleteObject(laptop)
-- end)


-- RegisterCommand('openvault', function()
--     TriggerEvent("utk_oh:openvault_c")
-- end)


-- --- money trays


-- RegisterNetEvent('ghost:createCrates')
-- AddEventHandler('ghost:createCrates', function(toggle)
--     if toggle == true then
--      weaponbox = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 259.64764404297, 214.68962097168, 100.68382263184, true,  true, true)
--     CreateObject(weaponbox)
--     SetEntityHeading(weaponbox, 186.12)
--     FreezeEntityPosition(weaponbox, true)

--      weaponbox3 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 262.24865722656, 213.46434020996, 100.68383026123, true,  true, true)
--     CreateObject(weaponbox3)
--     SetEntityHeading(weaponbox3, 219.52)
--     FreezeEntityPosition(weaponbox3, true) 

--      weaponbox4 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 263.57299804688, 215.60986328125, 100.68383026123, true,  true, true)  -- 259.64764404297, 214.68962097168, 101.68382263184 Heading: 186.15272521973
--     CreateObject(weaponbox4)
--     SetEntityHeading(weaponbox4, 291.02)
--     FreezeEntityPosition(weaponbox4, true)


--     elseif toggle == false then
--         DeleteObject(weaponbox)
--         DeleteObject(weaponbox4)
--         DeleteObject(weaponbox3)
--     end
-- end)

-- function CreatenBrakeCrates()
--     local ped = PlayerPedId()

--     TriggerEvent('ghost:CleanClientVaultD')
--     TriggerEvent("ghost:createCrates" ,true)

--     TriggerEvent('DoLongHudText', 'The Cops are here hurry the fuck up.. ' ,ped)
--     Citizen.Trace("Crates Spawned :  Sucess")
--     Citizen.Wait(240000) -- 4 mins 
--     TriggerEvent('DoLongHudText', 'The Cops are here hurry the fuck up..' ,ped)
--     Citizen.Wait(60000) -- 1 min warning then delete 
--     TriggerEvent("ghost:createCrates" ,false)
--     Citizen.Trace("Crates Remove :  Timer Complete Removed")
--   end

--   function Loot()
--     Grab2clear = false
--     Grab3clear = false
--     Trolley = nil
--     local ped = PlayerPedId()
--     local model = "hei_prop_heist_cash_pile"
--     Trolley = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 1.0, `hei_prop_hei_cash_trolly_01`, false, false, false)
--     local CashAppear = function()
--         local pedCoords = GetEntityCoords(ped)
--         local grabmodel = GetHashKey(model)
--         RequestModel(grabmodel)
--         while not HasModelLoaded(grabmodel) do
--             Citizen.Wait(0)
--         end
--         local grabobj = CreateObject(grabmodel, pedCoords, true)
--         FreezeEntityPosition(grabobj, true)
--         SetEntityInvincible(grabobj, true)
--         SetEntityNoCollisionEntity(grabobj, ped)
--         SetEntityVisible(grabobj, false, false)
--         AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
--         local startedGrabbing = GetGameTimer()
--         Citizen.CreateThread(function()
--             while GetGameTimer() - startedGrabbing < 37000 do
--                 Citizen.Wait(0)
--                 DisableControlAction(0, 73, true)
--                 if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
--                     if not IsEntityVisible(grabobj) then
--                         SetEntityVisible(grabobj, true, false)
--                     end
--                 end
--                 if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
--                     if IsEntityVisible(grabobj) then
--                         SetEntityVisible(grabobj, false, false)
--                     end
--                 end
--             end
--             DeleteObject(grabobj)
--         end)
--     end
--     local emptyobj = `ch_prop_gold_trolly_01c_empty`
--     if IsEntityPlayingAnim(Trolley, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
--         return
--     end
--     local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
--     RequestAnimDict("anim@heists@ornate_bank@grab_cash")
--     RequestModel(baghash)
--     RequestModel(emptyobj)
--     while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
--         Citizen.Wait(0)
--     end
--     while not NetworkHasControlOfEntity(Trolley) do
--         Citizen.Wait(0)
--         NetworkRequestControlOfEntity(Trolley)
--     end
--     GrabBag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
--     Grab1 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
--     NetworkAddPedToSynchronisedScene(ped, Grab1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
--     NetworkAddEntityToSynchronisedScene(GrabBag, Grab1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
--     NetworkStartSynchronisedScene(Grab1)
--     Citizen.Wait(1500)
--     CashAppear()
--     if not Grab2clear then
--         Grab2 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
--         NetworkAddPedToSynchronisedScene(ped, Grab2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
--         NetworkAddEntityToSynchronisedScene(GrabBag, Grab2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
--         NetworkAddEntityToSynchronisedScene(Trolley, Grab2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
--         NetworkStartSynchronisedScene(Grab2)
--         Citizen.Wait(37000)
--     end
--     if not Grab3clear then
--         Grab3 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
--         NetworkAddPedToSynchronisedScene(ped, Grab3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
--         NetworkAddEntityToSynchronisedScene(GrabBag, Grab3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
--         NetworkStartSynchronisedScene(Grab3)
--         NewTrolley = CreateObject(emptyobj, GetEntityCoords(Trolley) + vector3(0.0, 0.0, - 0.985), true, false, false)
--         SetEntityRotation(NewTrolley, GetEntityRotation(Trolley))
--         DeleteObject(Trolley)
--         while DoesEntityExist(Trolley) do
--             Citizen.Wait(0)
--             DeleteEntity(Trolley)
--         end
--         PlaceObjectOnGroundProperly(NewTrolley)
--         SetEntityAsMissionEntity(NewTrolley, 1, 1)
--         Citizen.SetTimeout(5000, function()
--             DeleteObject(NewTrolley)
--             while DoesEntityExist(NewTrolley) do
--               Citizen.Wait(0)
--               DeleteEntity(NewTrolley)
--             end
--         end)
--     end
--     Citizen.Wait(1800)
--     if DoesEntityExist(GrabBag) then
--         DeleteEntity(GrabBag)
--     end
--     RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
--     SetModelAsNoLongerNeeded(emptyobj)
--     SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
--     TriggerServerEvent("zyloz-pacificbank:giveMoney")
--     TriggerServerEvent("zyloz-pacificbank:startCoolDown")
-- end

-- RegisterNetEvent("np-vault:grab", function()
--     local chance = math.random(120)
--     Loot()
--     if chance < 25 then
-- 		TriggerEvent("player:receiveItem",'fcadrive', 1)
-- 	end
--     TriggerEvent("player:receiveItem", "band",math.random(200,250))
--     TriggerEvent("player:receiveItem", "rollcash",math.random(150,275))
-- end)













-- ----- lower vault start lol

-- RegisterNetEvent('np-vault:startlowervault')
-- AddEventHandler('np-vault:startlowervault', function()
--     local player = GetEntityCoords(PlayerPedId())
--     local distance = #(vector3(272.08557, 231.21812, 97.683708) - player)
--     if distance < 1.5 then
--         if exports["np-duty"]:LawAmount() >= 0 then
--             if exports["np-inventory"]:hasEnoughOfItem("heistlaptop4", 1) then
--                 TriggerEvent('np-hud:show_hackerman')
--                 exports['hacking']:OpenHackingGame(10, 6, 6, function(Success2)
--                     OnLowerHackDone(Success2)
--                     DeleteObject(bag)
--                     DeleteObject(laptop)
--                     FreezeEntityPosition(ped, false)
--                 end)
--                 TriggerEvent("inventory:removeItem", "heistlaptop4", 1)
--                 TriggerEvent('evan:alert:bigbank2')
--                 Citizen.Wait(1000)
--             end 
--         end
--     end
-- end)


-- function OnLowerHackDone(success2)
--     if success2 then
--         TriggerServerEvent('np-doors:change-lock-state', 278, false) 
--         TriggerServerEvent("np-doors:change-lock-state", 279, false)
--         CreatenzylozCrates()
--     end
-- end



-- RegisterNetEvent('zyloz:createCrates')
-- AddEventHandler('zyloz:createCrates', function(toggle)
--     if toggle == true then
--      weaponbox = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 296.67828369141, 211.29058837891, 96.688102722168, true,  true, true)
--     CreateObject(weaponbox)
--     SetEntityHeading(weaponbox, 186.12)
--     FreezeEntityPosition(weaponbox, true)

--      weaponbox3 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 308.09204101563, 216.22746276855, 96.688110351563, true,  true, true)
--     CreateObject(weaponbox3)
--     SetEntityHeading(weaponbox3, 219.52)
--     FreezeEntityPosition(weaponbox3, true) 

--      weaponbox4 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 303.46594238281, 229.1854095459, 96.688110351563, true,  true, true)  -- 303.46594238281, 229.1854095459, 97.68815612793 Heading: 1.4503790140152
--     CreateObject(weaponbox4)
--     SetEntityHeading(weaponbox4, 291.02)
--     FreezeEntityPosition(weaponbox4, true)

--     weaponbox5 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 303.01165771484, 217.92240905762, 96.688087463379, true,  true, true)  -- 303.01165771484, 217.92240905762, 97.688087463379 Heading: 66.771492004395
--     CreateObject(weaponbox5)
--     SetEntityHeading(weaponbox5, 291.02)
--     FreezeEntityPosition(weaponbox5, true)


--     elseif toggle == false then
--         DeleteObject(weaponbox)
--         DeleteObject(weaponbox4)
--         DeleteObject(weaponbox3)
--         DeleteObject(weaponbox5)
--     end
-- end)

-- function CreatenzylozCrates()
--     local ped = PlayerPedId()

--     TriggerEvent('ghost:CleanClientVaultD')
--     TriggerEvent("zyloz:createCrates" ,true)

--     TriggerEvent('DoLongHudText', 'The Cops are here hurry the fuck up.. ' ,ped)
--     Citizen.Trace("Crates Spawned :  Sucess")
--     Citizen.Wait(240000) -- 4 mins 
--     TriggerEvent('DoLongHudText', 'The Cops are here hurry the fuck up..' ,ped)
--     Citizen.Wait(60000) -- 1 min warning then delete 
--     TriggerEvent("ghost:createCrates" ,false)
--     Citizen.Trace("Crates Remove :  Timer Complete Removed")
--   end


--   RegisterNetEvent('np-vault:startlowervault')
--   AddEventHandler('np-vault:startlowervault', function()
--     local player = GetEntityCoords(PlayerPedId())
--     local distance = #(vector3(279.85586, 231.04055, 97.182815) - player)
--     if distance < 1.5 then
--   exports['np-vault']:OpenVaultGame(function(success)
--     if success then
--         TriggerServerEvent("np-doors:change-lock-state", 325, false)
--       print("280")  
--     else
--         TriggerEvent('phone:addJobNotify', "YOU FUCKED UP THE HACK")
--     end
--   end, 10, 10)
-- end 
-- end)
 






-- ------------------------- VOID RP ------------------------------------------------------------------------------