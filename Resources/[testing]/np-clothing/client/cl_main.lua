creatingCharacter, inZone, firstChar = false, false
cam, camOffset, headingToCam = -1, 2, GetEntityHeading(PlayerPedId())
zoneName = nil
previousSkinData, StoreBlips = {}, {}, {}
local ToggledVariations = {}
local HatProp, HatTexture, MaskProp, MaskPalette, MaskTexture, GlassesProp, GlassesProp, GlassesTexture, ShirtProp, ShirtTexture, BagProp, BagTexture, PantsProp, PantsTexture, ShoesProp, ShoesTexture = nil
    , nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
local CurrentScreenPosition = "middle"
local Transitioning = false
OriginalPosition = nil

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    InitMenu()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    DeleteBlips()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
    PlayerData.gang = GangInfo
end)

function InitMenu()
    TriggerServerEvent("np-clothes/loadPlayerSkin")
    CreateBlips()
    LoadAnims()
    if Config.UseTarget then
        DebugLog('target', 'Using target for shops and rooms.')
        Citizen.CreateThread(TargetClothing)
    else
        DebugLog('polyzones', 'Using polyzones for shops and rooms.')
        Citizen.CreateThread(PolyClothing)
    end
end


RegisterCommand('testy', function(source, args, RawCommand)
    print("succes")
    TriggerEvent("np-clothing:client:openMenu")
    
end)

-- [ Code ] --

-- [ Events ] --

AddEventHandler('onResourceStop', function()
    DeleteBlips()
end)

RegisterNetEvent('np-clothing:client:openMenu', function()
    openMenu({
        { menu = "character", label = "Character", selected = true },
        { menu = "clothing", label = "Features", selected = false },
        { menu = "accessoires", label = "Accessories", selected = false }
    }, true)
end)


RegisterNetEvent('np-clothing/client/getOutfits', function(Job, Grade)
    local LocalPlayer = exports["np-base"]:getModule("LocalPlayer")
    local gen = LocalPlayer:getCurrentCharacter().gender
    if gen == 1 then 
        Gender = "female" 
    else
        Gender = "male"
    end
    openMenu({
        { menu = "roomoutfits", label = "Presets", selected = true, outfits = Config.Outfits[Job][Gender][Grade] },
        { menu = "character", label = "Clothing", selected = false },
        { menu = "accessoires", label = "Accessories", selected = false }
    })
end)

RegisterNetEvent('np-clothes:client:CreateFirstCharacter', function()
    local LocalPlayer = exports["np-base"]:getModule("LocalPlayer")
    local gender = LocalPlayer:getCurrentCharacter().gender
    local skin = "mp_m_freemode_01"

    openMenu({
        { menu = "character", label = "Character", selected = true },
        { menu = "clothing", label = "Features", selected = false },
        { menu = "accessoires", label = "Accessories", selected = false }
    })

    if gender == 1 then
        skin = "mp_f_freemode_01"
    end

    ChangeToSkinNoUpdate(skin)
    SendNUIMessage({
        action = "ResetValues",
    })
end)

RegisterNetEvent("np-clothes:loadSkin", function(new, model, data)
    model = model ~= nil and tonumber(model) or false
    Citizen.CreateThread(function()
        LoadPlayerModel(model)
        SetPlayerModel(PlayerId(), model)
        SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)
        data = json.decode(data)
        TriggerEvent('np-clothing:client:loadPlayerClothing', data, PlayerPedId())
    end)
end)

RegisterNetEvent('np-clothing:client:loadPlayerClothing', function(data, ped)
    if ped == nil then ped = PlayerPedId() end

    for i = 0, 11 do
        SetPedComponentVariation(ped, i, 0, 0, 0)
    end

    for i = 0, 7 do
        ClearPedProp(ped, i)
    end

    -- Face
    if not data["facemix"] or not data["face2"] then
        data["facemix"] = Config.SkinData["facemix"]
        data["facemix"].shapeMix = data["facemix"].defaultShapeMix
        data["facemix"].skinMix = data["facemix"].defaultSkinMix
        data["face2"] = Config.SkinData["face2"]
    end

    SetPedHeadBlendData(ped, data["face"].item, data["face2"].item, nil, data["face"].texture, data["face2"].texture, nil
        , data["facemix"].shapeMix, data["facemix"].skinMix, nil, true)

    -- Pants
    SetPedComponentVariation(ped, 4, data["pants"].item, 0, 0)
    SetPedComponentVariation(ped, 4, data["pants"].item, data["pants"].texture, 0)

    -- Hair
    SetPedComponentVariation(ped, 2, data["hair"].item, 0, 0)
    SetPedHairColor(ped, data["hair"].texture, data["hair"].texture)

    -- Eyebrows
    SetPedHeadOverlay(ped, 2, data["eyebrows"].item, 1.0)
    SetPedHeadOverlayColor(ped, 2, 1, data["eyebrows"].texture, 0)

    -- Beard
    SetPedHeadOverlay(ped, 1, data["beard"].item, 1.0)
    SetPedHeadOverlayColor(ped, 1, 1, data["beard"].texture, 0)

    -- Blush
    SetPedHeadOverlay(ped, 5, data["blush"].item, 1.0)
    SetPedHeadOverlayColor(ped, 5, 1, data["blush"].texture, 0)

    -- Lipstick
    SetPedHeadOverlay(ped, 8, data["lipstick"].item, 1.0)
    SetPedHeadOverlayColor(ped, 8, 1, data["lipstick"].texture, 0)

    -- Makeup
    SetPedHeadOverlay(ped, 4, data["makeup"].item, 1.0)
    SetPedHeadOverlayColor(ped, 4, 1, data["makeup"].texture, 0)

    -- Ageing
    SetPedHeadOverlay(ped, 3, data["ageing"].item, 1.0)
    SetPedHeadOverlayColor(ped, 3, 1, data["ageing"].texture, 0)

    -- Arms
    SetPedComponentVariation(ped, 3, data["arms"].item, 0, 2)
    SetPedComponentVariation(ped, 3, data["arms"].item, data["arms"].texture, 0)

    -- T-Shirt
    SetPedComponentVariation(ped, 8, data["t-shirt"].item, 0, 2)
    SetPedComponentVariation(ped, 8, data["t-shirt"].item, data["t-shirt"].texture, 0)

    -- Vest
    SetPedComponentVariation(ped, 9, data["vest"].item, 0, 2)
    SetPedComponentVariation(ped, 9, data["vest"].item, data["vest"].texture, 0)

    -- Torso 2
    SetPedComponentVariation(ped, 11, data["torso2"].item, 0, 2)
    SetPedComponentVariation(ped, 11, data["torso2"].item, data["torso2"].texture, 0)

    -- Shoes
    SetPedComponentVariation(ped, 6, data["shoes"].item, 0, 2)
    SetPedComponentVariation(ped, 6, data["shoes"].item, data["shoes"].texture, 0)

    -- Mask
    SetPedComponentVariation(ped, 1, data["mask"].item, 0, 2)
    SetPedComponentVariation(ped, 1, data["mask"].item, data["mask"].texture, 0)

    -- Badge
    SetPedComponentVariation(ped, 10, data["decals"].item, 0, 2)
    SetPedComponentVariation(ped, 10, data["decals"].item, data["decals"].texture, 0)

    -- Accessory
    SetPedComponentVariation(ped, 7, data["accessory"].item, 0, 2)
    SetPedComponentVariation(ped, 7, data["accessory"].item, data["accessory"].texture, 0)

    -- Bag
    SetPedComponentVariation(ped, 5, data["bag"].item, 0, 2)
    SetPedComponentVariation(ped, 5, data["bag"].item, data["bag"].texture, 0)

    -- Hat
    if data["hat"].item ~= -1 and data["hat"].item ~= 0 then
        SetPedPropIndex(ped, 0, data["hat"].item, data["hat"].texture, true)
    else
        ClearPedProp(ped, 0)
    end

    -- Glass
    if data["glass"].item ~= -1 and data["glass"].item ~= 0 then
        SetPedPropIndex(ped, 1, data["glass"].item, data["glass"].texture, true)
    else
        ClearPedProp(ped, 1)
    end

    -- Ear
    if data["ear"].item ~= -1 and data["ear"].item ~= 0 then
        SetPedPropIndex(ped, 2, data["ear"].item, data["ear"].texture, true)
    else
        ClearPedProp(ped, 2)
    end

    -- Watch
    if data["watch"].item ~= -1 and data["watch"].item ~= 0 then
        SetPedPropIndex(ped, 6, data["watch"].item, data["watch"].texture, true)
    else
        ClearPedProp(ped, 6)
    end

    -- Bracelet
    if data["bracelet"].item ~= -1 and data["bracelet"].item ~= 0 then
        SetPedPropIndex(ped, 7, data["bracelet"].item, data["bracelet"].texture, true)
    else
        ClearPedProp(ped, 7)
    end

    if data["eye_color"].item ~= -1 and data["eye_color"].item ~= 0 then
        SetPedEyeColor(ped, data['eye_color'].item)
    else

    end

    if data["moles"].item ~= -1 and data["moles"].item ~= 0 then
        SetPedHeadOverlay(ped, 9, data['moles'].item, (data['moles'].texture / 10))
    else

    end

    SetPedFaceFeature(ped, 0, (data['nose_0'].item / 10))
    SetPedFaceFeature(ped, 1, (data['nose_1'].item / 10))
    SetPedFaceFeature(ped, 2, (data['nose_2'].item / 10))
    SetPedFaceFeature(ped, 3, (data['nose_3'].item / 10))
    SetPedFaceFeature(ped, 4, (data['nose_4'].item / 10))
    SetPedFaceFeature(ped, 5, (data['nose_5'].item / 10))
    SetPedFaceFeature(ped, 6, (data['eyebrown_high'].item / 10))
    SetPedFaceFeature(ped, 7, (data['eyebrown_forward'].item / 10))
    SetPedFaceFeature(ped, 8, (data['cheek_1'].item / 10))
    SetPedFaceFeature(ped, 9, (data['cheek_2'].item / 10))
    SetPedFaceFeature(ped, 10, (data['cheek_3'].item / 10))
    SetPedFaceFeature(ped, 11, (data['eye_opening'].item / 10))
    SetPedFaceFeature(ped, 12, (data['lips_thickness'].item / 10))
    SetPedFaceFeature(ped, 13, (data['jaw_bone_width'].item / 10))
    SetPedFaceFeature(ped, 14, (data['jaw_bone_back_lenght'].item / 10))
    SetPedFaceFeature(ped, 15, (data['chimp_bone_lowering'].item / 10))
    SetPedFaceFeature(ped, 16, (data['chimp_bone_lenght'].item / 10))
    SetPedFaceFeature(ped, 17, (data['chimp_bone_width'].item / 10))
    SetPedFaceFeature(ped, 18, (data['chimp_hole'].item / 10))
    SetPedFaceFeature(ped, 19, (data['neck_thikness'].item / 10))
    Config.SkinData = data
end)

RegisterNetEvent('np-clothing/client/loadOutfit', function(oData)
    local ped = PlayerPedId()

    data = oData.outfitData

    if typeof(data) ~= "table" then data = json.decode(data) end

    for k, v in pairs(data) do
        Config.SkinData[k].item = data[k].item
        Config.SkinData[k].texture = data[k].texture

        -- To secure backwards compability for facemixing
        if data[k].shapeMix then
            Config.SkinData[k].shapeMix = data[k].shapeMix
        end

        if data[k].skinMix then
            Config.SkinData[k].skinMix = data[k].skinMix
        end
    end

    -- Pants
    if data["pants"] ~= nil then
        SetPedComponentVariation(ped, 4, data["pants"].item, data["pants"].texture, 0)
    end

    -- Arms
    if data["arms"] ~= nil then
        SetPedComponentVariation(ped, 3, data["arms"].item, data["arms"].texture, 0)
    end

    -- T-Shirt
    if data["t-shirt"] ~= nil then
        SetPedComponentVariation(ped, 8, data["t-shirt"].item, data["t-shirt"].texture, 0)
    end

    -- Vest
    if data["vest"] ~= nil then
        SetPedComponentVariation(ped, 9, data["vest"].item, data["vest"].texture, 0)
    end

    -- Torso 2
    if data["torso2"] ~= nil then
        SetPedComponentVariation(ped, 11, data["torso2"].item, data["torso2"].texture, 0)
    end

    -- Shoes
    if data["shoes"] ~= nil then
        SetPedComponentVariation(ped, 6, data["shoes"].item, data["shoes"].texture, 0)
    end

    -- Bag
    if data["bag"] ~= nil then
        SetPedComponentVariation(ped, 5, data["bag"].item, data["bag"].texture, 0)
    end

    -- Badge
    if data["decals"] ~= nil then
        SetPedComponentVariation(ped, 10, data["decals"].item, data["decals"].texture, 0)
    end

    -- Accessory
    if data["accessory"] ~= nil then
        if Mercy.Functions.GetPlayerData().metadata["tracker"] then
            SetPedComponentVariation(ped, 7, 13, 0, 0)
        else
            SetPedComponentVariation(ped, 7, data["accessory"].item, data["accessory"].texture, 0)
        end
    else
        if Mercy.Functions.GetPlayerData().metadata["tracker"] then
            SetPedComponentVariation(ped, 7, 13, 0, 0)
        else
            SetPedComponentVariation(ped, 7, -1, 0, 2)
        end
    end

    -- Mask
    if data["mask"] ~= nil then
        SetPedComponentVariation(ped, 1, data["mask"].item, data["mask"].texture, 0)
    end

    -- Bag
    if data["bag"] ~= nil then
        SetPedComponentVariation(ped, 5, data["bag"].item, data["bag"].texture, 0)
    end

    -- Hat
    if data["hat"] ~= nil then
        if data["hat"].item ~= -1 and data["hat"].item ~= 0 then
            SetPedPropIndex(ped, 0, data["hat"].item, data["hat"].texture, true)
        else
            ClearPedProp(ped, 0)
        end
    end

    -- Glass
    if data["glass"] ~= nil then
        if data["glass"].item ~= -1 and data["glass"].item ~= 0 then
            SetPedPropIndex(ped, 1, data["glass"].item, data["glass"].texture, true)
        else
            ClearPedProp(ped, 1)
        end
    end

    -- Ear
    if data["ear"] ~= nil then
        if data["ear"].item ~= -1 and data["ear"].item ~= 0 then
            SetPedPropIndex(ped, 2, data["ear"].item, data["ear"].texture, true)
        else
            ClearPedProp(ped, 2)
        end
    end

    if oData.outfitName ~= nil then
        TriggerEvent("DoLongHudText", "You have chosen " .. oData.outfitName .. "! Press Confirm to confirm outfit.") 
    end
end)

RegisterNetEvent("np-clothes/client/loadPlayerSkin", function()
    TriggerServerEvent('np-clothes/loadPlayerSkin')
end)

-- [ NUI Callbacks ] --

RegisterNUICallback('selectOutfit', function(data, cb)
    TriggerEvent('np-clothing/client/loadOutfit', data)
    cb('ok')
end)

-- [ Scroll in / out ] --

function GetCurrentCamPosition(camPos, ScreenPosition)
    OriginalPosition = OriginalPosition == nil and camPos or OriginalPosition
    if ScreenPosition ~= CurrentScreenPosition then -- If the position is different than the current position
        CurrentScreenPosition = ScreenPosition
      
        local ScreenMultiplier = CurrentScreenPosition == "top" and 0.5 or CurrentScreenPosition == "middle" and 0.0 or CurrentScreenPosition == "bottom" and -0.5
        camPos = vector3(OriginalPosition.x, OriginalPosition.y, OriginalPosition.z)
        camPos = vector3(camPos.x, camPos.y, camPos.z + ScreenMultiplier) 
    end
    return camPos
end

RegisterNUICallback('zoomOut', function(data, cb)
    if not Transitioning then
        Transitioning = true
        local pedPos = GetEntityCoords(PlayerPedId())
        local camPos = GetCamCoord(cam)
        local newCamPos = GetCurrentCamPosition(camPos, data.position)

        -- Cam Zoom
        camOffset = camOffset + 0.75
        if camOffset >= 3.0 then camOffset = 3.0 end

        -- Set Cam Params
        local PedCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), -0.25, 0.0, 0.0)
        local cx, cy = GetPositionByRelativeHeading(PlayerPedId(), headingToCam, camOffset)
        SetCamParams(cam, cx, cy, newCamPos.z, 0.0, 0.0, 0.0, 40.0, 750, 0, 0, 2)
        PointCamAtCoord(cam, pedPos.x, pedPos.y, newCamPos.z)

        Citizen.SetTimeout(750, function()
            Transitioning = false
        end)
    end
    cb('ok')
end)

RegisterNUICallback('zoomIn', function(data, cb)
    if not Transitioning then
        Transitioning = true
        local pedPos = GetEntityCoords(PlayerPedId())
        local camPos = GetCamCoord(cam)
        local newCamPos = GetCurrentCamPosition(camPos, data.position)

        -- Cam Zoom
        camOffset = camOffset - 0.75
        if camOffset <= 0.0 then camOffset = 3.0 end

        -- Set Cam Params
        local PedCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), -0.25, 0.0, 0.0)
        local cx, cy = GetPositionByRelativeHeading(PlayerPedId(), headingToCam, camOffset)
        SetCamParams(cam, cx, cy, newCamPos.z, 0.0, 0.0, 0.0, 40.0, 750, 0, 0, 2)
        PointCamAtCoord(cam, pedPos.x, pedPos.y, newCamPos.z)

        Citizen.SetTimeout(750, function()
            Transitioning = false
        end)
    end
    cb('ok')
end)

RegisterNUICallback('rotatePedRight', function(_, cb)
    local ped = PlayerPedId()
    local Heading = GetEntityHeading(ped)
    SetEntityHeading(ped, Heading + 5)
    cb('ok')
end)

RegisterNUICallback('rotatePedLeft', function(_, cb)
    local ped = PlayerPedId()
    local Heading = GetEntityHeading(ped)
    SetEntityHeading(ped, Heading - 5)
    cb('ok')
end)

RegisterNUICallback('TrackerError', function(_, cb)
    TriggerEvent("DoLongHudText", "You can't remove your ankle bracelet..", 2) 
    cb('ok')
end)

RegisterNUICallback('saveOutfit', function(data, cb)
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    TriggerServerEvent('np-clothes/saveOutfit', data.outfitName, model, Config.SkinData)
    cb('ok')
end)

RegisterNUICallback('resetOutfit', function(_, cb)
    TriggerServerEvent("np-clothes/loadPlayerSkin")
    Config.SkinData = json.decode(previousSkinData)
    previousSkinData = {}
    cb('ok')
end)

RegisterNUICallback('Close', function(_, cb)
    SetNuiFocus(false, false)
    creatingCharacter = false
    disableCam()
    FreezeEntityPosition(PlayerPedId(), false)
    cb('ok')
end)

RegisterNUICallback('getCatergoryItems', function(data, cb)
    cb(Config.Menus[data.category])
end)

RegisterNUICallback('updateSkin', function(data, cb)
    ChangeVariation(data)
    cb('ok')
end)

RegisterNUICallback('updateSkinOnInput', function(data, cb)
    ChangeVariation(data)
    cb('ok')
end)

RegisterNUICallback('removeOutfit', function(data, cb)
    TriggerServerEvent('np-clothing/server/removeOutfit', data.outfitName, data.outfitId)
    TriggerEvent("DoLongHudText", "You have deleted your" .. data.outfitName .. " outfit!", 2) 
    cb('ok')
end)

RegisterNUICallback('toggleVariation', function(data, cb)
    ToggledVariations[data.variationId] = not ToggledVariations[data.variationId]
    local Ped = PlayerPedId()
    local ClothingData = {}
    LoadAnims()
    DoAnimation(data.variationId)
    if data.variationId == 'hat' then
        if ToggledVariations[data.variationId] then
            HatProp = GetPedPropIndex(Ped, 0)
            HatTexture = GetPedPropTextureIndex(Ped, 0)
            ClothingData = { outfitData = { ["hat"] = { item = -1, texture = 0 } } }
        else
            ClothingData = { outfitData = { ["hat"] = { item = HatProp, texture = HatTexture } } }
        end
    elseif data.variationId == 'mask' then
        if ToggledVariations[data.variationId] then
            MaskProp = GetPedDrawableVariation(Ped, 1)
            MaskPalette = GetPedPaletteVariation(Ped, 1)
            MaskTexture = GetPedTextureVariation(Ped, 1)
            ClothingData = { outfitData = { ["mask"] = { item = -1, texture = 0 } } }
        else
            ClothingData = { outfitData = { ["mask"] = { item = MaskProp, texture = MaskTexture } } }
        end
    elseif data.variationId == 'glasses' then
        if ToggledVariations[data.variationId] then
            GlassesProp = GetPedPropIndex(Ped, 1)
            GlassesTexture = GetPedPropTextureIndex(Ped, 1)
            ClothingData = { outfitData = { ["glass"] = { item = -1, texture = 0 } } }
        else
            ClothingData = { outfitData = { ["glass"] = { item = GlassesProp, texture = GlassesTexture } } }
        end
    elseif data.variationId == 'shirt' then
        if ToggledVariations[data.variationId] then
            ShirtProp = GetPedDrawableVariation(Ped, 11)
            ShirtTexture = GetPedTextureVariation(Ped, 11)
            ClothingData = { outfitData = { ["torso2"] = { item = -1, texture = 0 } } }
        else
            ClothingData = { outfitData = { ["torso2"] = { item = ShirtProp, texture = ShirtTexture } } }
        end
    elseif data.variationId == 'bag' then
        if ToggledVariations[data.variationId] then
            BagProp = GetPedDrawableVariation(Ped, 5)
            BagTexture = GetPedTextureVariation(Ped, 5)
            ClothingData = { outfitData = { ["bag"] = { item = -1, texture = 0 } } }
        else
            ClothingData = { outfitData = { ["bag"] = { item = BagProp, texture = BagTexture } } }
        end
    elseif data.variationId == 'pants' then
        if ToggledVariations[data.variationId] then
            PantsProp = GetPedDrawableVariation(Ped, 4)
            PantsTexture = GetPedTextureVariation(Ped, 4)
            ClothingData = { outfitData = { ["pants"] = { item = -1, texture = 0 } } }
        else
            ClothingData = { outfitData = { ["pants"] = { item = PantsProp, texture = PantsTexture } } }
        end
    elseif data.variationId == 'shoes' then
        if ToggledVariations[data.variationId] then
            ShoesProp = GetPedDrawableVariation(Ped, 6)
            ShoesTexture = GetPedTextureVariation(Ped, 6)
            ClothingData = { outfitData = { ["shoes"] = { item = -1, texture = 0 } } }
        else
            ClothingData = { outfitData = { ["shoes"] = { item = ShoesProp, texture = ShoesTexture } } }
        end
    end
    TriggerEvent('np-clothing/client/loadOutfit', ClothingData)
    cb('ok')
end)

RegisterNUICallback('setCurrentPed', function(data, cb)
    local LocalPlayer = exports["np-base"]:getModule("LocalPlayer")
    local gender = LocalPlayer:getCurrentCharacter().gender

    if gender == 0 then
        cb(Config.ManPlayerModels[data.ped])
        ChangeToSkinNoUpdate(Config.ManPlayerModels[data.ped])
    else
        cb(Config.WomanPlayerModels[data.ped])
        ChangeToSkinNoUpdate(Config.WomanPlayerModels[data.ped])
    end
end)

RegisterNUICallback('saveClothing', function(Data, cb)
    SaveSkin(Data.IsAdmin)
    cb('ok')
end)
