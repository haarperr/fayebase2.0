local playerPed, playerCoords = PlayerPedId(), vec3(0, 0, 0)
local disableNotis, disableNotifSounds = false, false

local colors = {
    [1] = "Metallic Graphite Black",
    [2] = "Metallic Black Steel",
    [3] = "Metallic Dark Silver",
    [4] = "Metallic Silver",
    [5] = "Metallic Blue Silver",
    [6] = "Metallic Steel Gray",
    [7] = "Metallic Shadow Silver",
    [8] = "Metallic Stone Silver",
    [9] = "Metallic Midnight Silver",
    [10] = "Metallic Gun Metal",
    [11] = "Metallic Anthracite Grey",
    [12] = "Matte Black",
    [13] = "Matte Gray",
    [14] = "Matte Light Grey",
    [15] = "Util Black",
    [16] = "Util Black Poly",
    [17] = "Util Dark Silver",
    [18] = "Util Silver",
    [19] = "Util Gun Metal",
    [20] = "Util Shadow Silver",
    [21] = "Worn Black",
    [22] = "Worn Graphite",
    [23] = "Worn Silver Grey",
    [24] = "Worn Silver",
    [25] = "Worn Blue Silver",
    [26] = "Worn Shadow Silver",
    [27] = "Metallic Red",
    [28] = "Metallic Torino Red",
    [29] = "Metallic Formula Red",
    [30] = "Metallic Blaze Red",
    [31] = "Metallic Graceful Red",
    [32] = "Metallic Garnet Red",
    [33] = "Metallic Desert Red",
    [34] = "Metallic Cabernet Red",
    [35] = "Metallic Candy Red",
    [36] = "Metallic Sunrise Orange",
    [37] = "Metallic Classic Gold",
    [38] = "Metallic Orange",
    [39] = "Matte Red",
    [40] = "Matte Dark Red",
    [41] = "Matte Orange",
    [42] = "Matte Yellow",
    [43] = "Util Red",
    [44] = "Util Bright Red",
    [45] = "Util Garnet Red",
    [46] = "Worn Red",
    [47] = "Worn Golden Red",
    [48] = "Worn Dark Red",
    [49] = "Metallic Dark Green",
    [50] = "Metallic Racing Green",
    [51] = "Metallic Sea Green",
    [52] = "Metallic Olive Green",
    [53] = "Metallic Green",
    [54] = "Metallic Gasoline Blue Green",
    [55] = "Matte Lime Green",
    [56] = "Util Dark Green",
    [57] = "Util Green",
    [58] = "Worn Dark Green",
    [59] = "Worn Green",
    [60] = "Worn Sea Wash",
    [61] = "Metallic Midnight Blue",
    [62] = "Metallic Dark Blue",
    [63] = "Metallic Saxony Blue",
    [64] = "Metallic Blue",
    [65] = "Metallic Mariner Blue",
    [66] = "Metallic Harbor Blue",
    [67] = "Metallic Diamond Blue",
    [68] = "Metallic Surf Blue",
    [69] = "Metallic Nautical Blue",
    [70] = "Metallic Bright Blue",
    [71] = "Metallic Purple Blue",
    [72] = "Metallic Spinnaker Blue",
    [73] = "Metallic Ultra Blue",
    [74] = "Metallic Bright Blue",
    [75] = "Util Dark Blue",
    [76] = "Util Midnight Blue",
    [77] = "Util Blue",
    [78] = "Util Sea Foam Blue",
    [79] = "Uil Lightning blue",
    [80] = "Util Maui Blue Poly",
    [81] = "Util Bright Blue",
    [82] = "Matte Dark Blue",
    [83] = "Matte Blue",
    [84] = "Matte Midnight Blue",
    [85] = "Worn Dark blue",
    [86] = "Worn Blue",
    [87] = "Worn Light blue",
    [88] = "Metallic Taxi Yellow",
    [89] = "Metallic Race Yellow",
    [90] = "Metallic Bronze",
    [91] = "Metallic Yellow Bird",
    [92] = "Metallic Lime",
    [93] = "Metallic Champagne",
    [94] = "Metallic Pueblo Beige",
    [95] = "Metallic Dark Ivory",
    [96] = "Metallic Choco Brown",
    [97] = "Metallic Golden Brown",
    [98] = "Metallic Light Brown",
    [99] = "Metallic Straw Beige",
    [100] = "Metallic Moss Brown",
    [101] = "Metallic Biston Brown",
    [102] = "Metallic Beechwood",
    [103] = "Metallic Dark Beechwood",
    [104] = "Metallic Choco Orange",
    [105] = "Metallic Beach Sand",
    [106] = "Metallic Sun Bleeched Sand",
    [107] = "Metallic Cream",
    [108] = "Util Brown",
    [109] = "Util Medium Brown",
    [110] = "Util Light Brown",
    [111] = "Metallic White",
    [112] = "Metallic Frost White",
    [113] = "Worn Honey Beige",
    [114] = "Worn Brown",
    [115] = "Worn Dark Brown",
    [116] = "Worn straw beige",
    [117] = "Brushed Steel",
    [118] = "Brushed Black steel",
    [119] = "Brushed Aluminium",
    [120] = "Chrome",
    [121] = "Worn Off White",
    [122] = "Util Off White",
    [123] = "Worn Orange",
    [124] = "Worn Light Orange",
    [125] = "Metallic Securicor Green",
    [126] = "Worn Taxi Yellow",
    [127] = "police car blue",
    [128] = "Matte Green",
    [129] = "Matte Brown",
    [130] = "Worn Orange",
    [131] = "Matte White",
    [132] = "Worn White",
    [133] = "Worn Olive Army Green",
    [134] = "Pure White",
    [135] = "Hot Pink",
    [136] = "Salmon pink",
    [137] = "Metallic Vermillion Pink",
    [138] = "Orange",
    [139] = "Green",
    [140] = "Blue",
    [141] = "Mettalic Black Blue",
    [142] = "Metallic Black Purple",
    [143] = "Metallic Black Red",
    [144] = "Hunter Green",
    [145] = "Metallic Purple",
    [146] = "Metallic V Dark Blue",
    [147] = "MODSHOP BLACK1",
    [148] = "Matte Purple",
    [149] = "Matte Dark Purple",
    [150] = "Metallic Lava Red",
    [151] = "Matte Forest Green",
    [152] = "Matte Olive Drab",
    [153] = "Matte Desert Brown",
    [154] = "Matte Desert Tan",
    [155] = "Matte Foilage Green",
    [156] = "DEFAULT ALLOY COLOR",
    [157] = "Epsilon Blue",
    [158] = "Unknown",
}

local whitelisted = {
    [`WEAPON_STUNGUN`] = true,
    [`WEAPON_SNOWBALL`] = true
}

CreateThread(function()
	while true do
		playerPed = PlayerPedId()
        playerCoords = GetEntityCoords(playerPed)
        currentVehicle = GetVehiclePedIsIn(playerPed, false)
        currentWeapon = GetSelectedPedWeapon(playerPed)
        currentlyArmed = IsPedArmed(playerPed, 7) and not whitelisted[currentWeapon]
        if currentVehicle ~= 0 then inVehicle = true elseif inVehicle then inVehicle = false end
		Wait(1000)
	end
end)

local function getCardinalDirectionFromHeading()
    local heading = GetEntityHeading(playerPed)
    if heading >= 315 or heading < 45 then return "North Bound"
    elseif heading >= 45 and heading < 135 then return "West Bound"
    elseif heading >=135 and heading < 225 then return "South Bound"
    elseif heading >= 225 and heading < 315 then return "East Bound" end
end

function GetStreetAndZone()
    local coords = GetEntityCoords(playerPed)
    local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
    local area = GetLabelText(tostring(GetNameOfZone(coords.x, coords.y, coords.z)))
    local playerStreetsLocation = area
    if not zone then zone = "UNKNOWN" end
    if currentStreetName ~= nil and currentStreetName ~= "" then playerStreetsLocation = currentStreetName .. ", " ..area
    else playerStreetsLocation = area end
    return playerStreetsLocation
end

local function GetClosestNPC(sentPos, sentDistance, sentType, sentIgnoredPed)
    if sentType == 'combat' then
        local allPeds = GetGamePool('CPed')
        for i = 1, #allPeds do
            local ped = allPeds[i]
            if DoesEntityExist(ped) then
                if ped ~= sentIgnoredPed then
                    local dist = #(GetEntityCoords(ped) - sentPos)
                    if dist < sentDistance then
                        return ped
                    end
                end 
            end
        end
    elseif sentType == 'gunshot' then
        local allPeds = GetGamePool('CPed')
        for i = 1, #allPeds do
            local ped = allPeds[i]
            if DoesEntityExist(ped) then
                local dist = #(GetEntityCoords(ped) - sentPos)
                if dist < sentDistance then
                    if (GetPedAlertness(ped) > 0) and not IsPedAimingFromCover(ped) and not IsPedBeingStunned(ped, 0) and not IsPedDeadOrDying(ped, 1) and IsPedHuman(ped) and not IsPedInAnyPlane(ped) and not IsPedInAnyHeli(ped) and not IsPedShooting(ped) and not IsPedAPlayer(ped) then
                        TaskUseMobilePhoneTimed(ped, 5000)
                        return ped
                    end
                end
            end
        end
    elseif sentType == 'armed' then
        local allPeds = GetGamePool('CPed')
        for i = 1, #allPeds do
            local ped = allPeds[i]
            if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
                local dist = #(GetEntityCoords(ped) - sentPos)
                if dist < 50.0 and math.random(10) > 4 then
                    if not IsPedAimingFromCover(ped) and not IsPedBeingStunned(ped, 0) and not IsPedDeadOrDying(ped, 1) and IsPedHuman(ped) and not IsPedInAnyPlane(ped) and not IsPedInAnyHeli(ped) and not IsPedShooting(ped) then
                        TaskUseMobilePhoneTimed(ped, 5000)
                        return ped
                    end
                end
            end
        end
    else
        local allPeds = GetGamePool('CPed')
        for i = 1, #allPeds do
            local ped = allPeds[i]
            if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
                local dist = #(GetEntityCoords(ped) - sentPos)
                if dist < sentDistance then
                    return ped
                end
            end
        end
    end
end

local function GetPedInFront()	
	local plyPed = playerPed
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 12, plyPed, 7)
	local _, _, _, _, ped = GetShapeTestResult(rayHandle)
	return ped
end

local function GetVehicleDescription(sentVehicle)
    if not sentVehicle or sentVehicle == nil then
        local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if not DoesEntityExist(currentVehicle) then
            return
        end
    elseif sentVehicle then
        currentVehicle = sentVehicle
    end
    plate = GetVehicleNumberPlateText(currentVehicle)
    make = GetDisplayNameFromVehicleModel(GetEntityModel(currentVehicle))
    color1, color2 = GetVehicleColours(currentVehicle)
    if color1 == 0 then color1 = 1 end
    if color2 == 0 then color2 = 2 end
    if color1 == -1 then color1 = 158 end
    if color2 == -1 then color2 = 158 end 
    if math.random(1, 2) == math.random(1, 2) then
        plate = "Unknown"
    end
    local dir = getCardinalDirectionFromHeading()
    local vehicleData  = {
        model = make,
        plate = plate,
        firstColor = colors[color1],
        secondColor = colors[color2],
        heading = dir
    }
    return vehicleData
end

local function canPedBeUsed(ped,isGunshot,isSpeeder)
    if math.random(100) > 15 then
        return false
    end
    if ped == nil then
        return false
    end
    if isSpeeder == nil then
        isSpeeder = false
    end
    if ped == PlayerPedId() then
        return false
    end
    if GetEntityHealth(ped) < GetEntityMaxHealth(ped) then
        return false
    end
    if isSpeeder then
        if not IsPedInAnyVehicle(ped, false) then
            return false
        end
    end
    if `mp_f_deadhooker` == GetEntityModel(ped) then
        return false
    end
    local curcoords = GetEntityCoords(PlayerPedId())
    local startcoords = GetEntityCoords(ped)
    if #(curcoords - startcoords) < 10.0 then
        return false
    end    
    if #(curcoords - vector3( 1088.76, -3187.51, -38.99)) < 15.0 then
        return false
    end  
    if not HasEntityClearLosToEntity(PlayerPedId(), ped, 17) and not isGunshot then
        return false
    end
    if not DoesEntityExist(ped) then
        return false
    end
    if IsPedAPlayer(ped) then
        return false
    end
    if IsPedFatallyInjured(ped) then
        return false
    end
    if IsPedArmed(ped, 7) then
        return false
    end
    if IsPedInMeleeCombat(ped) then
        return false
    end
    if IsPedShooting(ped) then
        return false
    end
    if IsPedDucking(ped) then
        return false
    end
    if IsPedBeingJacked(ped) then
        return false
    end
    if IsPedSwimming(ped) then
        return false
    end
    if IsPedJumpingOutOfVehicle(ped) or IsPedBeingJacked(ped) then
        return false
    end
    local pedType = GetPedType(ped)
    if pedType == 6 or pedType == 27 or pedType == 29 or pedType == 28 then
        return false
    end
    return true
end

local NulledAreas = { 
    [1] = vector3(102.09, -1938.74, 20.79),
    [2] = vector3(-221.78, -1667.06, 34.45),
    [3] = vector3(-23.24, -1462.26, 30.8),
    [4] = vector3(-9.77, -1842.7, 26.15),
    [5] = vector3(16.54, -1548.8, 30.75),
    [6] = vector3(-120.32, -1522.75, 34.89)
}

tasksIdle = {
    [1] = "CODE_HUMAN_MEDIC_KNEEL",
    [2] = "WORLD_HUMAN_STAND_MOBILE",
}

local KnownWeapons = {
    [-120179019] = {['weaponName'] = 'Glock 18', ['isAuto'] = false},
    [1834241177 ] = {['weaponName'] = 'Rail Gun', ['isAuto'] = false},
    [218362403] = {['weaponName'] = 'Slug Shotgun', ['isAuto'] = false},
    [148457251] = {['weaponName'] = 'Browning Hi-Power', ['isAuto'] = false},
    [-2012211169] = {['weaponName'] = 'Diamond Back', ['isAuto'] = false},
    [-1746263880] = {['weaponName'] = 'Colt Python', ['isAuto'] = false},
    [453432689 ] = {['weaponName'] = 'Colt 1911', ['isAuto'] = false},
    [-1075685676] = {['weaponName'] = 'Beretta M9', ['isAuto'] = false},
    [1593441988] = {['weaponName'] = 'FN FNX-45', ['isAuto'] = false},
    [-134995899] = {['weaponName'] = 'Mac-10 ', ['isAuto'] = true},
    [-1716589765] = {['weaponName'] = 'Desert Eagle', ['isAuto'] = false},
    [584646201] = {['weaponName'] = 'Glock 18C', ['isAuto'] = true},
    [-942620673] = {['weaponName'] = 'Uzi', ['isAuto'] = true},
    [736523883] = {['weaponName'] = 'MP5', ['isAuto'] = true},
    [1192676223] = {['weaponName'] = ' M4', ['isAuto'] = true},
    [-176814556] = {['weaponName'] = 'FN SCAR-L', ['isAuto'] = true},
    [-1719357158] = {['weaponName'] = 'mk14', ['isAuto'] = false},
    [100416529] = {['weaponName'] = 'm24', ['isAuto'] = false},
    [-1536150836] = {['weaponName'] = 'AWM', ['isAuto'] = false},
    [-90637530] = {['weaponName'] = 'Dragunov', ['isAuto'] = false},
    [-1074790547] = {['weaponName'] = 'AK 47', ['isAuto'] = true},
    [497969164] = {['weaponName'] = 'M70', ['isAuto'] = true},
    [-275439685] = {['weaponName'] = 'Sawn-off Shotgun', ['isAuto'] = false},
    [487013001] = {['weaponName'] = 'Remington 870', ['isAuto'] = false},
    [1432025498] = {['weaponName'] = 'IZh-81', ['isAuto'] = true},
    [171789620] = {['weaponName'] = 'SIG MPX', ['isAuto'] = true},
    [1649403952 ] = {['weaponName'] = 'Draco NAK9', ['isAuto'] = true},
    [-1472189665] = {['weaponName'] = 'Skorpion', ['isAuto'] = true},
}

CreateThread(function()
    local isBusyGunShots, armed, cooldownGS, cooldownSMD = false, false, 0, 0
    while true do
        Wait(0)
        if not isBusyGunShots then
            armed = currentlyArmed
            if armed then
                if IsPedShooting(playerPed) and ((cooldownGS == 0) or cooldownGS - GetGameTimer() < 0) then
                    isBusyGunShots = true
                    if IsPedCurrentWeaponSilenced(playerPed) then
                        cooldownGS = GetGameTimer() + math.random(10000,20000)
                        TriggerEvent("civilian:alertPolice",15.0,"gunshot",0,true,inHuntingZone,currentWeapon)
                    elseif inVehicle then
                        cooldownGS = GetGameTimer() + math.random(5000,15000)
                        TriggerEvent("civilian:alertPolice",150.0,"gunshotvehicle",0,true,inHuntingZone,currentWeapon)
                    else
                        cooldownGS = GetGameTimer() + math.random(10000,20000)
                        TriggerEvent("civilian:alertPolice",550.0,"gunshot",0,true,inHuntingZone,currentWeapon)
                    end
                    isBusyGunShots = false
                elseif (cooldownSMD == 0 and math.random(10) > 7) or ((cooldownSMD - GetGameTimer() < 0) and math.random(10) > 7) then
                    local shouldAlert = true
                    local myPos = GetEntityCoords(playerPed)
                    for i = 1, #NulledAreas do
                        local dist = #(NulledAreas[i] - myPos)
                        if dist <= math.random(75, 100) then
                            shouldAlert = false
                            break 
                        end
                    end
                end
            else
                Wait(1000)
            end 
        else
            Wait(250)
        end
    end
end)

CreateThread(function()
    local isBusy, cooldown = false, 0
    while true do 
        Wait(0)
        if not inVehicle and not isBusy and (cooldown - GetGameTimer() < 0) then
            local pedinfront = GetPedInFront()
            if pedinfront > 0 then
                if IsPedInMeleeCombat(playerPed) and IsPedInCombat(pedinfront, playerPed) and GetClosestNPC(playerCoords, 25.0, 'combat', pedinfront) then
                    TriggerEvent("civilian:alertPolice", 15.0, "fight", 0)
                    cooldown = GetGameTimer() + math.random(20000,25000)
                else
                    Wait(1000)
                end
            else
                Wait(1000)
            end
        else 
            Wait(1000)
        end 
    end 
end)
    
local function ResetMathRandom()
    math.randomseed(GetCloudTimeAsInt())
end

local function randomizeBlipLocation(pOrigin)
    local x = pOrigin.x
    local y = pOrigin.y
    local z = pOrigin.z
    ResetMathRandom()
    local luck = math.random(1, 2)
    ResetMathRandom()
    y = math.random(25) + y
    ResetMathRandom()
    if luck == math.random(1, 2) then
        ResetMathRandom()
        x = math.random(25) + x
    end
    return vec3(x, y, z)
end

function AlertFight()
    local locationInfo = GetStreetAndZone()
    local gender, armed = IsPedMale(playerPed), IsPedArmed(playerPed, 7)
    local currentPos = GetEntityCoords(playerPed)
    local dispatchCode = "10-15"
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 3,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Disturbance",
        blipSprite = 458,
        blipColor = 25
    })
    TriggerServerEvent('np-dispatch:combatAlert', currentPos)
    if math.random(10) > 5 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(5000, 10000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('dispatch:svNotify', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    priority = 3,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {x = newPos.x, y = newPos.y, z = newPos.z},
                    dispatchMessage = "Car fleeing 10-15"
                })
                TriggerServerEvent('np-dispatch:combatAlert', newPos)
            end
            return
        end)
    end
end

function AlertGunShot(isHunting, sentWeapon)
    if KnownWeapons[sentWeapon] then
        local locationInfo = GetStreetAndZone()
        local gender = IsPedMale(playerPed)
        local currentPos = GetEntityCoords(playerPed)
        local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
        local vehicleData = GetVehicleDescription() or {}
        local initialTenCode = (not isInVehicle and '10-71A' or '10-71B')
        TriggerEvent('np-dispatch:gunshotcl')
        TriggerServerEvent('dispatch:svNotify', {
            dispatchCode = initialTenCode,
            firstStreet = locationInfo,
            gender = gender,
            model = vehicleData.model,
            plate = vehicleData.plate,
            priority = 2,
            firstColor = vehicleData.firstColor,
            secondColor = vehicleData.secondColor,
            heading = vehicleData.heading,
            automaticGunfire = KnownWeapons[sentWeapon]['isAuto'],
            origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
            dispatchMessage = "Shots Fired"
        })
        if math.random(1, 10) > 3 and not isInVehicle then
            CreateThread(function()
                Wait(math.random(5000, 10000))
                if IsPedInAnyVehicle(PlayerPedId()) then
                    local vehicleData = GetVehicleDescription() or {}
                    local newPos = GetEntityCoords(PlayerPedId())
                    local locationInfo = GetStreetAndZone()
                    TriggerServerEvent('dispatch:svNotify', {
                        dispatchCode = 'CarEvading',
                        relatedCode = initialTenCode,
                        firstStreet = locationInfo,
                        gender = gender,
                        model = vehicleData.model,
                        plate = vehicleData.plate,
                        priority = 2,
                        firstColor = vehicleData.firstColor,
                        secondColor = vehicleData.secondColor,
                        heading = vehicleData.heading,
                        origin = {x = newPos.x, y = newPos.y, z = newPos.z},
                        dispatchMessage = "Car fleeing 10-60"
                    })
                    TriggerEvent('np-dispatch:gunshotcl')
                end
                return
            end)
        end
    end
end

RegisterNetEvent('np-mdt:drugsale')
AddEventHandler("np-mdt:drugsale",function()
    TriggerEvent('np-dispatch:drug')
    DrugSale()
end)

RegisterCommand('sup', function()
    TriggerEvent('np-mdt:drugsale')
end)

function DrugSale()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local initialTenCode = "10-99"
    TriggerServerEvent('np-dispatch:drugsale', currentPos)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = initialTenCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 2,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Suspicious Hand-off"
    })
    if math.random(10) > 5 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(7500, 12500))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('dispatch:svNotify', {
                    dispatchCode = 'CarEvading',
                    relatedCode = initialTenCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    priority = 2,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {x = newPos.x, y = newPos.y, z = newPos.z},
                    dispatchMessage = "Car Fleeing 10-99"
                })
                TriggerServerEvent('np-dispatch:drugsale', newPos)
            end
            return
        end)
    end
end

function CarCrash()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    if currentVeh == 0 or GetVehicleNumberPlateText(currentVeh) == nil then currentVeh = GetVehiclePedIsIn(PlayerPedId(), true) end
    local vehicleData = GetVehicleDescription(currentVeh) or {}
    local dispatchCode = "10-50"
    TriggerServerEvent('np-dispatch:vehiclecrash', currentPos)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        model = vehicleData.model,
        plate = vehicleData.plate,
        priority = 3,
        firstColor = vehicleData.firstColor,
        secondColor = vehicleData.secondColor,
        heading = vehicleData.heading,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Vehicle Crash"
    })
end

function AlertCheckLockpick(object)
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local vehicleData = GetVehicleDescription() or {}
    local initialTenCode = (not isInVehicle and '10-60' or '10-60')
    TriggerEvent('np-dispatch:stolenveh')
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = initialTenCode,
        firstStreet = locationInfo,
        gender = gender,
        model = vehicleData.model,
        plate = vehicleData.plate,
        priority = 2,
        firstColor = vehicleData.firstColor,
        secondColor = vehicleData.secondColor,
        heading = vehicleData.heading,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Vehicle Theft in Progress"
    })
    if math.random(1, 10) > 3 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(5000, 10000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('dispatch:svNotify', {
                    dispatchCode = 'CarEvading',
                    relatedCode = initialTenCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    priority = 2,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {x = newPos.x, y = newPos.y, z = newPos.z},
                    dispatchMessage = "Car Fleeing 10-99"
                })
                TriggerEvent('np-dispatch:stolenveh')
            end
            return
        end)
    end
end

RegisterNetEvent('np-dispatch:houserobbery')
AddEventHandler("np-dispatch:houserobbery",function()
    AlertHouseRobbery()
end)

function AlertHouseRobbery()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-31A"
    TriggerEvent('np-dispatch:robhouse')
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 2,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Breaking and entering"
    })
end

function AlertJewelRob()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    TriggerServerEvent('np-dispatch:jewel', currentPos)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 1,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Vangelico Robbery"
    })
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(12500, 15000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('dispatch:svNotify', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {x = newPos.x, y = newPos.y, z = newPos.z},
                    dispatchMessage = "Evading 10-90"
                })
                TriggerServerEvent('np-dispatch:jewel', newPos)
            end
            return
        end)
    end
end

function AlertJailBreak()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local dispatchCode = "10-98"
    TriggerServerEvent('np-dispatch:blip:jailbreak', currentPos)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 1,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Jail Break in Progress"
    })
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(17500, 25000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('dispatch:svNotify', {
                    dispatchCode = 'CarFleeing',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {x = newPos.x, y = newPos.y, z = newPos.z},
                    dispatchMessage = "Evading 10-98"
                })
                TriggerServerEvent('np-dispatch:blip:jailbreak', newPos)
            end
            return
        end)
    end
end

function AlertFleecaRobbery()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    TriggerServerEvent('np-dispatch:bankwobbewy', currentPos)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 1,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Bank Robbery"
    })
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(17500, 25000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('dispatch:svNotify', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {x = newPos.x, y = newPos.y, z = newPos.z},
                    dispatchMessage = "Evading 10-90"
                })
                TriggerServerEvent('np-dispatch:bankwobbewy', newPos)
            end
            return
        end)
    end
end

RegisterNetEvent('np-dispatch:bankrobbery')
AddEventHandler("np-dispatch:bankrobbery",function()
    AlertFleecaRobbery()
end)

RegisterNetEvent('np-dispatch:bankrobbery:pacific')
AddEventHandler("np-dispatch:bankrobbery:pacific",function()
    AlertPacificRobbery()
end)

function AlertPacificRobbery()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    TriggerServerEvent('np-dispatch:bankwobbewy', currentPos)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 1,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Pacific Standard Heist"
    })
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(17500, 25000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('dispatch:svNotify', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {x = newPos.x, y = newPos.y, z = newPos.z},
                    dispatchMessage = "Evading 10-90"
                })
                TriggerServerEvent('np-dispatch:bankwobbewy', newPos)
            end
            return
        end)
    end
end
function AlertPowerplant()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    TriggerServerEvent('np-dispatch:bankwobbewy', currentPos)
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = "Senora Way, Palmer-Taylor Power Station",
        gender = gender,
        priority = 1,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Powerplant Hit"
    })
    if math.random(10) > 2 and not isInVehicle then
        CreateThread(function()
            Wait(math.random(17500, 25000))
            if IsPedInAnyVehicle(PlayerPedId()) then
                local vehicleData = GetVehicleDescription() or {}
                local newPos = GetEntityCoords(PlayerPedId())
                local locationInfo = GetStreetAndZone()
                TriggerServerEvent('dispatch:svNotify', {
                    dispatchCode = 'CarEvading',
                    relatedCode = dispatchCode,
                    firstStreet = locationInfo,
                    gender = gender,
                    model = vehicleData.model,
                    plate = vehicleData.plate,
                    priority = 1,
                    firstColor = vehicleData.firstColor,
                    secondColor = vehicleData.secondColor,
                    heading = vehicleData.heading,
                    origin = {x = newPos.x, y = newPos.y, z = newPos.z},
                    dispatchMessage = "Evading 10-90"
                })
                TriggerServerEvent('np-dispatch:bankwobbewy', newPos)
            end
            return
        end)
    end
end

RegisterNetEvent("np-dispatch:boostTrackerPing")
AddEventHandler("np-dispatch:boostTrackerPing", function(toggle)
    if toggle == true then
  local pos = GetEntityCoords(PlayerPedId(), true)
  local street = GetStreetAndZone()
  local veh = GetVehiclePedIsIn(PlayerPedId(), false)
  local color1, color2 = GetVehicleColours(veh)
	local vehCol1 = colors[color1]
  local vehCol2 = colors[color2]
	local plate = GetVehicleNumberPlateText(veh)
	local vehHash = GetEntityModel(veh)
	local vehName = GetDisplayNameFromVehicleModel(vehHash)
	local vehNameText = GetLabelText(vehName)
  local gender = IsPedMale(PlayerPedId())

  TriggerServerEvent("dispatch:svNotify", {
    dispatchCode = "10-60",
    firstStreet = street,
    gemder = gender,
    model = vehNameText,
    plate = plate,
    firstColor = vehCol1,
    secondColor = vehCol2,
    isImportant = false,
    dispatchMessage = "Stolen Vehicle Tracker",
    recipientList = {police = "police", sheriff = "sheriff", state = "state"},
    origin = {
      x = pos.x,
      y = pos.y,
      z = pos.z
    }
  })
  TriggerEvent("np-dispatch:carBoostTracker")
elseif toggle == false then
    return end
end)

function AlertDeath()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local dispatchCode = "10-47"
    TriggerEvent('np-dispatch:downguy')
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 3,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Injured Person"
    })
end

RegisterNetEvent('np-dispatch:jailbreak')
AddEventHandler("np-dispatch:jailbreak",function()
    AlertJailBreak()
end)

RegisterNetEvent('np-dispatch:jewelrobbery')
AddEventHandler("np-dispatch:jewelrobbery",function()
    AlertJewelRob()
    TriggerEvent('np-dispatch:jewrob')
end)

RegisterNetEvent('np-dispatch:carjacking')
AddEventHandler("np-dispatch:carjacking",function()
    AlertCheckLockpick()
end)

LoadDreamsVersion = function()
    RegisterNetEvent('civilian:alertPolice')
    AddEventHandler("civilian:alertPolice",function(basedistance, alertType, objPassed, isGunshot, isHunting, sentWeapon)
        if exports['isPed']:isPed("myjob") == nil then return end;
        local isPolice = exports['isPed']:isPed("myjob") == "police"
        local object = objPassed
        if not daytime then
            basedistance = basedistance * 8.2
        else
            basedistance = basedistance * 3.45
        end
        if isGunshot == nil then 
            isGunshot = false 
        end
        local plyCoords = GetEntityCoords(PlayerPedId())
        if isGunshot then
            shittypefuckyou = 'gunshot'
        end
        local nearNPC
        if alertType == 'drugsale' then
            nearNPC = GetClosestNPC(plyCoords, basedistance, 'combat', object)
        else
            nearNPC = GetClosestNPC(plyCoords, basedistance, shittypefuckyou)
        end 
        local dst = 0
        if nearNPC then
            dst = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(nearNPC))
        end
        if nearNPC and DoesEntityExist(nearNPC) then
            if not isSpeeder and alertType ~= "robberyhouse" then
                RequestAnimDict("amb@code_human_wander_texting@male@base")
                while not HasAnimDictLoaded("amb@code_human_wander_texting@male@base") do
                    Wait(0)
                end
                Wait(1000)
                if GetEntityHealth(nearNPC) < GetEntityMaxHealth(nearNPC) then
                    return
                end
                if not DoesEntityExist(nearNPC) then
                    return
                end
                if IsPedFatallyInjured(nearNPC) then
                    return
                end
                if IsPedInMeleeCombat(nearNPC) then
                    return
                end
                ClearPedTasks(nearNPC)
                TaskPlayAnim(nearNPC, "cellphone@", "cellphone_call_listen_base", 1.0, 1.0, -1, 49, 0, 0, 0, 0)
            end
        end
        local isUnderground = false
        if plyCoords.z <= -25 then isUnderground = true end
        if alertType == "drugsale" and not underground then
            if dst > 50.5 and dst < 75.0 then
                DrugSale()
            end
        elseif alertType == "druguse" and not underground and not pd then
            if dst > 12.0 and dst < 18.0 then
                DrugUse()
            end
        elseif alertType == "carcrash" then
            CarCrash()
        elseif alertType == "death" then
            AlertDeath()
            local roadtest2 = IsPointOnRoad(GetEntityCoords(PlayerPedId()), PlayerPedId())
      
            if roadtest2 then
              return
            end
        elseif alertType == "Suspicious" then
            AlertSuspicious()
        elseif alertType == "fight" and not underground then
            AlertFight()
        elseif (alertType == "gunshot" or alertType == "gunshotvehicle") then
            local job = exports['isPed']:isPed('myjob')
            if job == "police" or job == "sheriff" or job == "state" then
                print('no')
            else
                AlertGunShot(isHunting, sentWeapon)
            end
        elseif alertType == "lockpick" then
            if dst > 5.0 and dst < 85.0 then
                if math.random(100) >= 25 then
                    AlertCheckLockpick(object)
                end
            end
        end
    end)
    RegisterNetEvent('dispatch:clNotify')
    AddEventHandler('dispatch:clNotify', function(sNotificationData, sNotificationId, sender, pCallID)
        sNotificationId = pCallID
        if sNotificationData ~= nil then
            if sender == GetPlayerServerId(PlayerId()) and sNotificationData['dispatchCode'] == '911' then
                SendNUIMessage({
                    update = "newCall",
                    callID = pCallID,
                    data = {
                        dispatchCode = '911',
                        priority = 1,
                        dispatchMessage = "Sent 911 call",
                        information = "Thank you for sending a 911 call in, it has been received and is being processed."
                    },
                    timer = 5000,
                    isPolice = true
                })
            end
            local shouldAlert = true
            if shouldAlert then 
                if not disableNotis then
                    if sNotificationData.origin ~= nil then
                        if sNotificationData.originStatic == nil or not sNotificationData.originStatic then
                            sNotificationData.origin = randomizeBlipLocation(sNotificationData.origin)
                        else
                            sNotificationData.origin = sNotificationData.origin
                        end
                    end
                    SendNUIMessage({
                        update = "newCall",
                        callID = pCallID,
                        data = sNotificationData,
                        timer = 5000,
                        isPolice = exports['isPed']:isPed("myjob") == "police" or exports['isPed']:isPed("myjob") == "state" or exports['isPed']:isPed("myjob") == "sheriff" or exports['isPed']:isPed("myjob") == "ems"
                    })
                end
            end
        end
    end)
    RegisterNetEvent('np-dispatch:setBlip')
    AddEventHandler('np-dispatch:setBlip', function(type, pos, id)
        if (exports['isPed']:isPed("myjob") == "police" or exports['isPed']:isPed("myjob") == 'ems') then	
            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
            PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
            if type == '911' then
                local alpha = 250
                local call = AddBlipForCoord(pos)
                SetBlipSprite (call, 480)
                SetBlipDisplay(call, 4)
                SetBlipScale  (call, 1.2)
                SetBlipAsShortRange(call, true)
                SetBlipAlpha(call, alpha)
                SetBlipHighDetail(call, true)
                SetBlipAsShortRange(call, true)
                SetBlipColour (call, 1)
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentString('['..id..'] 911 Call')
                EndTextCommandSetBlipName(call)
                while alpha ~= 0 do
                    Citizen.Wait(240 * 4)
                    alpha = alpha - 1
                    SetBlipAlpha(call, alpha)
                    if alpha == 0 then
                        RemoveBlip(call)
                        return
                    end
                end
            end
        end
    end)
end

Citizen.CreateThread(function()
    if Config["CoreSettings"]["Core"] == "warp" then
        LoadDreamsVersion()
    end
end)

local gasStations = {
    {264.47033691406,-1261.2421875,29.29295539856},
    {-320.13858032227,-1471.3533935547,30.548488616943},
    {-526.69915771484,-1210.8858642578,18.184833526611},
    {-724.63739013672,-934.99969482422,19.213779449463},
    {1208.9411621094,-1402.3977050781,35.224239349365},
    {819.65350341797,-1028.7437744141,26.404289245605},
    {-70.216720581055,-1761.7586669922,29.552667617798},
    {1181.3813476563,-330.79992675781,69.301834106445},
    {620.84295654297,269.13439941406,103.0856552124},
    {-1437.6204833984,-276.74166870117,46.212665557861},
    {-2096.2429199219,-320.27899169922,13.164064407349},
    {2581.3210449219,362.05072021484,108.46426391602},
    {-1800.3715820313,803.67309570313,138.64669799805},
    {-2554.9643554688,2334.4987792969,33.077770233154},
    {2539.0300292969,2594.3547363281,37.96667098999},
    {2679.9538574219,3263.9755859375,55.235542297363},
    {1785.4615478516,3330.3972167969,41.382518768311},
    {1207.3582763672,2660.1997070313,38.37427520752},
    {1040.25,2671.1923828125,39.550861358643},
    {263.99612426758,2606.4821777344,44.982532501221},
    {49.521022796631,2778.8117675781,58.049034118652},
    {2005.2669677734,3773.830078125,32.403442382813},
    {1701.4376220703,6416.0341796875,32.763523101807},
    {180.12121582031,6602.83203125,31.868190765381},
    {154.82797241211,6628.8154296875,31.73567199707},
    {-94.501037597656,6419.6235351563,31.485576629639},
}

Citizen.CreateThread( function()
    local origin3 = false
    while true do
        Wait(1)
        local plyPos = GetEntityCoords(PlayerPedId(),  true)
        local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
        local dstcheck = 1000.0
        for i,v in ipairs(gasStations) do
            local scandst = #(vector3(v[1],v[2],v[3]) - vector3(plyPos.x, plyPos.y, plyPos.z))
            if scandst < 20 and scandst < dstcheck then
                dstcheck = scandst
                if IsExplosionInSphere(9,v[1],v[2],v[3],60.0)  then
                    origin3 = true
                    TriggerServerEvent("dispatch:svNotify", {
                        dispatchCode = "Explosion",
                        firstStreet = GetStreetAndZone(),
                        priority = 2,
                        dispatchMessage = "Gas Station",
                        origin = {
                          x = plyPos.x,
                          y = plyPos.y,
                          z = plyPos.z
                        },
                    })
                    TriggerEvent('np-dispatch:gasexplosion')
                    Wait(9000)
                    origin3 = false
                end
            end
        end
        if dstcheck > 50 then
            Citizen.Wait(math.ceil(dstcheck*10))
        end
    end
end)

RegisterNetEvent('np-dispatch:storerobbery2')
AddEventHandler("np-dispatch:storerobbery2",function()
    AlertShop()
end)

function AlertShop()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-31B"
    TriggerEvent('np-dispatch:robstore')
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 2,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Store Robbery In Progress"
    })
end

-- Bank Truck --

RegisterNetEvent('np-dispatch:bank_truck_robbery')
AddEventHandler("np-dispatch:bank_truck_robbery",function()
    AlertBankTruck()
end)

function AlertBankTruck()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    TriggerEvent('np-dispatch:bankt')
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 2,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Bank Truck Robbery"
    })
end

RegisterNetEvent('np-dispatch:bobcat_robbery')
AddEventHandler("np-dispatch:bobcat_robbery",function()
    AlertBobcat()
end)

function AlertBobcat()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-90"
    TriggerEvent('np-dispatch:dispatchBobcat')
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 2,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Bobcat Security Alert"
    })
end

RegisterNetEvent('np-boosting:ping')
AddEventHandler('np-boosting:ping', function()
    AlertBoosting()
end)

function AlertBoosting()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local dispatchCode = "10-60"
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 3,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Stolen Vehicle Tracker"
    })
    TriggerEvent("np-dispatch:carBoostTracker")
end

RegisterNetEvent('np-dispatch:unauthorised_aircraft')
AddEventHandler("np-dispatch:unauthorised_aircraft",function()
    Aircraft()
end)

function Aircraft()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-31A"
    TriggerEvent('np-dispatch:cocaine_plane')
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 2,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Unauthorised Aircraft"
    })
end

RegisterNetEvent('np-dispatch:sus_drop')
AddEventHandler("np-dispatch:sus_drop",function()
    AlertSus()
end)

function AlertSus()
    local locationInfo = GetStreetAndZone()
    local gender = IsPedMale(playerPed)
    local currentPos = GetEntityCoords(playerPed)
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local currentVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    local dispatchCode = "10-31A"
    TriggerEvent('np-dispatch:dispatchBobcat')
    TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = dispatchCode,
        firstStreet = locationInfo,
        gender = gender,
        priority = 2,
        origin = {x = currentPos.x, y = currentPos.y, z = currentPos.z},
        dispatchMessage = "Suspicious Hand-Off"
    })
end
