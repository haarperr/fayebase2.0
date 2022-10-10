VoidDOC = false
VoidUnderGround = false
VoidBennysShit = false
VoidBennysShit2 = false
voidHarmonyShit = false
voidHarmonyShit2 = false
voidDriftSchool = false


Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("bennyslocation", vector3(-39.5, -1054.39, 28.4), 6, 4, {
        name="bennyslocation",
        heading=340,
        -- debugPoly=true,
        minZ=27.0,
        maxZ=31.0
    }) 
      
    exports["np-polyzone"]:AddBoxZone("benny4", vector3(450.16, -975.93, 25.7), 10, 5, {
        name="benny4",
        heading=270,
        --debugPoly=true,
        minZ=24.7,
        maxZ=28.7
    })
      

    exports["np-polyzone"]:AddBoxZone("benny7", vector3(921.81, -984.47, 38.89), 10, 5, {
        name="benny7",
        heading=270,
        --debugPoly=true,
        minZ=38.70,
        maxZ=41.23
    })
      
    exports["np-polyzone"]:AddBoxZone("pillbox_bennys", vector3(340.29, -570.79, 28.8), 4, 8.8, {
        name="pillbox_bennys",
        heading=250,
        --debugPoly=true,
        minZ=27.8,
        maxZ=31.8
    })

      -- Drift Bennys

      exports["np-polyzone"]:AddBoxZone("void_drift_bennys_repair", vector3(-167.33, -2460.88, 6.32), 5, 7, {
        name="void_drift_bennys_repair",
        heading=45,
        --debugPoly=true,
        minZ=5.12,
        maxZ=9.12
    })

    -- DOC Bennys

    exports["np-polyzone"]:AddBoxZone("void_doc_bennys", vector3(1832.73, 2549.64, 45.89), 5, 9.8, {
        name="void_doc_bennys",
        heading=0,
        --debugPoly=true,
        minZ=44.49,
        maxZ=48.49
    })

    -- Bennys Mech Shop Bennys 1

    exports["np-polyzone"]:AddBoxZone("hayes_bay_1", vector3(-231.99, -1334.95, 30.89), 4, 6.4, {
        name="hayes_bay_1",
        heading=270,
        --debugPoly=true,
        minZ=28.09,
        maxZ=32.09
    })

    -- Bennys Mech Shop Bennys 2

    exports["np-polyzone"]:AddBoxZone("southside_bennys_2", vector3(-1423.61, -449.95, 35.93), 4, 6.4, {
        name="southside_bennys_2",
        heading=300,
        --debugPoly=true,
        minZ=33.33,
        maxZ=37.33
    })

    -- Harmony Bennys 1

    exports["np-polyzone"]:AddBoxZone("harmony_bennys_shit_show_ui", vector3(1174.77, 2640.18, 37.75), 4, 6.8, {
        name="harmony_bennys_shit_show_ui",
        heading=270,
        --debugPoly=true,
        minZ=34.75,
        maxZ=38.75
    })

    -- Harmony Bennys 2

    exports["np-polyzone"]:AddBoxZone("harmony_bennys_shit_show_ui2", vector3(1182.38, 2639.75, 37.75), 4, 6.8, {
        name="harmony_bennys_shit_show_ui2",
        heading=270,
        --debugPoly=true,
        minZ=35.75,
        maxZ=39.75
    })
end)

AddEventHandler('np-polyzone:enter', function(name)
    if name == "bennyslocation" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        exports['np-interface']:showInteraction("Bennys")
    elseif name == "benny4" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        exports['np-interface']:showInteraction("Bennys")
    elseif name == "benny7" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        local isEmployed = exports["np-business"]:IsEmployedAt("tuner_shop")
        if isEmployed then
            exports['np-interface']:showInteraction("Bennys")
        end
    elseif name == "pillbox_bennys" and IsPedInAnyVehicle(PlayerPedId()) and not isPlyInBennys then
        if exports["isPed"]:isPed("myJob") == 'ems' then
            exports['np-interface']:showInteraction("Bennys")
        end
    elseif name == "void_doc_bennys" and IsPedInAnyVehicle(PlayerPedId(), false) then
        VoidDOC = true     
        if exports["isPed"]:isPed("myJob") == 'doc' then
            exports['np-interface']:showInteraction("Bennys")
        end
    elseif name == "hayes_bay_1" and IsPedInAnyVehicle(PlayerPedId(), false) then
        VoidBennysShit = true     
        local isEmployed = exports["np-business"]:IsEmployedAt("hayes_autos")
        if isEmployed then
            exports['np-interface']:showInteraction("Bennys")
        end
    elseif name == "southside_bennys_2" and IsPedInAnyVehicle(PlayerPedId(), false) then
        VoidBennysShit2 = true     
        local isEmployed = exports["np-business"]:IsEmployedAt("bennys")
        if isEmployed then
            exports['np-interface']:showInteraction("Bennys")
        end
    elseif name == "harmony_bennys_shit_show_ui" and IsPedInAnyVehicle(PlayerPedId()) then
        voidHarmonyShit = true     
        local isEmployed = exports["np-business"]:IsEmployedAt("harmony_repairs")
        if isEmployed then
            exports['np-interface']:showInteraction("Bennys")
        end
    elseif name == "harmony_bennys_shit_show_ui2" and IsPedInAnyVehicle(PlayerPedId()) then
        voidHarmonyShit2 = true     
        local isEmployed = exports["np-business"]:IsEmployedAt("harmony_repairs")
        if isEmployed then
            exports['np-interface']:showInteraction("Bennys")
        end
    elseif name == "void_drift_bennys_repair" and IsPedInAnyVehicle(PlayerPedId()) then
        voidDriftSchool = true     
        local isEmployed = exports["np-business"]:IsEmployedAt("drift_school")
        if isEmployed then
            exports['np-interface']:showInteraction("Bennys")
        end
    end
end)

AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_doc_bennys" and IsPedInAnyVehicle(PlayerPedId(), false) then
        VoidDOC = false
        exports['np-interface']:hideInteraction()
    elseif name == "hayes_bay_1" and IsPedInAnyVehicle(PlayerPedId(), false) then
        VoidBennysShit = false
        exports['np-interface']:hideInteraction()
    elseif name == "southside_bennys_2" and IsPedInAnyVehicle(PlayerPedId(), false) then
        VoidBennysShit2 = false
        exports['np-interface']:hideInteraction()
    elseif name == "harmony_bennys_shit_show_ui" then
        voidHarmonyShit = false
        exports['np-interface']:hideInteraction()
    elseif name == "harmony_bennys_shit_show_ui2" then
        voidHarmonyShit2 = false
        exports['np-interface']:hideInteraction()
    elseif name == "void_drift_bennys_repair" then
        voidDriftSchool = false
        exports['np-interface']:hideInteraction()
    end
end)

RegisterNetEvent("np-driftschool:repair_vehicle")
AddEventHandler('np-driftschool:repair_vehicle', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("drift_school")
    if isEmployed then
        local car = GetVehiclePedIsIn(PlayerPedId(), false)
        if car ~= 0 then
            FreezeEntityPosition(car, true)
            SetEntityCoords(car, -167.4725189209,-2460.7648925781,5.9091796875)
            SetEntityHeading(GetPlayerPed(-1), 133.22833251953)
            local finished = exports["np-taskbar"]:taskBar(4000,"Repairing Engine",false,false,playerVeh)
            Citizen.Wait(1000)
            local finished = exports["np-taskbar"]:taskBar(3000,"Repairing Body",false,false,playerVeh)
            if (finished == 100) then
                TriggerEvent("DoShortHudText", "Repair Complete")
                SetVehicleFixed(car)
                SetVehicleDirtLevel(car, 0)
                SetVehicleDeformationFixed(car)
                SetVehicleUndriveable(car, false)
                FreezeEntityPosition(car, false)
            else
                FreezeEntityPosition(car, false)
                SetVehicleUndriveable(car, false)
            end
        end
    end
end)