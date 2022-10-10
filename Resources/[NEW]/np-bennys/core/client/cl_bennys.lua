--#[Benny's Coordinates]#--

local bennyLocation = vector3(546.61352539062, -189.59159851074, 53.77131652832)
local bennyLocation2 = vector3(450.0, -976.04833984375, 24.96630)
local bennyLocationBridge = vector3(727.74, -1088.95, 22.17)
local billyLocationPaleto = vector3(110.8, 6626.46, 31.89)
local bennyLocationMRPD = vector3(450.01, -976.04, 25.03)
local bennyLocationTunershop2 = vector3(135.87, -3030.35, 7.04)
local bennyLocationHarmonyBay1 = vector3(1174.78, 2639.96, 37.73)
local bennyLocationHarmonyBay2 = vector3(1182.4747314453, 2639.8022460938, 37.148681640625)
local civrepairbennys = vector3(-38.980415344238, -1054.4558105469, 27.67400932312) -- Repair shop for civs in bennys
local bennyHeading = 31.181098937988
local bennysLocationHayes = vector3(-1423.979, -449.8175, 35.432106)
local bennysLocationBennysBusiness2 = vector3(-231.9036, -1334.236, 30.286109)
local bennyLocationUnderground = vector3(947.46923, -1750.245, 20.419561)
local bennyLocationIllegalShop = vector3(1033.3187255859, -2528.9538574219, 27.712768554688)
local bennyLocationSandyPD = vector3(1878.4317, 3696.0478, 32.934951)
local bennyLocationPillbox = vector3(340.38067, -570.7971, 28.191606)
local bennyLocationDOC = vector3(1832.5999, 2549.8505, 45.285083)
local bennyLocationPublic = vector3(-39.454944610596, -1053.0329589844, 28.403686523438)

--#[Global Variables]#--
isPlyInBennys = false

--#[Local Variables]#--
local plyFirstJoin = false

isDev = false
local nearDefault = false
local nearImport = false
local nearAuto = false
local nearTuner = false
local playerCoords = GetEntityCoords(PlayerPedId())

local originalCategory = nil
local originalMod = nil
local originalPrimaryColour = nil
local originalSecondaryColour = nil
local originalPearlescentColour = nil
local originalWheelColour = nil
local originalDashColour = nil
local originalInterColour = nil
local originalWindowTint = nil
local originalWheelCategory = nil
local originalWheel = nil
local originalWheelType = nil
local originalCustomWheels = nil
local originalNeonLightState = nil
local originalNeonLightSide = nil
local originalNeonColourR = nil
local originalNeonColourG = nil
local originalNeonColourB = nil
local originalXenonColour = nil
local originalOldLivery = nil
local originalPlateIndex = nil

local attemptingPurchase = false
local isPurchaseSuccessful = false

--#[Local Functions]#--
local function isNear(pos1, pos2, distMustBe)
    local diff = pos2 - pos1
	local dist = (diff.x * diff.x) + (diff.y * diff.y)

	return (dist < (distMustBe * distMustBe))
end

local function saveVehicle()
    local plyPed = PlayerPedId()
    local veh = GetVehiclePedIsIn(plyPed, false)
    local vehicleMods = exports['np-base']:FetchVehProps(veh)
    TriggerServerEvent('updateVehicle',vehicleMods,GetVehicleNumberPlateText(veh))  
end


--#[Global Functions]#--
function AttemptPurchase(type, upgradeLevel)
    local cheap = false

    if nearImport or nearTuner then
        cheap = true
    end

    if upgradeLevel ~= nil then
        upgradeLevel = upgradeLevel + 2
    end
    TriggerServerEvent("np-bennys:attemptPurchase", type, upgradeLevel)

    attemptingPurchase = true

    while attemptingPurchase do
        Citizen.Wait(1)
    end

    if not isPurchaseSuccessful then
        PlaySoundFrontend(-1, "ERROR", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    end

    return isPurchaseSuccessful
end

function RepairVehicle()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleFixed(plyVeh)
    SetVehicleDirtLevel(plyVeh, 0.0)
    SetVehiclePetrolTankHealth(plyVeh, 4000.0)
    TriggerEvent('veh.randomDegredation',10,plyVeh,3)
end

function GetCurrentMod(id)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local mod = GetVehicleMod(plyVeh, id)
    local modName = GetLabelText(GetModTextLabel(plyVeh, id, mod))

    return mod, modName
end

function GetCurrentWheel()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local wheel = GetVehicleMod(plyVeh, 23)
    local wheelName = GetLabelText(GetModTextLabel(plyVeh, 23, wheel))
    local wheelType = GetVehicleWheelType(plyVeh)

    return wheel, wheelName, wheelType
end

function GetCurrentCustomWheelState()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local state = GetVehicleModVariation(plyVeh, 23)

    if state then
        return 1
    else
        return 0
    end
end

function GetOriginalWheel()
    return originalWheel
end

function GetOriginalCustomWheel()
    return originalCustomWheels
end

function GetCurrentWindowTint()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    return GetVehicleWindowTint(plyVeh)
end

function GetCurrentVehicleWheelSmokeColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local r, g, b = GetVehicleTyreSmokeColor(plyVeh)

    return r, g, b
end

function GetCurrentNeonState(id)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isEnabled = IsVehicleNeonLightEnabled(plyVeh, id)

    if isEnabled then
        return 1
    else
        return 0
    end
end

function GetCurrentNeonColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local r, g, b = GetVehicleNeonLightsColour(plyVeh)

    return r, g, b
end

function GetCurrentXenonState()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isEnabled = IsToggleModOn(plyVeh, 22)

    if isEnabled then
        return 1
    else
        return 0
    end
end

function GetCurrentXenonColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    return GetVehicleHeadlightsColour(plyVeh)
end

function GetCurrentTurboState()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isEnabled = IsToggleModOn(plyVeh, 18)

    if isEnabled then
        return 1
    else
        return 0
    end
end

function GetCurrentExtraState(extra)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    return IsVehicleExtraTurnedOn(plyVeh, extra)
end

function CheckValidMods(category, id, wheelType)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local tempMod = GetVehicleMod(plyVeh, id)
    local tempWheel = GetVehicleMod(plyVeh, 23)
    local tempWheelType = GetVehicleWheelType(plyVeh)
    local tempWheelCustom = GetVehicleModVariation(plyVeh, 23)
    local validMods = {}
    local amountValidMods = 0
    local hornNames = {}

    if wheelType ~= nil then
        SetVehicleWheelType(plyVeh, wheelType)
    end

    if id == 14 then
        for k, v in pairs(vehicleCustomisation) do 
            if vehicleCustomisation[k].category == category then
                hornNames = vehicleCustomisation[k].hornNames

                break
            end
        end
    end

    local modAmount = GetNumVehicleMods(plyVeh, id)
    for i = 1, modAmount do
        local label = GetModTextLabel(plyVeh, id, (i - 1))
        local modName = GetLabelText(label)

        if modName == "NULL" then
            if id == 14 then
                if i <= #hornNames then
                    modName = hornNames[i].name
                else
                    modName = "Horn " .. i
                end
            else
                modName = category .. " " .. i
            end
        end

        validMods[i] = 
        {
            id = (i - 1),
            name = modName
        }

        amountValidMods = amountValidMods + 1
    end

    if modAmount > 0 then
        table.insert(validMods, 1, {
            id = -1,
            name = "Stock " .. category
        })
    end

    if wheelType ~= nil then
        SetVehicleWheelType(plyVeh, tempWheelType)
        SetVehicleMod(plyVeh, 23, tempWheel, tempWheelCustom)
    end

    return validMods, amountValidMods
end

function RestoreOriginalMod()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleMod(plyVeh, originalCategory, originalMod)
    SetVehicleDoorsShut(plyVeh, true)

    originalCategory = nil
    originalMod = nil
end

function RestoreOriginalWindowTint()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleWindowTint(plyVeh, originalWindowTint)

    originalWindowTint = nil
end

function RestoreOriginalColours()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleColours(plyVeh, originalPrimaryColour, originalSecondaryColour)
    SetVehicleExtraColours(plyVeh, originalPearlescentColour, originalWheelColour)
    SetVehicleDashboardColour(plyVeh, originalDashColour)
    SetVehicleInteriorColour(plyVeh, originalInterColour)

    originalPrimaryColour = nil
    originalSecondaryColour = nil
    originalPearlescentColour = nil
    originalWheelColour = nil
    originalDashColour = nil
    originalInterColour = nil
end

function RestoreOriginalWheels()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local doesHaveCustomWheels = GetVehicleModVariation(plyVeh, 23)

    SetVehicleWheelType(plyVeh, originalWheelType)

    if originalWheelCategory ~= nil then
        SetVehicleMod(plyVeh, originalWheelCategory, originalWheel, originalCustomWheels)
        
        if GetVehicleClass(plyVeh) == 8 then --Motorcycle
            SetVehicleMod(plyVeh, 24, originalWheel, originalCustomWheels)
        end

        originalWheelType = nil
        originalWheelCategory = nil
        originalWheel = nil
        originalCustomWheels = nil
    end
end

function RestoreOriginalNeonStates()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleNeonLightEnabled(plyVeh, originalNeonLightSide, originalNeonLightState)

    originalNeonLightState = nil
    originalNeonLightSide = nil
end

function RestoreOriginalNeonColours()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleNeonLightsColour(plyVeh, originalNeonColourR, originalNeonColourG, originalNeonColourB)

    originalNeonColourR = nil
    originalNeonColourG = nil
    originalNeonColourB = nil
end

function RestoreOriginalXenonColour()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleHeadlightsColour(plyVeh, originalXenonColour)
    SetVehicleLights(plyVeh, 0)

    originalXenonColour = nil
end

function RestoreOldLivery()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleLivery(plyVeh, originalOldLivery)
end

function RestorePlateIndex()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleNumberPlateTextIndex(plyVeh, originalPlateIndex)
end

function PreviewMod(categoryID, modID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if originalMod == nil and originalCategory == nil then
        originalCategory = categoryID
        originalMod = GetVehicleMod(plyVeh, categoryID)
    end

    if categoryID == 39 or categoryID == 40 or categoryID == 41 then
        SetVehicleDoorOpen(plyVeh, 4, false, true)
    elseif categoryID == 37 or categoryID == 38 then
        SetVehicleDoorOpen(plyVeh, 5, false, true)
    end

    SetVehicleMod(plyVeh, categoryID, modID)
end

function PreviewWindowTint(windowTintID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if originalWindowTint == nil then
        originalWindowTint = GetVehicleWindowTint(plyVeh)
    end

    SetVehicleWindowTint(plyVeh, windowTintID)
end

function PreviewColour(paintType, paintCategory, paintID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleModKit(plyVeh, 0)
    if originalDashColour == nil and originalInterColour == nil and originalPrimaryColour == nil and originalSecondaryColour == nil and originalPearlescentColour == nil and originalWheelColour == nil then
        originalPrimaryColour, originalSecondaryColour = GetVehicleColours(plyVeh)
        originalPearlescentColour, originalWheelColour = GetVehicleExtraColours(plyVeh)
        originalDashColour = GetVehicleDashboardColour(plyVeh)
        originalInterColour = GetVehicleInteriorColour(plyVeh)
    end
    if paintType == 0 then --Primary Colour
        if paintCategory == 1 then --Metallic Paint
            SetVehicleColours(plyVeh, paintID, originalSecondaryColour)
            SetVehicleExtraColours(plyVeh, originalPearlescentColour, originalWheelColour)
        else
            SetVehicleColours(plyVeh, paintID, originalSecondaryColour)
        end
    elseif paintType == 1 then --Secondary Colour
        SetVehicleColours(plyVeh, originalPrimaryColour, paintID)
    elseif paintType == 2 then --Pearlescent Colour
        SetVehicleExtraColours(plyVeh, paintID, originalWheelColour)
    elseif paintType == 3 then --Wheel Colour
        SetVehicleExtraColours(plyVeh, originalPearlescentColour, paintID)
    elseif paintType == 4 then --Dash Colour
        SetVehicleDashboardColour(plyVeh, paintID)
    elseif paintType == 5 then --Interior Colour
        SetVehicleInteriorColour(plyVeh, paintID)
    end
end

function PreviewWheel(categoryID, wheelID, wheelType)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local doesHaveCustomWheels = GetVehicleModVariation(plyVeh, 23)

    if originalWheelCategory == nil and originalWheel == nil and originalWheelType == nil and originalCustomWheels == nil then
        originalWheelCategory = categoryID
        originalWheelType = GetVehicleWheelType(plyVeh)
        originalWheel = GetVehicleMod(plyVeh, 23)
        originalCustomWheels = GetVehicleModVariation(plyVeh, 23)
    end

    SetVehicleWheelType(plyVeh, wheelType)
    SetVehicleMod(plyVeh, categoryID, wheelID, doesHaveCustomWheels)

    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        SetVehicleMod(plyVeh, 24, wheelID, doesHaveCustomWheels)
    end
end

function PreviewNeon(side, enabled)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if originalNeonLightState == nil and originalNeonLightSide == nil then
        if IsVehicleNeonLightEnabled(plyVeh, side) then
            originalNeonLightState = 1
        else
            originalNeonLightState = 0
        end

        originalNeonLightSide = side
    end

    SetVehicleNeonLightEnabled(plyVeh, side, enabled)
end

function PreviewNeonColour(r, g, b)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if originalNeonColourR == nil and originalNeonColourG == nil and originalNeonColourB == nil then
        originalNeonColourR, originalNeonColourG, originalNeonColourB = GetVehicleNeonLightsColour(plyVeh)
    end

    SetVehicleNeonLightsColour(plyVeh, r, g, b)
end

function PreviewXenonColour(colour)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if originalXenonColour == nil then
        originalXenonColour = GetVehicleHeadlightsColour(plyVeh)
    end

    SetVehicleLights(plyVeh, 2)
    SetVehicleHeadlightsColour(plyVeh, colour)
end

function PreviewOldLivery(liv)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalOldLivery == nil then
        originalOldLivery = GetVehicleLivery(plyVeh)
    end

    SetVehicleLivery(plyVeh, tonumber(liv))
end

function PreviewPlateIndex(index)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    if originalPlateIndex == nil then
        originalPlateIndex = GetVehicleNumberPlateTextIndex(plyVeh)
    end

    SetVehicleNumberPlateTextIndex(plyVeh, tonumber(index))
end

function ApplyMod(categoryID, modID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    if categoryID == 18 then
        ToggleVehicleMod(plyVeh, categoryID, modID)
    elseif categoryID == 11 or categoryID == 12 or categoryID== 13 or categoryID == 15 or categoryID == 16 then --Performance Upgrades
        originalCategory = categoryID
        originalMod = modID

        SetVehicleMod(plyVeh, categoryID, modID)
    else
        originalCategory = categoryID
        originalMod = modID

        SetVehicleMod(plyVeh, categoryID, modID)
    end
end

function ApplyExtra(extraID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isEnabled = IsVehicleExtraTurnedOn(plyVeh, extraID)
    if isEnabled == 1 then
        SetVehicleExtra(plyVeh, tonumber(extraID), 1)
        SetVehiclePetrolTankHealth(plyVeh,4000.0)
    else
        SetVehicleExtra(plyVeh, tonumber(extraID), 0)
        SetVehiclePetrolTankHealth(plyVeh,4000.0)
    end
end

function ApplyPreset(presetId)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleColourCombination(plyVeh, presetId)

    originalPrimaryColour, originalSecondaryColour = GetVehicleColours(plyVeh)
    originalPearlescentColour, originalWheelColour = GetVehicleExtraColours(plyVeh)
end

function ApplyWindowTint(windowTintID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    originalWindowTint = windowTintID

    SetVehicleWindowTint(plyVeh, windowTintID)
end

function ApplyColour(paintType, paintCategory, paintID)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(plyVeh)
    local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(plyVeh)

    if paintType == 0 then --Primary Colour
        if paintCategory == 1 then --Metallic Paint
            SetVehicleColours(plyVeh, paintID, vehSecondaryColour)
            -- SetVehicleExtraColours(plyVeh, paintID, vehWheelColour)
            SetVehicleExtraColours(plyVeh, originalPearlescentColour, vehWheelColour)
            originalPrimaryColour = paintID
            -- originalPearlescentColour = paintID
        else
            SetVehicleColours(plyVeh, paintID, vehSecondaryColour)
            originalPrimaryColour = paintID
        end
    elseif paintType == 1 then --Secondary Colour
        SetVehicleColours(plyVeh, vehPrimaryColour, paintID)
        originalSecondaryColour = paintID
    elseif paintType == 2 then --Pearlescent Colour
        SetVehicleExtraColours(plyVeh, paintID, vehWheelColour)
        originalPearlescentColour = paintID
    elseif paintType == 3 then --Wheel Colour
        SetVehicleExtraColours(plyVeh, vehPearlescentColour, paintID)
        originalWheelColour = paintID
    elseif paintType == 4 then --Dash Colour
        SetVehicleDashboardColour(plyVeh, paintID)
        originalDashColour = paintID
    elseif paintType == 5 then --Interior Colour
        SetVehicleInteriorColour(plyVeh, paintID)
        originalInterColour = paintID
    end
end

function ApplyWheel(categoryID, wheelID, wheelType)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local doesHaveCustomWheels = GetVehicleModVariation(plyVeh, 23)

    originalWheelCategory = categoryID
    originalWheel = wheelID
    originalWheelType = wheelType

    SetVehicleWheelType(plyVeh, wheelType)
    SetVehicleMod(plyVeh, categoryID, wheelID, doesHaveCustomWheels)
    
    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        SetVehicleMod(plyVeh, 24, wheelID, doesHaveCustomWheels)
    end
end

function RestoreOriginalColourPresets()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleColours(plyVeh, originalPrimaryColour, originalSecondaryColour)
    SetVehicleExtraColours(plyVeh, originalPearlescentColour, originalWheelColour)

    originalPrimaryColour = nil
    originalSecondaryColour = nil
    originalPearlescentColour = nil
    originalWheelColour = nil
end

function PreviewColourPresets(presetId)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    SetVehicleModKit(plyVeh, 0)

    if originalPrimaryColour == nil and originalSecondaryColour == nil and originalPearlescentColour == nil and originalWheelColour == nil then
        originalPrimaryColour, originalSecondaryColour = GetVehicleColours(plyVeh)
        originalPearlescentColour, originalWheelColour = GetVehicleExtraColours(plyVeh)
    end

    SetVehicleColourCombination(plyVeh, presetId)
end

function checkVehiclePresets(model)
    for tmodel, tpresets in pairs(vehiclePresets) do
        local thash = GetHashKey(tmodel)

        if tostring(thash) == tostring(model) then
            return tpresets
        end
    end
end

function ApplyCustomWheel(state)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    SetVehicleMod(plyVeh, 23, GetVehicleMod(plyVeh, 23), state)
    
    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        SetVehicleMod(plyVeh, 24, GetVehicleMod(plyVeh, 24), state)
    end
end

function ApplyNeon(side, enabled)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    originalNeonLightState = enabled
    originalNeonLightSide = side

    SetVehicleNeonLightEnabled(plyVeh, side, enabled)
end

function ApplyNeonColour(r, g, b)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    originalNeonColourR = r
    originalNeonColourG = g
    originalNeonColourB = b

    SetVehicleNeonLightsColour(plyVeh, r, g, b)
end

function ApplyXenonLights(category, state)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    ToggleVehicleMod(plyVeh, category, state)
end

function ApplyXenonColour(colour)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    originalXenonColour = colour

    SetVehicleHeadlightsColour(plyVeh, colour)
end

function ApplyOldLivery(liv)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    originalOldLivery = liv

    SetVehicleLivery(plyVeh, liv)
end

function ApplyPlateIndex(index)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    originalPlateIndex = index
    SetVehicleNumberPlateTextIndex(plyVeh, index)
end

function ApplyTyreSmoke(r, g, b)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    ToggleVehicleMod(plyVeh, 20, true)
    SetVehicleTyreSmokeColor(plyVeh, r, g, b)
end

function ExitBennys()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)

    saveVehicle()

    DisplayMenuContainer(false)

    FreezeEntityPosition(plyVeh, false)
    SetEntityCollision(plyVeh, true, true)

    SetTimeout(100, function()
        DestroyMenus()
    end)

    isPlyInBennys = false
end

RegisterNetEvent('np-bennys:enter_location')
AddEventHandler('np-bennys:enter_location', function(useID)
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        bennyHeading = 87.4
        if useID == 1 and not isPlyInBennys then -- Harmony 
            bennyHeading = 0.0
            enterLocation(bennyLocationHarmonyBay2)
        elseif useID == 2 and not isPlyInBennys then -- Bennys 
            bennyHeading = 177.05165
            enterLocation(bennysLocationBennysBusiness2)
        elseif useID == 4 and not isPlyInBennys then -- Underground 
            bennyHeading = 356.58505
            enterLocation(bennyLocationUnderground)
        elseif useID == 5 and not isPlyInBennys then -- Underground 
            bennyHeading = 86.821075
            enterLocation(bennyLocationDOC)
        elseif useID == 6 and not isPlyInBennys then -- Bennys
            bennyHeading = 90.5
            enterLocation(bennyLocationMRPD)
        elseif useID == 8 and not isPlyInBennys then -- PD Bennys
            bennyHeading = 160.64
            enterLocation(bennyLocation2)
        elseif useID == 9 and not isPlyInBennys then -- Tunershop
            bennyHeading = 0
            enterLocation(bennyLocationTunershop2)
        elseif useID == 10 and not isPlyInBennys then -- Pillbox 
            bennyHeading = 335.8677
            enterLocation(bennyLocationPillbox)
        elseif useID == 11 and not isPlyInBennys then -- Harmony 
            bennyHeading = 5
            enterLocation(bennyLocationHarmonyBay1)
        elseif useID == 12 and not isPlyInBennys then -- Hayes
            bennyHeading = 209.65313
            enterLocation(bennysLocationHayes)
        elseif useID == 14 and not isPlyInBennys then -- Dev
            print('bennys')
        elseif useID == 15 and not isPlyInBennys then -- MAF Racing
            bennyHeading = 263.6220703125
            enterLocation(bennyLocationIllegalShop)
        elseif useID == 16 and not isPlyInBennys then -- Sandy PD
            bennyHeading = 121.17162
            enterLocation(bennyLocationSandyPD)
        end
    end
end)

function enterLocation(locationsPos)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isMotorcycle = false

    SetVehicleModKit(plyVeh, 0)
    SetEntityCoords(plyVeh, locationsPos)
    SetEntityHeading(plyVeh, bennyHeading)
    FreezeEntityPosition(plyVeh, true)
    SetEntityCollision(plyVeh, false, true)

    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        isMotorcycle = true
    else
        isMotorcycle = false
    end

    InitiateMenus(isMotorcycle, GetVehicleBodyHealth(plyVeh))
    
    SetTimeout(100, function()
        if GetVehicleBodyHealth(plyVeh) < 1000.0 then
            DisplayMenu(true, "repairMenu")
        else
            DisplayMenu(true, "mainMenu")
        end
        
        DisplayMenuContainer(true)
        PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    end)

    isPlyInBennys = true
end

function enterLocationDev(locationsPos)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    local isMotorcycle = false

    SetVehicleModKit(plyVeh, 0)
    isDev = true

    -- SetEntityCollision(plyVeh, false, true)

    if GetVehicleClass(plyVeh) == 8 then --Motorcycle
        isMotorcycle = true
    else
        isMotorcycle = false
    end

    InitiateMenus(isMotorcycle, GetVehicleBodyHealth(plyVeh))

    SetTimeout(100, function()
        if GetVehicleBodyHealth(plyVeh) < 1000.0 then
            DisplayMenu(true, "repairMenu")
        else
            DisplayMenu(true, "mainMenu")
        end
        
        DisplayMenuContainer(true)
        PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    end)

    isPlyInBennys = true
end


function disableControls()
    DisableControlAction(1, 38, true) --Key: E
    DisableControlAction(1, 172, true) --Key: Up Arrow
    DisableControlAction(1, 173, true) --Key: Down Arrow
    DisableControlAction(1, 177, true) --Key: Backspace
    DisableControlAction(1, 176, true) --Key: Enter
    DisableControlAction(1, 71, true) --Key: W (veh_accelerate)
    DisableControlAction(1, 72, true) --Key: S (veh_brake)
    DisableControlAction(1, 34, true) --Key: A
    DisableControlAction(1, 35, true) --Key: D
    DisableControlAction(1, 75, true) --Key: F (veh_exit)

    if IsDisabledControlJustReleased(1, 172) then --Key: Arrow Up
        MenuScrollFunctionality("up")
        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    end

    if IsDisabledControlJustReleased(1, 173) then --Key: Arrow Down
        MenuScrollFunctionality("down")
        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    end

    if IsDisabledControlJustReleased(1, 176) then --Key: Enter
        MenuManager(true)
        PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    end

    if IsDisabledControlJustReleased(1, 177) then --Key: Backspace
        MenuManager(false)
        PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    end
end

Citizen.CreateThread(function()
    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) then
            local plyPos = GetEntityCoords(plyPed)

            nearBridge = isNear(plyPos, bennyLocationUnderground, 3)

            if nearBridge then

                if not isPlyInBennys and nearBridge then
                    -- DrawMarker(21, bennyLocationUnderground.x, bennyLocationUnderground.y, bennyLocationUnderground.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                end

                if not isPlyInBennys then
                    -- Draw3DText(bennyLocationUnderground.x, bennyLocationUnderground.y, bennyLocationUnderground.z + 0.5, "[Press ~p~E~w~ - Enter Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustReleased(1, 38) then
                        -- TriggerEvent('np-bennys:enter_location', 3)
                    end
                else
                    disableControls()
                end
            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) then
            local plyPos = GetEntityCoords(plyPed)

            nearBridge = isNear(plyPos, bennyLocationBridge, 10)

            if nearBridge then

                if not isPlyInBennys and nearBridge then
                    -- DrawMarker(21, bennyLocationBridge.x, bennyLocationBridge.y, bennyLocationBridge.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                end

                if not isPlyInBennys then
                    -- Draw3DText(bennyLocationBridge.x, bennyLocationBridge.y, bennyLocationBridge.z + 0.5, "[Press ~p~E~w~ - Enter Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustReleased(1, 38) then
                        -- TriggerEvent('np-bennys:enter_location', 4)
                    end
                else
                    disableControls()
                end
            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) then
            local plyPos = GetEntityCoords(plyPed)

            nearDefault = isNear(plyPos, bennyLocation, 10) 

            if nearDefault then

                if not isPlyInBennys and nearDefault then
                    -- DrawMarker(21, bennyLocation.x, bennyLocation.y, bennyLocation.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                end

                if not isPlyInBennys then
                    -- Draw3DText(bennyLocation.x, bennyLocation.y, bennyLocation.z + 0.5, "[Press ~p~E~w~ - Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustReleased(1, 38) then
                        -- TriggerEvent('np-bennys:enter_location', 1)
                    end
                else
                    disableControls()
                end
            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) then
            local plyPos = GetEntityCoords(plyPed)

            nearDefault = isNear(plyPos, bennyLocation2, 10) 

            if nearDefault and exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'ems' then

                if not isPlyInBennys and nearDefault then
                    -- DrawMarker(21, bennyLocation2.x, bennyLocation2.y, bennyLocation2.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                end

                if not isPlyInBennys then
                    -- Draw3DText(bennyLocation2.x, bennyLocation2.y, bennyLocation2.z + 0.5, "[Press ~p~E~w~ - Police Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustReleased(1, 38) then
                        -- TriggerEvent('np-bennys:enter_location', 3)
                    end
                else
                    disableControls()
                end
            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) then
            local plyPos = GetEntityCoords(plyPed)

            nearDefault = isNear(plyPos, bennyLocationHarmonyBay1, 1) 


            if nearDefault or isDev == true then

                if not isPlyInBennys and nearDefault then
                    -- DrawMarker(21, bennyLocationHarmonyBay1.x, bennyLocationHarmonyBay1.y, bennyLocationHarmonyBay1.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                end

                if not isPlyInBennys then
                    -- Draw3DText(bennyLocationHarmonyBay1.x, bennyLocationHarmonyBay1.y, bennyLocationHarmonyBay1.z + 0.5, "[Press ~p~E~w~ - Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustReleased(1, 38) then
                        -- TriggerEvent('np-bennys:enter_location', 1)
                    end
                else
                    disableControls()
                end
            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) then
            local plyPos = GetEntityCoords(plyPed)

            nearDefault = isNear(plyPos, bennyLocationDOC, 5) 


            if nearDefault or isDev == true then

                if not isPlyInBennys and nearDefault then
                    -- DrawMarker(21, bennyLocationDOC.x, bennyLocationDOC.y, bennyLocationDOC.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                end

                if not isPlyInBennys then
                    -- Draw3DText(bennyLocationDOC.x, bennyLocationDOC.y, bennyLocationDOC.z + 0.5, "[Press ~p~E~w~ - Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustReleased(1, 38) then
                        -- TriggerEvent('np-bennys:enter_location', 1)
                    end
                else
                    disableControls()
                end
            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) then
            local plyPos = GetEntityCoords(plyPed)

            nearDefault = isNear(plyPos, bennyLocationTunershop2, 1) 


            if nearDefault or isDev == true then

                if not isPlyInBennys and nearDefault then
                    -- DrawMarker(21, bennyLocationTunershop2.x, bennyLocationTunershop2.y, bennyLocationTunershop2.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                end

                if not isPlyInBennys then
                    -- Draw3DText(bennyLocationTunershop2.x, bennyLocationTunershop2.y, bennyLocationTunershop2.z + 0.5, "[Press ~p~E~w~ - Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustReleased(1, 38) then
                        -- TriggerEvent('np-bennys:enter_location', 1)
                    end
                else
                    disableControls()
                end
            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) then
            local plyPos = GetEntityCoords(plyPed)

            nearDefault = isNear(plyPos, bennyLocationHarmonyBay2, 16) 


            if nearDefault or isDev == true then

                if not isPlyInBennys and nearDefault then
                    -- DrawMarker(21, bennyLocationHarmonyBay2.x, bennyLocationHarmonyBay2.y, bennyLocationHarmonyBay2.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                end

                if not isPlyInBennys then
                    -- Draw3DText(bennyLocationHarmonyBay2.x, bennyLocationHarmonyBay2.y, bennyLocationHarmonyBay2.z + 0.5, "[Press ~p~E~w~ - Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustReleased(1, 38) then
                        -- TriggerEvent('np-bennys:enter_location', 1)
                    end
                else
                    disableControls()
                end
            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

-- Bennys Bay 1 --

Citizen.CreateThread(function()
    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) then
            local plyPos = GetEntityCoords(plyPed)

            nearDefault = isNear(plyPos, bennysLocationHayes, 12) 


            if nearDefault or isDev == true then

                if not isPlyInBennys and nearDefault then
                    -- DrawMarker(21, bennysLocationHayes.x, bennysLocationHayes.y, bennysLocationHayes.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                end

                if not isPlyInBennys then
                    -- Draw3DText(bennysLocationHayes.x, bennysLocationHayes.y, bennysLocationHayes.z + 0.5, "[Press ~p~E~w~ - Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustReleased(1, 38) then
                        -- TriggerEvent('np-bennys:enter_location', 12)
                    end
                else
                    disableControls()
                end
            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

-- Illegal Shop --

Citizen.CreateThread(function()
    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) then
            local plyPos = GetEntityCoords(plyPed)

            nearDefault = isNear(plyPos, bennyLocationIllegalShop, 15) 

            if nearDefault or isDev == true then

                if not isPlyInBennys and nearDefault then
                    -- DrawMarker(21, bennyLocationIllegalShop.x, bennyLocationIllegalShop.y, bennyLocationIllegalShop.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                end

                if not isPlyInBennys then
                    -- Draw3DText(bennyLocationIllegalShop.x, bennyLocationIllegalShop.y, bennyLocationIllegalShop.z + 0.5, "[Press ~p~E~w~ - Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustReleased(1, 38) then
                        -- TriggerEvent('np-bennys:enter_location', 12)
                    end
                else
                    disableControls()
                end
            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

-- Sandy PD --

Citizen.CreateThread(function()
    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) then
            local plyPos = GetEntityCoords(plyPed)

            nearDefault = isNear(plyPos, bennyLocationSandyPD, 15) 

            if nearDefault or isDev == true then

                if not isPlyInBennys and nearDefault then
                    -- DrawMarker(21, bennyLocationSandyPD.x, bennyLocationSandyPD.y, bennyLocationSandyPD.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                end

                if not isPlyInBennys then
                    -- Draw3DText(bennyLocationSandyPD.x, bennyLocationSandyPD.y, bennyLocationSandyPD.z + 0.5, "[Press ~p~E~w~ - Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustReleased(1, 38) then
                        -- TriggerEvent('np-bennys:enter_location', 12)
                    end
                else
                    disableControls()
                end
            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

-- Public Repair --

Citizen.CreateThread(function()
    while true do 
        local plyPed = PlayerPedId()

        if IsPedInAnyVehicle(plyPed, false) then
            local plyPos = GetEntityCoords(plyPed)

            nearDefault = isNear(plyPos, bennyLocationPublic, 15) 

            if nearDefault or isDev == true then

                if not isPlyInBennys and nearDefault then
                    -- DrawMarker(21, bennyLocationPublic.x, bennyLocationPublic.y, bennyLocationPublic.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 148, 0, 211, 255, true, false, 2, true, nil, nil, false)
                end

                if not isPlyInBennys then
                    -- Draw3DText(bennyLocationPublic.x, bennyLocationPublic.y, bennyLocationPublic.z + 0.5, "[Press ~p~E~w~ - Benny's Motorworks]", 255, 255, 255, 255, 4, 0.45, true, true, true, true, 0, 0, 0, 0, 55)
                    if IsControlJustReleased(1, 38) then
                        -- TriggerEvent('np-bennys:enter_location', 12)
                    end
                else
                    disableControls()
                end
            else
                Wait(1000)
            end
        else
            Wait(2000)
        end

        Citizen.Wait(1)
    end
end)

--#[Event Handlers]#--
RegisterNetEvent("np-bennys:purchaseSuccessful")
AddEventHandler("np-bennys:purchaseSuccessful", function()
    isPurchaseSuccessful = true
    attemptingPurchase = false
end)

RegisterNetEvent("np-bennys:purchaseFailed")
AddEventHandler("np-bennys:purchaseFailed", function()
    isPurchaseSuccessful = false
    attemptingPurchase = false
end)

--#{Public Benny}#--

RegisterNetEvent("bennys:civ:repair:cl")
AddEventHandler('bennys:civ:repair:cl', function()
    local car = GetVehiclePedIsIn(PlayerPedId(), false)
    if car ~= 0 then
        FreezeEntityPosition(car, true)
        SetEntityCoords(car, -39.454944610596, -1053.0329589844, 28.403686523438)
        SetEntityHeading(GetPlayerPed(-1), 158.74015808105)
        local finished = exports["np-taskbar"]:taskBar(4000,"Repairing Engine",false,false,playerVeh)
        Citizen.Wait(1000)
        local finished = exports["np-taskbar"]:taskBar(3000,"Repairing Body",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("DoShortHudText", "Repair's complete !")
            SetVehicleFixed(car)
            SetVehicleDirtLevel(car, 0)
            SetVehicleDeformationFixed(car)
            SetVehicleUndriveable(car, false)
            FreezeEntityPosition(car, false)
        else
            FreezeEntityPosition(car, false)
        end
    end
end)