local RobbedFirstDoor = false

-- First Door

RegisterNetEvent('np-heists:start_paleto')
AddEventHandler('np-heists:start_paleto', function()
    local PlayerCoord = GetEntityCoords(PlayerPedId())
    local DoorDist = #(vector3(-105.5392, 6472.0039, 31.626703) - PlayerCoord)
    if DoorDist < 1.5 then
        if exports['np-duty']:LawAmount() >= 4 then
            TaskGoToCoordAnyMeans(PlayerPedId(), -105.4272, 6471.7207, 31.626733, 2.0,0,786603,0)
            SetEntityHeading(PlayerPedId(), 58.739597)
            Citizen.Wait(3000)
            FreezeEntityPosition(PlayerPedId(), true)
            TriggerEvent('animation:PlayAnimation', 'kneel')
            TriggerEvent('np-dispatch:bankrobbery')
            TriggerEvent('inventory:removeItem', 'heistlaptop2', 1)
            exports['np-hacking']:OpenHackingGame(function(pEvanIsGood)
                ClearPedTasksImmediately(ply)
                if pEvanIsGood then
                    TriggerEvent("client:newStress",true, 70)
                    TriggerEvent('animation:cancel')
                    FreezeEntityPosition(PlayerPedId(), false)
                    TriggerEvent('phone:addJobNotify', 'Wait 5 Minutes.')
                    Citizen.Wait(300000)
                    RobbedFirstDoor = true
                    TriggerServerEvent('np-heists:shibiz_paleto')
                    TriggerEvent('phone:addJobNotify', 'Paleto Bank Door Open.')
                    TriggerServerEvent("np-doors:change-lock-state", 583, false)
                else
                    TriggerEvent("client:newStress",true, 70)
                    TriggerEvent('animation:cancel')
                    FreezeEntityPosition(PlayerPedId(), false)
                end
            end)
        else
            TriggerEvent('DoLongHudText', 'Not enough cops on duty', 2)
        end
    end
end)

RegisterNetEvent('np-heists:paleto_laptop')
AddEventHandler('np-heists:paleto_laptop', function()
    TriggerServerEvent('np-heists:paleto_sv_code')
end)

RegisterNetEvent('np-heists:cooldown_doors')
AddEventHandler('np-heists:cooldown_doors', function()
    TriggerServerEvent("np-doors:change-lock-state", 583, true)
    TriggerServerEvent("np-doors:change-lock-state", 517, true)
    RobbedFirstDoor = false
end)

-- 2nd Door

RegisterNetEvent('np-heists:2nd_door_thermite')
AddEventHandler('np-heists:2nd_door_thermite', function()
    local PlayerCoord = GetEntityCoords(PlayerPedId())
    local DoorDist = #(vector3(-105.5768, 6475.1308, 31.626695) - PlayerCoord)
    if DoorDist < 1.5 then
        if exports['np-duty']:LawAmount() >= 4 then
            if RobbedFirstDoor then
                InsideAnim()
                TriggerEvent('np-dispatch:bankrobbery')
                exports['np-thermite']:OpenThermiteGame(function(success)
                    if success then
                        TriggerServerEvent('np-heists:evan_bozo_check')
                        TriggerServerEvent("np-doors:change-lock-state", 517, false)
                        TriggerEvent('inventory:removeItem', 'thermal_charge', 1)
                    else
                        TriggerEvent('DoLongHudText', 'Failure', 2)
                        TriggerEvent('inventory:removeItem', 'thermal_charge', 1)
                    end
                end)
            else
                TriggerEvent('DoLongHudText', 'Doesnt quite work like this.', 2)
            end
        end
    end
end)

function InsideAnim() -- FRONT DOOR ANIMATION
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 316.55865)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(-105.5768, 6475.1308, 31.626695, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), -105.5768, 6475.1308, 31.626695,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("lumo:particleserver", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
end

-- Avail

RegisterNetEvent('np-heists:paleto_avail')
AddEventHandler('np-heists:paleto_avail', function()
    TriggerEvent('np-context:sendMenu', {
        {
            id = 1,
            header = "< Go Back",
            txt = "",
            params = {
                event = "np-illegalactivities:check_availability",
            }
        },
        {
            id = 2,
            header = "Paleto Bank",
            txt = "Available",
        },
    })
end)

RegisterNetEvent('np-heists:paleto_unavailable')
AddEventHandler('np-heists:paleto_unavailable', function()
    TriggerEvent('np-context:sendMenu', {
        {
            id = 1,
            header = "< Go Back",
            txt = "",
            params = {
                event = "np-illegalactivities:check_availability",
            }
        },
        {
            id = 2,
            header = "Paleto Bank",
            txt = "Unavailable",
        },
    })
end)

-- Loot 1 --

RegisterNetEvent('np-heists:case_paleto_1')
AddEventHandler('np-heists:case_paleto_1', function()
    TriggerServerEvent('np-heists:loot_evan_case_1')
end)

RegisterNetEvent('np-heists:paleto_loot_1_evan')
AddEventHandler('np-heists:paleto_loot_1_evan', function()
    TriggerEvent('animation:PlayAnimation', 'welding')
    FreezeEntityPosition(PlayerPedId(), true)
    local finished = exports['np-taskbar']:taskBar(20000, 'Drilling Into Box')
    if finished == 100 then
        TriggerServerEvent('np-heists:paleto_lootTable')
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)

exports["np-polytarget"]:AddBoxZone("void_paleto_hit_first_case",  vector3(-102.56, 6475.23, 31.63), 3, 0.9, {
    heading=315,
    --debugPoly=true,
    minZ=29.23,
    maxZ=33.23
})

exports["np-interact"]:AddPeekEntryByPolyTarget("void_paleto_hit_first_case", {
    {
        event = "np-heists:case_paleto_1",
        id = "void_paleto_hit_first_case",
        icon = "circle",
        label = "Loot.",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

-- Loot 2 --

RegisterNetEvent('np-heists:case_paleto_2')
AddEventHandler('np-heists:case_paleto_2', function()
    TriggerServerEvent('np-heists:loot_evan_case_2')
end)

RegisterNetEvent('np-heists:paleto_loot_2_evan')
AddEventHandler('np-heists:paleto_loot_2_evan', function()
    TriggerEvent('animation:PlayAnimation', 'welding')
    FreezeEntityPosition(PlayerPedId(), true)
    local finished = exports['np-taskbar']:taskBar(20000, 'Drilling Into Box')
    if finished == 100 then
        TriggerServerEvent('np-heists:paleto_lootTable')
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)

exports["np-polytarget"]:AddBoxZone("void_paleto_hit_second_case",  vector3(-102.9, 6478.31, 31.63), 6, 0.5, {
    heading=45,
    --debugPoly=true,
    minZ=28.83,
    maxZ=32.83
})

exports["np-interact"]:AddPeekEntryByPolyTarget("void_paleto_hit_second_case", {
    {
        event = "np-heists:case_paleto_2",
        id = "void_paleto_hit_second_case",
        icon = "circle",
        label = "Loot.",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});

-- Loot 3 --

RegisterNetEvent('np-heists:case_paleto_3')
AddEventHandler('np-heists:case_paleto_3', function()
    TriggerServerEvent('np-heists:loot_evan_case_3')
end)

RegisterNetEvent('np-heists:paleto_loot_3_evan')
AddEventHandler('np-heists:paleto_loot_3_evan', function()
    TriggerEvent('animation:PlayAnimation', 'welding')
    FreezeEntityPosition(PlayerPedId(), true)
    local finished = exports['np-taskbar']:taskBar(20000, 'Drilling Into Box')
    if finished == 100 then
        TriggerServerEvent('np-heists:paleto_lootTable')
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)

exports["np-polytarget"]:AddBoxZone("void_paleto_hit_third_case",  vector3(-106.2, 6478.86, 31.63), 3, 0.5, {
    heading=315,
    --debugPoly=true,
    minZ=29.03,
    maxZ=33.03
})

exports["np-interact"]:AddPeekEntryByPolyTarget("void_paleto_hit_third_case", {
    {
        event = "np-heists:case_paleto_3",
        id = "void_paleto_hit_third_case",
        icon = "circle",
        label = "Loot.",
        parameters = {},
    }
}, {
    distance = { radius = 2.5 },
});