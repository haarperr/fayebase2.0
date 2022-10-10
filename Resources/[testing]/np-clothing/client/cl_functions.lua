-- [ Code ] --

-- [ Functions ] --

function DebugLog(Part, Message)
    if Config.Debug then
        print("[" .. GetCurrentResourceName() .. ":" .. Part .. "]: " .. Message)
    end
end

function TargetClothing()
    -- Stores
    for i = 1, #Config.Stores do
        local TargetOptions = {}
        local Store = Config.Stores[i]

        if Store['Type'] == 'barber' then
            TargetOptions = {
                TargetAction = function()
                    openMenu({
                        { menu = "clothing", label = "Hair", selected = true },
                    })
                end,
                icon = "fas fa-chair-office",
                label = "Barber",
            }
        elseif Store['Type'] == 'clothing' then
            TargetOptions = {
                TargetAction = function()
                    openMenu({
                        { menu = "character", label = "Clothing", selected = true },
                        { menu = "accessoires", label = "Accessories", selected = false }
                    })
                end,
                icon = "fas fa-clothes-hanger",
                label = "Clothing Store",
            }
        elseif Store['Type'] == 'surgeon' then
            TargetOptions = {
                TargetAction = function()
                    openMenu({
                        { menu = "clothing", label = "Features", selected = true },
                    })
                end,
                icon = "fas fa-scalpel",
                label = "Plastic Surgeon",
            }
        end

        exports['np-target']:AddBoxZone(Store['Type'] .. i, Store['Coords'], Store['Length'], Store['Width'], {
            name = Store['Type'] .. i,
            debugPoly = false,
            minZ = Store['Coords'].z - 1,
            maxZ = Store['Coords'].z + 1,
        }, {
            options = {
                {
                    type = "client",
                    action = TargetOptions.TargetAction,
                    icon = TargetOptions.icon,
                    label = TargetOptions.label,
                },
            },
            distance = 3
        })
    end

    -- Clothing Rooms
    for i = 1, #Config.ClothingRooms do
        local Room = Config.ClothingRooms[i]
        local TargetAction = nil

        if Room['IsGang'] then
            TargetAction = function()
                local Grade = PlayerData.gang.grade.level
                TriggerEvent('np-clothing/client/getOutfits', Room['Job'], Grade)
            end
        else
            TargetAction = function()
                local Grade = PlayerData.job.grade.level
                TriggerEvent('np-clothing/client/getOutfits', Room['Job'], Grade)
            end
        end

        exports['np-target']:AddBoxZone('clothing_' .. Room['Job'] .. i, Room['Coords'], Room['Length'], Room['Width'],
            {
                name = 'clothing_' .. Room['Job'] .. i,
                debugPoly = false,
                minZ = Room['Coords'].z - 2,
                maxZ = Room['Coords'].z + 2,
            }, {
            options = {
                {
                    type = "client",
                    action = TargetAction,
                    icon = "fas fa-sign-in-alt",
                    label = "Clothing",
                    job = Room['Job']
                },
            },
            distance = 3
        })
    end
end

function PolyClothing()
    -- PolyZones
    local StoreZones = {}
    local RoomZones = {}

    -- Create  Store Zones
    for i = 1, #Config.Stores do
        local Store = Config.Stores[i]
        StoreZones[#StoreZones + 1] = BoxZone:Create(
            Store['Coords'],
            Store['Length'],
            Store['Width'], {
            name = Store['Type'],
            minZ = Store['Coords'].z - 2,
            maxZ = Store['Coords'].z + 2,
            debugPoly = false,
        })
    end

    -- Create Clothing Room Zones
    for i = 1, #Config.ClothingRooms do
        local Room = Config.ClothingRooms[i]
        RoomZones[#RoomZones + 1] = BoxZone:Create(
            Room['Coords'],
            Room['Length'],
            Room['Width'], {
            name = 'ClothingRooms_' .. i,
            minZ = Room['Coords'].z - 2,
            maxZ = Room['Coords'].z + 2,
            debugPoly = false,
        })
    end

    -- Zone in/out Check
    local StoreCombo = ComboZone:Create(StoreZones, { name = "StoreCombo", debugPoly = false })
    local RoomCombo = ComboZone:Create(RoomZones, { name = "RoomCombo", debugPoly = false })

    StoreCombo:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            zoneName = zone.name
            inZone = true
            if zoneName == 'surgeon' then
                exports["np-ui"]:showInteraction(("[E] %s"):format("Plastic Surgery"))
            elseif zoneName == 'clothing' then
                exports["np-ui"]:showInteraction(("[E] %s"):format("Clothing Shop"))
            elseif zoneName == 'barber' then
                exports["np-ui"]:showInteraction(("[E] %s"):format("Barber"))
            end
        else
            inZone = false
            exports["np-ui"]:hideInteraction()
        end
    end)

    RoomCombo:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            local job = exports["isPed"]:isPed("myjob")
            local ZoneId = tonumber(Mercy.Shared.SplitStr(zone.name, "_")[2])
            local JobName = Config.ClothingRooms[ZoneId]['IsGang'] and job
            if (JobName == Config.ClothingRooms[ZoneId]['Job']) then
                zoneName = ZoneId
                inZone = true
                exports["np-ui"]:showInteraction(("[E] %s"):format("Clothing Shop"))
            end
        else
            inZone = false
            exports['np-ui']:hideInteraction()
        end
    end)

    Wait(1000)
    while true do
        local Sleep = 1000
        if inZone then
            Sleep = 5
            if zoneName == 'surgeon' then
                if IsControlJustReleased(0, 38) then
                    openMenu({
                        { menu = "clothing", label = "Features", selected = true },
                    })
                end
            elseif zoneName == 'clothing' then
                if IsControlJustReleased(0, 38) then
                    openMenu({
                        { menu = "character", label = "Clothing", selected = true },
                        { menu = "accessoires", label = "Accessories", selected = false }
                    })
                end
            elseif zoneName == 'barber' then
                if IsControlJustReleased(0, 38) then
                    openMenu({
                        { menu = "clothing", label = "Hair", selected = true },
                    })
                end
            else
                if IsControlJustReleased(0, 38) then
                    local Room = Config.ClothingRooms[zoneName]
                    local Grade = Room['IsGang'] and PlayerData.gang.grade.level or PlayerData.job.grade.level
                    TriggerEvent('np-clothing/client/getOutfits', Room['Job'], Grade)
                end
            end
        else
            Sleep = 1000
        end
        Wait(Sleep)
    end
end

function CreateBlips()
    for i = 1, #Config.Stores do
        local Store = Config.Stores[i]
        local Blip = AddBlipForCoord(Store.coords)
        SetBlipSprite(Blip, Store['BlipSettings']['Sprite'])
        SetBlipColour(Blip, Store['BlipSettings']['Color'])
        SetBlipScale(Blip, 0.7)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Store['BlipSettings']['Label'])
        EndTextCommandSetBlipName(Blip)
        StoreBlips[#StoreBlips + 1] = Blip
    end
    DebugLog('blips', 'Successfully created blips.')
end

function DeleteBlips()
    for i = 1, #StoreBlips do
        RemoveBlip(StoreBlips[i])
    end
    DebugLog('blips', 'Successfully deleted blips.')
end

function GetPositionByRelativeHeading(ped, head, dist)
    local pedPos = GetEntityCoords(PlayerPedId())

    local finPosx = pedPos.x + math.cos(head * (math.pi / 180)) * dist
    local finPosy = pedPos.y + math.sin(head * (math.pi / 180)) * dist

    return finPosx, finPosy
end

function GetMaxValues()
    maxModelValues = {
        ["arms"]                 = { type = "character", item = 0, texture = 0 },
        ["eye_color"]            = { type = "hair", item = 0, texture = 0 },
        ["t-shirt"]              = { type = "character", item = 0, texture = 0 },
        ["torso2"]               = { type = "character", item = 0, texture = 0 },
        ["pants"]                = { type = "character", item = 0, texture = 0 },
        ["shoes"]                = { type = "character", item = 0, texture = 0 },
        ["face"]                 = { type = "character", item = 0, texture = 0 },
        ["face2"]                = { type = "character", item = 0, texture = 0 },
        ["facemix"]              = { type = "character", shapeMix = 0, skinMix = 0 },
        ["vest"]                 = { type = "character", item = 0, texture = 0 },
        ["accessory"]            = { type = "character", item = 0, texture = 0 },
        ["decals"]               = { type = "character", item = 0, texture = 0 },
        ["bag"]                  = { type = "character", item = 0, texture = 0 },
        ["moles"]                = { type = "hair", item = 0, texture = 0 },
        ["hair"]                 = { type = "hair", item = 0, texture = 0 },
        ["eyebrows"]             = { type = "hair", item = 0, texture = 0 },
        ["beard"]                = { type = "hair", item = 0, texture = 0 },
        ["eye_opening"]          = { type = "hair", id = 1 },
        ["jaw_bone_width"]       = { type = "hair", item = 0, texture = 0 },
        ["jaw_bone_back_lenght"] = { type = "hair", item = 0, texture = 0 },
        ["lips_thickness"]       = { type = "hair", item = 0, texture = 0 },
        ["cheek_1"]              = { type = "hair", item = 0, texture = 0 },
        ["cheek_2"]              = { type = "hair", item = 0, texture = 0 },
        ["cheek_3"]              = { type = "hair", item = 0, texture = 0 },
        ["eyebrown_high"]        = { type = "hair", item = 0, texture = 0 },
        ["eyebrown_forward"]     = { type = "hair", item = 0, texture = 0 },
        ["nose_0"]               = { type = "hair", item = 0, texture = 0 },
        ["nose_1"]               = { type = "hair", item = 0, texture = 0 },
        ["nose_2"]               = { type = "hair", item = 0, texture = 0 },
        ["nose_3"]               = { type = "hair", item = 0, texture = 0 },
        ["nose_4"]               = { type = "hair", item = 0, texture = 0 },
        ["nose_5"]               = { type = "hair", item = 0, texture = 0 },
        ["chimp_bone_lowering"]  = { type = "hair", item = 0, texture = 0 },
        ["chimp_bone_lenght"]    = { type = "hair", item = 0, texture = 0 },
        ["chimp_bone_width"]     = { type = "hair", item = 0, texture = 0 },
        ["chimp_hole"]           = { type = "hair", item = 0, texture = 0 },
        ["neck_thikness"]        = { type = "hair", item = 0, texture = 0 },
        ["blush"]                = { type = "hair", item = 0, texture = 0 },
        ["lipstick"]             = { type = "hair", item = 0, texture = 0 },
        ["makeup"]               = { type = "hair", item = 0, texture = 0 },
        ["ageing"]               = { type = "hair", item = 0, texture = 0 },
        ["mask"]                 = { type = "accessoires", item = 0, texture = 0 },
        ["hat"]                  = { type = "accessoires", item = 0, texture = 0 },
        ["glass"]                = { type = "accessoires", item = 0, texture = 0 },
        ["ear"]                  = { type = "accessoires", item = 0, texture = 0 },
        ["watch"]                = { type = "accessoires", item = 0, texture = 0 },
        ["bracelet"]             = { type = "accessoires", item = 0, texture = 0 },

    }
    local ped = PlayerPedId()
    for k, v in pairs(Config.ClothingCategories) do
        if v.type == "variation" then
            maxModelValues[k].item = GetNumberOfPedDrawableVariations(ped, v.id)
            maxModelValues[k].texture = GetNumberOfPedTextureVariations(ped, v.id, GetPedDrawableVariation(ped, v.id)) -
                1
        end

        if v.type == "hair" then
            maxModelValues[k].item = GetNumberOfPedDrawableVariations(ped, v.id)
            maxModelValues[k].texture = 45
        end

        if v.type == "mask" then
            maxModelValues[k].item = GetNumberOfPedDrawableVariations(ped, v.id)
            maxModelValues[k].texture = GetNumberOfPedTextureVariations(ped, v.id, GetPedDrawableVariation(ped, v.id))
        end

        if v.type == "face" then
            maxModelValues[k].item = 45
            maxModelValues[k].texture = 15
        end

        if v.type == "face2" then
            maxModelValues[k].item = 45
            maxModelValues[k].texture = 15
        end

        if v.type == "facemix" then
            maxModelValues[k].shapeMix = 10
            maxModelValues[k].skinMix = 10
        end

        if v.type == "ageing" then
            maxModelValues[k].item = GetNumHeadOverlayValues(v.id)
            maxModelValues[k].texture = 0
        end

        if v.type == "overlay" then
            maxModelValues[k].item = GetNumHeadOverlayValues(v.id)
            maxModelValues[k].texture = 45
        end

        if v.type == "prop" then
            maxModelValues[k].item = GetNumberOfPedPropDrawableVariations(ped, v.id)
            maxModelValues[k].texture = GetNumberOfPedPropTextureVariations(ped, v.id, GetPedPropIndex(ped, v.id))
        end

        if v.type == "eye_color" then
            maxModelValues[k].item = 31
            maxModelValues[k].texture = 0
        end

        if v.type == "moles" then
            maxModelValues[k].item = GetNumHeadOverlayValues(9) - 1
            maxModelValues[k].texture = 10
        end

        if v.type == "nose" then
            maxModelValues[k].item = 30
            maxModelValues[k].texture = 0
        end

        if v.type == "cheek" then
            maxModelValues[k].item = 30
            maxModelValues[k].texture = 0
        end

        if v.type == "chin" then
            maxModelValues[k].item = 30
            maxModelValues[k].texture = 0
        end

    end

    SendNUIMessage({
        action = "updateMax",
        maxValues = maxModelValues
    })
end

function openMenu(allowedMenus, Admin)
    previousSkinData = json.encode(Config.SkinData)
    creatingCharacter = true

    -- local PlayerData = Mercy.Functions.GetPlayerData() -- we dant have it in the framework maybe i'll add it later
    -- local trackerMeta = PlayerData.metadata["tracker"]

    GetMaxValues()
    SendNUIMessage({
        action = "Open",
        menus = allowedMenus,
        currentClothing = Config.SkinData,
        hasTracker = false,
        IsAdmin = Admin ~= nil and Admin or false,
        ShopPrice = Config.ClothingPrice
    })
    SetNuiFocus(true, true)
    SetCursorLocation(0.9, 0.25)

    FreezeEntityPosition(PlayerPedId(), true)

    EnableCam()
end

function EnableCam()
    -- Destroy Cam
    RenderScriptCams(0, 0, 750, 1, 0)
    DestroyCam(cam, false)

    -- Create Cam
    if not DoesCamExist(cam) then
        local PedCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), -0.5, 2.0, 0.0)
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamActive(cam, true)
        RenderScriptCams(1, 1, 750, 1, 0)
        SetCamCoord(cam, PedCoords.x, PedCoords.y, PedCoords.z)
        SetCamRot(cam, 0.0, 0.0, GetEntityHeading(PlayerPedId()) + 180)
    end

    headingToCam = GetEntityHeading(PlayerPedId()) + 90
    camOffset = 2.0
end

function disableCam()
    OriginalPosition = nil
    RenderScriptCams(0, 0, 750, 1, 0)
    DestroyCam(cam, false)
    FreezeEntityPosition(PlayerPedId(), false)
end

function resetClothing(data)
    local ped = PlayerPedId()

    -- Face
    SetPedHeadBlendData(ped, data["face"].item, data["face2"].item, nil, data["face"].texture, data["face2"].texture, nil , data["facemix"].shapeMix, data["facemix"].skinMix, nil, true)

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
    SetPedHeadOverlayColor(ped, 8, 1, data["lipstick"].item, 0)

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
    SetPedEyeColor(ped, data['eye_color'].item)
    SetPedHeadOverlay(ped, 9, data['moles'].item, data['moles'].texture)
    SetPedFaceFeature(ped, 0, data['nose_0'].item)
    SetPedFaceFeature(ped, 1, data['nose_1'].item)
    SetPedFaceFeature(ped, 2, data['nose_2'].item)
    SetPedFaceFeature(ped, 3, data['nose_3'].item)
    SetPedFaceFeature(ped, 4, data['nose_4'].item)
    SetPedFaceFeature(ped, 5, data['nose_5'].item)
    SetPedFaceFeature(ped, 6, data['eyebrown_high'].item)
    SetPedFaceFeature(ped, 7, data['eyebrown_forward'].item)
    SetPedFaceFeature(ped, 8, data['cheek_1'].item)
    SetPedFaceFeature(ped, 9, data['cheek_2'].item)
    SetPedFaceFeature(ped, 10, data['cheek_3'].item)
    SetPedFaceFeature(ped, 11, data['eye_opening'].item)
    SetPedFaceFeature(ped, 12, data['lips_thickness'].item)
    SetPedFaceFeature(ped, 13, data['jaw_bone_width'].item)
    SetPedFaceFeature(ped, 14, data['jaw_bone_back_lenght'].item)
    SetPedFaceFeature(ped, 15, data['chimp_bone_lowering'].item)
    SetPedFaceFeature(ped, 16, data['chimp_bone_lenght'].item)
    SetPedFaceFeature(ped, 17, data['chimp_bone_width'].item)
    SetPedFaceFeature(ped, 18, data['chimp_hole'].item)
    SetPedFaceFeature(ped, 19, data['neck_thikness'].item)

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
end

function ChangeVariation(data)
    local ped = PlayerPedId()
    local clothingCategory = data.clothingType
    local type = data.type
    local item = data.articleNumber ~= nil and data.articleNumber or false

    if item then
        if clothingCategory == "pants" then
            if type == "item" then
                SetPedComponentVariation(ped, 4, item, 0, 0)
                Config.SkinData["pants"].item = item
            elseif type == "texture" then
                local curItem = GetPedDrawableVariation(ped, 4)
                SetPedComponentVariation(ped, 4, curItem, item, 0)
                Config.SkinData["pants"].texture = item
            end
        elseif clothingCategory == "face" then
            if type == "item" then
                SetPedHeadBlendData(ped, tonumber(item), Config.SkinData["face2"].item, nil, Config.SkinData["face"].texture
                    , Config.SkinData["face2"].texture, nil, Config.SkinData["facemix"].shapeMix,
                    Config.SkinData["facemix"].skinMix, nil, true)
                Config.SkinData["face"].item = item
            elseif type == "texture" then
                SetPedHeadBlendData(ped, Config.SkinData["face"].item, Config.SkinData["face2"].item, nil, item,
                    Config.SkinData["face2"].texture, nil, Config.SkinData["facemix"].shapeMix,
                    Config.SkinData["facemix"].skinMix, nil, true)
                Config.SkinData["face"].texture = item
            end
        elseif clothingCategory == "face2" then
            if type == "item" then
                SetPedHeadBlendData(ped, Config.SkinData["face"].item, tonumber(item), nil, Config.SkinData["face"].texture,
                    Config.SkinData["face2"].texture, nil, Config.SkinData["facemix"].shapeMix,
                    Config.SkinData["facemix"].skinMix, nil, true)
                Config.SkinData["face2"].item = item
            elseif type == "texture" then
                SetPedHeadBlendData(ped, Config.SkinData["face"].item, Config.SkinData["face2"].item, nil,
                    Config.SkinData["face"].texture, item, nil, Config.SkinData["facemix"].shapeMix,
                    Config.SkinData["facemix"].skinMix, nil, true)
                Config.SkinData["face2"].texture = item
            end
        elseif clothingCategory == "facemix" then
            if type == "skinMix" then
                SetPedHeadBlendData(ped, Config.SkinData["face"].item, Config.SkinData["face2"].item, nil,
                    Config.SkinData["face"].texture, Config.SkinData["face2"].texture, nil,
                    Config.SkinData["facemix"].shapeMix, item, nil, true)
                Config.SkinData["facemix"].skinMix = item
            elseif type == "shapeMix" then
                SetPedHeadBlendData(ped, Config.SkinData["face"].item, Config.SkinData["face2"].item, nil,
                    Config.SkinData["face"].texture, Config.SkinData["face2"].texture, nil, item,
                    Config.SkinData["facemix"].skinMix, nil, true)
                Config.SkinData["facemix"].shapeMix = item
            end
        elseif clothingCategory == "hair" then
            SetPedHeadBlendData(ped, Config.SkinData["face"].item, Config.SkinData["face2"].item, nil,
                Config.SkinData["face"].texture, Config.SkinData["face2"].texture, nil, Config.SkinData["facemix"].shapeMix,
                Config.SkinData["facemix"].skinMix, nil, true)
            if type == "item" then
                SetPedComponentVariation(ped, 2, item, 0, 0)
                Config.SkinData["hair"].item = item
            elseif type == "texture" then
                SetPedHairColor(ped, item, item)
                Config.SkinData["hair"].texture = item
            end
        elseif clothingCategory == "eyebrows" then
            if type == "item" then
                SetPedHeadOverlay(ped, 2, item, 1.0)
                Config.SkinData["eyebrows"].item = item
            elseif type == "texture" then
                SetPedHeadOverlayColor(ped, 2, 1, item, 0)
                Config.SkinData["eyebrows"].texture = item
            end
        elseif clothingCategory == "beard" then
            if type == "item" then
                SetPedHeadOverlay(ped, 1, item, 1.0)
                Config.SkinData["beard"].item = item
            elseif type == "texture" then
                SetPedHeadOverlayColor(ped, 1, 1, item, 0)
                Config.SkinData["beard"].texture = item
            end
        elseif clothingCategory == "blush" then
            if type == "item" then
                SetPedHeadOverlay(ped, 5, item, 1.0)
                Config.SkinData["blush"].item = item
            elseif type == "texture" then
                SetPedHeadOverlayColor(ped, 5, 1, item, 0)
                Config.SkinData["blush"].texture = item
            end
        elseif clothingCategory == "lipstick" then
            if type == "item" then
                SetPedHeadOverlay(ped, 8, item, 1.0)
                Config.SkinData["lipstick"].item = item
            elseif type == "texture" then
                SetPedHeadOverlayColor(ped, 8, 1, item, 0)
                Config.SkinData["lipstick"].texture = item
            end
        elseif clothingCategory == "makeup" then
            if type == "item" then
                SetPedHeadOverlay(ped, 4, item, 1.0)
                Config.SkinData["makeup"].item = item
            elseif type == "texture" then
                SetPedHeadOverlayColor(ped, 4, 1, item, 0)
                Config.SkinData["makeup"].texture = item
            end
        elseif clothingCategory == "ageing" then
            if type == "item" then
                SetPedHeadOverlay(ped, 3, item, 1.0)
                Config.SkinData["ageing"].item = item
            elseif type == "texture" then
                SetPedHeadOverlayColor(ped, 3, 1, item, 0)
                Config.SkinData["ageing"].texture = item
            end
        elseif clothingCategory == "arms" then
            if type == "item" then
                SetPedComponentVariation(ped, 3, item, 0, 2)
                Config.SkinData["arms"].item = item
            elseif type == "texture" then
                local curItem = GetPedDrawableVariation(ped, 3)
                SetPedComponentVariation(ped, 3, curItem, item, 0)
                Config.SkinData["arms"].texture = item
            end
        elseif clothingCategory == "eye_color" then
            if type == "item" then
                SetPedEyeColor(ped, item)
                Config.SkinData["eye_color"].item = item
            end
        elseif clothingCategory == "moles" then
            if type == "item" then
                SetPedHeadOverlay(ped, 9, item, 1.0)
                Config.SkinData["moles"].item = item
            elseif type == "texture" then
                local curItem = GetPedDrawableVariation(ped, 9)
                local newitem = (item / 10)
                SetPedHeadOverlayColor(ped, 9, curItem, newitem)
                Config.SkinData["moles"].texture = item
            end
        elseif clothingCategory == "nose_0" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 0, newitem)
                Config.SkinData["nose_0"].item = item
            end
        elseif clothingCategory == "nose_1" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 1, newitem)
                Config.SkinData["nose_1"].item = item
            end
        elseif clothingCategory == "nose_2" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 2, newitem)
                Config.SkinData["nose_2"].item = item
            end
        elseif clothingCategory == "nose_3" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 3, newitem)
                Config.SkinData["nose_3"].item = item
            end
        elseif clothingCategory == "nose_4" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 4, newitem)
                Config.SkinData["nose_4"].item = item
            end
        elseif clothingCategory == "nose_5" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 5, newitem)
                Config.SkinData["nose_5"].item = item
            end
        elseif clothingCategory == "eyebrown_high" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 6, newitem)
                Config.SkinData["eyebrown_high"].item = item
            end
        elseif clothingCategory == "eyebrown_forward" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 7, newitem)
                Config.SkinData["eyebrown_forward"].item = item
            end
        elseif clothingCategory == "cheek_1" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 8, newitem)
                Config.SkinData["cheek_1"].item = item
            end
        elseif clothingCategory == "cheek_2" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 9, newitem)
                Config.SkinData["cheek_1"].item = item
            end
        elseif clothingCategory == "cheek_3" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 10, newitem)
                Config.SkinData["cheek_3"].item = item
            end
        elseif clothingCategory == "eye_opening" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 11, newitem)
                Config.SkinData["eye_opening"].item = item
            end
        elseif clothingCategory == "lips_thickness" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 12, newitem)
                Config.SkinData["lips_thickness"].item = item
            end
        elseif clothingCategory == "jaw_bone_width" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 13, newitem)
                Config.SkinData["jaw_bone_width"].item = item
            end
        elseif clothingCategory == "jaw_bone_back_lenght" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 14, newitem)
                Config.SkinData["jaw_bone_back_lenght"].item = item
            end
        elseif clothingCategory == "chimp_bone_lowering" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 15, newitem)
                Config.SkinData["chimp_bone_lowering"].item = item
            end
        elseif clothingCategory == "chimp_bone_lenght" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 16, newitem)
                Config.SkinData["chimp_bone_lenght"].item = item
            end
        elseif clothingCategory == "chimp_bone_width" then
            if type == "item" then
                local newitem = (item / 10)

                SetPedFaceFeature(ped, 17, newitem)
                Config.SkinData["chimp_bone_width"].item = item
            end
        elseif clothingCategory == "chimp_hole" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 18, newitem)
                Config.SkinData["chimp_hole"].item = item
            end
        elseif clothingCategory == "neck_thikness" then
            if type == "item" then
                local newitem = (item / 10)
                SetPedFaceFeature(ped, 19, newitem)
                Config.SkinData["chimp_hole"].item = item
            end
        elseif clothingCategory == "t-shirt" then
            if type == "item" then
                SetPedComponentVariation(ped, 8, item, 0, 2)
                Config.SkinData["t-shirt"].item = item
            elseif type == "texture" then
                local curItem = GetPedDrawableVariation(ped, 8)
                SetPedComponentVariation(ped, 8, curItem, item, 0)
                Config.SkinData["t-shirt"].texture = item
            end
        elseif clothingCategory == "vest" then
            if type == "item" then
                SetPedComponentVariation(ped, 9, item, 0, 2)
                Config.SkinData["vest"].item = item
            elseif type == "texture" then
                SetPedComponentVariation(ped, 9, Config.SkinData["vest"].item, item, 0)
                Config.SkinData["vest"].texture = item
            end
        elseif clothingCategory == "bag" then
            if type == "item" then
                SetPedComponentVariation(ped, 5, item, 0, 2)
                Config.SkinData["bag"].item = item
            elseif type == "texture" then
                SetPedComponentVariation(ped, 5, Config.SkinData["bag"].item, item, 0)
                Config.SkinData["bag"].texture = item
            end
        elseif clothingCategory == "decals" then
            if type == "item" then
                SetPedComponentVariation(ped, 10, item, 0, 2)
                Config.SkinData["decals"].item = item
            elseif type == "texture" then
                SetPedComponentVariation(ped, 10, Config.SkinData["decals"].item, item, 0)
                Config.SkinData["decals"].texture = item
            end
        elseif clothingCategory == "accessory" then
            if type == "item" then
                SetPedComponentVariation(ped, 7, item, 0, 2)
                Config.SkinData["accessory"].item = item
            elseif type == "texture" then
                SetPedComponentVariation(ped, 7, Config.SkinData["accessory"].item, item, 0)
                Config.SkinData["accessory"].texture = item
            end
        elseif clothingCategory == "torso2" then
            if type == "item" then
                SetPedComponentVariation(ped, 11, item, 0, 2)
                Config.SkinData["torso2"].item = item
            elseif type == "texture" then
                local curItem = GetPedDrawableVariation(ped, 11)
                SetPedComponentVariation(ped, 11, curItem, item, 0)
                Config.SkinData["torso2"].texture = item
            end
        elseif clothingCategory == "shoes" then
            if type == "item" then
                SetPedComponentVariation(ped, 6, item, 0, 2)
                Config.SkinData["shoes"].item = item
            elseif type == "texture" then
                local curItem = GetPedDrawableVariation(ped, 6)
                SetPedComponentVariation(ped, 6, curItem, item, 0)
                Config.SkinData["shoes"].texture = item
            end
        elseif clothingCategory == "mask" then
            if type == "item" then
                SetPedComponentVariation(ped, 1, item, 0, 2)
                Config.SkinData["mask"].item = item
            elseif type == "texture" then
                local curItem = GetPedDrawableVariation(ped, 1)
                SetPedComponentVariation(ped, 1, curItem, item, 0)
                Config.SkinData["mask"].texture = item
            end
        elseif clothingCategory == "hat" then
            if type == "item" then
                if item ~= -1 then
                    SetPedPropIndex(ped, 0, item, Config.SkinData["hat"].texture, true)
                else
                    ClearPedProp(ped, 0)
                end
                Config.SkinData["hat"].item = item
            elseif type == "texture" then
                SetPedPropIndex(ped, 0, Config.SkinData["hat"].item, item, true)
                Config.SkinData["hat"].texture = item
            end
        elseif clothingCategory == "glass" then
            if type == "item" then
                if item ~= -1 then
                    SetPedPropIndex(ped, 1, item, Config.SkinData["glass"].texture, true)
                    Config.SkinData["glass"].item = item
                else
                    ClearPedProp(ped, 1)
                end
            elseif type == "texture" then
                SetPedPropIndex(ped, 1, Config.SkinData["glass"].item, item, true)
                Config.SkinData["glass"].texture = item
            end
        elseif clothingCategory == "ear" then
            if type == "item" then
                if item ~= -1 then
                    SetPedPropIndex(ped, 2, item, Config.SkinData["ear"].texture, true)
                else
                    ClearPedProp(ped, 2)
                end
                Config.SkinData["ear"].item = item
            elseif type == "texture" then
                SetPedPropIndex(ped, 2, Config.SkinData["ear"].item, item, true)
                Config.SkinData["ear"].texture = item
            end
        elseif clothingCategory == "watch" then
            if type == "item" then
                if item ~= -1 then
                    SetPedPropIndex(ped, 6, item, Config.SkinData["watch"].texture, true)
                else
                    ClearPedProp(ped, 6)
                end
                Config.SkinData["watch"].item = item
            elseif type == "texture" then
                SetPedPropIndex(ped, 6, Config.SkinData["watch"].item, item, true)
                Config.SkinData["watch"].texture = item
            end
        elseif clothingCategory == "bracelet" then
            if type == "item" then
                if item ~= -1 then
                    SetPedPropIndex(ped, 7, item, Config.SkinData["bracelet"].texture, true)
                else
                    ClearPedProp(ped, 7)
                end
                Config.SkinData["bracelet"].item = item
            elseif type == "texture" then
                SetPedPropIndex(ped, 7, Config.SkinData["bracelet"].item, item, true)
                Config.SkinData["bracelet"].texture = item
            end
        end
        GetMaxValues()
    end
end

function LoadPlayerModel(skin)
    RequestModel(skin)
    while not HasModelLoaded(skin) do
        Citizen.Wait(0)
    end
end

function RequestAnimationDict(AnimSet)
    while (not HasAnimDictLoaded(AnimSet)) do
        RequestAnimDict(AnimSet)
        Citizen.Wait(0)
    end
end

function isPedAllowedRandom(skin)
    local retval = false
    for k, v in pairs(Config.BlockedPeds) do
        if v ~= skin then
            retval = true
        end
    end
    return retval
end

function ChangeToSkinNoUpdate(skin)
    local ped = PlayerPedId()
    local model = GetHashKey(skin)
    Citizen.CreateThread(function()
        LoadPlayerModel(model)
        SetPlayerModel(PlayerId(), model)
        SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)

        for k, v in pairs(Config.SkinData) do
            if skin == "mp_m_freemode_01" or skin == "mp_f_freemode_01" then
                ChangeVariation({
                    clothingType = k,
                    articleNumber = v.defaultItem,
                    type = "item",
                })
            else
                if k ~= "face" and k ~= "hair" and k ~= "face2" then
                    ChangeVariation({
                        clothingType = k,
                        articleNumber = v.defaultItem,
                        type = "item",
                    })
                end
            end

            if skin == "mp_m_freemode_01" or skin == "mp_f_freemode_01" then
                ChangeVariation({
                    clothingType = k,
                    articleNumber = v.defaultTexture,
                    type = "texture",
                })
            else
                if k ~= "face" and k ~= "hair" and k ~= "face2" then
                    ChangeVariation({
                        clothingType = k,
                        articleNumber = v.defaultTexture,
                        type = "texture",
                    })
                end
            end
        end
    end)
end

function SaveSkin(IsAdmin)
    -- Mercy.Functions.TriggerCallback('np-clothing/server/pay-for-clothes', function(HasPaid)
    local HasPaid = RPC.execute("np-clothing/server/pay-for-clothes", IsAdmin)
    if HasPaid then
        local Model = GetEntityModel(PlayerPedId())
        local Clothing = json.encode(Config.SkinData)
        TriggerServerEvent("np-clothing/saveSkin", Model, Clothing, IsAdmin)
    end
end

function typeof(var)
    local _type = type(var);
    if (_type ~= "table" and _type ~= "userdata") then
        return _type;
    end
    local _meta = getmetatable(var);
    if (_meta ~= nil and _meta._NAME ~= nil) then
        return _meta._NAME;
    else
        return _type;
    end
end

function DoAnimation(Type, SubType)
    SubType = SubType ~= nil and SubType:lower() or false
    if Type == 'hat' then
        RequestAnimationDict("mp_masks@on_foot")
        local AnimDur = GetAnimDuration("mp_masks@on_foot", "put_on_mask") * 1000 - 300
        TaskPlayAnim(PlayerPedId(), "mp_masks@on_foot", "put_on_mask", 4.0, 3.0, -1, 49, 1.0, 0, 0, 0)
        SetTimeout(AnimDur, function()
            ClearPedTasks(PlayerPedId())
        end)
    elseif Type == 'mask' then
        RequestAnimationDict("mp_masks@on_foot")
        local AnimDur = GetAnimDuration("mp_masks@on_foot", "put_on_mask") * 1000 - 300
        TaskPlayAnim(PlayerPedId(), "mp_masks@on_foot", "put_on_mask", 4.0, 3.0, -1, 49, 1.0, 0, 0, 0)
        SetTimeout(AnimDur, function()
            ClearPedTasks(PlayerPedId())
        end)
    elseif Type == 'glasses' then
        RequestAnimationDict("clothingspecs")
        local AnimDur = GetAnimDuration("clothingspecs", "take_off") * 1000 - 2500
        TaskPlayAnim(PlayerPedId(), "clothingspecs", "take_off", 4.0, 3.0, -1, 49, 1.0, 0, 0, 0)
        SetTimeout(AnimDur, function()
            ClearPedTasks(PlayerPedId())
        end)
    elseif Type == 'shirt' then
        RequestAnimationDict("clothingtie")
        local AnimDur = GetAnimDuration("clothingtie", "try_tie_negative_a") * 1000 - 7000
        TaskPlayAnim(PlayerPedId(), "clothingtie", "try_tie_negative_a", 4.0, 3.0, -1, 49, 1.0, 0, 0, 0)
        SetTimeout(AnimDur, function()
            ClearPedTasks(PlayerPedId())
        end)
    elseif Type == 'bag' then
        RequestAnimationDict("anim@heists@ornate_bank@grab_cash")
        local AnimDur = GetAnimDuration("anim@heists@ornate_bank@grab_cash", "intro") * 1000 - 300
        TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash", "intro", 4.0, 3.0, -1, 49, 1.0, 0, 0, 0)
        SetTimeout(AnimDur, function()
            ClearPedTasks(PlayerPedId())
        end)
    elseif Type == 'pants' then
        RequestAnimationDict("re@construction")
        local AnimDur = GetAnimDuration("re@construction", "out_of_breath") * 1000 - 5500
        TaskPlayAnim(PlayerPedId(), "re@construction", "out_of_breath", 4.0, 3.0, -1, 49, 1.0, 0, 0, 0)
        SetTimeout(AnimDur, function()
            ClearPedTasks(PlayerPedId())
        end)
    elseif Type == 'shoes' then
        RequestAnimationDict("random@domestic")
        local AnimDur = GetAnimDuration("random@domestic", "pickup_low") * 1000 - 300
        TaskPlayAnim(PlayerPedId(), "random@domestic", "pickup_low", 4.0, 3.0, -1, 49, 1.0, 0, 0, 0)
        SetTimeout(AnimDur, function()
            ClearPedTasks(PlayerPedId())
        end)
    end
end

function LoadAnims()
    RequestAnimationDict("mp_masks@on_foot")
    RequestAnimationDict("clothingspecs")
    RequestAnimationDict("clothingtie")
    RequestAnimationDict("anim@heists@ornate_bank@grab_cash")
    RequestAnimationDict("re@construction")
    RequestAnimationDict("random@domestic")
end
