Citizen.CreateThread(function()
    RequestIpl("prologue06_int_np")
    local interiorid = GetInteriorAtCoords(883.4142, -2282.372, 31.44168)
    ActivateInteriorEntitySet(interiorid, "np_prolog_clean")
    RefreshInterior(interiorid)
end)

--##############--
--## VOID RP ##--
--##############--

RegisterNetEvent('np-bobcat:firstdoor')
AddEventHandler('np-bobcat:firstdoor', function()
    local player = GetEntityCoords(PlayerPedId())
    local distance = #(vector3(882.17254638672, -2258.0190429688, 32.461284637451) - player)
    if distance < 1.5 then
        if exports["np-duty"]:LawAmount() >= 0 then
            if exports["np-inventory"]:hasEnoughOfItem("thermal_charge", 1) then
                TriggerEvent('np-hud:show_hackerman')
                TriggerEvent("client:newStress",true, 75)
                frontdoor()
                exports['np-thermite']:OpenThermiteGame(function(success)
                    if success then
                        TriggerEvent('DoLongHudText', "Success!", 1)
                        TriggerEvent('np-hud:hide_hackerman')
                        TriggerEvent("inventory:removeItem", "thermal_charge", 1)
                        TriggerServerEvent('np-doors:change-lock-state', 273, false) 
                        TriggerServerEvent("np-doors:change-lock-state", 274, false)
                        TriggerEvent('np-dispatch:bobcat_robbery')
                        Citizen.Wait(3000)
                        FreezeEntityPosition(PlayerPedId(), false)
                    else
                        TriggerEvent('np-dispatch:bobcat_robbery')
                        TriggerEvent('np-hud:hide_hackerman')
                        TriggerEvent('inventory:removeItem', 'thermal_charge', 1)
                    end
                end)
            end
        else
            TriggerEvent('DoLongHudText', 'Not Enough Cops on Duty', 2)
        end
    end
end)

-- REAL INSIDE DOOR EDIT THIS
RegisterNetEvent('np-bobcat:seconddoor')
AddEventHandler('np-bobcat:seconddoor', function()
local player = GetEntityCoords(PlayerPedId())
local distance = #(vector3(880.89782714844, -2263.880859375, 32.441692352295) - player)
if distance < 1.5 then
    if exports["np-duty"]:LawAmount() >= 0 then
            if exports["np-inventory"]:hasEnoughOfItem("Gruppe6Card2", 1, false) and exports["np-inventory"]:hasEnoughOfItem("thermal_charge", 1) then
                    insidedoor()
                    TriggerEvent('np-hud:show_hackerman')
                    TriggerEvent("client:newStress",true, 75)
                        exports['np-thermite']:OpenThermiteGame(function(success)
                            if success then
                                TriggerEvent('np-hud:hide_hackerman')
                                TriggerEvent('DoLongHudText', "Success!", 1)
                                TriggerServerEvent("createped")
                                TriggerEvent("inventory:removeItem", "Gruppe6Card2", 1)
                                TriggerEvent("inventory:removeItem", "thermal_charge", 1)
                                --Door IDS
                                TriggerServerEvent("np-doors:change-lock-state", 275, false)
                                TriggerEvent('np-dispatch:bobcat_robbery')
                                Citizen.Wait(3000)
                            else
                                Citizen.Wait(2000)
                                TriggerEvent('np-hud:hide_hackerman')
                                TriggerEvent("inventory:removeItem", "Gruppe6Card2", 1)
                                TriggerEvent("inventory:removeItem", "thermal_charge", 1)
                                TriggerEvent('np-dispatch:bobcat_robbery')
                            end
                        end)
                    end
                end
            end
        end)

function frontdoor() -- FRONT DOOR ANIMATION
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(882.1660, -2258.35, 32.461, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 882.1660, -2258.35, 32.461,  true,  true, false)

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

function insidedoor() -- FIRST DOOR INSIDE ANIMATION
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(880.4080, -2264.50, 32.441, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 880.4080, -2264.50, 32.441,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.4,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("lumo:particleserversec", method)
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

RegisterNetEvent("bobcat:success:panel", function()
    TriggerEvent('DoLongHudText', "Success!", 1)
    TriggerServerEvent("np-doors:change-lock-state", 275, false)
    TriggerServerEvent("np-doors:change-lock-state", 276, false)
    TriggerEvent('np-dispatch:bobcat_robbery')
end)

RegisterNetEvent("bobcat:fail:panel", function()
    TriggerEvent('DoLongHudText', "Failed, that nearly blew", 2)
    TriggerEvent('np-dispatch:bobcat_robbery')
end)

RegisterNetEvent("bobcat2:success:panel", function()
    TriggerEvent('DoLongHudText', "Success!", 1)
    TriggerServerEvent("np-doors:change-lock-state", 277, false)
    TriggerEvent('np-dispatch:bobcat_robbery')
end)

RegisterNetEvent("bobcat2:fail:panel", function()
    TriggerEvent('DoLongHudText', "Failed, that nearly blew", 2)
    TriggerEvent('np-dispatch:bobcat_robbery')
end)



RegisterNetEvent("lumo:effectoutside")
AddEventHandler("lumo:effectoutside", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(882.1320, -2257.34, 32.461)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    print("lumo")
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("lumo:effectinside")
AddEventHandler("lumo:effectinside", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(880.49, -2263.60, 32.441)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    print("lumo")
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent('lumo:propcreatle') -- Prop
AddEventHandler('lumo:propcreatle', function()
    TriggerEvent("lumo:propcreate")
end)

RegisterNetEvent('lumo:propcreate')
AddEventHandler('lumo:propcreate', function()
    local weaponbox = CreateObject(GetHashKey("ex_prop_crate_ammo_sc"), 888.0774, -2287.33, 31.441, true,  true, true)
    CreateObject(weaponbox)
    SetEntityHeading(weaponbox, 176.02)
    FreezeEntityPosition(weaponbox, true)

    local weaponbox3 = CreateObject(GetHashKey("ex_prop_crate_expl_bc"), 882.1840, -2286.8, 31.441, true,  true, true)
    CreateObject(weaponbox3)
    SetEntityHeading(weaponbox3, 158.02)
    FreezeEntityPosition(weaponbox3, true) 

    local weaponbox4 = CreateObject(GetHashKey("ex_prop_crate_ammo_bc"), 881.4557, -2282.61, 31.441, true,  true, true)
    CreateObject(weaponbox4)
    SetEntityHeading(weaponbox4, 52.02)
    FreezeEntityPosition(weaponbox4, true)
end)

RegisterNetEvent('lumo:bobcatcreateped')
AddEventHandler('lumo:bobcatcreateped', function()
    local hashKey = `csb_mweather`

    local pedType = 30

    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(100)
    end

    AddRelationshipGroup('lumo')
	ped = CreatePed(pedType, hashKey, 885.34136962891, -2284.6821289063, 32.560077667236, 266.85827636719, true, false)
    ped2 = CreatePed(pedType, hashKey, 883.63641357422, -2282.826171875, 32.441707611084, 262.04022216797, true, false)
    ped3 = CreatePed(pedType, hashKey, 882.48681640625, -2284.5241699219, 32.441703796387, 264.04568481445, true, false)
	

    SetPedArmour(ped, 500)
    SetPedAsEnemy(ped, true)
    SetPedRelationshipGroupHash(ped, 'lumo')
    GiveWeaponToPed(ped, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
    TaskCombatPed(ped, GetPlayerPed(-1))
    SetPedAccuracy(ped, 100)
    SetPedDropsWeaponsWhenDead(ped, false)

    SetPedArmour(ped2, 500)
    SetPedAsEnemy(ped2, true)
    SetPedRelationshipGroupHash(ped2, 'lumo')
    GiveWeaponToPed(ped2, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
    TaskCombatPed(ped2, GetPlayerPed(-1))
    SetPedAccuracy(ped2, 100)
    SetPedDropsWeaponsWhenDead(ped2, false)

    SetPedArmour(ped3, 500)
    SetPedAsEnemy(ped3, true)
    SetPedRelationshipGroupHash(ped3, 'lumo')
    GiveWeaponToPed(ped3, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
    TaskCombatPed(ped3, GetPlayerPed(-1))
    SetPedAccuracy(ped3, 100)
    SetPedDropsWeaponsWhenDead(ped3, false)
end)

RegisterNetEvent('np-bobcat:bubbles')
AddEventHandler('np-bobcat:bubbles', function()
	local interiorid = GetInteriorAtCoords(883.4142, -2282.372, 31.44168)
	ActivateInteriorEntitySet(interiorid, "np_prolog_broken")
	RemoveIpl(interiorid, "np_prolog_broken")
	DeactivateInteriorEntitySet(interiorid, "np_prolog_clean")
	RefreshInterior(interiorid)
end)
	
RegisterNetEvent("createped")
AddEventHandler("createped", function()
    local hash = GetHashKey("ig_casey")
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end
    rehineped = CreatePed("PED_TYPE_CIVFEMALE", "ig_casey", 870.46154785156,-2287.2263183594,31.537719726562, 175.21, true, false)
        SetBlockingOfNonTemporaryEvents(rehineped, true)
        SetPedDiesWhenInjured(rehineped, false)
        SetPedCanPlayAmbientAnims(rehineped, true)
        SetPedCanRagdollFromPlayerImpact(rehineped, false)
        SetEntityInvincible(rehineped, false)
        RequestAnimDict("random@arrests@busted")
    while not HasAnimDictLoaded("random@arrests@busted") do
        Citizen.Wait(0)
    end
        TaskPlayAnim(rehineped, 'random@arrests@busted', 'idle_a', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
end)

RegisterNetEvent('walk') -- PED WALK
AddEventHandler('walk', function()
	ClearPedTasks(rehineped)
    FreezeEntityPosition(rehineped, false)
	TaskGoStraightToCoord(rehineped, 869.2078, -2292.60, 32.441, 150.0, -1, 265.61, 0)
	Citizen.Wait(5000)
	TaskGoStraightToCoord(rehineped, 893.3309, -2294.90, 32.441, 150.0, -1, 350.61, 0)
	Citizen.Wait(13000)
	TriggerEvent("lumo:pedbomb")
end)

RegisterNetEvent('lumo:client:requestblast') -- PED WALK
AddEventHandler('lumo:client:requestblast', function()
	TriggerServerEvent("np-bobcat:request_door")
end)

RegisterNetEvent('lumo:pedbomb') -- PED WALK
AddEventHandler('lumo:pedbomb', function()
	TaskGoStraightToCoord(rehineped, 894.6337, -2284.97, 32.441, 150.0, -1, 82.56, 0)
	Citizen.Wait(7500)
    RequestAnimDict("weapons@projectile@grenade_str")
    while not HasAnimDictLoaded("weapons@projectile@grenade_str") do
        Citizen.Wait(0)
    end
    TaskPlayAnim(rehineped, 'weapons@projectile@grenade_str', 'throw_h_fb_backward', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
	Citizen.Wait(1000)
	AddExplosion(890.7849, -2284.88, 32.441, 32, 150000.0, true, false, 4.0)
	AddExplosion(894.0084, -2284.90, 32.580, 32, 150000.0, true, false, 4.0)
    TriggerServerEvent("np-bobcat:bubbles")
    TriggerEvent("lumo:propcreate")
    Wait(1500)
    TriggerEvent("lumo:bobcatcreateped")
end)


RegisterNetEvent('np-bobcat:search_crate_1unchecked') -- PED WALK
AddEventHandler('np-bobcat:search_crate_1unchecked', function()
    TriggerServerEvent("np-bobcat:search_crate_1")
end)

RegisterNetEvent('np-bobcat:search_crate_2unchecked') -- PED WALK
AddEventHandler('np-bobcat:search_crate_2unchecked', function()
    TriggerServerEvent("np-bobcat:search_crate_2")
end)

RegisterNetEvent('np-bobcat:search_crate_3unchecked') -- PED WALK
AddEventHandler('np-bobcat:search_crate_3unchecked', function()
    TriggerServerEvent("np-bobcat:search_crate_3")
end)

RegisterNetEvent('np-bobcat:search_crate_1') 
AddEventHandler('np-bobcat:search_crate_1', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    TriggerEvent('np-hud:show_money')
    TriggerEvent("doAnim","search")
    TriggerEvent('np-dispatch:bobcat_robbery')
    local finished = exports["np-taskbar"]:taskBar(30000,"Looting")
    if finished == 100 then
        TriggerEvent('np-heists:bobcat_loot')
        TriggerEvent('np-hud:hide_money')
        ClearPedTasks(GetPlayerPed(-1))
        FreezeEntityPosition(GetPlayerPed(-1),false)
        searched1 = true
    end
end)

RegisterNetEvent('np-bobcat:search_crate_2') 
AddEventHandler('np-bobcat:search_crate_2', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    TriggerEvent('np-hud:show_money')
    TriggerEvent("doAnim","search")
    TriggerEvent('np-dispatch:bobcat_robbery')
    local finished = exports["np-taskbar"]:taskBar(30000,"Looting")
    if finished == 100 then
        TriggerEvent('np-heists:bobcat_loot')
        TriggerEvent('np-hud:hide_money')
        ClearPedTasks(GetPlayerPed(-1))
        FreezeEntityPosition(GetPlayerPed(-1),false)
        searched2 = true
    end
end)

RegisterNetEvent('np-bobcat:search_crate_3')
AddEventHandler('np-bobcat:search_crate_3', function()
    FreezeEntityPosition(GetPlayerPed(-1),true)
    TriggerEvent('np-hud:show_money')
    TriggerEvent("doAnim","search")
    TriggerEvent('np-dispatch:bobcat_robbery')
    local finished = exports["np-taskbar"]:taskBar(30000,"Looting")
    if finished == 100 then
        TriggerEvent('np-heists:bobcat_loot')
        TriggerEvent('np-hud:hide_money')
        ClearPedTasks(GetPlayerPed(-1))
        FreezeEntityPosition(GetPlayerPed(-1),false)
        searched3 = true
    end
end)

RegisterNetEvent('np-heists:bobcat_loot')
AddEventHandler('np-heists:bobcat_loot', function()
    local EvanDidIt = math.random(1, 5)
    if EvanDidIt == 1 then
        TriggerEvent('player:receiveItem', '497969164', 1) -- M70
        TriggerEvent('player:receiveItem', '148457251', 1) -- Browning
    elseif EvanDidIt == 2 then
        TriggerEvent('player:receiveItem', '-2012211169', 1) -- Diamondback
        TriggerEvent('player:receiveItem', '-1074790547', 1) -- AK47
    elseif EvanDidIt == 3 then
        TriggerEvent('player:receiveItem', '-134995899', 1) -- Mac-10
        TriggerEvent('player:receiveItem', '-1716589765', 1) -- Deagle
    elseif EvanDidIt == 4 then
        TriggerEvent('player:receiveItem', '1649403952', 1) -- Draco
        TriggerEvent('player:receiveItem', '-1716589765', 1) -- Deagle
    elseif EvanDidIt == 5 then
        TriggerEvent('player:receiveItem', '-942620673', 1) -- UZI
    end
end)