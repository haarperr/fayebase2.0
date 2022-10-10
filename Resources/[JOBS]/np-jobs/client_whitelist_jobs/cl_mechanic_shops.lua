

--// Tuner Shop Stash

voidTunerShopDoc = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("tuner_shop_docs_stash", vector3(128.46, -3014.08, 7.04), 2.5, 2.5, {
        name="tuner_shop_docs_stash",
        heading=0,
        debugPoly=false,
        minZ=5.04,
        maxZ=9.04
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "tuner_shop_docs_stash" then
        voidTunerShopDoc = true     
        TunerShopStash()
        local isEmployed = exports["np-business"]:IsEmployedAt("tuner_shop")
        if isEmployed then
            exports['np-interface']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "tuner_shop_docs_stash" then
        voidTunerShopDoc = false
        exports['np-interface']:hideInteraction()
    end
end)

function TunerShopStash()
	Citizen.CreateThread(function()
        while voidTunerShopDoc do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["np-business"]:IsEmployedAt("tuner_shop")
                if isEmployed then
                    TriggerEvent('tuner:stash:docs')
                end
			end
		end
	end)
end

RegisterNetEvent('tuner:stash:docs')
AddEventHandler('tuner:stash:docs', function()

    local isEmployed = exports["np-business"]:IsEmployedAt("tuner_shop")
    local hasPerm = exports["np-business"]:HasPermission("tuner_shop", "stash_access")
    if isEmployed and hasPerm then
		TriggerEvent("server-inventory-open", "1", "storage-tuner-docs")
		Wait(1000)
	end
end)

--// Start Of Hayes

--// Crafting

ARPHayes_Craft = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("arp_crafting_hayes", vector3(-1408.15, -447.6, 35.91), 1, 4.0, {
        name="arp_crafting_hayes",
        heading=210,
        --debugPoly=true,
        minZ=32.71,
        maxZ=36.71
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "arp_crafting_hayes" then
        ARPHayes_Craft = true     
        local isEmployed = exports["np-business"]:IsEmployedAt("hayes_autos")
        if isEmployed then
            HayesCraft()
            exports['np-interface']:showInteraction("[E] Craft")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "arp_crafting_hayes" then
        ARPHayes_Craft = false
        exports['np-interface']:hideInteraction()
    end
end)

function HayesCraft()
	Citizen.CreateThread(function()
        while ARPHayes_Craft do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["np-business"]:IsEmployedAt("hayes_autos")
                local hasPerm = exports["np-business"]:HasPermission("hayes_autos", "craft_access")
                if isEmployed and hasPerm then
                    TriggerEvent('server-inventory-open', '27', 'Craft')
                end
			end
		end
	end)
end

--// Tuner Shop

voidTunerCraft = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_crafting_tuner_shop", vector3(144.39, -3050.88, 7.04), 4, 1.4, {
        name="void_crafting_tuner_shop",
        heading=270,
        --debugPoly=true,
        minZ=5.44,
        maxZ=9.44
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_crafting_tuner_shop" then
        voidTunerCraft = true     
        local isEmployed = exports["np-business"]:IsEmployedAt("tuner_shop")
        if isEmployed then
            TunerShopCrafting()
            exports['np-interface']:showInteraction("[E] Craft")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_crafting_tuner_shop" then
        voidTunerCraft = false
        exports['np-interface']:hideInteraction()
    end
end)

function TunerShopCrafting()
	Citizen.CreateThread(function()
        while voidTunerCraft do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["np-business"]:IsEmployedAt("tuner_shop")
                local hasPerm = exports["np-business"]:HasPermission("tuner_shop", "craft_access")
                if isEmployed and hasPerm then
                    TriggerEvent('server-inventory-open', '33', 'Craft')
                end
			end
		end
	end)
end

--// Harmony Craft

voidHarmonyCraft = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_harmony_craft", vector3(1176.22, 2635.66, 37.75), 2, 3.6, {
        name="void_harmony_craft",
        heading=0,
        --debugPoly=true,
        minZ=35.35,
        maxZ=39.35
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_harmony_craft" then
        voidHarmonyCraft = true     
        local isEmployed = exports["np-business"]:IsEmployedAt("harmony_autos")
        local hasPerm = exports["np-business"]:HasPermission("harmony_autos", "craft_access")
        if isEmployed and hasPerm then
            HarmonyShopCrafting()
            exports['np-interface']:showInteraction("[E] Craft")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_harmony_craft" then
        voidHarmonyCraft = false
        exports['np-interface']:hideInteraction()
    end
end)

function HarmonyShopCrafting()
	Citizen.CreateThread(function()
        while voidHarmonyCraft do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["np-business"]:IsEmployedAt("harmony_autos")
                local hasPerm = exports["np-business"]:HasPermission("harmony_autos", "craft_access")
                if isEmployed and hasPerm then
                    TriggerEvent('server-inventory-open', '27', 'Craft')
                end
			end
		end
	end)
end

--// Harmony Stash

voidHarmony = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("harmony_mec_stash", vector3(1186.97, 2637.56, 38.44), 2, 2.0, {
        name="harmony_mec_stash",
        heading=0,
        --debugPoly=true,
        minZ=35.84,
        maxZ=39.84
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "harmony_mec_stash" then
        voidHarmony = true     
        local isEmployed = exports["np-business"]:IsEmployedAt("harmony_autos")
        local hasPerm = exports["np-business"]:HasPermission("harmony_autos", "stash_access")
        if isEmployed and hasPerm then
            HarmonyStash()
            exports['np-interface']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "harmony_mec_stash" then
        voidHarmony = false
        exports['np-interface']:hideInteraction()
    end
end)

function HarmonyStash()
	Citizen.CreateThread(function()
        while voidHarmony do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                local isEmployed = exports["np-business"]:IsEmployedAt("harmony_autos")
                local hasPerm = exports["np-business"]:HasPermission("harmony_autos", "stash_access")
                if isEmployed and hasPerm then
                    TriggerEvent("server-inventory-open", "1", "storage-harmony")
                end
			end
		end
	end)
end


-- // Racing Place Shit

voidRacingPartyTingInnit = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("racing_shit_like_southside_innit", vector3(1001.21, -2553.71, 32.87), 1, 4, {
        name="racing_shit_like_southside_innit",
        heading=355,
        --debugPoly=true,
        minZ=29.87,
        maxZ=33.87
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "racing_shit_like_southside_innit" then
        voidRacingPartyTingInnit = true     
        RacingLocationWarehouseStash()
            local rank = exports["isPed"]:GroupRank("illegal_shop")
            if rank > 3 then 
            exports['np-interface']:showInteraction("[E] Stash")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "racing_shit_like_southside_innit" then
        voidRacingPartyTingInnit = false
        exports['np-interface']:hideInteraction()
    end
end)

function RacingLocationWarehouseStash()
	Citizen.CreateThread(function()
        while voidRacingPartyTingInnit do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                    local rank = exports["isPed"]:GroupRank("illegal_shop")
                    if rank > 3 then 
                    TriggerEvent("server-inventory-open", "1", "storage-racing-shit")
                end
			end
		end
	end)
end

--// Craft

voidCraftingRacePlace = false

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("void_racing_warehouse_craft", vector3(1046.79, -2531.53, 28.29), 1.5, 4, {
        name="void_racing_warehouse_craft",
        heading=265,
        --debugPoly=true,
        minZ=25.29,
        maxZ=29.29
    })
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "void_racing_warehouse_craft" then
        voidCraftingRacePlace = true     
            local rank = exports["isPed"]:GroupRank("illegal_shop")
            if rank > 3 then 
            print(rank)
            RacingPlaceCraft()
            exports['np-interface']:showInteraction("[E] Craft")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "void_racing_warehouse_craft" then
        voidCraftingRacePlace = false
        exports['np-interface']:hideInteraction()
    end
end)

function RacingPlaceCraft()
	Citizen.CreateThread(function()
        while voidCraftingRacePlace do
            Citizen.Wait(5)
			if IsControlJustReleased(0, 38) then
                    local rank = exports["isPed"]:GroupRank("illegal_shop")
                    if rank > 3 then 
                    TriggerEvent('server-inventory-open', '60', 'Craft')
                end
			end
		end
	end)
end