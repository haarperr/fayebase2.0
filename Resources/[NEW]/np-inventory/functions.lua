local fixingvehicle = false
local justUsed = false
local itemsUsedRecently = 0
local lastCounter = 0 
local HeadBone = 0x796e;

local WheelChairDown = false

local nvgItems = {
    ["nightvisiongoggles"] = true,
    ["nightvisiongogglespd"] = true,
  }

  local supportedModels = {
    [`mp_f_freemode_01`] = 124,
    [`mp_m_freemode_01`] = 126,
  }

local jailBounds = PolyZone:Create({
  vector2(1855.8966064453, 2701.9802246094),
  vector2(1775.4013671875, 2770.5339355469),
  vector2(1646.7535400391, 2765.9870605469),
  vector2(1562.7836914063, 2686.6459960938),
  vector2(1525.3662109375, 2586.5190429688),
  vector2(1533.7038574219, 2465.5300292969),
  vector2(1657.5997314453, 2386.9389648438),
  vector2(1765.8286132813, 2404.4763183594),
  vector2(1830.1740722656, 2472.1193847656),
  vector2(1855.7557373047, 2569.0361328125)
}, {
    name = "jail_bounds",
    minZ = 30,
    maxZ = 70.5,
    debugGrid = false,
    gridDivisions = 25
})

RegisterNetEvent('inventory:DegenLastUsedItem')
AddEventHandler('inventory:DegenLastUsedItem', function(percent)
    local cid = exports["isPed"]:isPed("cid")
    print("Degen applied to ".. LastUsedItemId .. " ID: " .. LastUsedItem .. " at %" .. percent)
    TriggerServerEvent("inventory:degItem",LastUsedItem,percent,LastUsedItemId,cid)
end)

local validWaterItem = {
    ["oxygentank"] = true,
    ["water"] = true,
    ["vodka"] = true,
    ["beer"] = true,
    ["whitewine"] = true,
    ["whiskey"] = true,
    ["coffee"] = true,
    ["tea"] = true,
    ["fishtaco"] = true,
    ["fish_taco"] = true,
    ["taco"] = true,
    ["burrito"] = true,
    ["churro"] = true,
    ["hotdog"] = true,
    ["greencow"] = true,
    ["donut"] = true,
    ["eggsbacon"] = true,
    ["icecream"] = true,
    ["mshake"] = true,
    ["sandwich"] = true,
    ["hamburger"] = true,
    ["fish_sandwich"] = true,
    ["cola"] = true,
    ["jailfood"] = true,
    ["bleederburger"] = true,
    ["heartstopper"] = true,
    ["torpedo"] = true,
    ["meatfree"] = true,
    ["moneyshot"] = true,
    ["fries"] = true,
    ["slushy"] = true,
    ["nightvision"] = true,


}



Citizen.CreateThread(function()
    TriggerServerEvent("inv:playerSpawned");
end)

RegisterNetEvent('inventory-jail')
AddEventHandler('inventory-jail', function(startPosition, cid, name)
    if (hasEnoughOfItem("okaylockpick",1,false)) then
        local plyPed = PlayerPedId()
        local coord = GetPedBoneCoords(plyPed, HeadBone)
        local inPoly = jailBounds:isPointInside(coord)
        if inPoly  then
             TriggerServerEvent("server-inventory-open", startPosition, cid, "1", name);
        end
    end
end)



function getCloestVeh()
    playerped = PlayerPedId()
    coordA = GetEntityCoords(playerped, 1)
    coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
    targetVehicle = getVehicleInDirection(coordA, coordB)
    return targetVehicle
end

RegisterNetEvent('RunUseItem')
AddEventHandler('RunUseItem', function(itemid, slot, inventoryName, isWeapon, iteminfo, quality)

    if itemid == nil then
        return
    end
    local player = PlayerPedId()
    local ItemInfo = GetItemInfo(slot)
    local currentVehicle = GetVehiclePedIsUsing(player)
    LastUsedItem = ItemInfo.id
    LastUsedItemId = itemid
    if ItemInfo.quality == nil then return end
    if ItemInfo.quality < 1 then
        TriggerEvent("DoLongHudText","Item is too worn.",2)
        if isWeapon then
            TriggerEvent("brokenWeapon")
        end
        return
    end

    if justUsed then
        itemsUsedRecently = itemsUsedRecently + 1
        if itemsUsedRecently > 10 and itemsUsedRecently > lastCounter+5 then
            lastCounter = itemsUsedRecently
            TriggerServerEvent("exploiter", "Tried using " .. itemsUsedRecently .. " items in < 500ms ")
        end
        return
    end

    justUsed = true

    if (not hasEnoughOfItem(itemid,1,false)) then
        TriggerEvent("DoLongHudText","You dont appear to have this item on you?",2) 
        justUsed = false
        itemsUsedRecently = 0
        lastCounter = 0
        return
    end

    if itemid == "-72657034" then
        TriggerEvent("equipWeaponID",itemid,ItemInfo.information,ItemInfo.id)
        TriggerEvent("inventory:removeItem",itemid, 1)
        justUsed = false
        itemsUsedRecently = 0
        lastCounter = 0
        return
    end

    if itemid == "wheelchair" then
        if not WheelChairDown then
            WheelChairDown = true
            local vehicle = veh
            local veh = GetVehiclePedIsUsing(ped)
            local plyCoord = GetEntityCoords(PlayerPedId())

            Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
            
            RequestModel('npwheelchair')
            while not HasModelLoaded('npwheelchair') do
                Citizen.Wait(0)
            end
            personalvehicle = CreateVehicle('npwheelchair', plyCoord.x, plyCoord.y, plyCoord.z,true,false)
            SetModelAsNoLongerNeeded('npwheelchair')

            SetVehicleOnGroundProperly(personalvehicle)

            local plate = GetVehicleNumberPlateText(personalvehicle)
            local id = NetworkGetNetworkIdFromEntity(personalvehicle)
            SetNetworkIdCanMigrate(id, true)
            Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
            TaskWarpPedIntoVehicle(PlayerPedId(),personalvehicle,-1)
            SetEntityVisible(ped,true)			
            TriggerEvent("keys:addNew",personalvehicle, plate)
        else
            WheelChairDown = false
            DeleteEntity(personalvehicle)
        end
    end

    if (itemid == "bento_box_1") then
        local finished = exports['np-taskbar']:taskBar(1000, 'Unwrapping Bento Box')
        local cid = exports["isPed"]:isPed("cid")
        TriggerEvent("InteractSound_CL:PlayOnOne","unwrap",1.0)
        if finished == 100 then
            TriggerEvent("server-inventory-open", "1", "bentobox-"..ItemInfo.id)
        end
    end

    if (itemid == "bento_box_2") then
        local finished = exports['np-taskbar']:taskBar(1000, 'Unwrapping Bento Box')
        local cid = exports["isPed"]:isPed("cid")
        TriggerEvent("InteractSound_CL:PlayOnOne","unwrap",1.0)
        if finished == 100 then
            TriggerEvent("server-inventory-open", "1", "bentobox-"..ItemInfo.id)
        end
    end

    if (itemid == "bento_box_3") then
        local finished = exports['np-taskbar']:taskBar(1000, 'Unwrapping Bento Box')
        local cid = exports["isPed"]:isPed("cid")
        TriggerEvent("InteractSound_CL:PlayOnOne","unwrap",1.0)
        if finished == 100 then
            TriggerEvent("server-inventory-open", "1", "bentobox-"..ItemInfo.id)
        end
    end
    
    function getItemsOfType(itemid, limitAmount, checkQuality, metaInformation)
        if itemid == nil then
            return nil
        end
        local itemsFound = {}
        local amount = tonumber(limitAmount)
        for i,v in pairs(clientInventory) do
            if amount and #itemsFound >= amount then
                break
            end
    
            local qCheck = not checkQuality or v.quality > 0
            if v.item_id == itemid and qCheck then
                if metaInformation then
                    local totalMetaKeys = 0
                    local metaFoundCount = 0
                    local itemMeta = json.decode(v.information)
                    for metaKey, metaValue in pairs(metaInformation) do
                        totalMetaKeys = totalMetaKeys + 1
                        if itemMeta[metaKey] and itemMeta[metaKey] == metaValue then
                            metaFoundCount = metaFoundCount + 1
                        end
                    end
                    if totalMetaKeys <= metaFoundCount then
                        itemsFound[#itemsFound+1] = v
                    end
                else
                    itemsFound[#itemsFound+1] = v
                end
            end
        end
        return itemsFound
    end

    if (itemid == "wetbud") then
        TriggerEvent('inventory:removeItem', 'wetbud', 1)
        local finished = exports['np-taskbar']:taskBar(5000, 'Drying Bud')
        if finished == 100 then
            TriggerEvent( "player:receiveItem", "driedbud", 1)
        end
    end


    if (itemid == "inkedmoneybag") then
        TriggerEvent('np-illegalactivities:wash_inkedmoneybag')
    end

    if (itemid == "racingipad") then
        TriggerEvent('np-racing:openGUI')
    end

    if (itemid == "driedbud") then
        if exports['np-inventory']:hasEnoughOfItem('qualityscales', 1) and exports['np-inventory']:hasEnoughOfItem('emptybaggies', 1) then
            TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
            local finished = exports['np-taskbar']:taskBar(5000, 'Packaging')
            if finished == 100 then
                ClearPedTasksImmediately(PlayerPedId())
                TriggerEvent("player:receiveItem", "smallbud", math.random(15, 25))
                TriggerEvent('inventory:removeItem', 'emptybaggies', 1)
                TriggerEvent('inventory:removeItem', 'driedbud', 1)
            else
                ClearPedTasksImmediately(PlayerPedId())
            end
        else
            TriggerEvent('DoLongHudText', 'You need 1x Scales and 1x Empty Baggies', 2)
        end
    end

    if itemid == "methtable" then
        TriggerEvent('np-meth:place_table')
    end

    if itemid == "detcord" then 
        TriggerEvent('test:123')
    end

    if not isValidUseCase(itemid,isWeapon) then
        justUsed = false
        itemsUsedRecently = 0
        lastCounter = 0
        return
    end

    if (itemid == nil) then
        justUsed = false
        itemsUsedRecently = 0
        lastCounter = 0
        return
    end

    if (isWeapon) then
        if tonumber(ItemInfo.quality) > 0 then
            TriggerEvent("equipWeaponID",itemid,ItemInfo.information,ItemInfo.id)
        end
        justUsed = false
        itemsUsedRecently = 0
        lastCounter = 0
        Wait(1500)
        TriggerEvent("AttachWeapons")
        return
    end



    TriggerEvent("hud-display-item",itemid,"Used")

    Wait(800)

    local player = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(player, false)

     if (not IsPedInAnyVehicle(player)) then
         if (itemid == "Suitcase") then
            TriggerEvent('attach:suitcase')
         end

         if (itemid == "Boombox") then
                 TriggerEvent('attach:boombox')
         end
         if (itemid == "MedicalBag") then
                 TriggerEvent('attach:medicalBag')
         end
         if (itemid == "SecurityCase") then
                 TriggerEvent('attach:securityCase')
         end
         if (itemid == "Toolbox") then
                 TriggerEvent('attach:toolbox')
         end
     end

    local remove = false
    local itemreturn = false
    local drugitem = false
    local fooditem = false
    local drinkitem = false
    local healitem = false

    if (itemid == "joint" or itemid == "lsconfidentialjoint" or itemid == "alaskanthunderfuckjoint" or itemid == "chiliadkushjoint" or itemid == "whitewine" or itemid == "weed5oz" or itemid == "weedq" or itemid == "beer" or itemid == "vodka" or itemid == "whiskey" or itemid == "lsdtab") then
        drugitem = true
    end

    if (itemid == "cane") then
        TriggerEvent('attach:cane')
    end
    
    if (itemid == "fakeplate") then
      TriggerEvent("fakeplate:accepted")
    end

    if (itemid == "screwdriver") then
        TriggerEvent("fakeplate:off")
      end

    if (itemid == "miningpickaxe") then
        TriggerEvent('void-start-mining')
    end


    if (itemid == "locksystem") then
      TriggerServerEvent("robbery:triggerItemUsedServer",itemid)
    end


    if (itemid == "thermal_charge") then
        TriggerEvent('np-bobcat:firstdoor')
        TriggerEvent('np-vault:firstdoor')  
        TriggerEvent('np-vault:lowerfirstdoor')
        TriggerEvent('np-vault:lowerseconddoor')
        TriggerEvent('np-vault:seconddoor')
        TriggerEvent('np-bobcat:seconddoor')
        TriggerEvent('np-heists:door_thermite')
        TriggerEvent('np-heists:2nd_door_thermite')
        TriggerEvent('np-paleto:box')
    end  

    if (itemid == "huntingbait") then
        TriggerEvent('np-hunting:usedBait')
    end

    if (itemid == "craftedgemjade") then
        TriggerEvent("np-buffs:applyBuff", "gemfdsalfkj", { { buff = "strength", percent = 1.0, timeOverride = 120000 * 60 } })
        remove = true
    end

    if (itemid == "craftedgemcitrine") then
        TriggerEvent("np-buffs:applyBuff", "Ring", { { buff = "jobluck", percent = 0.01, timeOverride = 120000 * 60 } })
        remove = true
    end

    if (itemid == "craftedgemaquamarine") then
        TriggerEvent('swimbuffring')
        remove = true
    end


    
    if itemid == "murdermeal" then
        local finished = exports['np-taskbar']:taskBar(1000, 'Unwrapping')
        local cid = exports["isPed"]:isPed("cid")
        TriggerEvent("InteractSound_CL:PlayOnOne","unwrap",1.0)
        if finished == 100 then
            TriggerEvent("server-inventory-open", "1", "murdermeal-"..ItemInfo.id)
        end
    end
    
    if (itemid == "DuffelBag") then
        local finished = exports['np-taskbar']:taskBar(2000, 'Opening Duffel Bag')
        local cid = exports["isPed"]:isPed("cid")
        TriggerEvent("InteractSound_CL:PlayOnOne","StashOpen",1.0)
        if finished == 100 then
            TriggerEvent("server-inventory-open", "1", "duffelbag-"..ItemInfo.id)
        end
    end
    
    if (itemid == "present") then
        local finished = exports["np-taskbar"]:taskBar(4000,"Opening Present",false,false,playerVeh)
        if (finished == 100) then
            remove = true
            TriggerEvent("player:receiveItem", "lockpick", 2)
            TriggerEvent("player:receiveItem", "fishingrod", 1)
            TriggerEvent("player:receiveItem", "civradio", 1)
            TriggerEvent("player:receiveItem", "heartstopper", 1)
            TriggerEvent("player:receiveItem", "fries", 1)
            TriggerEvent("player:receiveItem", "milkshake", 1)
        end
    end
    

    if (itemid == "nightvision") then
        TriggerEvent('nightvision:toggle')
    end

    if itemid == "boggsproteinbar" then
        local success = AttachPropAndPlayAnimation(
            "mp_player_inteat@burger",
            "mp_player_int_eat_burger",
            49,
            6000,
            "Eating",
            "",
            false,
            "sandwich",
            playerVeh
        )
    
        if success then
            print("success")
            TriggerEvent("np-buffs:applyBuff", "boggs", { { buff = "bikeStats", percent = 1.0, timeOverride = 60 * 1000 } })
            TriggerEvent('DoLongHudText', 'You feel revitalized', 1)
            remove = true
        end
    end


        if itemid == "heartstopper" or itemid == "torpedo" then
            local success = AttachPropAndPlayAnimation(
                "mp_player_inteat@burger",
                "mp_player_int_eat_burger",
                49,
                6000,
                "Eating",
                "",
                false,
                "sandwich",
                playerVeh
            )
        
            if success then
                print("success")
                TriggerEvent('inv:wellfed')
                TriggerEvent("np-buffs:applyBuff", "burger_shot", { { buff = "strength", percent = 0.6, timeOverride = 60000 * 60 } })
                TriggerEvent("np-buffs:applyBuff", "burger_shotfullness", { { buff = "fullness", percent = 1.0, timeOverride = 60000 * 60 } })
                TriggerEvent('DoLongHudText', 'You feel revitalized', 1)
                remove = true
            end
        end

                    -- MALDINIS
    
    if (itemid == "pepperonipizza") then  
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)
        TriggerEvent("np-buffs:applyBuff", "maldini3", { { buff = "fullness", percent = 0.01, timeOverride = 60000 * 60 } })
    end

    if (itemid == "margheritapizza") then  
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)
        TriggerEvent("np-buffs:applyBuff", "maldini1", { { buff = "jobluck", percent = 0.01, timeOverride = 60000 * 60 } })
        TriggerEvent("np-buffs:applyBuff", "maldini4", { { buff = "fullness", percent = 0.01, timeOverride = 60000 * 60 } })
    end

    if (itemid == "bbqpizza") then  
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)
        TriggerEvent("np-buffs:applyBuff", "maldini2", { { buff = "swimming", percent = 0.01, timeOverride = 60000 * 60 } })
        TriggerEvent("np-buffs:applyBuff", "maldini5", { { buff = "fullness", percent = 0.01, timeOverride = 60000 * 60 } })
    end

-- maldinis end
-- uwu start
if (itemid == "shortcake") then  
    AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)
    TriggerEvent("np-buffs:applyBuff", "UwUFull", { { buff = "fullness", percent = 0.01, timeOverride = 60000 * 60 } })
end

if (itemid == "chocolate_cake") then  
    AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)
    TriggerEvent("np-buffs:applyBuff", "UwUFull2", { { buff = "fullness", percent = 0.01, timeOverride = 60000 * 60 } })
    TriggerEvent("np-buffs:applyBuff", "UwULuck", { { buff = "jobluck", percent = 0.01, timeOverride = 60000 * 60 } })
end

if (itemid == "donut") then  
    AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)
    TriggerEvent('strongevent')
    TriggerEvent('intelevent')
end
    
    
        if itemid == "bleederburger" then
            local success = AttachPropAndPlayAnimation(
                "mp_player_inteat@burger",
                "mp_player_int_eat_burger",
                49,
                6000,
                "Eating Juicy Burger",
                "",
                false,
                "sandwich",
                playerVeh
            )
        
            if success then
                print("success")
                TriggerEvent('inv:wellfed')
                TriggerEvent("np-buffs:applyBuff", "burger_shotjobluck", { { buff = "swimming", percent = 1.0, timeOverride = 60000 * 60 } })
                TriggerEvent('DoLongHudText', 'You feel like swimming', 1)
                remove = true
            end
        end
    
        if itemid == "moneyshot" then
            local success = AttachPropAndPlayAnimation(
                "mp_player_inteat@burger",
                "mp_player_int_eat_burger",
                49,
                6000,
                "Eating",
                "",
                false,
                "sandwich",
                playerVeh
            )
        
            if success then
                print("success")
                TriggerEvent('inv:wellfed')
                TriggerEvent("np-buffs:applyBuff", "burger_shot", { { buff = "jobluck", percent = 0.01, timeOverride = 60000 * 60 } })
                TriggerEvent('DoLongHudText', 'You feel revitalized', 1)
                remove = true
            end
        end
    
    
        if (itemid == "meatfree") then  
            AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:dogshit",true,itemid,playerVeh)
        end
    
            if (itemid == "fries") then
            TriggerEvent("animation:PlayAnimation","eat")
            local finished = exports['np-taskbar']:taskBar(6000, 'Eating')
            if finished == 100 then
                remove = true
                TriggerEvent('changehunger', 30)
                TriggerEvent("healed:minors")
                TriggerEvent("destroyProp")
            end
        end

    
    if (itemid == "craftedgemaquamarine") then
        TriggerEvent("buffs:triggerBuff", itemid)
        TriggerEvent("np-buffs:applyBuff", "craftedgemaquamarine", { { buff = "swimming", percent = 1.0 } })
        TriggerEvent("DoLongHudText","You Appear to have better Co2 Levels",1) 
    end

    if (itemid == "grapplegun" or itemid == "grapplegunpd") then
        TriggerEvent('Ghost:UseGrappleGun')
      end


      if (itemid == "spikes" and currentVehicle == 0) then
        TriggerEvent('placespikes')
        remove = true
    end

    
    if (itemid == "pixellaptop" and currentVehicle == 0) then
        TriggerEvent('np-boosting:open:boostingApp')
    end

    if (itemid == "grapes012" and currentVehicle == 0) then
        TriggerEvent("evan-craftbench:place", `gr_prop_gr_bench_03b`)
        remove = true
    end

    if(itemid == "evidencebag") then
        TriggerEvent("evidence:startCollect", itemid, slot)
        local itemInfo = GetItemInfo(slot)
        local data = itemInfo.information
        if data == '{}' then
            TriggerEvent("DoLongHudText","Start collecting evidence!",1) 
            TriggerEvent("inventory:updateItem", itemid, slot, '{"used": "true"}')
            --
        else
            local dataDecoded = json.decode(data)
            if(dataDecoded.used) then
                print('YOURE ALREADY COLLECTING EVIDENCE YOU STUPID FUCK')
            end
        end
    end

    if (itemid == "lsdtab" or itemid == "badlsdtab") then
        TriggerEvent("animation:PlayAnimation","pill")
        local finished = exports["np-taskbar"]:taskBar(3000,"Placing LSD Strip on 👅",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("Evidence:StateSet",2,1200)
            TriggerEvent("Evidence:StateSet",24,1200)
            TriggerEvent("fx:run", "lsd", 180, nil, (itemid == "badlsdtab" and true or false))
            remove = true
        end
    end

    if (itemid == "pdbadge") then
        local pCoord = GetEntityCoords(PlayerPedId())
        RPC.execute("np-gov:police:showBadge", ItemInfo.information, pCoord)
    end


    if (itemid == "boostinglaptop") then
        TriggerEvent('np-boosting:openLaptop')
    end

    if (itemid == "decryptersess" or itemid == "decrypterfv2" or itemid == "decrypterenzo") then
      if (#(GetEntityCoords(player) - vector3( 1275.49, -1710.39, 54.78)) < 3.0) then
          local finished = exports["np-taskbar"]:taskBar(25000,"Decrypting Data",false,false,playerVeh)
          if (finished == 100) then
            TriggerEvent("pixerium:check",3,"request:BankUpdate",true)
          end
      end

      if #(GetEntityCoords(player) - vector3( 2328.94, 2571.4, 46.71)) < 3.0 then
          local finished = exports["np-taskbar"]:taskBar(25000,"Decrypting Data",false,false,playerVeh)
          if finished == 100 then
            TriggerEvent("pixerium:check",3,"robbery:decrypt2",true)
          end
      end

      if #(GetEntityCoords(player) - vector3( 1208.73,-3115.29, 5.55)) < 3.0 then
          local finished = exports["np-taskbar"]:taskBar(25000,"Decrypting Data",false,false,playerVeh)
          if finished == 100 then
            TriggerEvent("pixerium:check",3,"robbery:decrypt3",true)
          end
      end
      
    end

    if (itemid == "pix1") then
      if (#(GetEntityCoords(player) - vector3( 1275.49, -1710.39, 54.78)) < 3.0) then
          local finished = exports["np-taskbar"]:taskBar(25000,"Decrypting Data",false,false,playerVeh)
          if (finished == 100) then
            TriggerEvent("Crypto:GivePixerium",math.random(1,2))
            remove = true
          end
      end
    end  

    if (itemid == "pix2") then
      if (#(GetEntityCoords(player) - vector3( 1275.49, -1710.39, 54.78)) < 3.0) then
          local finished = exports["np-taskbar"]:taskBar(25000,"Decrypting Data",false,false,playerVeh)
          if (finished == 100) then
            TriggerEvent("Crypto:GivePixerium",math.random(5,12))
            remove = true
          end
      end
    end

    if (itemid == "weedoz") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Packing Q Bags",false,false,playerVeh)
        if (finished == 100) then
            CreateCraftOption("weedq", 40, true)
        end
    end

    if (itemid == "weedpackage") then
        if exports['np-inventory']:hasEnoughOfItem('emptybaggies', 7) then
            local finished = exports['np-taskbar']:taskBar(5000, 'Preparing')
            if finished == 100 then
                TriggerEvent('inventory:removeItem', 'weedpackage', 1)
                TriggerEvent('inventory:removeItem', 'emptybaggies', 7)
                TriggerEvent("player:receiveItem","weedq", math.random(10, 15))
            end
        else
            TriggerEvent('DoLongHudText', 'You\'re missing something', 2)
        end
    end

        --Secret doors
    if (itemid == "key1") then
        TriggerEvent('np-doors:container_1')
    end
    
    if (itemid == "key2") then
        TriggerEvent('np-doors:container_2')
    end

    if (itemid == "key3") then
        TriggerEvent('np-doors:container_3')
    end

    if (itemid == "heistlaptop3") then
        TriggerEvent("np-robbery:usb")
        -- TriggerEvent("inventory:DegenLastUsedItem", 5)  
    end

    if (itemid == "heistlaptop4") then
         TriggerEvent("np-vault:startvault")
         TriggerEvent('np-vault:startlowervault')
    end

    if (itemid == "heistlaptop5") then
        TriggerEvent('np-prachack')
   end

------------- NEW JOINTS FUNCTIONS ~~ Zyloz

if (itemid == "joint" or itemid == "joint2") then
    local finished = exports["np-taskbar"]:taskBar(2000,"Smoking Joint",false,false,playerVeh)  -- normal joints
    if (finished == 100) then
        Wait(200)
        TriggerEvent("animation:PlayAnimation","weed")
        TriggerEvent("stress:timed",1000,"WORLD_HUMAN_SMOKING_POT")
        TriggerScreenblurFadeOut(100.0)
        TriggerEvent("client:newStress",false, 1200)
        if math.random(100) == 69 then
            TriggerEvent("player:receiveItem","femaleseed",1)
        end
        if math.random(600) == 69 then
            TriggerEvent("player:receiveItem","maleseed",1)
        end
        TriggerEvent("DoLongHudText", "Stress Relieved")
        remove = true
        TriggerScreenblurFadeOut(100.0)
    end
end


if (itemid == "blunt") then
    local finished = exports["np-taskbar"]:taskBar(2000,"Smoking Joint",false,false,playerVeh)   --- will give you intelegence
    if (finished == 100) then
        Wait(200)
        TriggerEvent("animation:PlayAnimation","weed")
        TriggerEvent("stress:timed",1000,"WORLD_HUMAN_SMOKING_POT")
        TriggerScreenblurFadeOut(100.0)
        TriggerEvent("client:newStress",false, 1400)
        TriggerEvent('intelevent')
        if math.random(100) == 69 then
            TriggerEvent("player:receiveItem","femaleseed",1)
        end
        if math.random(600) == 69 then
            TriggerEvent("player:receiveItem","maleseed",1)
        end
        TriggerEvent("DoLongHudText", "Stress Relieved")
        remove = true
        TriggerScreenblurFadeOut(100.0)
    end
end

if (itemid == "chiliadkushjoint") then
    local finished = exports["np-taskbar"]:taskBar(2000,"Smoking Joint",false,false,playerVeh)   --- will give you luck (WIP)
    if (finished == 100) then
        Wait(200)
        TriggerEvent("animation:PlayAnimation","weed")
        TriggerEvent("stress:timed",1000,"WORLD_HUMAN_SMOKING_POT")
        TriggerScreenblurFadeOut(100.0)
        TriggerEvent("client:newStress",false, 1500)
        TriggerEvent('luckevent')
        if math.random(100) == 69 then
            TriggerEvent("player:receiveItem","femaleseed",1)
        end
        if math.random(600) == 69 then
            TriggerEvent("player:receiveItem","maleseed",1)
        end
        TriggerEvent("DoLongHudText", "Stress Relieved")
        remove = true
        TriggerScreenblurFadeOut(100.0)
    end
end

if (itemid == "alaskanthunderfuckjoint") then
    local finished = exports["np-taskbar"]:taskBar(2000,"Smoking Joint",false,false,playerVeh)   --- will give you swim faster
    if (finished == 100) then
        Wait(200)
        TriggerEvent("animation:PlayAnimation","weed")
        TriggerEvent("stress:timed",1000,"WORLD_HUMAN_SMOKING_POT")
        TriggerScreenblurFadeOut(100.0)
        TriggerEvent("client:newStress",false, 1500)
        TriggerEvent('swimbuffevent')
        if math.random(100) == 69 then
            TriggerEvent("player:receiveItem","femaleseed",1)
        end
        if math.random(600) == 69 then
            TriggerEvent("player:receiveItem","maleseed",1)
        end
        TriggerEvent("DoLongHudText", "Stress Relieved")
        remove = true
        TriggerScreenblurFadeOut(100.0)
    end
end

if (itemid == "cbrownie" or itemid == "cgummies") then
    TriggerEvent("animation:PlayAnimation","pill")
    local finished = exports["np-taskbar"]:taskBar(3000,"Consuming Edible",false,false,playerVeh)
    if (finished == 100) then
        if exports['np-inventory']:hasEnoughOfItem('cbrownie', 1) or exports['np-inventory']:hasEnoughOfItem('cgummies', 1) then
            TriggerEvent("client:newStress",false, 5000)
            TriggerEvent('changehunger', -50)
            SetPlayerMaxArmour(PlayerId(), 100) --60
            SetPedArmour( player, 60) --60
            TriggerScreenblurFadeOut(100)
            TriggerEvent("DoLongHudText", "Stress Relieved")
            TriggerEvent("np-buffs:applyBuff", "cosmic4202", { { buff = "alert", percent = 1.0, timeOverride = 60000 * 60 } })
            remove = true
        end
    end
end

if (itemid == "420bar") then
    TriggerEvent("animation:PlayAnimation","eat")
    local finished = exports["np-taskbar"]:taskBar(15000,"Consuming Chocolate Bar",false,false,playerVeh)
    if (finished == 100) then
        if exports['np-inventory']:hasEnoughOfItem('420bar', 1) then
            TriggerEvent("client:newStress",false, 5000)
            SetPlayerMaxArmour(PlayerId(), 100) --60
            SetPedArmour( player, 60) --60
            TriggerEvent('hadsugar')
            TriggerScreenblurFadeOut(100)
            TriggerEvent("DoLongHudText", "Stress Relieved")
            TriggerEvent("np-buffs:applyBuff", "cosmic420", { { buff = "jobluck", percent = 1.0, timeOverride = 60000 * 60 } })
            TriggerEvent("np-buffs:applyBuff", "cosmic4201", { { buff = "alert", percent = 1.0, timeOverride = 60000 * 60 } })
            remove = true
        end
    end
end


if (itemid == "yellowjoint") then
    local finished = exports["np-taskbar"]:taskBar(2000,"Smoking Joint",false,false,playerVeh)  -- normal joints
    if (finished == 100) then
        Wait(200)
        TriggerEvent("animation:PlayAnimation","weed")
        TriggerEvent("stress:timed",1000,"WORLD_HUMAN_SMOKING_POT")
        TriggerScreenblurFadeOut(100.0)
        TriggerEvent("client:newStress",false, 1800)
        TriggerEvent('np-hud:show_alert')
        if math.random(100) == 69 then
            TriggerEvent("player:receiveItem","femaleseed",1)
        end
        if math.random(600) == 69 then
            TriggerEvent("player:receiveItem","maleseed",1)
        end
        TriggerEvent("DoLongHudText", "Stress Relieved")
        TriggerEvent("np-buffs:applyBuff", "cookiespecial", { { buff = "jobluck", percent = 0.6, timeOverride = 60000 * 60 } })
        remove = true
        TriggerScreenblurFadeOut(100.0)
    end
end

if (itemid == "bluejoint") then
    local finished = exports["np-taskbar"]:taskBar(2000,"Smoking Moon Joint",false,false,playerVeh)  -- normal joints
    if (finished == 100) then
        Wait(200)
        TriggerEvent("animation:PlayAnimation","weed")
        TriggerEvent("stress:timed",1000,"WORLD_HUMAN_SMOKING_POT")
        TriggerScreenblurFadeOut(100.0)
        TriggerEvent("client:newStress",false, 1800)
        if math.random(100) == 69 then
            TriggerEvent("player:receiveItem","femaleseed",1)
        end
        if math.random(600) == 69 then
            TriggerEvent("player:receiveItem","maleseed",1)
        end
        TriggerEvent("DoLongHudText", "Stress Relieved")
        remove = true
        TriggerScreenblurFadeOut(100.0)
    end
end

if (itemid == "pinkjoint") then
    local finished = exports["np-taskbar"]:taskBar(2000,"Smoking Pink Noscar Joint",false,false,playerVeh)  -- normal joints
    if (finished == 100) then
        Wait(200)
        TriggerEvent("animation:PlayAnimation","weed")
        TriggerEvent("stress:timed",1000,"WORLD_HUMAN_SMOKING_POT")
        TriggerScreenblurFadeOut(100.0)
        TriggerEvent("client:newStress",false, 2000)
        if math.random(100) == 69 then
            TriggerEvent("player:receiveItem","femaleseed",1)
        end
        if math.random(600) == 69 then
            TriggerEvent("player:receiveItem","maleseed",1)
        end
        TriggerEvent("DoLongHudText", "Stress Relieved")
        remove = true
        TriggerScreenblurFadeOut(100.0)
    end
end

if (itemid == "grapejoint") then
    local finished = exports["np-taskbar"]:taskBar(2000,"Smoking Grape Soda Joint",false,false,playerVeh)  -- normal joints
    if (finished == 100) then
        Wait(200)
        TriggerEvent("animation:PlayAnimation","weed")
        TriggerEvent("stress:timed",1000,"WORLD_HUMAN_SMOKING_POT")
        TriggerScreenblurFadeOut(100.0)
        TriggerEvent("client:newStress",false, 2000)
        if math.random(100) == 69 then
            TriggerEvent("player:receiveItem","femaleseed",1)
        end
        if math.random(600) == 69 then
            TriggerEvent("player:receiveItem","maleseed",1)
        end
        TriggerEvent("DoLongHudText", "Stress Relieved")
        remove = true
        TriggerScreenblurFadeOut(100.0)
    end
end



-- end of joints

    if ( itemid == "varmedkit") then
        TriggerEvent("np-ems:emsRevive")
        TriggerEvent('inventory:removeItem', 'varmedkit', 1)
    end


    if (itemid == "heistlaptop2") then
        TriggerServerEvent("np-paleto:hacklaptop")
    end

    if (itemid == "kp_nuts" or itemid == "walkerscrisp" or itemid == "porkscratchings") then
        TriggerEvent("animation:PlayAnimation","eat")
        local finished = exports['np-taskbar']:taskBar(7500, 'Eating')
        if finished == 100 then
            remove = true
            TriggerEvent('changehunger', 50)
        end
    end

    if (itemid == "vodka" or itemid == "beer" or itemid == "whiskey" or itemid == "casinovodka" or itemid == "casinorum" or itemid == "wineglass" or itemid == "chglass" or itemid == "pinacolada" or itemid == "martini") then
        AttachPropAndPlayAnimation("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,6000,"Drink","changethirst",true,itemid,playerVeh)
        TriggerEvent("Evidence:StateSet", 8, 600)
        local alcoholStrength = 0.5
        if itemid == "vodka" or itemid == "whiskey" or itemid == "casinovodka" or itemid == "casinorum" or itemid == "wineglass" or itemid == "chglass" or itemid == "pinacolada" or itemid == "martini" then alcoholStrength = 1.0 end
        TriggerEvent("fx:run", "alcohol", 180, alcoholStrength)
    end

    if ( itemid == "martini" or itemid == "GlassOfWhiskey" or itemid == "margarita") then
        AttachPropAndPlayAnimation("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,6000,"Drinking "..itemid,"",true,itemid,playerVeh)
        TriggerEvent('changethirst', 50)
        TriggerEvent("Evidence:StateSet", 8, 600)
        local alcoholStrength = 0.5
        if itemid == "martini" or itemid == "GlassOfWhiskey" or itemid == "margarita" then alcoholStrength = 1.0 end
        TriggerEvent("fx:run", "alcohol", 180, alcoholStrength)
    end


    if ( itemid == "glassofredwine" or itemid == "glassofwhitewine") then
        AttachPropAndPlayAnimation("amb@world_human_drinking@coffee@male@idle_a", "idle_c", 49,6000,"Drinking Wine","",true,itemid,playerVeh)
        TriggerEvent('changethirst', 50)
        TriggerEvent("Evidence:StateSet", 8, 600)
        local alcoholStrength = 0.5
        if itemid == "vodka" or itemid == "whiskey" then alcoholStrength = 1.0 end
        TriggerEvent("fx:run", "alcohol", 180, alcoholStrength)
    end

    if (itemid == "coffee") then
        TriggerEvent("animation:PlayAnimation","drink")
        local finished = exports['np-taskbar']:taskBar(6000, 'Drinking Coffee')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('coffee', 1) then
                TriggerEvent('changethirst', 50)
                remove = true
            else
                TriggerEvent('destroyProp')
                TriggerEvent('DoLongHudText', 'Oh it fell on the floor?', 2)
            end
        end
    end
    
    if (itemid == "tea") then
        TriggerEvent("animation:PlayAnimation","drink")
        local finished = exports['np-taskbar']:taskBar(6000, 'Drinking Tea')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('tea', 1) then 
                TriggerEvent('changethirst', 55)
                TriggerEvent('coffee:drink') 
                remove = true
            else
                TriggerEvent('destroyProp')
                TriggerEvent('DoLongHudText', 'Oh it fell on the floor?', 2)
            end
        end
    end

    if (itemid == "fishtaco" or itemid == "salad" or itemid == "sushiplate") then
        TriggerEvent("animation:PlayAnimation","eat")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(7000, 'Eating')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('fishtaco', 1) or exports['np-inventory']:hasEnoughOfItem('salad', 1) or exports['np-inventory']:hasEnoughOfItem('sushiplate', 1) then
                TriggerEvent("destroyProp")
                TriggerEvent('changehunger', 50)
                remove = true
            else
                TriggerEvent('destroyProp')
                TriggerEvent('DoLongHudText', 'Oh it fell on the floor?', 2)
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    if (itemid == "fish_taco") then
        TriggerEvent("animation:PlayAnimation","eat")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(6000, 'Eating Taco')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('fish_taco', 1) then
                TriggerEvent("destroyProp")
                remove = true
                TriggerEvent('void-tacos')
            else
                TriggerEvent('destroyProp')
                TriggerEvent('DoLongHudText', 'Oh it fell on the floor?', 2)
            end
        else
            TriggerEvent("destroyProp")
        end
    end
    
    if (itemid == "chocobar") then
        TriggerEvent("animation:PlayAnimation","eat")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(6000, 'Eating Chocolate Bar')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('chocobar', 1) then
                TriggerEvent("destroyProp")
                TriggerEvent('changehunger', 12)
                remove = true
            else
                TriggerEvent('destroyProp')
                TriggerEvent('DoLongHudText', 'Oh it fell on then floor ?', 2)
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    if (itemid == "chips") then
        TriggerEvent("animation:PlayAnimation","eat")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(7000, 'Eating Fries')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('chips', 1) then
                TriggerEvent("destroyProp")
                TriggerEvent('changehunger', 15)
                remove = true
            else
                TriggerEvent('destroyProp')
                TriggerEvent('DoLongHudText', 'Oh it fell on then floor ?', 2)
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    if (itemid == "taco" or itemid == "burrito") then
        TriggerEvent("animation:PlayAnimation","eat")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(6000, 'Eating')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('taco', 1) or exports['np-inventory']:hasEnoughOfItem('burrito', 1) then
                TriggerEvent("destroyProp")
                TriggerEvent('changehunger', 30)
                TriggerEvent('void-tacos')
                remove = true
            else
                TriggerEvent('destroyProp')
                TriggerEvent('DoLongHudText', 'Oh it fell on then floor ?', 2)
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    if (itemid == "churro" or itemid == "hotdog") then
        TriggerEvent("animation:PlayAnimation","drink")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(6000, 'Eating')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('churro', 1) or exports['np-inventory']:hasEnoughOfItem('hotdog', 1) then
                TriggerEvent("destroyProp")
                TriggerEvent('changehunger', 30)
                TriggerEvent('food:Condiment') 
                remove = true
            else
                TriggerEvent('destroyProp')
                TriggerEvent('DoLongHudText', 'Oh it fell on then floor ?', 2)
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    if (itemid == "greencow") then
        TriggerEvent("animation:PlayAnimation","drink")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(6000, 'Drinking')
        if finishied == 100 then
            if exports['np-inventory']:hasEnoughOfItem('greencow', 1) then
                TriggerEvent('changethirst', 35)
                TriggerEvent('food:Condiment')
                remove = true
            else
                TriggerEvent('destroyProp')
                TriggerEvent('DoLongHudText', 'Oh it fell on then floor ?', 2)
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    if (itemid == "donut" or itemid == "eggsbacon") then
        TriggerEvent("animation:PlayAnimation","eat")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(6000, 'Eating')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('donut', 1) or exports['np-inventory']:hasEnoughOfItem('eggsbacon', 1) then
                TriggerEvent("destroyProp")
                TriggerEvent('changehunger', 30)
                TriggerEvent('food:Condiment')
                remove = true
            else
                TriggerEvent('destroyProp')
                TriggerEvent('DoLongHudText', 'Oh it fell on then floor ?', 2)
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    if (itemid == "icecream" or itemid == "vanillaicecream") then
        TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","food:IceCream",true,itemid,playerVeh)
        TriggerEvent('changehunger', 30)
    end

    if (itemid == "mshake") then
        TaskItem("amb@world_human_drinking@beer@female@idle_a", "idle_a", 49,6000,"Drinking Milkshake","food:IceCream",true,itemid,playerVeh)
        TriggerEvent('changethirst', 45)
    end


    if (itemid == "advlockpick") then
        TriggerEvent("inv:lockPick",false,inventoryName,slot)
    end

    if (itemid == "craftbench") then
        TriggerEvent("evan-craftbench:place", `gr_prop_gr_bench_03b`)
    end

    if (itemid == "Gruppe6Card") then
        TriggerEvent('np-heists:banktruck:cl')
    end

    if (itemid == "usbdevice") then
         TriggerEvent('np-blackmarket:open')  
    end

    if (itemid == "weed12oz") then
        TriggerServerEvent("exploiter", "Someone ate a box with 12oz of weed for no reason / removing item in unintended way")
        TriggerEvent("inv:weedPacking") -- cannot find the end of this call anywhere
        remove = true
    end

    if (itemid == "heavyammo") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1788949567,50,true)
            remove = true
        end
    end

    if (itemid == "rpgammo") then
        local finished = exports["np-taskbar"]:taskBar(10000,"Reloading",false,false,playerVeh)
        if ( finished == 100 and hasEnoughOfItem(itemid, 1, false) ) then
            TriggerEvent("actionbar:ammo",1742569970,1,true)
            remove = true
        end
    end


    if (itemid == "trackerdisabler" ) then
        TriggerEvent('np-boosting:delayTracker')
        remove = false
    end

    if (itemid == "huntingammo") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1285032059,5,true)
            remove = true
        end
    end

    if (itemid == "pistolammo") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1950175060,50,true)
            remove = true
        end
    end

    if (itemid == "devammo") then
            TriggerEvent("actionbar:ammo",1950175060,500,true)
            TriggerEvent("actionbar:ammo",218444191,500,true)
            TriggerEvent("actionbar:ammo",1820140472,500,true)
            remove = true
    end

    if (itemid == "pistolammoPD") then
        local finished = exports["np-taskbar"]:taskBar(2500,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1950175060,50,true)
            remove = true
        end
    end

    if (itemid == "rifleammoPD") then
        print('dumbasssdasdasd')
        local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",218444191,50,true)
            remove = true
        end
    end

    if (itemid == "shotgunammoPD") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",218444191,50,true)
            remove = true
        end
    end

    if (itemid == "subammoPD") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1820140472,50,true)
            remove = true
        end
    end

    if (itemid == "snowballammo") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo", `AMMO_SNOWBALL_2`, 50, true)
            remove = true
        end
    end

    if (itemid == "rifleammo" or itemid == "airsoftammo") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",218444191,50,true)
            remove = true
        end
    end

    -- if (itemid == "sniperammo") then
    --     local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
    --     if (finished == 100) then
    --         TriggerEvent("actionbar:ammo",1285032059,5,true)
    --         remove = true
    --     end
    -- end

    if (itemid == "shotgunammo") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",-1878508229,50,true)
            remove = true
        end
    end

    if (itemid == "subammo") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1820140472,50,true)
            remove = true
        end
    end


    if (itemid == "paintballs") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1916856719,100,true)
            remove = true
        end
    end

    if (itemid == "rubberslugs") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",1517835987,10,true)
            remove = true
        end
    end

    if (itemid == "taserammo") then
        local finished = exports["np-taskbar"]:taskBar(2000,"Reloading",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",-1575030772,3,true)
            remove = true
        end
    end

    if (itemid == "empammo") then
        local finished = exports["np-taskbar"]:taskBar(30000,"Recharging EMP",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("actionbar:ammo",2034517757,2,true)
            remove = true
        end
    end

    if (itemid == "tyrerepairkit") then
        local veh = getCloestVeh()
        if DoesEntityExist(veh) and IsEntityAVehicle(veh) and #(GetEntityCoords(veh) - GetEntityCoords(PlayerPedId())) < 5.0 then
            ExecuteCommand('e mechanic3')
            FreezeEntityPosition(playerped,true)
            local finished = exports["np-taskbar"]:taskBar(20000,"Fixing tires",false,false,playerVeh)
            if (finished == 100) then
                for i = 0, 5 do
                    SetVehicleTyreFixed(targetVehicle, i) 
                    TriggerEvent('veh.randomDegredation',10,targetVehicle,3)
                    ClearPedTasks(playerped)
                    FreezeEntityPosition(playerped, false)
                    TriggerEvent('DoLongHudText', 'Repair Complete !')
                    remove = true
                end
            end
        else
            TriggerEvent('DoShortHudText', 'No vehicle nearby !',2)
      end
   end

   if (itemid == "driftingkit") then
        local veh = getCloestVeh()
        if DoesEntityExist(veh) and IsEntityAVehicle(veh) and #(GetEntityCoords(veh) - GetEntityCoords(PlayerPedId())) < 5.0 then
            ExecuteCommand('e mechanic3')
            local finished = exports["np-taskbar"]:taskBar(20000,"Applying Drifting kit",false,false,playerVeh)
            if finished == 100 then
            TriggerEvent('DoLongHudText', 'Drifting kit applied !')
            end
        end
    end

    if (itemid == "lightarmor") then
        local finished = exports["np-taskbar"]:taskBar(3500,"Putting on Armor",true,false,playerVeh)
        local armor = GetPedArmour(PlayerPedId())
        if (finished == 100) then
            StopAnimTask(PlayerPedId(), 'clothingshirt', 'try_shirt_positive_d', 1.0)
            SetPlayerMaxArmour(PlayerId(), 100) --60
            SetPedArmour( player, armor + 30) --60
            TriggerEvent("UseBodyArmor")
            TriggerEvent("hud:saveCurrentMeta")
            remove = true
        end
    end

    if (itemid == "heavyarmor") then
        local finished = exports["np-taskbar"]:taskBar(7000,"Putting on Armor",true,false,playerVeh)
        if (finished == 100) then
            StopAnimTask(PlayerPedId(), 'clothingshirt', 'try_shirt_positive_d', 1.0)
            SetPlayerMaxArmour(PlayerId(), 100) --60
            SetPedArmour( player, 60) --60
            TriggerEvent("UseBodyArmor")
            TriggerEvent("hud:saveCurrentMeta")
            remove = true
        end
    end

    if (itemid == "pdarmor") then
        local finished = exports["np-taskbar"]:taskBar(2000,"Putting on Armor",true,false,playerVeh)
        if (finished == 100) then
            StopAnimTask(PlayerPedId(), 'clothingshirt', 'try_shirt_positive_d', 1.0)
            SetPlayerMaxArmour(PlayerId(), 100) --60
            SetPedArmour( player, 60) --60
            TriggerEvent("UseBodyArmor")
            TriggerEvent("hud:saveCurrentMeta")
            remove = true
        end
    end


    if (itemid == "bodybag") then
        local finished = exports["np-taskbar"]:taskBar(10000,"Opening bag",true,false,playerVeh)
        if (finished == 100) then
            remove = true
            TriggerEvent( "player:receiveItem", "humanhead", 1 )
            TriggerEvent( "player:receiveItem", "humantorso", 1 )
            TriggerEvent( "player:receiveItem", "humanarm", 2 )
            TriggerEvent( "player:receiveItem", "humanleg", 2 )
        end
    end

    if (itemid == "bodygarbagebag") then
        local finished = exports["np-taskbar"]:taskBar(10000,"Opening trash bag",false,false,playerVeh)
        if (finished == 100) then
            remove = true
            TriggerServerEvent('loot:useItem', itemid)
        end
    end

    if (itemid == "foodsupplycrate") then
        TriggerEvent("DoLongHudText","Make sure you have a ton of space in your inventory! 100 or more.",2)
        local finished = exports["np-taskbar"]:taskBar(20000,"Opening the crate (ESC to Cancel)",false,false,playerVeh)
        if (finished == 100) then
            remove = true
            TriggerEvent( "player:receiveItem", "heartstopper", 10 )
            TriggerEvent( "player:receiveItem", "moneyshot", 10 )
            TriggerEvent( "player:receiveItem", "bleederburger", 10 )
            TriggerEvent( "player:receiveItem", "fries", 10 )
            TriggerEvent( "player:receiveItem", "cola", 10 )
        end
    end


    if itemid == "humanhead" then
        TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 10000, "Eating (ESC to Cancel)", "inv:wellfed", true,itemid,playerVeh,true,"humanskull")
    end

    if (itemid == "humantorso" or itemid == "humanarm" or itemid == "humanhand" or itemid == "humanleg" or itemid == "humanfinger") then
        TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 10000, "Eating (ESC to Cancel)", "inv:wellfed", true,itemid,playerVeh,true,"humanbone")
    end

    if (itemid == "humanear" or itemid == "humanintestines" or itemid == "humanheart" or itemid == "humaneye" or itemid == "humanbrain" or itemid == "humankidney" or itemid == "humanliver" or itemid == "humanlungs" or itemid == "humantongue" or itemid == "humanpancreas") then
        TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 10000, "Eating (ESC to Cancel)", "inv:wellfed", true,itemid)
    end

    if (itemid == "Bankbox") then
        if (hasEnoughOfItem("locksystem",1,false)) then
            local finished = exports["np-taskbar"]:taskBar(10000,"Opening bank box.",false,false,playerVeh)
            if (finished == 100) then
                remove = true
                TriggerEvent("inventory:removeItem","locksystem", 1)  

                TriggerServerEvent('loot:useItem', itemid)
            end
        else
            TriggerEvent("DoLongHudText","You are missing something to open the box with",2)
        end
    end

    if (itemid == "Securebriefcase") then
        if (hasEnoughOfItem("Bankboxkey",1,false)) then
            local finished = exports["np-taskbar"]:taskBar(5000,"Opening briefcase.",false,false,playerVeh)
            if (finished == 100) then
                remove = true
                TriggerEvent("inventory:removeItem","Bankboxkey", 1)  

                TriggerServerEvent('loot:useItem', itemid)
            end
        else
            TriggerEvent("DoLongHudText","You are missing something to open the briefcase with",2)
        end
    end

    if (itemid == "fishingrod") then
        TriggerEvent("np-fishing:start-fishing")
    end

    if (itemid == "fishingtacklebox") then
        local finished = exports["np-taskbar"]:taskBar(5000,"Opening",true,false,playerVeh)
        if (finished == 100) then
            remove = true
            TriggerServerEvent('loot:useItem', itemid)
        end
    end

    if (itemid == "binoculars") then 
        TriggerEvent("binoculars:Activate")
    end

    if (itemid == "camera") then
        TriggerEvent("camera:Activate")
    end

    if (itemid == "nitrous") then
        TriggerEvent("np-nitro:client:placeNitro")
    end

    if (itemid == "lockpick") then
        TriggerEvent("inv:lockPick",false,inventoryName,slot)
        TriggerEvent('dummie-check:boosting')
    end
		
    if (itemid == "radio" or itemid == "emsradio" or itemid == "civradio") then
        TriggerEvent('radioGui')
    end
		
    if (itemid == "umbrella") then
        TriggerEvent("animation:PlayAnimation","umbrella")
    end

    if (itemid == "repairkit") then
      TriggerEvent('veh:repairing',inventoryName,slot,itemid)
    end

    if (itemid == "largemedkit") then
        TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,10000,"Healing","healed:minors",false,itemid,playerVeh)
        TriggerEvent("inventory:DegenLastUsedItem", 15)
      end

      if (itemid == "smallmedkit") then
        TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,10000,"Healing","healed:minors",false,itemid,playerVeh)
        TriggerEvent("inventory:DegenLastUsedItem", 50)
      end

    if (itemid =="advrepairkit") then
      TriggerEvent('veh:repairing',inventoryName,slot,itemid)
           
    end

    if (itemid == "securityblue" or itemid == "securityblack" or itemid == "securitygreen" or itemid == "securitygold" or itemid == "securityred")  then
        TriggerEvent("robbery:scanLock",false,itemid)       
    end

    if (itemid == "Gruppe6Card2")  then
        TriggerEvent("np-heists:bobcat_armed_door")
    end

    if (itemid == "Gruppe6Card222")  then
        TriggerServerEvent("robbery:triggerItemUsedServer",itemid)
    end    

    if (itemid == "Gruppe6Card22")  then
        TriggerServerEvent("robbery:triggerItemUsedServer",itemid)
    end 
    
    if (itemid == "Largesupplycrate")  then
        local finished = exports["np-taskbar"]:taskBar(30000,"Opening Crate",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'propane', 300)
            TriggerEvent('player:receiveItem', 'sodiumhidroxide', 300)
        end
    end 

    if (itemid == "Mediumsupplycrate")  then
        local finished = exports["np-taskbar"]:taskBar(20000,"Opening Crate",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'propane', 200)
            TriggerEvent('player:receiveItem', 'sodiumhidroxide', 200)
        end
    end 

    if (itemid == "Smallsupplycrate")  then
        local finished = exports["np-taskbar"]:taskBar(10000,"Opening Crate",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent('player:receiveItem', 'propane', 100)
            TriggerEvent('player:receiveItem', 'sodiumhidroxide', 100)
            remove = true
        end
    end 

    if (itemid == "meth50g") then
        if exports['np-inventory']:hasEnoughOfItem('drugbaggy', 25) then
        TriggerEvent('inventory:removeItem', 'meth50g', 1)
        TriggerEvent('inventory:removeItem', 'drugbaggy', 25)
        local finished = exports['np-taskbar']:taskBar(25000, 'Bagging Meth')
        if finished == 100 then
            TriggerEvent('player:receiveItem', 'meth1g', 25)
        end
    end
end

    if (itemid == "ciggy") then
        local finished = exports["np-taskbar"]:taskBar(2000,"Lighting Up",false,false,playerVeh)
        if (finished == 100) then
            Wait(200)
            TriggerEvent("animation:PlayAnimation","smoke")      
            TriggerEvent("stress:timed",600,"WORLD_HUMAN_SMOKING_POT")
            TriggerEvent("client:newStress",false, 1000)
            remove = true
            Wait(20000)
            ClearPedTasksImmediately(GetPlayerPed(-1))
        end
    end

    if (itemid == "cigar") then
        if (finished == 100) then
            Wait(200)
            TriggerEvent("animation:PlayAnimation","cigar")    
            TriggerEvent("stress:timed",600,"WORLD_HUMAN_SMOKING_POT")
            TriggerEvent("client:newStress",false, 3500)
            remove = true
            Wait(6000)
            ClearPedTasksImmediately(GetPlayerPed(-1))
        end
    end

    if (itemid == "oxygentank") then
        local finished = exports["np-taskbar"]:taskBar(30000,"Setting up oxygen gear",true,false,playerVeh)
        if (finished == 100) then        
            TriggerEvent("UseOxygenTank")
            remove = true
        end
    end

    if (itemid == "codenotepad") then
        TriggerServerEvent('np-heists:srv:rob_safe')
    end

    if (itemid == "registerkey") then
        TriggerServerEvent('np-heists:srv:rob_register')
    end

    if (itemid == "bandage") then
        TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,10000,"Healing","healed:minors",true,itemid,playerVeh)
    end

    if (itemid == "coke50g") then
        TriggerEvent('inventory:removeItem', 'coke50g', 1)
        local finished = exports['np-taskbar']:taskBar(25000, 'Cutting coke with baking soda')
        if finished == 100 then
            TriggerEvent('player:receiveItem', 'coke5g', 50)
        end
    end

    if (itemid == "methlabcured") then
        if exports['np-inventory']:hasEnoughOfItem('drugbaggy', 10) then
            local finished = exports['np-taskbar']:taskBar(25000, 'Bagging Meth')
            if finished == 100 then
                if exports['np-inventory']:hasEnoughOfItem('drugbaggy', 10) and exports['np-inventory']:hasEnoughOfItem('methlabcured', 1) then
                    TriggerEvent('inventory:removeItem', 'drugbaggy', 10)
                    TriggerEvent('inventory:removeItem', 'methlabcured', 1)
                    TriggerEvent('player:receiveItem', 'meth1g', 10)
                else
                    TriggerEvent('DoLongHudText', '4K', 2)
                end
            end
        else
            TriggerEvent('DoLongHudText', 'You\'re Missing 10 Drug Baggies', 2)
        end
    end

    if (itemid == "idcard") then 
        local ItemInfo = GetItemInfo(slot)
        TriggerServerEvent("police:showID",ItemInfo.information)   
    end

    if (itemid == "drivingtest") then 
        local ItemInfo = GetItemInfo(slot)
        if (ItemInfo.information ~= "No information stored") then
            local data = json.decode(ItemInfo.information)
            TriggerServerEvent("driving:getResults", data.ID)
        end
    end

    if (itemid == "coke5g") then
        local finished = exports["np-interface"]:taskBarSkill(3000, math.random(15, 20))
        if (finished == 100 and hasEnoughOfItem(itemid, 1, false)) then
            TriggerEvent("attachItemObjectnoanim","drugpackage01")
            TriggerEvent("Evidence:StateSet",2,1200)
            TriggerEvent("Evidence:StateSet",6,1200)
            TaskItem("anim@amb@nightclub@peds@", "missfbi3_party_snort_coke_b_male3", 49, 2500, "Sniffing coke intensively", "hadcocaine", false, itemid, playerVeh)
            remove = true
        else
            TriggerEvent('DoLongHudText', 'You dropped the coke on the floor!', 2)
            remove = true
        end
    end

    if (itemid == "1gcrack") then 
        local finished = exports["np-interface"]:taskBarSkill(3000, math.random(15, 20))
        if (finished == 100 and hasEnoughOfItem(itemid, 1, false)) then
            TriggerEvent("attachItemObjectnoanim","crackpipe01")
            TaskItem("switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 49, 5000, "Smoking crack", "hadcrack", true,itemid,playerVeh)
            remove = true
        else
            TriggerEvent('DoLongHudText', 'You dropped the crack on the floor!', 2)
            remove = true
        end
    end

    if itemid == "copium" then
        local finished = exports["np-interface"]:taskBarSkill(3000, math.random(15, 20))
        if (finished == 100 and hasEnoughOfItem(itemid, 1, false)) then
            TaskItem("switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 49, 10000, "Taking a hit of copium", "hadtreat", true,itemid,playerVeh)
            remove = true
            SetEntityHealth(PlayerPedId(), 150)
            SetPedToRagdoll(PlayerPedId(), 30000, 30000, 0, 0, 0, 0)
        else
            TriggerEvent('DoLongHudText', 'You dropped the copium on the floor!', 2)
            remove = true
        end
    end

    if (itemid == "treat") then
        local model = GetEntityModel(player)
        if model == GetHashKey("a_c_chop") then
            TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 1200, "Treat Num's", "hadtreat", true,itemid,playerVeh)
        end
    end

    if (itemid == "IFAK") then
        TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,2000,"Slapping IFAK","healed:useOxy",true,itemid,playerVeh)
        TriggerEvent("client:newStress",false, 2500)
    end

    if (itemid == "aspirin") then
        TriggerEvent("animation:PlayAnimation","pill")
        TriggerEvent("useOxy")
        TriggerEvent("healed:useOxy")
        remove = true
    end

    if (itemid == "hydrocodone") then
        TriggerEvent("animation:PlayAnimation","pill")
        TriggerEvent("useOxy")
        TriggerEvent("healed:useOxy")
        remove = true
    end

    if (itemid == "ibuprofen") then
        TriggerEvent("animation:PlayAnimation","pill")
        TriggerEvent("useOxy")
        TriggerEvent("healed:useOxy")
        remove = true
    end

    if (itemid == "oxy") then
        TriggerEvent("animation:PlayAnimation","pill")
        TriggerEvent("useOxy")
        TriggerEvent("healed:useOxy")
        TriggerEvent("healthregen")
        TriggerEvent("client:newStress",false, 2000)
        remove = true
    end



    if (itemid == "sandwich" or itemid == "hamburger" or itemid == "fish_sandwich" or itemid == "salad" or itemid == "salmon_on_rice") then
        TriggerEvent("animation:PlayAnimation","eat")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(6000, 'Eating')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('sandwich', 1) or exports['np-inventory']:hasEnoughOfItem('hamburger', 1) or exports['np-inventory']:hasEnoughOfItem('fish_sandwich', 1) or exports['np-inventory']:hasEnoughOfItem('salad', 1) or exports['np-inventory']:hasEnoughOfItem('salmon_on_rice', 1) then
                TriggerEvent("destroyProp")
                TriggerEvent('changehunger', 30)
                remove = true
            else
                TriggerEvent('DoLongHudText', 'oh shit, it fell on the floor ?', 2)
                TriggerEvent("destroyProp")
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    -- Pearls items maybe later make certain foods do differnt effects ?

    if (itemid == "skinnedbass" or itemid == "skinnedsalmon" or itemid == "skinnedmarlin" or itemid == "skinnedshark" or itemid == "cookedcrab" or itemid == "cookedshrimp") then
        TriggerEvent("animation:PlayAnimation","eat")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(6000, 'Eating')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('skinnedbass', 1) or exports['np-inventory']:hasEnoughOfItem('skinnedsalmon', 1) or exports['np-inventory']:hasEnoughOfItem('skinnedmarlin', 1) or exports['np-inventory']:hasEnoughOfItem('skinnedshark', 1) or exports['np-inventory']:hasEnoughOfItem('cookedcrab', 1) or exports['np-inventory']:hasEnoughOfItem('cookedshrimp', 1) then
                TriggerEvent("destroyProp")
                TriggerEvent('changehunger', 46)
                remove = true
            else
                TriggerEvent('DoLongHudText', 'oh shit, it fell on the floor ?', 2)
                TriggerEvent("destroyProp")
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    if (itemid == "cookedsalmon" or itemid == "cookedshark" or itemid == "cookedrice" or itemid == "platedshrimp" or itemid == "platedbass" or itemid == "cookedshrimp") then
        TriggerEvent("animation:PlayAnimation","eat")
        TriggerEvent("attachItem", itemid)
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('cookedsalmon') or exports['np-inventory']:hasEnoughOfItem('cookedshark', 1) or exports['np-inventory']:hasEnoughOfItem('cookedrice', 1) or exports['np-inventory']:hasEnoughOfItem('platedshrimp', 1) or exports['np-inventory']:hasEnoughOfItem('platedbase', 1) or exports['np-inventory']:hasEnoughOfItem('cookedshrimp', 1) then
                TriggerEvent("destroyProp")
                TriggerEvent('changehunger', 50)
                remove = true
            else
                TriggerEvent('DoLongHudText', 'oh shit, it fell on the floor ?', 2)
                TriggerEvent("destroyProp")
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    if (itemid == "platedsalmon" or itemid == "platedmarlin") then
        TriggerEvent("animation:PlayAnimation","eat")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(6000, 'Eating')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('platedsalmon', 1) or exports['np-inventory']:hasEnoughOfItem('platedmarlin', 1) then
                TriggerEvent("destroyProp")
                TriggerEvent('changehunger', 50)
                remove = true
            else
                TriggerEvent('DoLongHudText', 'oh shit, it fell on the floor ?', 2)
                TriggerEvent("destroyProp")
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    -- [ End of pearls]


    -- FOODCHAIN

    local burgies = 0
RegisterNetEvent('inv:wellfed')
AddEventHandler('inv:wellfed', function()
    TriggerEvent("Evidence:StateSet",25,3600)
    TriggerEvent('changehunger', 60)
    TriggerEvent('changethirst', 60)
    burgies = 0
end)

RegisterNetEvent('inv:dogshit')
AddEventHandler('inv:dogshit', function()
    TriggerEvent("Evidence:StateSet",25,3600)
    TriggerEvent('changehunger', 25)
    TriggerEvent('changethirst', 25)
    burgies = 0
end)


    if (itemid == "jailfood") then  
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)
    end



    if (itemid == "coffee") then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)    -- UWU
    end

    if (itemid == "greentea") then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)    
        TriggerEvent('luckevent')
    end

    -- hightable shit
    if (itemid == "greentea") then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)    
        TriggerEvent('luckevent')
    end

    if (itemid == "ramunesoda") then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)    
        TriggerEvent('luckevent')
        TriggerEvent('strongevent')
    end

    if (itemid == "bubbletea") then
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)    
        TriggerEvent('luckevent')
    end

    if (itemid == "udon") then  
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)
        TriggerEvent('strongevent')
        TriggerEvent('intelevent')
    end

    if (itemid == "ramen") then  
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)
        TriggerEvent('stressbuff')
        TriggerEvent('intelevent')
    end

    if (itemid == "tonkatsu") then  
        AttachPropAndPlayAnimation("mp_player_inteat@burger", "mp_player_int_eat_burger", 49,6000,"Eating","inv:wellfed",true,itemid,playerVeh)
        TriggerEvent('strongevent')
        TriggerEvent('armorbuff')
    end

    if (itemid == "bstoy") then
        local finished = exports['np-taskbar']:taskBar(6000, 'Opening Toy')
        if finished == 100 then
        TriggerEvent('nicx-burgershot:gettoy')
        remove = true
    end
end


    -- FOODCHAIN END

    if (itemid == "cola" or itemid == "soda" or itemid == "water") then
        TriggerEvent("animation:PlayAnimation","drink")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(6000, 'Drinking')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('cola', 1) or exports['np-inventory']:hasEnoughOfItem('soda', 1) or exports['np-inventory']:hasEnoughOfItem('water', 1) then
                TriggerEvent("destroyProp")
                TriggerEvent('changethirst', 30)
                remove = true
            else
                TriggerEvent('DoLongHudText', 'oh shit, it fell on the floor ?', 2)
                TriggerEvent("destroyProp")
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    if (itemid == "lawnchair1") then
        TriggerEvent('voidrp:greenchair')
        ClearPedTasks(PlayerPedId())
    end

    if (itemid == "lawnchair") then
        TriggerEvent('voidrp:bluechair')
        ClearPedTasks(PlayerPedId())
    end

    if (itemid == "bubbletea" or itemid == "greentea" or itemid == "ramunesoda") then
        TriggerEvent("animation:PlayAnimation","drink")
        local finished = exports['np-taskbar']:taskBar(6000, 'Drinking')
        if finished == 100 then
            TriggerEvent('changethirst', 50)
            remove = true
        end
    end
    
    if (itemid == "softdrink") then
        TriggerEvent("animation:PlayAnimation","drink")
        TriggerEvent("attachItem", itemid)
        local finished = exports['np-taskbar']:taskBar(6000, 'Drinking')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('softdrink', 1) then
                TriggerEvent("destroyProp")
                TriggerEvent('changethirst', 50)
                remove = true
            else
                TriggerEvent('DoLongHudText', 'oh shit, it fell on the floor ?', 2)
                TriggerEvent("destroyProp")
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    if (itemid == "meth1g") then 
        local finished = exports["np-interface"]:taskBarSkill(3000, math.random(15, 20))  -- WHOEVER DID THIS IS ACTAULLY A FUCKING RETARD 
        if (finished == 100 and hasEnoughOfItem(itemid, 1, false)) then
            TriggerEvent("attachItemObjectnoanim","crackpipe01")
            TaskItem("switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 49,1000,"Smoking some meth","hadmeth",true,itemid,playerVeh)
            TriggerEvent('hadmeth')
            remove = true
        else
            TriggerEvent('DoLongHudText', 'You dropped the coke on the floor!', 2)
            remove = true
        end
    end

    if (itemid == "adrenaline") then
        TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,1000,"Applying Adrenaline","inventory:adrenaline",true,itemid,playerVeh)
    end

    if (itemid == "keya") then
        TriggerEvent('moneywash:enter')
        TriggerEvent("inventory:DegenLastUsedItem", 25)
    end

    if itemid == "slushy" then
        TriggerEvent("healed:useOxy")
        TriggerEvent("animation:PlayAnimation","drink")
        TriggerEvent("attachItem", "cup")
        local finished = exports['np-taskbar']:taskBar(10000, 'Drinking Slushy')
        if finished == 100 then
            if exports['np-inventory']:hasEnoughOfItem('slushy', 1) then
                remove = true
                TriggerEvent("destroyProp")
                TriggerEvent('changethirst', 30)
                TriggerEvent('changehunger', 30)
            else
                TriggerEvent('DoLongHudText', 'oh shit, it fell on the floor ?', 2)
                TriggerEvent("destroyProp")
            end
        else
            TriggerEvent("destroyProp")
        end
    end

    if (itemid == "shitlockpick") then
        lockpicking = true
        TriggerEvent("animation:lockpickinvtestoutside") 
        local finished = exports["np-taskbar"]:taskBar(2500,math.random(5,20))
        if (finished == 100) then    
            TriggerEvent("police:uncuffMenu")
        end
        lockpicking = false
        remove = true
    end

    if (itemid == "watch") then
        TriggerEvent("carHud:compass")
    end

    if (itemid == "harness") then
        local veh = GetVehiclePedIsIn(player, false)
        local driver = GetPedInVehicleSeat(veh, -1)
        if (PlayerPedId() == driver) then
            TriggerEvent("vehicleMod:useHarnessItem")
            remove = true
        end
    end

    TriggerEvent("np-inventory:itemUsed", itemid, passedItemInfo, inventoryName, slot)
    TriggerServerEvent("np-inventory:itemUsed", itemid, passedItemInfo, inventoryName, slot)

    if remove then
        TriggerEvent("inventory:removeItem",itemid, 1)
    end

    Wait(500)
    itemsUsedRecently = 0
    justUsed = false


end)

function AttachPropAndPlayAnimation(dictionary,animation,typeAnim,timer,message,func,remove,itemid,vehicle)
    if itemid == "hamburger" or itemid == "heartstopper" or itemid == "bleederburger" or itemid == "fish_sandwich" then
        TriggerEvent("attachItem", "hamburger")
    elseif itemid == "sandwich" then
        TriggerEvent("attachItem", "sandwich")
    elseif itemid == "donut" then
        TriggerEvent("attachItem", "donut")
    elseif itemid == "water" or itemid == "cola" or itemid == "vodka" or itemid == "whiskey" or itemid == "beer" or itemid == "coffee" then
        TriggerEvent("attachItem", itemid)
    elseif itemid == "fishtaco" or itemid == "taco" or itemid == "fish_taco" then
        TriggerEvent("attachItem", "taco")
    elseif itemid == "greencow" then
        TriggerEvent("attachItem", "energydrink")
    elseif itemid == "slushy" then
        TriggerEvent("attachItem", "cup")
    end
    local success = TaskItem(dictionary, animation, typeAnim, timer, message, func, remove, itemid,vehicle)
    TriggerEvent("destroyProp")
    return success
end




RegisterNetEvent('randPickupAnim')
AddEventHandler('randPickupAnim', function()
    loadAnimDict('pickup_object')
    TaskPlayAnim(PlayerPedId(),'pickup_object', 'putdown_low',5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
    Wait(1000)
    ClearPedSecondaryTask(PlayerPedId())
end)

local clientInventory = {};
RegisterNetEvent('current-items')
AddEventHandler('current-items', function(inv)
    clientInventory = inv
    checkForAttachItem()
    TriggerEvent("AttachWeapons")
end)

function checkForAttachItem()
    local AttatchItems = {
        "stolentv",
        "stolenmusic",
        "stolencoffee",
        "stolenmicrowave",
        "stolencomputer",
        "stolenart",
        "darkmarketpackage",
        "247package",
        "weedpackage",
        "methpackage",
        "boxscraps",
        "dodopackagesmall",
        "dodopackagemedium",
        "dodopackagelarge",
        "housesafe",
        "fridge",
        "huntingcarcass1",
        "huntingcarcass2",
        "huntingcarcass3",
        "huntingcarcass4"
    }

    local itemToAttach = "none"
    for k,v in pairs(AttatchItems) do
        if getQuantity(v) >= 1 then
            itemToAttach = v
            break
        end
    end

    TriggerEvent("animation:carry",itemToAttach,true)
end

RegisterNetEvent('SniffRequestCID')
AddEventHandler('SniffRequestCID', function(src)
    local cid = exports["isPed"]:isPed("cid")
    TriggerServerEvent("SniffCID",cid,src)
end)

if (itemid == "rpgammo") then
    local finished = exports["np-taskbar"]:taskBar(30000,"Reloading",false,false,playerVeh)
    if ( finished == 100 and hasEnoughOfItem(itemid, 1, false) ) then
        TriggerEvent("actionbar:ammo",1742569970,1,true)
        remove = true
    end
end

function GetItemInfo(checkslot)
    for i,v in pairs(clientInventory) do
        if (tonumber(v.slot) == tonumber(checkslot)) then
            local info = {["information"] = v.information,["id"] = v.id, ["quality"] = v.quality, ["item_id"] = v.item_id, ["amount"] = v.amount }
            return info
        end
    end
    return "No information stored";
end

function GetInfoForFirstItemOfName(item_id)
    for i,v in pairs(clientInventory) do
        if (v.item_id == item_id) then
            local info = {
              ["information"] = v.information,
              ["id"] = v.id,
              ["quality"] = v.quality,
              ["slot"] = v.slot,
              ["quantity"] = v.amount
            }
            return info
        end
    end
    return nil
end

function GetItemsByItemMetaKV(item_id, meta_key, meta_value)
  local items = {}
  for i, v in pairs(clientInventory) do
      if v.item_id == item_id then
          local info = json.decode(v.information)
          if info[meta_key] == meta_value then
              items[#items + 1] = {
                ["information"] = v.information,
                ["id"] = v.id,
                ["quality"] = v.quality,
              }
          end
      end
  end
  return items
end
exports("GetItemsByItemMetaKV", GetItemsByItemMetaKV)

function GetItemsByItemMetaKVMulti(item_id, meta_data)
    local items = {}
    for i, v in pairs(clientInventory) do
        if v.item_id == item_id then
            local info = json.decode(v.information)
            local shouldAdd = true
            for meta_key, meta_value in pairs(meta_data) do
                shouldAdd = shouldAdd and info[meta_key] == meta_value or false
            end
            if shouldAdd then
                items[#items + 1] = {
                    ["information"] = v.information,
                    ["id"] = v.id,
                    ["quality"] = v.quality,
                }
            end
        end
    end
    return items
end
exports("GetItemsByItemMetaKVMulti", GetItemsByItemMetaKVMulti)

-- item id, amount allowed, crafting.
function CreateCraftOption(id, add, craft)
    TriggerEvent("CreateCraftOption", id, add, craft)
end

-- Animations
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

function TaskItem(dictionary,animation,typeAnim,timer,message,func,remove,itemid,playerVeh,itemreturn,itemreturnid)
    loadAnimDict( dictionary ) 
    TaskPlayAnim( PlayerPedId(), dictionary, animation, 8.0, 1.0, -1, typeAnim, 0, 0, 0, 0 )
    local timer = tonumber(timer)
    if timer > 0 then
        local finished = exports["np-taskbar"]:taskBar(timer,message,true,false,playerVeh)
        if finished == 100 or timer == 0 then
            TriggerEvent(func)

            if remove then
                TriggerEvent("inventory:removeItem",itemid, 1)
            end
            if itemreturn then
                TriggerEvent( "player:receiveItem",itemreturnid, 1 )
            end
            return true
        end
    else
        TriggerEvent(func)
        return true
    end
end

function GetCurrentWeapons()
    local returnTable = {}
    for i,v in pairs(clientInventory) do
        if (tonumber(v.item_id)) then
            local t = { ["hash"] = v.item_id, ["id"] = v.id, ["information"] = v.information, ["name"] = v.item_id, ["slot"] = v.slot }
            returnTable[#returnTable+1]=t
        end
    end   
    if returnTable == nil then 
        return {}
    end
    return returnTable
end

function getQuantity(itemid)
    local amount = 0
    for i,v in pairs(clientInventory) do
        if (v.item_id == itemid) then
            amount = amount + v.amount
        end
    end
    return amount
end

function hasEnoughOfItem(itemid,amount,shouldReturnText)
    if shouldReturnText == nil then shouldReturnText = true end
    if itemid == nil or itemid == 0 or amount == nil or amount == 0 then if shouldReturnText then TriggerEvent("DoLongHudText","I dont seem to have " .. itemid .. " in my pockets.",2) end return false end
    amount = tonumber(amount)
    local slot = 0
    local found = false

    if getQuantity(itemid) >= amount then
        return true
    end 
    return false
end

function isValidUseCase(itemID,isWeapon)
    local player = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(player, false)
    if playerVeh ~= 0 then
        local model = GetEntityModel(playerVeh)
        if IsThisModelACar(model) or IsThisModelABike(model) or IsThisModelAQuadbike(model) then
            if IsEntityInAir(playerVeh) then
                Wait(1000)
                if IsEntityInAir(playerVeh) then
                    TriggerEvent("DoLongHudText","You appear to be flying through the air",2) 
                    return false
                end
            end
        end
    end

    if not validWaterItem[itemID] and not isWeapon then
        if IsPedSwimming(player) then
            local targetCoords = GetEntityCoords(player, 0)
            Wait(700)
            local plyCoords = GetEntityCoords(player, 0)
            if #(targetCoords - plyCoords) > 1.3 then
                TriggerEvent("DoLongHudText","Cannot be moving while swimming to use this.",2) 
                return false
            end
        end

        if IsPedSwimmingUnderWater(player) then
            TriggerEvent("DoLongHudText","Cannot be underwater to use this.",2) 
            return false
        end
    end

    return true
end

-- DNA

RegisterNetEvent('evidence:addDnaSwab')
AddEventHandler('evidence:addDnaSwab', function(dna)
    TriggerEvent("DoLongHudText", "DNA Result: " .. dna,1)    
end)

RegisterNetEvent('CheckDNA')
AddEventHandler('CheckDNA', function()
    TriggerServerEvent("Evidence:checkDna")
end)

RegisterNetEvent('evidence:swabNotify')
AddEventHandler('evidence:swabNotify', function()
    TriggerEvent("DoLongHudText", "DNA swab taken.",1)
end)


function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
    
    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
    
    return closestPlayer, closestDistance
end


-- DNA AND EVIDENCE END

-- this is the upside down world, be careful.

function getVehicleInDirection(coordFrom, coordTo)
    local offset = 0
    local rayHandle
    local vehicle

    for i = 0, 100 do
        rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)   
        a, b, c, d, vehicle = GetRaycastResult(rayHandle)
        
        offset = offset - 1

        if vehicle ~= 0 then break end
    end
    
    local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
    
    if distance > 25 then vehicle = nil end

    return vehicle ~= nil and vehicle or 0
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)

end


RegisterNetEvent('animation:lockpickinvtestoutside')
AddEventHandler('animation:lockpickinvtestoutside', function()
    local lPed = PlayerPedId()
    RequestAnimDict("veh@break_in@0h@p_m_one@")
    while not HasAnimDictLoaded("veh@break_in@0h@p_m_one@") do
        Citizen.Wait(0)
    end
    
    while lockpicking do        
        TaskPlayAnim(lPed, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0, 1.0, 1.0, 16, 0.0, 0, 0, 0)
        Citizen.Wait(2500)
    end
    ClearPedTasks(lPed)
end)

RegisterNetEvent('animation:lockpickinvtest')
AddEventHandler('animation:lockpickinvtest', function(disable)
    local lPed = PlayerPedId()
    RequestAnimDict("mini@repair")
    while not HasAnimDictLoaded("mini@repair") do
        Citizen.Wait(0)
    end
    if disable ~= nil then
        if not disable then
            lockpicking = false
            return
        else
            lockpicking = true
        end
    end
    while lockpicking do

        if not IsEntityPlayingAnim(lPed, "mini@repair", "fixing_a_player", 3) then
            ClearPedSecondaryTask(lPed)
            TaskPlayAnim(lPed, "mini@repair", "fixing_a_player", 8.0, -8, -1, 16, 0, 0, 0, 0)
        end
        Citizen.Wait(1)
    end
    ClearPedTasks(lPed)
end)

RegisterCommand("slimjim", function(source, args)
    TriggerEvent("police:slimjim")
end)

RegisterNetEvent("police:slimjim")
AddEventHandler("police:slimjim",function()
  src = source
	local job = exports['isPed']:isPed('job')
    if exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'state' or exports["isPed"]:isPed("myJob") == 'ranger' then
        if lockpicking then return end
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            local plate = GetVehicleNumberPlateText(vehicle)
            SetVehicleEngineOn(vehicle, true, true)
            TriggerEvent("vehicle:keys:addNew",targetVehicle,plate)
        -- targetVehicle = GetVehiclePedIsUsing(playerped)
        -- TriggerEvent('lockpick:checkandallow',GetVehicleNumberPlateText(targetVehicle))
        -- if targetVehicle ~= nil then
        --     local plateba = GetVehicleNumberPlateText(targetVehicle)
        --     SetVehicleDoorsLocked(targetVehicle, 1)
        --     TriggerServerEvent("garage:addKeys", plate)
        --     TriggerEvent("DoLongHudText", "Ignition Working.",1)
        --     SetEntityAsMissionEntity(targetVehicle,false,true)
        --     SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
        else
            local playerped = PlayerPedId()
            local coordA = GetEntityCoords(playerped, 1)
            local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
            local targetVehicle = getVehicleInDirection(coordA, coordB)
            if targetVehicle == 0 then
              TriggerEvent("DoLongHudText", "No Vehicle near by.",2)
              return
            end
            lockpicking = true
            TaskTurnPedToFaceEntity(PlayerPedId(), targetVehicle, 1.0)
            TriggerEvent('animation:lockpickinvtestoutside')
            local finished = exports["np-taskbar"]:taskBar(10000,"Using Slim Jim")
            if finished == 100 then
              if targetVehicle then
                  local plate = GetVehicleNumberPlateText(targetVehicle)
                  SetVehicleDoorsLocked(targetVehicle, 1)
                  TriggerEvent("DoLongHudText", "Vehicle Unlocked.",1)
                  TriggerEvent('InteractSound_CL:PlayOnOne', 'unlock', 0.1)
                  TriggerEvent("keys:addNew",targetVehicle,plate)
                  lockpicking = false
                  ClearPedTasksImmediately(playerped)
              end
            end

        end
    end
end)

RegisterNetEvent('inv:lockPick')
AddEventHandler('inv:lockPick', function(isForced,inventoryName,slot)
    TriggerEvent("robbery:scanLock",true)
    if lockpicking then return end

    lockpicking = true
    playerped = PlayerPedId()
    targetVehicle = GetVehiclePedIsUsing(playerped)
    local itemid = 21

    if targetVehicle == 0 then
        coordA = GetEntityCoords(playerped, 1)
        coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
        targetVehicle = getVehicleInDirection(coordA, coordB)
        local driverPed = GetPedInVehicleSeat(targetVehicle, -1)
        if targetVehicle == 0 then
            lockpicking = false
            TriggerEvent("robbery:lockpickhouse",isForced)
            return
        end

        if driverPed ~= 0 then
            lockpicking = false
            return
        end
            local d1,d2 = GetModelDimensions(GetEntityModel(targetVehicle))
            local leftfront = GetOffsetFromEntityInWorldCoords(targetVehicle, d1["x"]-0.25,0.25,0.0)

            local count = 5000
            local dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
            while dist > 2.0 and count > 0 do
                dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
                Citizen.Wait(1)
                count = count - 1
                DrawText3Ds(leftfront["x"],leftfront["y"],leftfront["z"],"Move here to lockpick.")
            end

            if dist > 2.0 then
                lockpicking = false
                return
            end


            TaskTurnPedToFaceEntity(PlayerPedId(), targetVehicle, 1.0)
            Citizen.Wait(1000)
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'lockpick', 0.4)
            local triggerAlarm = GetVehicleDoorLockStatus(targetVehicle) > 1
            if triggerAlarm then
                SetVehicleAlarm(targetVehicle, true)
                StartVehicleAlarm(targetVehicle)
            end

            TriggerEvent("animation:lockpickinvtestoutside")
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'lockpick', 0.4)



 
            local finished = exports["np-ui"]:taskBarSkill(15000,3)

            if finished ~= 100 then
                 lockpicking = false
                return
            end

            local finished = exports["np-ui"]:taskBarSkill(2200,4)

            if finished ~= 100 then
                 lockpicking = false
                return
            end


            if finished == 100 then
                if triggerAlarm then
                    SetVehicleAlarm(targetVehicle, false)
                end
                local chance = math.random(50)
                if #(GetEntityCoords(targetVehicle) - GetEntityCoords(PlayerPedId())) < 10.0 and targetVehicle ~= 0 and GetEntitySpeed(targetVehicle) < 5.0 then

                    SetVehicleDoorsLocked(targetVehicle, 1)
                    TriggerEvent("DoLongHudText", "Vehicle Unlocked.",1)
                    TriggerEvent('InteractSound_CL:PlayOnOne', 'unlock', 0.1)

                end
            end
        lockpicking = false
    else
        if targetVehicle ~= 0 and not isForced then

            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'lockpick', 0.4)
            local triggerAlarm = GetVehicleDoorLockStatus(targetVehicle) > 1
            if triggerAlarm then
                SetVehicleAlarm(targetVehicle, true)
                StartVehicleAlarm(targetVehicle)
            end

            SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
            TriggerEvent("animation:lockpickinvtest")
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'lockpick', 0.4)

           
            local carTimer = GetVehicleHandlingFloat(targetVehicle, 'CHandlingData', 'nMonetaryValue')
            if carTimer == nil then
                carTimer = math.random(25000,180000)
            end
            if carTimer < 25000 then
                carTimer = 25000
            end

            if carTimer > 180000 then
                carTimer = 180000
            end
            
            carTimer = math.ceil(carTimer / 3)


            local myJob = exports["isPed"]:isPed("myJob")
            if myjob == "towtruck" then
                carTimer = 4000
            end

            local finished = exports["np-ui"]:taskBarSkill(math.random(5000,10000),math.random(10,15))
            if finished ~= 100 then
                 lockpicking = false
                return
            end

            local finished = exports["np-ui"]:taskBarSkill(math.random(5000,10000),math.random(10,15))
            if finished ~= 100 then
                 lockpicking = false
                return
            end

            local finished = exports["np-ui"]:taskBarSkill(1500,math.random(10,15))
            if finished ~= 100 then
                TriggerEvent("DoLongHudText", "The lockpick bent out of shape.",2)
                TriggerEvent("inventory:removeItem","lockpick", 1)                
                 lockpicking = false
                return
            end     


            Citizen.Wait(500)
            if finished == 100 then
                if triggerAlarm then
                    SetVehicleAlarm(targetVehicle, false)
                end
                local chance = math.random(50)
                if #(GetEntityCoords(targetVehicle) - GetEntityCoords(PlayerPedId())) < 10.0 and targetVehicle ~= 0 and GetEntitySpeed(targetVehicle) < 5.0 then

                    local plate = GetVehicleNumberPlateText(targetVehicle)
                    SetVehicleDoorsLocked(targetVehicle, 1)
                    TriggerEvent("keys:addNew",targetVehicle,plate)
                    TriggerEvent("DoLongHudText", "Ignition Working.",1)
                    SetEntityAsMissionEntity(targetVehicle,false,true)
                    SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
                    TriggerEvent("chop:plateoff",plate)

                end
                lockpicking = false
            end
        end
    end
    lockpicking = false
end)

RegisterNetEvent('InventoryAdvanced:lockPick')
AddEventHandler('InventoryAdvanced:lockPick', function(isForced,inventoryName,slot)
    TriggerEvent("robbery:scanLock",true)
    if lockpicking then return end

    lockpicking = true
    playerped = PlayerPedId()
    targetVehicle = GetVehiclePedIsUsing(playerped)
    local itemid = 21

    if targetVehicle == 0 then
        coordA = GetEntityCoords(playerped, 1)
        coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
        targetVehicle = getVehicleInDirection(coordA, coordB)
        local driverPed = GetPedInVehicleSeat(targetVehicle, -1)
        if targetVehicle == 0 then
            lockpicking = false
            TriggerEvent("robbery:lockpickhouse",isForced)
            return
        end

        if driverPed ~= 0 then
            lockpicking = false
            return
        end
            local d1,d2 = GetModelDimensions(GetEntityModel(targetVehicle))
            local leftfront = GetOffsetFromEntityInWorldCoords(targetVehicle, d1["x"]-0.25,0.25,0.0)

            local count = 5000
            local dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
            while dist > 2.0 and count > 0 do
                dist = #(vector3(leftfront["x"],leftfront["y"],leftfront["z"]) - GetEntityCoords(PlayerPedId()))
                Citizen.Wait(1)
                count = count - 1
                DrawText3Ds(leftfront["x"],leftfront["y"],leftfront["z"],"Move here to lockpick.")
            end

            if dist > 2.0 then
                lockpicking = false
                return
            end


            TaskTurnPedToFaceEntity(PlayerPedId(), targetVehicle, 1.0)
            Citizen.Wait(1000)
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'lockpick', 0.4)
            local triggerAlarm = GetVehicleDoorLockStatus(targetVehicle) > 1
            if triggerAlarm then
                SetVehicleAlarm(targetVehicle, true)
                StartVehicleAlarm(targetVehicle)
            end

            TriggerEvent("animation:lockpickinvtestoutside")
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'lockpick', 0.4)



 
            local finished = exports["np-interface"]:taskBarSkill(15000,3)

            if finished ~= 100 then
                 lockpicking = false
                return
            end

            local finished = exports["np-interface"]:taskBarSkill(2200,4)

            if finished ~= 100 then
                 lockpicking = false
                return
            end


            if finished == 100 then
                if triggerAlarm then
                    SetVehicleAlarm(targetVehicle, false)
                end
                local chance = math.random(50)
                if #(GetEntityCoords(targetVehicle) - GetEntityCoords(PlayerPedId())) < 10.0 and targetVehicle ~= 0 and GetEntitySpeed(targetVehicle) < 5.0 then

                    SetVehicleDoorsLocked(targetVehicle, 1)
                    TriggerEvent("DoLongHudText", "Vehicle Unlocked.",1)
                    TriggerEvent('InteractSound_CL:PlayOnOne', 'unlock', 0.1)
                    TriggerEvent("inventory:DegenLastUsedItem", 5)

                end
            end
        lockpicking = false
    else
        if targetVehicle ~= 0 and not isForced then

            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'lockpick', 0.4)
            local triggerAlarm = GetVehicleDoorLockStatus(targetVehicle) > 1
            if triggerAlarm then
                SetVehicleAlarm(targetVehicle, true)
                StartVehicleAlarm(targetVehicle)
            end

            SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
            TriggerEvent("animation:lockpickinvtest")
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'lockpick', 0.4)

           
            local carTimer = GetVehicleHandlingFloat(targetVehicle, 'CHandlingData', 'nMonetaryValue')
            if carTimer == nil then
                carTimer = math.random(25000,180000)
            end
            if carTimer < 25000 then
                carTimer = 25000
            end

            if carTimer > 180000 then
                carTimer = 180000
            end
            
            carTimer = math.ceil(carTimer / 3)


            local myJob = exports["isPed"]:isPed("myJob")
            if myjob == "towtruck" then
                carTimer = 4000
            end

            local finished = exports["np-interface"]:taskBarSkill(math.random(5000,10000),math.random(10,15))
            if finished ~= 100 then
                 lockpicking = false
                return
            end

            local finished = exports["np-interface"]:taskBarSkill(math.random(5000,10000),math.random(10,15))
            if finished ~= 100 then
                 lockpicking = false
                return
            end

            local finished = exports["np-interface"]:taskBarSkill(1500,math.random(5,10))
            if finished ~= 100 then
                TriggerEvent("DoLongHudText", "The lockpick bent out of shape.",2)
                TriggerEvent("inventory:DegenLastUsedItem", 20)             
                 lockpicking = false
                return
            end     


            Citizen.Wait(500)
            if finished == 100 then
                if triggerAlarm then
                    SetVehicleAlarm(targetVehicle, false)
                end
                local chance = math.random(50)
                if #(GetEntityCoords(targetVehicle) - GetEntityCoords(PlayerPedId())) < 10.0 and targetVehicle ~= 0 and GetEntitySpeed(targetVehicle) < 5.0 then

                    local plate = GetVehicleNumberPlateText(targetVehicle)
                    SetVehicleDoorsLocked(targetVehicle, 1)
                    TriggerEvent("keys:addNew",targetVehicle,plate)
                    TriggerEvent("DoLongHudText", "Ignition Working.",1)
                    SetEntityAsMissionEntity(targetVehicle,false,true)
                    SetVehicleHasBeenOwnedByPlayer(targetVehicle,true)
                    TriggerEvent("chop:plateoff",plate)

                end
                lockpicking = false
            end
        end
    end
    lockpicking = false
end)

local reapiring = false
RegisterNetEvent('veh:repairing')
AddEventHandler('veh:repairing', function(inventoryName,slot,itemid)
    local playerped = PlayerPedId()
    local coordA = GetEntityCoords(playerped, 1)
    local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 100.0, 0.0)
    local targetVehicle = getVehicleInDirection(coordA, coordB)

    local advanced = false
    if itemid == "advrepairkit" then
        advanced = true
    end

    if targetVehicle ~= 0 then

        local d1,d2 = GetModelDimensions(GetEntityModel(targetVehicle))
        local moveto = GetOffsetFromEntityInWorldCoords(targetVehicle, 0.0,d2["y"]+0.5,0.2)
        local dist = #(vector3(moveto["x"],moveto["y"],moveto["z"]) - GetEntityCoords(PlayerPedId()))
        local count = 1000
        local fueltankhealth = GetVehiclePetrolTankHealth(targetVehicle)

        while dist > 1.5 and count > 0 do
            dist = #(vector3(moveto["x"],moveto["y"],moveto["z"]) - GetEntityCoords(PlayerPedId()))
            Citizen.Wait(1)
            count = count - 1
            DrawText3Ds(moveto["x"],moveto["y"],moveto["z"],"Move here to repair.")
        end

        if reapiring then return end
        reapiring = true
        
        local timeout = 20

        NetworkRequestControlOfEntity(targetVehicle)

        while not NetworkHasControlOfEntity(targetVehicle) and timeout > 0 do 
            NetworkRequestControlOfEntity(targetVehicle)
            Citizen.Wait(100)
            timeout = timeout -1
        end


        if dist < 1.5 then
            TriggerEvent("animation:repair",targetVehicle)
            fixingvehicle = true

            local repairlength = 1000

            if advanced then
                local timeAdded = 0
                for i=0,5 do
                    if IsVehicleTyreBurst(targetVehicle, i, false) then
                        if IsVehicleTyreBurst(targetVehicle, i, true) then
                            timeAdded = timeAdded + 1200
                        else
                           timeAdded = timeAdded + 800
                        end
                    end
                end
                local fuelDamage = 48000 - (math.ceil(fueltankhealth)*12)
                repairlength = ((3500 - (GetVehicleEngineHealth(targetVehicle) * 3) - (GetVehicleBodyHealth(targetVehicle)) / 2) * 5) + 2000
                repairlength = repairlength + timeAdded + fuelDamage
            else
                local timeAdded = 0
                for i=0,5 do
                    if IsVehicleTyreBurst(targetVehicle, i, false) then
                        if IsVehicleTyreBurst(targetVehicle, i, true) then
                            timeAdded = timeAdded + 1600
                        else
                           timeAdded = timeAdded + 1200
                        end
                    end
                end
                local fuelDamage = 48000 - (math.ceil(fueltankhealth)*12)
                repairlength = ((3500 - (GetVehicleEngineHealth(targetVehicle) * 3) - (GetVehicleBodyHealth(targetVehicle)) / 2) * 3) + 2000
                repairlength = repairlength + timeAdded + fuelDamage
            end



            local finished = exports["np-interface"]:taskBarSkill(math.random(5000,10000),math.random(10,15))
            if finished ~= 100 then
                fixingvehicle = false
                reapiring = false
                ClearPedTasks(playerped)
                return
            end

            if finished == 100 then
                
                local myJob = exports["isPed"]:isPed("myJob")
                if myJob == "towtruck" then

                    SetVehicleEngineHealth(targetVehicle, 1000.0)
                    SetVehicleBodyHealth(targetVehicle, 1000.0)
                    SetVehiclePetrolTankHealth(targetVehicle, 4000.0)

                    if math.random(100) > 95 then
                        TriggerEvent("inventory:removeItem","repairtoolkit",1)
                    end

                else

                    TriggerEvent('veh.randomDegredation',30,targetVehicle,3)

                    if advanced then
                        TriggerEvent("inventory:removeItem","advrepairkit", 1)
                        TriggerEvent('veh.randomDegredation',30,targetVehicle,3)
                        if GetVehicleEngineHealth(targetVehicle) < 900.0 then
                            SetVehicleEngineHealth(targetVehicle, 900.0)
                        end
                        if GetVehicleBodyHealth(targetVehicle) < 945.0 then
                            SetVehicleBodyHealth(targetVehicle, 945.0)
                        end

                        if fueltankhealth < 3800.0 then
                            SetVehiclePetrolTankHealth(targetVehicle, 3800.0)
                        end

                    else

                        local timer = math.ceil(GetVehicleEngineHealth(targetVehicle) * 5)
                        if timer < 2000 then
                            timer = 2000
                        end
                        local finished = exports["np-interface"]:taskBarSkill(math.random(5000,10000),math.random(10,15))
                        if finished ~= 100 then
                            fixingvehicle = false
                            reapiring = false
                            ClearPedTasks(playerped)
                            return
                        end

                        if math.random(100) > 95 then
                            TriggerEvent("inventory:removeItem","repairtoolkit",1)
                        end

                        if GetVehicleEngineHealth(targetVehicle) < 200.0 then
                            SetVehicleEngineHealth(targetVehicle, 200.0)
                        end
                        if GetVehicleBodyHealth(targetVehicle) < 945.0 then
                            SetVehicleBodyHealth(targetVehicle, 945.0)
                        end

                        if fueltankhealth < 2900.0 then
                            SetVehiclePetrolTankHealth(targetVehicle, 2900.0)
                        end                        

                        if GetEntityModel(targetVehicle) == `BLAZER` then
                            SetVehicleEngineHealth(targetVehicle, 600.0)
                            SetVehicleBodyHealth(targetVehicle, 800.0)
                        end
                    end                    
                end

                for i = 0, 5 do
                    SetVehicleTyreFixed(targetVehicle, i) 
                end
            end
            ClearPedTasks(playerped)
        end
        fixingvehicle = false
    end
    reapiring = false
end)

-- Animations
RegisterNetEvent('animation:load')
AddEventHandler('animation:load', function(dict)
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end)

RegisterNetEvent('animation:repair')
AddEventHandler('animation:repair', function(veh)
    SetVehicleDoorOpen(veh, 4, 0, 0)
    RequestAnimDict("mini@repair")
    while not HasAnimDictLoaded("mini@repair") do
        Citizen.Wait(0)
    end

    TaskTurnPedToFaceEntity(PlayerPedId(), veh, 1.0)
    Citizen.Wait(1000)

    while fixingvehicle do
        local anim3 = IsEntityPlayingAnim(PlayerPedId(), "mini@repair", "fixing_a_player", 3)
        if not anim3 then
            TaskPlayAnim(PlayerPedId(), "mini@repair", "fixing_a_player", 8.0, -8, -1, 16, 0, 0, 0, 0)
        end
        Citizen.Wait(1)
    end
    SetVehicleDoorShut(veh, 4, 1, 1)
end)


local Throttles = {}

function Throttled(name, time)
    if not Throttles[name] then
        Throttles[name] = true
        Citizen.SetTimeout(time or 500, function() Throttles[name] = false end)
        return false
    end

    return true
end

local ItemCallbacks = {}

function RegisterItemCallback(itemName, cb)
    ItemCallbacks[itemName] = cb
end

RegisterCommand('+useKeyFob', function()
    if Throttled("np-doors:doorKeyFob", 1000) then return end
    TriggerEvent("np-doors:doorKeyFob")
end, false)
RegisterCommand('-useKeyFob', function() end, false)

Citizen.CreateThread(function()
    exports["np-binds"]:registerKeyMapping("", "Vehicle", "Door Keyfob", "+useKeyFob", "-useKeyFob", "Y")
    TriggerServerEvent("inv:playerSpawned")
    TriggerEvent("closeInventoryGui")
end)

RegisterNetEvent('np-inventory:shitlord-check')
AddEventHandler('np-inventory:shitlord-check', function()
    if (not hasEnoughOfItem(GetSelectedPedWeapon(PlayerPedId()),1,false)) then
        SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
    end
end)

AddEventHandler("np-inventory:itemUsed", function(item)
    if not nvgItems[item] then return end
    local sm = supportedModels[GetEntityModel(PlayerPedId())]
    if sm then
      TriggerEvent("animation:PlayAnimation", "hairtie")
      Wait(1000)
    end
    nightVisionActive = not nightVisionActive
    nightVisionActivePD = nightVisionActive and (item == "nightvisiongogglespd") or false
    if nightVisionActive
       and (not nightVisionActivePD)
    then
      nightVisionActive = false
      TriggerEvent("DoLongHudText", "Signal interference.", 2)
      return
    end
    SetNightvision(nightVisionActive)
    if not sm then return end
    if nightVisionActive then
      prevPropIdx = GetPedPropIndex(PlayerPedId(), 0)
      prevPropTextureIdx = GetPedPropTextureIndex(PlayerPedId(), 0)
      SetPedPropIndex(PlayerPedId(), 0, sm, 0, true)
    else
      ClearPedProp(PlayerPedId(), 0)
      SetPedPropIndex(PlayerPedId(), 0, prevPropIdx, prevPropTextureIdx, true)
    end
  end)

function WeedAnim()
    RequestAnimDict("amb@world_human_smoking_pot@male@base")
    while not HasAnimDictLoaded("amb@world_human_smoking_pot@male@base") do Citizen.Wait(0) end
    local ped = PlayerPedId()
    local x, y, z = table.unpack(GetEntityCoords(ped))
    jointProp = CreateObject(`prop_sh_joint_01`, x, y, z+0.2,  true,  true, true)
    AttachEntityToEntity(jointProp, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    TaskPlayAnim(ped, 'amb@world_human_smoking_pot@male@base', 'base', 8.0, -8, -1, 49, 0, 0, 0, 0)

    local isSmoking = true

    CreateThread(function()
        while true do
            Wait(0)
            if isSmoking then
                if IsPedShooting(ped) then
                    TriggerEvent('DoLongHudText', 'You cant multitask', 2)
                    TriggerEvent('np-taskbar_cancel')
                    isSmoking = false
                end
            elseif not isSmoking then
                ClearPedTasks(PlayerPedId())
                DeleteEntity(jointProp)
                return
            end
        end
    end)
end

function LoadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent("voidrp:vehicle:wheelchair:control")
AddEventHandler("voidrp:vehicle:wheelchair:control", function(pArgs, pEntity)
    ToggleWheelchairControl(pEntity)
end)

function GetClosestWheelChair()
	local playerPed = PlayerPedId()
	local modelHash = `npwheelchair`
	local entity = GetEntityInFrontOfPlayer(2.0, playerPed)
	local entityModel = GetEntityModel(entity)

	if DoesEntityExist(entity) and entityModel == modelHash then
		return entity
	end
end

function ToggleWheelchairControl(pEntity)
	local wheelchair = pEntity

	if IsPushingWheelchair then
		IsPushingWheelchair = false
		return
	end

	if not wheelchair then return end

	local playerPed = PlayerPedId()
	local currentStearingAngle, currentForwardSpeed, canMove, onFourWheels = 0.0, 0.0, false
	local carryDict, carryAnim = "anim@heists@box_carry@", "idle"
    local walkDict, walkAnim = "move_action@generic@core", "walk"
	local hasWalkingVelocity = false

	AttachEntityToEntity(playerPed, wheelchair, GetEntityBoneIndexByName(wheelchair, "misc_b"), -0.23, -0.4, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 1, 0, 1, 0, 1)

	LoadAnimDict(carryDict)
    LoadAnimDict(walkDict)

	IsPushingWheelchair = true

	local isEmpty, driver = IsVehicleSeatFree(wheelchair, -1)

	if not isEmpty then
		driver = GetPedInVehicleSeat(wheelchair, -1)
		RequestVehicleControl(driver, wheelchair)
	end

	Citizen.CreateThread(function()
		print("[Wheelchair] Controlling: %s | Empty: %s |", IsPushingWheelchair, isEmpty)

		while IsPushingWheelchair do
			local isMovingForward, isMovingBackwards = IsControlPressed(0, 32), IsControlPressed(0, 8)
			local isStearingLeft, isStearingRight = IsControlPressed(0, 34), IsControlPressed(0, 9)
			local forwardSpeed, steeringAngle = 1.5, 30.0
			local IsWalking = false

			if not IsEntityPlayingAnim(playerPed, carryDict, carryAnim, 3) then
				TaskPlayAnim(playerPed, carryDict, carryAnim, 8.0, 8.0, -1, 51, 0, false, false, false)
			end

			if isEmpty then
				NetworkRequestControlOfEntity(wheelchair)
			end

			if IsControlPressed(0, 21) then
				forwardSpeed = 2.5
				steeringAngle = 30.0 / forwardSpeed
			end

			if canMove and isMovingForward then
				IsWalking, currentForwardSpeed = true, forwardSpeed
				-- DecorSetFloat(playerPed, "forwardspeed", forwardSpeed)
				if isEmpty then
					SetVehicleForwardSpeed(wheelchair, forwardSpeed)
				end
			end

			if canMove and isMovingBackwards then
				IsWalking, currentForwardSpeed = true, -1.0
				-- DecorSetFloat(playerPed, "forwardspeed", -1.0)

				if isEmpty then
					SetVehicleForwardSpeed(wheelchair, -1.0)
				end
			end

			if currentForwardSpeed ~= 0.0 and not isMovingForward and not isMovingBackwards then
				currentForwardSpeed = 0.0
				-- DecorSetFloat(playerPed, "forwardspeed", 0.0)
			end

			if isStearingLeft then
				currentStearingAngle = steeringAngle
				-- DecorSetFloat(playerPed, "steeringangle", currentStearingAngle * 0.01)

				if isEmpty then
					SetVehicleSteeringAngle(wheelchair, steeringAngle)
				end
			end

			if isStearingRight then
				currentStearingAngle = -steeringAngle
				-- DecorSetFloat(playerPed, "steeringangle", currentStearingAngle * 0.01)

				if isEmpty then
					SetVehicleSteeringAngle(wheelchair, -steeringAngle)
				end
			end

			if currentStearingAngle ~= 0.0 and (isMovingForward or isMovingBackwards) and (not isStearingLeft and not isStearingRight) then
				currentStearingAngle = 0.0
				-- DecorSetFloat(playerPed, "steeringangle", 0.0)

				if isEmpty then
					SetVehicleSteeringAngle(wheelchair, 0.0)
				end
			end

			local isPlayingWalkAnim = IsEntityPlayingAnim(playerPed,  walkDict, walkAnim, 3)

			if (IsWalking or hasWalkingVelocity) and not isPlayingWalkAnim then
				TaskPlayAnim(playerPed, walkDict, walkAnim, 8.0, 8.0, -1, 1, 0, false, false, false)
			elseif not IsWalking and not hasWalkingVelocity and isPlayingWalkAnim then
				StopAnimTask(playerPed, walkDict, walkAnim, 3.0)
			end

			Citizen.Wait(0)
		end

		if not isEmpty then
			RestoreVehicleControl(driver, wheelchair)
		end

		DetachEntity(playerPed, false, true) -- Might be good to pass P3 (-_-) as true, otherwise in rare occasions the player gets catapulted to the sky....
		StopAnimTask(playerPed, carryDict, carryAnim, 3.0)
		StopAnimTask(playerPed, walkDict, walkAnim, 3.0)

		RemoveAnimDict(walkDict)
		RemoveAnimDict(carryDict)
		print("[Wheelchair] Controlling: %s | Empty: %s |", IsPushingWheelchair, isEmpty)
	end)

	Citizen.CreateThread(function()
		while IsPushingWheelchair do
			local hasDriver = not IsVehicleSeatFree(wheelchair, -1)
			local isEngineOn = GetIsVehicleEngineRunning(wheelchair)
			local velocity, isUpright = GetEntityVelocity(wheelchair), IsEntityUpright(wheelchair, 50.0)
			local vY, vZ = math.abs(velocity.y), math.abs(velocity.z)
			onFourWheels, canMove, hasWalkingVelocity = IsVehicleOnAllWheels(wheelchair), false, false

			if not isEngineOn then
				Sync.SetVehicleEngineOn(wheelchair, true, true, false)
				Sync.SetVehicleUndriveable(wheelchair, false)
			end

			if onFourWheels or vZ < 0.3 then -- Might need to adjust the vZ check to a higher value
				canMove = true
			end

			if vY > 0.5 then -- This will trigger the walking anim if the wheelchair is being manipulated by the driver
				hasWalkingVelocity = true
			end

			if vZ > 2.0 or not IsEntityAttachedToEntity(playerPed, wheelchair) or IsPedDeadOrDying(playerPed, 1) then
				IsPushingWheelchair = false
				print("[Wheelchair] Fall Detected | Velocity: %s |", vZ)
			end

			if not isUpright then
				IsPushingWheelchair = false
			end

			if hasDriver then
				local currentDriver = GetPedInVehicleSeat(wheelchair, -1)

				if currentDriver ~= driver then
					RestoreVehicleControl(driver, wheelchair)
					driver = currentDriver
					RequestVehicleControl(driver, wheelchair)
					print("[Wheelchair] New Driver Detected | Control Requested |")
				end

				isEmpty = not hasDriver
			elseif not isEmpty and not hasDriver then
				isEmpty = not hasDriver
				RestoreVehicleControl(driver, wheelchair)
				driver = nil
				print("[Wheelchair] No Driver Detected | Restoring Local Controls |")
			end

			Citizen.Wait(400)
		end
	end)
end