local hackAnimDict = "anim@heists@ornate_bank@hack"

local function loadDicts()
    RequestAnimDict(hackAnimDict)
    RequestModel("hei_prop_hst_laptop")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestModel("hei_prop_heist_card_hack_02")
    while not HasAnimDictLoaded(hackAnimDict)
        or not HasModelLoaded("hei_prop_hst_laptop")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
        or not HasModelLoaded("hei_prop_heist_card_hack_02") do
        Wait(0)
    end
end

function UseBankPanel(panelCoords, panelHeading)
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply)
    local p = promise:new()
    TriggerEvent('np-hud:show_hackerman')
    TriggerEvent("client:newStress",true, 150)
    ClearPedTasksImmediately(ply)
    Wait(0)
    ClearPedTasksImmediately(ply)
    Wait(0)
    SetEntityHeading(ply, panelHeading)
    Wait(0)
    TaskPlayAnimAdvanced(ply, hackAnimDict, "hack_enter", panelCoords, 0, 0, 0, 1.0, 0.0, 8300, 0, 0.3, false, false, false)
    Wait(0)
    SetEntityHeading(ply, panelHeading)
    while IsEntityPlayingAnim(ply, hackAnimDict, "hack_enter", 3) do
        Wait(0)
    end
    local laptop = CreateObject(`hei_prop_hst_laptop`, GetOffsetFromEntityInWorldCoords(ply, 0.2, 0.6, 0.0), 1, 1, 0)
    Wait(0)
    SetEntityRotation(laptop, GetEntityRotation(ply, 2), 2, true)
    PlaceObjectOnGroundProperly(laptop)
    Wait(0)
    TaskPlayAnim(ply, hackAnimDict, "hack_loop", 1.0, 0.0, -1, 1, 0, false, false, false)
    Wait(1000)
    TriggerServerEvent("np-fleeca:startCoolDown")
    Citizen.CreateThread(function()
        exports['np-hacking']:OpenHackingGame(function(minigameResult)
            p:resolve(minigameResult)
            minigameResult = nil
            DeleteObject(laptop)
            ClearPedTasksImmediately(ply)
            TriggerEvent('inventory:removeItem', 'heistlaptop3', 1)
            TriggerEvent('np-hud:hide_hackerman')
        end)
    end)
    return p
end

function SpawnTrolley(coords, type, heading)
    Citizen.CreateThread(function()
        local trolleys = { `hei_prop_hei_cash_trolly_01` }
        for _, hash in pairs(trolleys) do
            local clean = true
            RequestModel(hash)
            while not HasModelLoaded(hash) do
                Citizen.Wait(0)
            end
            while clean do
                local trolleyAlreadyExists = GetClosestObjectOfType(coords, 1.0, hash, 0, 0, 0)
                if trolleyAlreadyExists == 0 then
                    clean = false
                else
                    SetEntityAsMissionEntity(trolleyAlreadyExists, 1, 1)
                    Citizen.Wait(0)
                    DeleteEntity(trolleyAlreadyExists)
                end
            end
        end
        Citizen.Wait(0)
        local spawnHash = `hei_prop_hei_cash_trolly_01`
        RequestModel(spawnHash)
        while not HasModelLoaded(spawnHash) do
            Citizen.Wait(0)
        end
        local trolley = CreateObject(spawnHash, coords, true, false, false)
        Citizen.Wait(0)
        SetEntityHeading(trolley, heading)
        PlaceObjectOnGroundProperly(trolley)
    end)
end

function ResetDoor(bankId)
    Bank = Config["Banks"][bankId]
    door = GetClosestObjectOfType(Bank['Door']['X'], Bank['Door']['Y'], Bank['Door']['Z'], 3.0, Bank['Door']['Model'])
    SetEntityRotation(door, 0.0, 0.0, Bank["Door"]["HStart"], 0.0)
end

function OpenDoor(bankId)
    ResetDoor(bankId)
    Bank = Config["Banks"][bankId]
    door = GetClosestObjectOfType(Bank['Door']['X'], Bank['Door']['Y'], Bank['Door']['Z'], 3.0, Bank['Door']['Model'])
    rotation = GetEntityRotation(door)["z"]
	Citizen.CreateThread(function()
		FreezeEntityPosition(door, false)
        while rotation >= Bank["Door"]["HEnd"] do
            Citizen.Wait(1)
            rotation = rotation - 0.25
            SetEntityRotation(door, 0.0, 0.0, rotation)
        end
		FreezeEntityPosition(door, true)
    end)
end

local function usePanel(id, loc, heading, trolelyloc, trolelyheading)
    Citizen.CreateThread(function()
        TriggerEvent('np-dispatch:bankrobbery')
        local ply = PlayerPedId()
        local plyCoords = GetEntityCoords(ply)
        loadDicts()
        local success = Citizen.Await(UseBankPanel(loc, heading))
        if not success then
            return
        end
        TriggerEvent('phone:addJobNotify', "The Door Will Open Soon! Sit tight and wait for the police.")
        Citizen.Wait(300000)
        OpenDoor(id)
        TriggerEvent('phone:addJobNotify', "The Door Is OPEN grab the cash and GTFO")
        SpawnTrolley(trolelyloc, "cash", trolelyheading)
    end)
end

function ResetDoors()
    for id, bank in pairs(Config["Banks"]) do
        door = GetClosestObjectOfType(bank['Door']['X'], bank['Door']['Y'], bank['Door']['Z'], 3.0, bank['Door']['Model'])
        SetEntityRotation(door, 0.0, 0.0, bank["Door"]["HStart"], 0.0)
        FreezeEntityPosition(door, true)
    end
end

RegisterNetEvent("np-fleeca:resetdoors", function()
    ResetDoors()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    ResetDoors()
end)

RegisterCommand('testbro', function()
    TriggerEvent('np-duty:PoliceMenu')
end)

function Loot()
    Grab2clear = false
    Grab3clear = false
    Trolley = nil
    local ped = PlayerPedId()
    local model = "hei_prop_heist_cash_pile"
    Trolley = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 1.0, `hei_prop_hei_cash_trolly_01`, false, false, false)
    local CashAppear = function()
        TriggerEvent('np-hud:show_money')
        local pedCoords = GetEntityCoords(ped)
        local grabmodel = GetHashKey(model)
        RequestModel(grabmodel)
        while not HasModelLoaded(grabmodel) do
            Citizen.Wait(0)
        end
        local grabobj = CreateObject(grabmodel, pedCoords, true)
        FreezeEntityPosition(grabobj, true)
        SetEntityInvincible(grabobj, true)
        SetEntityNoCollisionEntity(grabobj, ped)
        SetEntityVisible(grabobj, false, false)
        AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
        local startedGrabbing = GetGameTimer()
        Citizen.CreateThread(function()
            while GetGameTimer() - startedGrabbing < 37000 do
                Citizen.Wait(0)
                DisableControlAction(0, 73, true)
                if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
                    if not IsEntityVisible(grabobj) then
                        SetEntityVisible(grabobj, true, false)
                    end
                end
                if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
                    if IsEntityVisible(grabobj) then
                        SetEntityVisible(grabobj, false, false)
                    end
                end
            end
            DeleteObject(grabobj)
        end)
    end
    local emptyobj = `ch_prop_gold_trolly_01c_empty`
    if IsEntityPlayingAnim(Trolley, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
        return
    end
    local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
    RequestAnimDict("anim@heists@ornate_bank@grab_cash")
    RequestModel(baghash)
    RequestModel(emptyobj)
    while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
        Citizen.Wait(0)
    end
    while not NetworkHasControlOfEntity(Trolley) do
        Citizen.Wait(0)
        NetworkRequestControlOfEntity(Trolley)
    end
    GrabBag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
    Grab1 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, Grab1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(GrabBag, Grab1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(Grab1)
    Citizen.Wait(1500)
    CashAppear()
    if not Grab2clear then
        Grab2 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, Grab2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(GrabBag, Grab2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(Trolley, Grab2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
        NetworkStartSynchronisedScene(Grab2)
        Citizen.Wait(37000)
    end
    if not Grab3clear then
        Grab3 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, Grab3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(GrabBag, Grab3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
        NetworkStartSynchronisedScene(Grab3)
        NewTrolley = CreateObject(emptyobj, GetEntityCoords(Trolley) + vector3(0.0, 0.0, - 0.985), true, false, false)
        SetEntityRotation(NewTrolley, GetEntityRotation(Trolley))
        DeleteObject(Trolley)
        while DoesEntityExist(Trolley) do
            Citizen.Wait(0)
            DeleteEntity(Trolley)
        end
        PlaceObjectOnGroundProperly(NewTrolley)
        SetEntityAsMissionEntity(NewTrolley, 1, 1)
        Citizen.SetTimeout(5000, function()
            DeleteObject(NewTrolley)
            while DoesEntityExist(NewTrolley) do
              Citizen.Wait(0)
              DeleteEntity(NewTrolley)
            end
        end)
    end
    Citizen.Wait(1800)
    if DoesEntityExist(GrabBag) then
        DeleteEntity(GrabBag)
    end
    RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
    SetModelAsNoLongerNeeded(emptyobj)
    SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
    DeleteEntity(trolleys)
    TriggerServerEvent("np-fleeca:giveMoney")
    TriggerEvent('np-hud:hide_money')
end

RegisterNetEvent("np-fleeca:grab")
AddEventHandler("np-fleeca:grab", function()
    print('called 1?')
    local chance = math.random(120)
    Loot()
    if chance < 25 then
		TriggerEvent("player:receiveItem",'phonedongle', 1)
        TriggerEvent('np-mining:get_gem')
	end
    TriggerEvent("player:receiveItem", "inkset",math.random(200,277))
    TriggerEvent("player:receiveItem", "inkedmoneybag",math.random(1,3))
end)

RegisterNetEvent('np-loot_fleeca')
AddEventHandler('np-loot_fleeca', function()
    print('called 2?')
    TriggerServerEvent('np-fleeca:tut_tut')
end)

RegisterNetEvent("np-fleeca:laptopused", function(id)
    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config["Banks"][id]["PanelCorrds"], true) <= 3.5 then
        usePanel(id, Config["Banks"][id]["PanelCorrds"], Config["Banks"][id]["PanelCorrdsHeading"], Config["Banks"][id]["TrolleyCoords"], Config["Banks"][id]["TrolleyCoords2"], Config["Banks"][id]["TrolleyHeading"])
    else
        TriggerEvent("DoLongHudText", "Hooking up Laptop!", 2)
    end
end)

AddEventHandler("np-inventory:itemUsed", function(item, info)
    if item == "heistlaptop3" then 
        TriggerServerEvent("np-fleeca:laptop1")
    end
end)

-- Config

Config = {}

Config["Money"] = 15000

Config["Banks"] = {
    [1] = {
        ["PanelCorrds"] = vector3(-2956.59, 482.05, 15.815),
        ["PanelCorrdsHeading"] = 357.23,
        ["TrolleyCoords"] = vector3(-2952.69, 483.34, 15.815),
        ["TrolleyHeading"] = 85,
        ["Door"] = {
            ["Model"] = -63539571,
            ["X"] = -2958.539,
            ["Y"] = 482.2706,
            ["Z"] = 15.835,
            ["HStart"] = 0.0,
            ["HEnd"] = -79.5
        }
    },
    [2] = {
        ["PanelCorrds"] = vector3(147.22, -1046.148, 29.487),
        ["PanelCorrdsHeading"] = 250.64,
        ["TrolleyCoords"] = vector3(147.25, -1050.38, 28.35),
        ["TrolleyHeading"] = -15,
        ["Door"] = {
            ["Model"] = 2121050683,
            ["X"] = 148.025,
            ["Y"] = -1044.364,
            ["Z"] = 29.50693,
            ["HStart"] = 249.846,
            ["HEnd"] = -183.599
        }
    },
    [3] = {
        ["PanelCorrds"] = vector3(311.19, -284.46, 54.16),
        ["PanelCorrdsHeading"] = 245.64,
        ["TrolleyCoords"] = vector3(311.82, -288.16, 54.14),
        ["TrolleyHeading"] = -15,
        ["Door"] = {
            ["Model"] = 2121050683,
            ["X"] = 311.76,
            ["Y"] = -283.31,
            ["Z"] = 54.16,
            ["HStart"] = 249.846,
            ["HEnd"] = -183.599
        }
    },
    [4] = {
        ["PanelCorrds"] = vector3(-353.50, -55.37, 49.157),
        ["PanelCorrdsHeading"] = 250.64,
        ["TrolleyCoords"] = vector3(-353.34, -59.48, 48.01),
        ["TrolleyHeading"] = -15,
        ["Door"] = {
            ["Model"] = 2121050683,
            ["X"] = -352.725,
            ["Y"] = -53.564,
            ["Z"] = 49.50693,
            ["HStart"] = 249.846,
            ["HEnd"] = -183.599
        }
    },
    [5] = {
        ["PanelCorrds"] = vector3(1176.04, 2712.81, 38.08), 
        ["PanelCorrdsHeading"] = 180.01,
        ["TrolleyCoords"] = vector3(-353.34, -59.48, 48.01),  
        ["TrolleyHeading"] = -15,
        ["Door"] = {
            ["Model"] = 2121050683,
            ["X"] = 1175.91,
            ["Y"] = 2711.70,
            ["Z"] = 38.08,
            ["HStart"] = 90.846,
            ["HEnd"] = -183.599
        }
    }
}

RegisterNetEvent('np-heists:fleeca_available')
AddEventHandler('np-heists:fleeca_available', function()
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
            header = "Fleeca Bank",
            txt = "Available",
        },
    })
end)

RegisterNetEvent('np-heists:fleeca_unavailable')
AddEventHandler('np-heists:fleeca_unavailable', function()
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
            header = "Fleeca Bank",
            txt = "Unavailable",
        },
    })
end)