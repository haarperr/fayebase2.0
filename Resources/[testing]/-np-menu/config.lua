local isInstructorMode = false
local isHandcuffed = false
local isHandcuffedAndWalking = false
local hasOxygenTankOn = false
local gangNum = 0
local cuffStates = {}
local isAtGarage = false


-- Location's
local bennyLocation = vector3(-39.09, -1054.17, 27.79)
local bennyLocationMRPD = vector3(450.01, -976.04, 25.03)
local bennyLocationTunershop = vector3(135.87, -3030.35, 7.04)
local HayesAutoBay2 = vector3(1181.803, 2640.435, 37.23743)
local HayesAutoBay1 = vector3(1174.7, 2640.938, 37.23) -- hayes bay 1 RIGHT SIDE OF HAYES
local bennysSandyShoresPD = vector3(1848.368, 3682.907, 33.45)
local bennysRacingWarehouse = vector3(1032.5406494141,-2528.4790039062,27.679077148438)
local RepairDriftSchool = vector3(-167.4725189209,-2460.7648925781,5.9091796875)
local badboysCustoms = vector3(937.7227, -970.6481, 39.02) -- Tunershop on vespucci BLVD
local badboysCustomsBay1 = vector3(938.13, -978.24, 38.89)
local badboysCustomsBay2 = vector3(929.35, -982.55, 38.76)

local PaletoCivRepairShop = vector3(111.37, 6626.33, 31.27)
local pdheliGarage = vector3(449.303, -981.2569, 43.691)
rootMenuConfig =  {
    {
        id = "police-actions",
        displayName = "Police Actions",
        icon = "#police-action",
        enableMenu = function()
            return (exports['np-base']:CurrentJob() == 'police' or exports['np-base']:CurrentJob() == 'sheriff' or exports['np-base']:CurrentJob() == 'state' and not exports['np-death']:GetDeathStatus())
        end,
        --"police:runplate", "police:toggleradar"
        subMenus = {'police:checkInventory', 'police:revive', 'police:remmask', 'police:checkBank', 'police:checkLicenses', 'police:gsr', 'police:dnaSwab'}
    },

    {
        id = "panic",
        displayName = "Panic",
        icon = "#police-action-panic",
        functionName = "police:policePanic",
        enableMenu = function()
            return (exports['np-base']:CurrentJob() == 'police' or exports['np-base']:CurrentJob() == 'sheriff' or exports['np-base']:CurrentJob() == 'state' and not exports['np-death']:GetDeathStatus() and not exports['np-death']:GetDeathStatus())
        end
    },
    {
        id = "emspanic",
        displayName = "Panic",
        icon = "#police-action-panic",
        functionName = "ems:panicbutton",
        enableMenu = function()
            return (exports['np-base']:CurrentJob() == 'ems' and not exports['np-death']:GetDeathStatus())
        end
    },
    {
        id = "policeDeadA",
        displayName = "10-13A",
        icon = "#police-dead",
        functionName = "police:tenThirteenA",
        enableMenu = function()
            return (exports['np-death']:GetDeathStatus() and exports['np-base']:CurrentJob() == 'police' or exports['np-base']:CurrentJob() == 'sheriff' or exports['np-base']:CurrentJob() == 'state')
        end
    },
    {
        id = "policeDeadB",
        displayName = "10-13B",
        icon = "#police-dead",
        functionName = "police:tenThirteenB",
        enableMenu = function()
            return (exports['np-death']:GetDeathStatus() and exports['np-base']:CurrentJob() == 'police' or exports['np-base']:CurrentJob() == 'sheriff' or exports['np-base']:CurrentJob() == 'state' and not exports['np-death']:GetDeathStatus())
        end
    },
    {
        id = "emsDeadA",
        displayName = "10-14A",
        icon = "#ems-dead",
        functionName = "police:tenForteenA",
        enableMenu = function()
            return (exports['np-base']:CurrentJob() == 'ems' and exports['np-death']:GetDeathStatus())
        end
    },
    {
        id = "emsDeadB",
        displayName = "10-14B",
        icon = "#ems-dead",
        functionName = "police:tenForteenB",
        enableMenu = function()
            return (exports['np-base']:CurrentJob() == 'ems' and exports['np-death']:GetDeathStatus())
        end
    },
    {
        id = "EnterCivBennys",
        displayName = "Enter Bennys",
        icon = "#ems-dead",
        functionName = "bennys:enter",
        enableMenu = function()
            return (polyChecks.bennys.isInside and IsPedInAnyVehicle(PlayerPedId(), false) and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId() and not exports['np-death']:GetDeathStatus())
        end
    },
    {
        id = "openGarageMenu",
        displayName = "Vehicle List",
        icon = "#Garage",
        functionName = "np-garages:open",
        enableMenu = function()
            return (not IsPedInAnyVehicle(PlayerPedId(), false) and isAtGarage == true and not exports['np-death']:GetDeathStatus())
        end
    },

    {
        id = "GivePhoneNumber",
        displayName = "Give Number",
        icon = "#cuffs-check-phone",
        functionName = "np-phone:GivePhoneNumberCL",
        enableMenu = function()
            t, distance, closestPed = GetClosestPlayer()
            if not IsPedInAnyVehicle(PlayerPedId()) and distance ~= -1 and distance < 2 and not exports['np-death']:GetDeathStatus() then
                return true
             end
             return false
         end
    },
    {
        id = "animations",
        displayName = "Walk Style",
        icon = "#walking",
        enableMenu = function()
            return not exports['np-death']:GetDeathStatus()
        end,
        subMenus = { "animations:brave", "animations:cubby",  "animations:business", "animations:tipsy", "animations:injured","animations:tough", "animations:default", "animations:hobo", "animations:money", "animations:swagger", "animations:shady", "animations:maneater", "animations:chichi", "animations:sassy", "animations:sad", "animations:posh", "animations:alien",
        
        --new
        "animations:arrogant","animations:casual","animations:casual2","animations:casual3","animations:casual4","animations:casual5","animations:casual6","animations:confident","animations:business2","animations:business3","animations:femme","animations:flee","animations:gangster","animations:gangster2","animations:gangster3","animations:gangster4","animations:gangster5","animations:heels","animations:heels2","animations:muscle",--[["animations:quick",]]"animations:wide","animations:scared","animations:hurry","animations:quick",}
    },

    {
        id = "expressions",
        displayName = "Expressions",
        icon = "#expressions",
        enableMenu = function()
            return not exports['np-death']:GetDeathStatus()
        end,
        subMenus = { "expressions:normal", "expressions:drunk", "expressions:angry", "expressions:dumb", "expressions:electrocuted", "expressions:grumpy", "expressions:happy", "expressions:injured", "expressions:joyful", "expressions:mouthbreather", "expressions:oneeye", "expressions:shocked", "expressions:sleeping", "expressions:smug", "expressions:speculative", "expressions:stressed", "expressions:sulking", "expressions:weird", "expressions:weird2"}
    },
    {
        id = "blips",
        displayName = "Blips",
        icon = "#blips",
        enableMenu = function()
            return not exports['np-death']:GetDeathStatus()
        end,
        subMenus = { "blips:gasstations", "blips:trainstations", "blips:garages", "blips:barbershop", "blips:tattooshop"}
    },
    {
        id = "drivinginstructor",
        displayName = "Driving Instructor",
        icon = "#drivinginstructor",
        enableMenu = function()
            return (not exports['np-death']:GetDeathStatus() and isInstructorMode)
        end,
        subMenus = { "drivinginstructor:drivingtest", "drivinginstructor:submittest", }
    },
    {
        id = "cuff",
        displayName = "Cuff Actions",
        icon = "#cuffs",
        enableMenu = function()
            return (not isHandcuffed and not isHandcuffedAndWalking and exports['np-base']:CurrentJob() == 'police' or exports['np-base']:CurrentJob() == 'sheriff' or exports['np-base']:CurrentJob() == 'state' and not exports['np-death']:GetDeathStatus())
        end,
        subMenus = { "cuffs:uncuff", "cuffs:remmask","cuffs:cuff" }
    },
    {
        id = "medic",
        displayName = "Medical",
        icon = "#medic",
        enableMenu = function()
            return (exports['np-base']:CurrentJob() == 'ems' and not exports['np-death']:GetDeathStatus())
        end,
        subMenus = {"medic:revive", "medic:heal", "medic:heal2", "general:putinvehicle", "general:unseatnearest" }
    },
    {
        id = "news",
        displayName = "News",
        icon = "#news",
        enableMenu = function()
            return (exports['np-base']:CurrentJob() == 'news' and not exports['np-death']:GetDeathStatus())
        end,
        subMenus = { "news:setCamera", "news:setMicrophone", "news:setBoom" }
    },
    {
        id = "vehicle",
        displayName = "Vehicle",
        icon = "#vehicle-options-vehicle",
        functionName = "veh:options",
        enableMenu = function()
            return ( IsPedInAnyVehicle(PlayerPedId(), false) and not exports['np-death']:GetDeathStatus())
        end
    },
    {
    id = "vehicles-keysgive",
    displayName = "Give Keys",
    icon = "#general-keys-give",
    functionName = "keys:gives",
    enableMenu = function(pEntity, pContext)
        return IsPedInAnyVehicle(PlayerPedId(), false) and not exports['np-death']:GetDeathStatus()
      end
    },

    {
        id = "steal",
        displayName = "Rob Player",
        icon = "#steal-from-player",
        functionName = "np-police:stealrob",
         enableMenu = function()
            t, distance, closestPed = GetClosestPlayer()
            if not IsPedInAnyVehicle(PlayerPedId()) and distance ~= -1 and distance < 2 and ( IsEntityPlayingAnim(closestPed, "dead", "dead_d", 3) or IsEntityPlayingAnim(closestPed, "random@crash_rescue@car_death@std_car", "loop", 3) or IsEntityPlayingAnim(closestPed, "amb@code_human_cower@male@base", "base", 3) or IsEntityPlayingAnim(closestPed, "random@arrests@busted", "idle_a", 3) or IsEntityPlayingAnim(closestPed, "mp_arresting", "idle", 3) or IsEntityPlayingAnim(closestPed, "random@mugging3", "handsup_standing_base", 3) or IsEntityPlayingAnim(closestPed, "missfbi5ig_22", "hands_up_anxious_scientist", 3) or IsEntityPlayingAnim(closestPed, "missfbi5ig_22", "hands_up_loop_scientist", 3) or IsEntityPlayingAnim(closestPed, "missminuteman_1ig_2", "handsup_base", 3) ) then
                return true
             end
             return false
         end
    },

    {
        id = "escort",
        displayName = "Escort",
        icon = "#general-escort",
        functionName = "np-police:escortPlayer",
        enableMenu = function()
            t, distance, closestPed = GetClosestPlayer()
            if not IsPedInAnyVehicle(PlayerPedId()) and distance ~= -1 and distance < 2 and not exports['np-death']:GetDeathStatus() then
                return true
             end
             return false
         end
    },
    {
        id = "oxygentank",
        displayName = "Remove Oxygen Tank",
        icon = "#oxygen-mask",
        functionName = "RemoveOxyTank",
        enableMenu = function()
            return not exports['np-death']:GetDeathStatus() and hasOxygenTankOn
        end
    }, 
    {
        id = "mdt",
        displayName = "MDT",
        icon = "#mdt",
        functionName = "np-mdt:RequestOpen",
        enableMenu = function()
            return ((exports['np-base']:CurrentJob() == 'police' or exports['np-base']:CurrentJob() == 'sheriff' or exports['np-base']:CurrentJob() == 'state' or exports['np-base']:CurrentJob() == 'judge' or exports['np-base']:CurrentJob() == 'district_attorney' or exports['np-base']:CurrentJob() == 'public_defender') and not exports['np-death']:GetDeathStatus())
        end
    },
    {
        id = "mdt",
        displayName = "Dispatch",
        icon = "#general-check-over-target",
        functionName = "np-dispatch_new:openFull",
        enableMenu = function()
            return ((exports['np-base']:CurrentJob() == 'police' or exports['np-base']:CurrentJob() == 'sheriff' or exports['np-base']:CurrentJob() == 'state' or exports['np-base']:CurrentJob() == 'judge' or exports['np-base']:CurrentJob() == 'district_attorney' or exports['np-base']:CurrentJob() == 'public_defender') and not exports['np-death']:GetDeathStatus())
        end
    },
    {
        id = "mdtems",
        displayName = "MDT",
        icon = "#mdt",
        functionName = "np-mdt:RequestOpen",
        enableMenu = function()
            return ((exports['np-base']:CurrentJob() == 'ems') and not exports['np-death']:GetDeathStatus())
        end
    },
    {
        id = "pdimpoundveh",
        displayName = "Impound Vehicle",
        icon = "#impound-vehicle",
        functionName = "np-police-impoundMenu",
        enableMenu = function()
            return (not IsPedInAnyVehicle(PlayerPedId(), false) and exports['np-base']:CurrentJob() == 'police' or exports['np-base']:CurrentJob() == 'sheriff' or exports['np-base']:CurrentJob() == 'state' and not exports['np-death']:GetDeathStatus()) and exports["np-vehicledegrade"]:NearVehicle("Distance")
        end,
    },

    {
        id = "police-and-ems-radios",
        displayName = "Radio",
        icon="#radio-channel-icon",
        enableMenu = function()
            if not exports['np-death']:GetDeathStatus() then
                return (exports['np-base']:CurrentJob() == 'police' or exports['np-base']:CurrentJob() == 'sheriff' or exports['np-base']:CurrentJob() == 'ems' or exports['np-base']:CurrentJob() == 'state')
            end
        end,
        subMenus = {'radio:1', 'radio:2', 'radio:3', 'radio:4', 'radio:5'}
    },
    
    -- PD Vehicle
    {
        id = "police-vehicle",
        displayName = "Police Vehicle",
        icon = "#police-vehicle",
            enableMenu = function()
                if not exports['np-death']:GetDeathStatus() then
                    return (IsPedInAnyVehicle(PlayerPedId(), false) and exports['np-base']:CurrentJob() == 'police' or exports['np-base']:CurrentJob() == 'sheriff' or exports['np-base']:CurrentJob() == 'state')
                end
            end,
        subMenus = {"police:riflerack","police:toggleradar"}
    },

    {
        id = "np-water-and-power-work-veh",
        displayName = "Get Work Vehicle",
        icon = "#general-check-vehicle",
        functionName = "np-civjobs:waternpowercar",
        enableMenu = function()
            local player = PlayerPedId()
            local plyCoords = GetEntityCoords(player)
            local distance = GetDistanceBetweenCoords(plyCoords.x,plyCoords.y,plyCoords.z,453.96923828125, -1966.2592773438, 22.961181640625,false)

            return (distance <= 3.0 and not exports['np-death']:GetDeathStatus() and not IsPedInAnyVehicle(PlayerPedId()))
        end
    },

    {
         id = "storeVehicle",
         displayName = "Store Vehicle",
         icon = "#Store-Vehicle",
         functionName = "np-garages:store",
         enableMenu = function()
             return (not IsPedInAnyVehicle(PlayerPedId(), false) and isAtGarage == true and exports["np-vehicledegrade"]:NearVehicle("Distance") and not exports['np-death']:GetDeathStatus())
         end
    },

    {
        id = "benny:enter1",
        displayName = "Enter Benny's ($250)",
        icon = "#general-check-vehicle",
        functionName = "np-public-bennys",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennyLocation) <= 4)
        end,
    },
    {
        id = "benny:enter4",
        displayName = "Enter Benny's",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:mrpd",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennyLocationMRPD) <= 4)
        end,
    },

    {
        id = "benny:enter5",
        displayName = "Enter Tuner's",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:tunershop",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennyLocationTunershop) <= 4)
        end,
    },
    
    {
        id = "benny:enter8",
        displayName = "Enter Harmony Autos",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:hayes:bay2",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - HayesAutoBay2) <= 3)
        end,
    },

    {
        id = "benny:enter9",
        displayName = "Enter Hayes Autos",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:hayes",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - HayesAutoBay1) <= 2)
        end,
    },


    {
        id = "benny:enterSandyPd",
        displayName = "Enter Bennys",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:sandypd",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennysSandyShoresPD) <= 3)
        end,
    },

    {
        id = "benny:enterRacingWarehouse",
        displayName = "Enter Bennys",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:illegal",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - bennysRacingWarehouse) <= 3)
        end,
    },

    {
        id = "enter:benny:badboysCustoms", 
        displayName = "Enter Bennys",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:badboysCustoms",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - badboysCustoms) <= 3)
        end,
    },

    {
        id = "enter:benny:badboysCustomsBay1", 
        displayName = "Enter Bennys",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:badboysCustomsBay1",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - badboysCustomsBay1) <= 3)
        end,
    },

    {
        id = "enter:benny:badboysCustomsBay2", 
        displayName = "Enter Bennys",
        icon = "#general-check-vehicle",
        functionName = "enter:benny:badboysCustomsBay2",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - badboysCustomsBay2) <= 3)
        end,
    },

    {
        id = "enter:paleto:civ:repair",
        displayName = "Enter Bennys",
        icon = "#general-check-vehicle",
        functionName = "repair:civ:bennys:paleto",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - PaletoCivRepairShop) <= 3)
        end,
    },


    {
        id = "pdhelisGarage",
        displayName = "Vehicle List",
        icon = "#Garage",
        functionName = "np-police:OpenHeliGarage",
        enableMenu = function()
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - pdheliGarage) <= 3)
        end,
    },
    {
        id = "pdhelisGarageStore",
        displayName = "Store Vehicle",
        icon = "#Store-Vehicle",
        functionName = "np-police:heliStatus",
        enableMenu = function()
            return (not isDead and not IsPedInAnyVehicle(PlayerPedId()) and #(GetEntityCoords(PlayerPedId()) - pdheliGarage) <= 3)
        end,
    },
    {
        id = "deployachor:client",
        displayName = "Anchor",
        icon = "#vehicle-anchor",
        functionName = "client:anchor",
        enableMenu = function()
            local currVeh = GetVehiclePedIsIn(PlayerPedId(), false)
            local vehModel = GetEntityModel(currVeh)
            return (not isDead and IsThisModelABoat(vehModel) or IsThisModelAJetski(vesModel) or IsThisModelAnAmphibiousCar(vehModel) or IsThisModelAnAmphibiousQuadbike(vehModel))
        end,
    },

   {
       id = "enterProperty",
       displayName = "Enter Property",
       icon = "#judge-licenses-grant-house",
       functionName = "housing:interactionTriggered",
       enableMenu = function()
           return not exports['np-death']:GetDeathStatus() and exports["np-housing"]:isNearProperty()
       end
  },
   

  {
   id = "lock&unlockProperty",
   displayName = "Unlock/Lock Property",
   icon = "#impound-vehicle",
   functionName = "housing:toggleClosestLock",
   enableMenu = function()
       return not exports['np-death']:GetDeathStatus() and exports["np-housing"]:isNearProperty()
   end
  },

   {
       id = "open-garage-housing",
       displayName = "Vehicle List",
       icon = "#Garage",
       functionName = "np-garages:open",
       enableMenu = function()
           if pHouseGarages ~= nil then
               if #(vector3(pHouseGarages.x,pHouseGarages.y,pHouseGarages.z) - GetEntityCoords(PlayerPedId())) < 5.5 and not exports['np-death']:GetDeathStatus() and not IsPedInAnyVehicle(PlayerPedId(), false) and isAtHouseGarage then
                   return true
               end
           end
           return false
       end
   },

   {
       id = "park-vehicle-garage-housing",
       displayName = "Store Vehicle",
       icon = "#Store-Vehicle",
       functionName = "np-garages:store",
       enableMenu = function()
           if pHouseGarages ~= nil then
               if #(vector3(pHouseGarages.x,pHouseGarages.y,pHouseGarages.z)  - GetEntityCoords(PlayerPedId())) < 3.0 and not exports['np-death']:GetDeathStatus() and not IsPedInAnyVehicle(PlayerPedId(), false) and exports["np-vehicledegrade"]:NearVehicle("Distance") and not exports['np-death']:GetDeathStatus() and isAtHouseGarage then
                   return true
               end
           end
           return false
       end
   },

   
   {
    id = "sellmeth",
    displayName = "Sell",
    icon = "#walking",
    functionName = "np-meth:cornerSellProduct",
    enableMenu = function()
        return not exports['np-death']:GetDeathStatus() and showSellMethOption and not canStartCornering and hasCarTarget
    end
   },

    {
        id = "sellmethfromcorner",
        displayName = "Corner",
        icon = "#walking",
        functionName = "np-meth:cornerStartSelling",
        enableMenu = function()
            return not exports['np-death']:GetDeathStatus() and canStartCornering
        end
    },

    -- {
    --     id = "cornerweedStart",
    --     displayName = "Start Cornering",
    --     icon = "#cocaine-crate",
    --     functionName = "np-weed:attemptCornering",
    --     enableMenu = function()
    --         local corerning = exports['np-weedrun']:isWeedcorerning()
    --         if not IsPedInAnyVehicle(PlayerPedId()) and not exports['np-death']:GetDeathStatus() and exports["np-inventory"]:hasEnoughOfItem("darkmarketdeliveries", 1, false) and not corerning then
    --             return true
    --          end
    --          return false
    --      end
    -- },
    -- {
    --     id = "cornerweedStart",
    --     displayName = "Stop Cornering",
    --     icon = "#cocaine-crate",
    --     functionName = "np-weed:stopCornering",
    --     enableMenu = function()
    --         local corerning = exports['np-weedrun']:isWeedcorerning()
    --         if not exports['np-death']:GetDeathStatus() and corerning then
    --             return true
    --          end
    --          return false
    --      end
    -- },
 

}

newSubMenus = {
    ['police:checkInventory'] = {
        title = "Search",
        icon = "#cuffs-check-inventory",
        functionName = "np-police:checkInventory"
    },   
    ['police:revive'] = {
        title = "Revive",
        icon = "#medic-revive",
        functionName = "np-police:revive"
    },
    ['police:remmask'] = {
        title = "Remove Mask Hat",
        icon = "#cuffs-remove-mask",
        functionName = "np-police:remmask"
    },
    ['police:checkBank'] = {
        title = "Check Bank",
        icon = "#police-check-bank",
        functionName = "np-police:checkBank"
    },
    ['police:checkLicenses'] = {
        title = "Check Licenses",
        icon = "#police-check-licenses",
        functionName = "np-police:checkLicenses"
    },
    ['police:gsr'] = {
        title = "GSR Check",
        icon = "#police-action-gsr",
        functionName = "np-police:gsr"
    },
    ['police:dnaSwab'] = {
        title = "DNA Swab",
        icon = "#police-action-dna-swab",
        functionName = "np-police:dnaSwab"
    },
    ['general:emotes'] = {
        title = "Emotes",
        icon = "#general-emotes",
        functionName = "emotes:OpenMenu"
    },    
    ['general:keysgive'] = {
        title = "Give Key",
        icon = "#general-keys-give",
        functionName = "keys:give"
    },
    ['general:apartgivekey'] = {
        title = "Give Key",
        icon = "#general-apart-givekey",
        functionName = "apart:giveKey"
    },
    ['general:askfortrain'] = {
        title = "Request Train",
        icon = "#general-ask-for-train",
        functionName = "AskForTrain",
    },
    ['general:checkoverself'] = {
        title = "Examine Self",
        icon = "#general-check-over-self",
        functionName = "Evidence:CurrentDamageList"
    },
    ['general:checktargetstates'] = {
        title = "Examine Target",
        icon = "#general-check-over-target",
        functionName = "requestWounds"
    },
    ['general:checkvehicle'] = {
        title = "Examine Vehicle",
        icon = "#general-check-vehicle",
        functionName = "towgarage:annoyedBouce"
    },
    ['general:escort'] = {
        title = "Escort",
        icon = "#general-escort",
        functionName = "np-police:escortPlayer"
    },
    ['general:putinvehicle'] = {
        title = "Seat Vehicle",
        icon = "#general-put-in-veh",
        functionName = "police:forceEnter"
    },
    ['general:unseatnearest'] = {
        title = "Unseat Nearest",
        icon = "#general-unseat-nearest",
        functionName = "unseatPlayer"
    },    
    ['general:flipvehicle'] = {
        title = "Flip Vehicle",
        icon = "#general-flip-vehicle",
        functionName = "FlipVehicle"
    },

    ['animations:joy'] = {
        title = "Joy",
        icon = "#animation-joy",
        functionName = "AnimSet:Joy"
    },
    ['animations:sexy'] = {
        title = "Sexy",
        icon = "#animation-sexy",
        functionName = "AnimSet:Sexy"
    },
    ['animations:moon'] = {
        title = "Moon",
        icon = "#animation-moon",
        functionName = "AnimSet:Moon"
    },
    ['animations:tired'] = {
        title = "Tired",
        icon = "#animation-tired",
        functionName = "AnimSet:Tired"
    },
    ['animations:arrogant'] = {
        title = "Arrogant",
        icon = "#animation-arrogant",
        functionName = "AnimSet:Arrogant"
    },
    
    ['animations:casual'] = {
        title = "Casual",
        icon = "#animation-casual",
        functionName = "AnimSet:Casual"
    },
    ['animations:casual2'] = {
        title = "Casual 2",
        icon = "#animation-casual",
        functionName = "AnimSet:Casual2"
    },
    ['animations:casual3'] = {
        title = "Casual 3",
        icon = "#animation-casual",
        functionName = "AnimSet:Casual3"
    },
    ['animations:casual4'] = {
        title = "Casual 4",
        icon = "#animation-casual",
        functionName = "AnimSet:Casual4"
    },
    ['animations:casual5'] = {
        title = "Casual 5",
        icon = "#animation-casual",
        functionName = "AnimSet:Casual5"
    },
    ['animations:casual6'] = {
        title = "Casual 6",
        icon = "#animation-casual",
        functionName = "AnimSet:Casual6"
    },
    ['animations:confident'] = {
        title = "Confident",
        icon = "#animation-confident",
        functionName = "AnimSet:Confident"
    },
    
    ['animations:business2'] = {
        title = "Business 2",
        icon = "#animation-business",
        functionName = "AnimSet:Business2"
    },
    ['animations:business3'] = {
        title = "Business 3",
        icon = "#animation-business",
        functionName = "AnimSet:Business3"
    },
    
    ['animations:femme'] = {
        title = "Femme",
        icon = "#animation-female",
        functionName = "AnimSet:Femme"
    },
    ['animations:flee'] = {
        title = "Flee",
        icon = "#animation-flee",
        functionName = "AnimSet:Flee"
    },
    ['animations:gangster'] = {
        title = "Gangster",
        icon = "#animation-gangster",
        functionName = "AnimSet:Gangster"
    },
    ['animations:gangster2'] = {
        title = "Gangster 2",
        icon = "#animation-gangster",
        functionName = "AnimSet:Gangster2"
    },
    ['animations:gangster3'] = {
        title = "Gangster 3",
        icon = "#animation-gangster",
        functionName = "AnimSet:Gangster3"
    },
    ['animations:gangster4'] = {
        title = "Gangster 4",
        icon = "#animation-gangster",
        functionName = "AnimSet:Gangster4"
    },
    ['animations:gangster5'] = {
        title = "Gangster 5",
        icon = "#animation-gangster",
        functionName = "AnimSet:Gangster5"
    },
    
    ['animations:heels'] = {
        title = "Heels",
        icon = "#animation-female",
        functionName = "AnimSet:Heels"
    },
    ['animations:heels2'] = {
        title = "Heels 2",
        icon = "#animation-female",
        functionName = "AnimSet:Heels2"
    },
    
    ['animations:hipster'] = {
        title = "Hipster",
        icon = "#animation-hipster",
        functionName = "AnimSet:Hipster"
    },
    ['animations:hiking'] = {
        title = "Hiking",
        icon = "#animation-hiking",
        functionName = "AnimSet:Hiking"
    },
    
    ['animations:jog'] = {
        title = "Jog",
        icon = "#animation-jog",
        functionName = "AnimSet:Jog"
    },
    
    ['animations:muscle'] = {
        title = "Muscle",
        icon = "#animation-tough",
        functionName = "AnimSet:Muscle"
    },
    
    ['animations:quick'] = {
        title = "Quick",
        icon = "#animation-chubby",
        functionName = "AnimSet:Quick"
    },
    ['animations:wide'] = {
        title = "Wide",
        icon = "#animation-wide",
        functionName = "AnimSet:Wide"
    },
    ['animations:scared'] = {
        title = "Scared",
        icon = "#animation-scared",
        functionName = "AnimSet:Scared"
    },
    ['animations:guard'] = {
        title = "Guard",
        icon = "#animation-guard",
        functionName = "AnimSet:Guard"
    },
    ['animations:brave'] = {
        title = "Brave",
        icon = "#animation-brave",
        functionName = "AnimSet:Brave"
    },
    ['animations:hurry'] = {
        title = "Hurry",
        icon = "#animation-chubby",
        functionName = "AnimSet:Hurry"
    },
    ['animations:business'] = {
        title = "Business",
        icon = "#animation-business",
        functionName = "AnimSet:Business"
    },
    ['animations:tipsy'] = {
        title = "Tipsy",
        icon = "#animation-tipsy",
        functionName = "AnimSet:Tipsy"
    },
    ['animations:injured'] = {
        title = "Injured",
        icon = "#animation-injured",
        functionName = "AnimSet:Injured"
    },
    ['animations:tough'] = {
        title = "Tough",
        icon = "#animation-tough",
        functionName = "AnimSet:ToughGuy"
    },
    ['animations:sassy'] = {
        title = "Sassy",
        icon = "#animation-sassy",
        functionName = "AnimSet:Sassy"
    },
    ['animations:sad'] = {
        title = "Sad",
        icon = "#animation-sad",
        functionName = "AnimSet:Sad"
    },
    ['animations:posh'] = {
        title = "Posh",
        icon = "#animation-posh",
        functionName = "AnimSet:Posh"
    },
    ['animations:alien'] = {
        title = "Alien",
        icon = "#animation-alien",
        functionName = "AnimSet:Alien"
    },
    ['animations:nonchalant'] =
    {
        title = "Nonchalant",
        icon = "#animation-nonchalant",
        functionName = "AnimSet:NonChalant"
    },
    ['animations:hobo'] = {
        title = "Hobo",
        icon = "#animation-hobo",
        functionName = "AnimSet:Hobo"
    },
    ['animations:cubby'] = {
        title = "Chubby Walk",
        icon = "#animation-chubby",
        functionName = "AnimSet:Cubby"
    },
    ['animations:money'] = {
        title = "Money",
        icon = "#animation-money",
        functionName = "AnimSet:Money"
    },
    ['animations:swagger'] = {
        title = "Swagger",
        icon = "#animation-swagger",
        functionName = "AnimSet:Swagger"
    },
    ['animations:shady'] = {
        title = "Shady",
        icon = "#animation-shady",
        functionName = "AnimSet:Shady"
    },
    ['animations:maneater'] = {
        title = "Man Eater",
        icon = "#animation-maneater",
        functionName = "AnimSet:ManEater"
    },
    ['animations:chichi'] = {
        title = "ChiChi",
        icon = "#animation-chichi",
        functionName = "AnimSet:ChiChi"
    },
    ['animations:default'] = {
        title = "Default",
        icon = "#animation-default",
        functionName = "AnimSet:default"
    },
    ['blips:gasstations'] = {
        title = "Gas Stations",
        icon = "#blips-gasstations",
        functionName = "CarPlayerHud:ToggleGas"
    },    
    ['blips:trainstations'] = {
        title = "Train Stations",
        icon = "#blips-trainstations",
        functionName = "Trains:ToggleTainsBlip"
    },
    ['blips:garages'] = {
        title = "Garages",
        icon = "#blips-garages",
        functionName = "Garages:ToggleGarageBlip"
    },
    ['blips:barbershop'] = {
        title = "Barber Shop",
        icon = "#blips-barbershop",
        functionName = "hairDresser:ToggleHair"
    },    
    ['blips:tattooshop'] = {
        title = "Tattoo Shop",
        icon = "#blips-tattooshop",
        functionName = "tattoo:ToggleTattoo"
    },
    ['drivinginstructor:drivingtest'] = {
        title = "Driving Test",
        icon = "#drivinginstructor-drivingtest",
        functionName = "drivingInstructor:testToggle"
    },
    ['drivinginstructor:submittest'] = {
        title = "Submit Test",
        icon = "#drivinginstructor-submittest",
        functionName = "drivingInstructor:submitTest"
    },
    ['cuffs:cuff'] = {
        title = "Cuff",
        icon = "#cuffs-cuff",
        functionName = "np-police:CuffPlayer"
    },
    ['cuffs:uncuff'] = {
        title = "Uncuff",
        icon = "#cuffs-uncuff",
        functionName = "np-police:uncuffMenu"
    },
    ['cuffs:remmask'] = {
        title = "Remove Mask Hat",
        icon = "#cuffs-remove-mask",
        functionName = "np-police:remmask"
    },
    ['cuffs:checkinventory'] = {
        title = "Search Person",
        icon = "#cuffs-check-inventory",
        functionName = "np-police:checkInventory"
    },
    ['cuffs:unseat'] = {
        title = "Unseat",
        icon = "#cuffs-unseat-player",
        functionName = "unseatPlayerCiv"
    },
    ['medic:revive'] = {
        title = "Revive",
        icon = "#medic-revive",
        functionName = "np-ems:emsRevive"
    },
    ['medic:heal'] = {
        title = "Small Heal",
        icon = "#medic-heal",
        functionName = "np-ems:smallheal"
    },
    ['medic:heal2'] = {
        title = "Big Heal",
        icon = "#medic-heal",
        functionName = "np-ems:bigheal"
    },
    ['medic:stomachpump'] = {
        title = "Stomach pump",
        icon = "#medic-stomachpump",
        functionName = "ems:stomachpump"
    },
    ['news:setCamera'] = {
        title = "Camera",
        icon = "#news-job-news-camera",
        functionName = "camera:setCamera"
    },
    ['news:setMicrophone'] = {
        title = "Microphone",
        icon = "#news-job-news-microphone",
        functionName = "camera:setMic"
    },
    ['news:setBoom'] = {
        title = "Microphone Boom",
        icon = "#news-job-news-boom",
        functionName = "camera:setBoom"
    },
    ['weed:currentStatusServer'] = {
        title = "Request Status",
        icon = "#weed-cultivation-request-status",
        functionName = "weed:currentStatusServer"
    },   
    ['weed:weedCrate'] = {
        title = "Remove A Crate",
        icon = "#weed-cultivation-remove-a-crate",
        functionName = "weed:weedCrate"
    },
    ["expressions:angry"] = {
        title="Angry",
        icon="#expressions-angry",
        functionName = "expressions",
        functionParameters =  { "mood_angry_1" }
    },
    ["expressions:drunk"] = {
        title="Drunk",
        icon="#expressions-drunk",
        functionName = "expressions",
        functionParameters =  { "mood_drunk_1" }
    },
    ["expressions:dumb"] = {
        title="Dumb",
        icon="#expressions-dumb",
        functionName = "expressions",
        functionParameters =  { "pose_injured_1" }
    },
    ["expressions:electrocuted"] = {
        title="Electrocuted",
        icon="#expressions-electrocuted",
        functionName = "expressions",
        functionParameters =  { "electrocuted_1" }
    },
    ["expressions:grumpy"] = {
        title="Grumpy",
        icon="#expressions-grumpy",
        functionName = "expressions", 
        functionParameters =  { "mood_drivefast_1" }
    },
    ["expressions:happy"] = {
        title="Happy",
        icon="#expressions-happy",
        functionName = "expressions",
        functionParameters =  { "mood_happy_1" }
    },
    ["expressions:injured"] = {
        title="Injured",
        icon="#expressions-injured",
        functionName = "expressions",
        functionParameters =  { "mood_injured_1" }
    },
    ["expressions:joyful"] = {
        title="Joyful",
        icon="#expressions-joyful",
        functionName = "expressions",
        functionParameters =  { "mood_dancing_low_1" }
    },
    ["expressions:mouthbreather"] = {
        title="Mouthbreather",
        icon="#expressions-mouthbreather",
        functionName = "expressions",
        functionParameters = { "smoking_hold_1" }
    },
    ["expressions:normal"]  = {
        title="Normal",
        icon="#expressions-normal",
        functionName = "expressions:clear"
    },
    ["expressions:oneeye"]  = {
        title="One Eye",
        icon="#expressions-oneeye",
        functionName = "expressions",
        functionParameters = { "pose_aiming_1" }
    },
    ["expressions:shocked"]  = {
        title="Shocked",
        icon="#expressions-shocked",
        functionName = "expressions",
        functionParameters = { "shocked_1" }
    },
    ["expressions:sleeping"]  = {
        title="Sleeping",
        icon="#expressions-sleeping",
        functionName = "expressions",
        functionParameters = { "dead_1" }
    },
    ["expressions:smug"]  = {
        title="Smug",
        icon="#expressions-smug",
        functionName = "expressions",
        functionParameters = { "mood_smug_1" }
    },
    ["expressions:speculative"]  = {
        title="Speculative",
        icon="#expressions-speculative",
        functionName = "expressions",
        functionParameters = { "mood_aiming_1" }
    },
    ["expressions:stressed"]  = {
        title="Stressed",
        icon="#expressions-stressed",
        functionName = "expressions",
        functionParameters = { "mood_stressed_1" }
    },
    ["expressions:sulking"]  = {
        title="Sulking",
        icon="#expressions-sulking",
        functionName = "expressions",
        functionParameters = { "mood_sulk_1" },
    },
    ["expressions:weird"]  = {
        title="Weird",
        icon="#expressions-weird",
        functionName = "expressions",
        functionParameters = { "effort_2" }
    },
    ["expressions:weird2"]  = {
        title="Weird 2",
        icon="#expressions-weird2",
        functionName = "expressions",
        functionParameters = { "effort_3" }
    },

    -- PD Radios --

    ["radio:1"] = {
        title="Channel 1 (PD)",
        icon="#radio-channel-icon",
        functionName = "np-radio:set_chan_1",
    },
    
    ["radio:2"] = {
        title="Channel 2 (EMS)",
        icon="#radio-channel-icon",
        functionName = "np-radio:set_chan_2",
    },

    ["radio:3"] = {
        title="Channel 3",
        icon="#radio-channel-icon",
        functionName = "np-radio:set_chan_3",
    },

    ["radio:4"] = {
        title="Channel 4",
        icon="#radio-channel-icon",
        functionName = "np-radio:set_chan_4",
    },

    ["radio:5"] = {
        title="Channel 5",
        icon="#radio-channel-icon",
        functionName = "np-radio:set_chan_5",
    },
    ['police:toggleradar'] = {
        title = "Toggle Radar",
        icon = "#police-vehicle-radar",
        functionName = "startSpeedo"
    },
    ['police:riflerack'] = {
        title = "Rifle Rack",
        icon="#drivinginstructor-submittest",
        functionName = "police:RifleRack",
    },
}

RegisterNetEvent("menu:setCuffState")
AddEventHandler("menu:setCuffState", function(pTargetId, pState)
    cuffStates[pTargetId] = pState
end)

RegisterNetEvent("menu:hasOxygenTank")
AddEventHandler("menu:hasOxygenTank", function(pHasOxygenTank)
    hasOxygenTankOn = pHasOxygenTank
end)

RegisterNetEvent('enablegangmember')
AddEventHandler('enablegangmember', function(pGangNum)
    gangNum = pGangNum
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
    local closestPed = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        for index,value in ipairs(players) do
            local target = GetPlayerPed(value)
            if(target ~= ply) then
                local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
                local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
                if(closestDistance == -1 or closestDistance > distance) and not IsPedInAnyVehicle(target, false) then
                    closestPlayer = value
                    closestPed = target
                    closestDistance = distance
                end
            end
        end
        return closestPlayer, closestDistance, closestPed
    end
end

local approvedGarages = {
    "A",
    "B",
    "C",
    "D",
    "G",
    "P",
    "Q",
    "T",
    "casino",
    "Repo",
    "Impound Lot",
    "Garage Del Perro",
    "Police Department",
    "Pillbox",
    "Harmony",
    "Winery",
    "Pier",
    "BBC",
    "VU",
    "Burger Shot Garage",
    "Bahama Mamas Garage",
    "Bean Machine Garage",
    "Best Buds Garage",
    "Auto Exotics Garage",
    "Life Invader Garage",
    "PDM Garage",
    "Harmony Autos Garage",
    "Courthouse Garage",
    "Bennys Garage",
    "Integrity Way",
    "Badboy Customs"
}

local pCurrentGarage = "None"


function polyZoneEnter(zoneName, zoneData)
    currentZone = zoneName
    for k, v in pairs (approvedGarages) do
        if zoneName == v then
            pCurrentGarage = zoneName
            print(pCurrentGarage)
            isAtGarage = true
            isAtHouseGarage = false
        end
    end
end

function polyZoneExit(zoneName)
    if currentZone == zoneName then
        isAtGarage = false
        isAtHouseGarage = false
        pCurrentGarage = "None"
    end
end

exports("currentGarage", function()
    if isAtGarage then
        return pCurrentGarage
    elseif isAtHouseGarage then
        return pHouseNameGarage
    end
end)

exports("houseGarageCoords", function()
    return pHouseGarages
end)

exports("NearHouseGarage", function()
    return isAtHouseGarage
end)

RegisterNetEvent("menu:send:house:garages", function(pCoords, pGarageName)
    pHouseGarages = pCoords
    isAtHouseGarage = true
    pHouseNameGarage = pGarageName
end)

RegisterNetEvent("menu:housing", function(pState)
    isAtHouseGarage = pState
end)

AddEventHandler('np-polyzone:entered:garages', polyZoneEnter)
AddEventHandler('np-polyzone:exited:garages', polyZoneExit)

-- RegisterCommand('GetInfo', function()
--     local user = exports["np-base"]:GetModule("LocalPlayer")
--     print('This is my cash', user.cash)
--     print('This is my bank', user.bank)
-- end)