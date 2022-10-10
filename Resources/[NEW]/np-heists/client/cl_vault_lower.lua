local firstlowerdoor = false
local firstpindoor = false
local secpindoor = false
local thirdpindoor = false
local fourthpindoor = false
local vaultdoor = false
local laptoppin = false


----- lower vault start lol

RegisterNetEvent('np-vault:startlowervault')
AddEventHandler('np-vault:startlowervault', function()
    local player = GetEntityCoords(PlayerPedId())
    local distance = #(vector3(272.08557, 231.21812, 97.683708) - player)
    local pd = exports['np-duty']:LawAmount()
    if pd >= 4 then
        if distance < 1.5 then
            if exports["np-inventory"]:hasEnoughOfItem("heistlaptop4", 1) then
                if exports['np-blackout']:Blackout() then
                    StartLowerVaultKid()
                    TriggerEvent('np-dispatch:bankrobbery')
                    exports['np-hacking']:OpenHackingGame(10, 6, 6, function(Success2)
                    OnLowerHackDone(Success2)
                    DeleteObject(bag)
                    DeleteObject(laptop)
                    FreezeEntityPosition(ped, false)
                end)
                TriggerEvent("inventory:removeItem", "heistlaptop4", 1)
                Citizen.Wait(1000)
                end 
            end
        end
    else
        TriggerEvent('DoLongHudText', 'Not enough cops on duty.')
    end
end)


function OnLowerHackDone(success2)
    if success2 then
        TriggerServerEvent('np-doors:change-lock-state', 278, false) 
        TriggerServerEvent("np-doors:change-lock-state", 279, false)
    end
end



RegisterNetEvent('zyloz:createCrates')
AddEventHandler('zyloz:createCrates', function(toggle)
    if toggle == true then
     weaponbox = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 296.67828369141, 211.29058837891, 96.688102722168, true,  true, true)
    CreateObject(weaponbox)
    SetEntityHeading(weaponbox, 186.12)
    FreezeEntityPosition(weaponbox, true)

     weaponbox3 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 308.09204101563, 216.22746276855, 96.688110351563, true,  true, true)
    CreateObject(weaponbox3)
    SetEntityHeading(weaponbox3, 219.52)
    FreezeEntityPosition(weaponbox3, true) 

     weaponbox4 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 303.46594238281, 229.1854095459, 96.688110351563, true,  true, true)
    CreateObject(weaponbox4)
    SetEntityHeading(weaponbox4, 291.02)
    FreezeEntityPosition(weaponbox4, true)

    weaponbox5 = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 303.01165771484, 217.92240905762, 96.688087463379, true,  true, true)  
    CreateObject(weaponbox5)
    SetEntityHeading(weaponbox5, 291.02)
    FreezeEntityPosition(weaponbox5, true)

    goldcrate = CreateObject(GetHashKey("ch_prop_gold_trolly_01c"), 296.213134334, 217.598383434, 96.688194343, true,  true, true)  -- vector3(296.2131, 217.59838, 97.688194)
    CreateObject(goldcrate)
    SetEntityHeading(goldcrate, 291.02)
    FreezeEntityPosition(goldcrate, true)

    goldcrate2 = CreateObject(GetHashKey("ch_prop_gold_trolly_01c"), 296.4403418, 224.3234734, 96.688194343, true,  true, true)  -- vector3(296.2131, 217.59838, 97.688194)
    CreateObject(goldcrate2)
    SetEntityHeading(goldcrate2, 291.02)
    FreezeEntityPosition(goldcrate2, true)  


    elseif toggle == false then
        DeleteObject(weaponbox)
        DeleteObject(weaponbox4)
        DeleteObject(weaponbox3)
        DeleteObject(weaponbox5)
    end
end)

function CreatenzylozCrates()
    local ped = PlayerPedId()

    TriggerEvent('nicx:CleanClientVaultD')
    TriggerEvent("zyloz:createCrates" ,true)

    TriggerEvent('DoLongHudText', 'The Cops are here hurry the fuck up.. ' ,ped)
    Citizen.Trace("Crates Spawned :  Sucess")
    Citizen.Wait(240000) -- 4 mins 
    TriggerEvent('DoLongHudText', 'The Cops are here hurry the fuck up..' ,ped)
    Citizen.Wait(60000) -- 1 min warning then delete 
    TriggerEvent("nicx:createCrates" ,false)
    Citizen.Trace("Crates Remove :  Timer Complete Removed")
  end


  RegisterNetEvent('np-vault:startlowervault')
  AddEventHandler('np-vault:startlowervault', function()
    local player = GetEntityCoords(PlayerPedId())
    local distance = #(vector3(279.85586, 231.04055, 97.182815) - player)
    if distance < 1.5 then
        exports['np-vault']:OpenVaultGame(function(success)
    if success then
        TriggerServerEvent("np-doors:change-lock-state", 325, false)
        print("280")  
    else
        TriggerEvent('phone:addJobNotify', "YOU FUCKED UP THE HACK")
    end
  end, 10, 10)
end 
end)
 

exports["np-polyzone"]:AddBoxZone("vault_lower_entrance", vector3(266.01, 231.64, 97.68), 5.2, 13.4, {
    name="vault_lower_entrance",
    heading=340,
    --debugPoly=true,
    minZ=96.48,
    maxZ=99.88
})


RegisterNetEvent('np-vault:closevaultlower')
AddEventHandler('np-vault:closevaultlower', function()
    RequestIpl("np_int_placement_ch_interior_6_dlc_casino_vaultmilo")

    local interiorid = GetInteriorAtCoords(259.2812, 203.5071, 96.77954)

    EnableInteriorProp(interiorid, "np_vault_clean")
    DisableInteriorProp(interiorid, "np_vault_broken")
    DisableInteriorProp(interiorid, "np_vault_blocked")

    RefreshInterior(interiorid)
end)

RegisterNetEvent('np-vault:blockedvaultlower')
AddEventHandler('np-vault:blockedvaultlower', function()
    RequestIpl("np_int_placement_ch_interior_6_dlc_casino_vaultmilo")

    local interiorid = GetInteriorAtCoords(259.2812, 203.5071, 96.77954)

    EnableInteriorProp(interiorid, "np_vault_clean")
    DisableInteriorProp(interiorid, "np_vault_broken")
    EnableInteriorProp(interiorid, "np_vault_blocked")

    RefreshInterior(interiorid)
end)

RegisterNetEvent('np-vault:openvaultlower')
AddEventHandler('np-vault:openvaultlower', function()
    RequestIpl("np_int_placement_ch_interior_6_dlc_casino_vaultmilo")

    local interiorid = GetInteriorAtCoords(259.2812, 203.5071, 96.77954)

    DisableInteriorProp(interiorid, "np_vault_clean")
    EnableInteriorProp(interiorid, "np_vault_broken")
    DisableInteriorProp(interiorid, "np_vault_blocked")

    RefreshInterior(interiorid)
end)



Citizen.CreateThread(function()
    RequestIpl("np_int_placement_ch_interior_6_dlc_casino_vaultmilo")

    local interiorid = GetInteriorAtCoords(259.2812, 203.5071, 96.77954)

    EnableInteriorProp(interiorid, "np_vault_clean")
    DisableInteriorProp(interiorid, "np_vault_broken")
    DisableInteriorProp(interiorid, "np_vault_blocked")

    RefreshInterior(interiorid)
end)

function refreshVaultDoor()
    RequestIpl("np_int_placement_ch_interior_6_dlc_casino_vaultmilo")
    local interiorid = GetInteriorAtCoords(259.2812, 203.5071, 96.77954)
    for k, s in pairs(bicBoiVaultDoorStates) do
        DisableInteriorProp(interiorid, k)
    end
    for k, s in pairs(bicBoiVaultDoorStates) do
        if s then
            EnableInteriorProp(interiorid, k)
        end
    end
    RefreshInterior(interiorid)

    RequestIpl("hei_hw1_02_interior_2_heist_ornate_bankmilo")
    interiorid = GetInteriorAtCoords(247.913, 218.042, 105.283)
    for k, s in pairs(upperVaultEntityState) do
      DisableInteriorProp(interiorid, k)
    end
    for k, s in pairs(upperVaultEntityState) do
      if s then
        EnableInteriorProp(interiorid, k)
      end
    end
    RefreshInterior(interiorid)
end



RegisterNetEvent('np-vault:openvaultdoor_ITSLOWER')
AddEventHandler('np-vault:openvaultdoor_ITSLOWER', function()
    TriggerEvent('np-vault:openvaultlower')
end)


RegisterNetEvent('np-vaultrob:lower:vaultdoor')
AddEventHandler('np-vaultrob:lower:vaultdoor', function(s, args)
    local ped = PlayerPedId()
    local PLAYER_COORDS = GetEntityCoords(ped)
    local vaultdoorlowerlocation = vector3(284.13, 223.26, 98.24)
    if #(PLAYER_COORDS - vaultdoorlowerlocation) < 20.0 and not vaultdoor then
        vaultdoor = true
        AddExplosion(284.13, 223.26, 98.24, 37, 150000.0, true, false, 4.0)
        TriggerEvent('np-vault:openvaultdoor_ITSLOWER')
        CreatenzylozCrates()
        Wait(1800000)
        TriggerEvent("np-vault:LOWERVAULT_REFRESH")
    end
end)

RegisterNetEvent("np-vault:LOWERVAULT_REFRESH")
AddEventHandler("vault:LOWERVAULT_REFRESH", function()
    laptoppin = false
    firsttrolleylower = false
    sectrolleylower = false
    thirddlowertrolley = false
    fourthtrolleylower = false
    fifthtrolleylower = false
    sixthtrolleylower = false
    trolleyleryerinemi = false
    sextrolley = false

    if firstlowerdoor then
        TriggerServerEvent("shx-doors:alterlockstate", 120)
        TriggerServerEvent("shx-doors:alterlockstate", 121)
    end

    if vaultdoor then
        vaultdoor = false
        TriggerEvent('np-vault:blockedvaultlower')
        Citizen.Wait(900000)
        TriggerEvent('np-vault:closevaultlower')
    end

    if firstpindoor and secpindoor and thirdpindoor and fourthpindoor then
        TriggerServerEvent("np-doors:change-lock-state", 325, false)
    end
    Wait(2000)
    vaultdoor = false
    firstlowerdoor = false
    firstpindoor = false
    secpindoor = false
    thirdpindoor = false
    fourthpindoor = false  
    DeleteObject(Trolley1)
	while DoesEntityExist(Trolley1) do
        Citizen.Wait(1)
        DeleteObject(Trolley1)
	end

	DeleteObject(Trolley2)
	while DoesEntityExist(Trolley2) do
        Citizen.Wait(1)
        DeleteObject(Trolley2)
	end

	DeleteObject(Trolley3)
	while DoesEntityExist(Trolley3) do
        Citizen.Wait(1)
        DeleteObject(Trolley3)
	end
	DeleteObject(Trolley4)
	while DoesEntityExist(Trolley4) do
        Citizen.Wait(1)
        DeleteObject(Trolley4)
	end

	DeleteObject(Trolley5)
	while DoesEntityExist(Trolley5) do
        Citizen.Wait(1)
        DeleteObject(Trolley5)
	end

	DeleteObject(Trolley6)
	while DoesEntityExist(Trolley6) do
        Citizen.Wait(1)
        DeleteObject(Trolley6)
	end
end)

RegisterNetEvent("np-vaultrob:lower:fourpincontrol")
AddEventHandler("np-vaultrob:lower:fourpincontrol", function()
    if firstpindoor then
        if secpindoor then
            if thirdpindoor then
                if fourthpindoor then
                    TriggerServerEvent("np-doors:change-lock-state", 325, false)
                    print('all completed')
                else
                    print('not all completed')
                end
            else
                print('not all completed')
            end
        else
            print('not all completed')
        end
    else
        print('not all completed')
    end
end)


RegisterNetEvent('np-vaultrob:lower:firstpindoor')
AddEventHandler('np-vaultrob:lower:firstpindoor', function()
    if not firstpindoor  then
        exports['np-vault']:OpenVaultGame(function(success)
            if success then
                firstpindoor = true
                TriggerEvent("np-vaultrob:lower:fourpincontrol")
            else
                firstpindoor = false
            end
        end, 5, 5)
    else 
        print('Already hacked!')
    end
end)

RegisterNetEvent('np-vaultrob:lower:secpindoor')
AddEventHandler('np-vaultrob:lower:secpindoor', function()
    if not secpindoor then
        exports['np-vault']:OpenVaultGame(function(success)
            if success then
                secpindoor = true
                TriggerEvent("np-vaultrob:lower:fourpincontrol")
            else
                secpindoor = false
            end
        end, 5, 5)
    else 
        print('Already hacked!')
    end
end)

RegisterNetEvent('np-vaultrob:lower:thirdpindoor')
AddEventHandler('np-vaultrob:lower:thirdpindoor', function()
    if not thirdpindoor then
        exports['np-vault']:OpenVaultGame(function(success)
            if success then
                thirdpindoor = true
                TriggerEvent("np-vaultrob:lower:fourpincontrol")
            else
                thirdpindoor = false
            end
        end, 5, 5)
    else 
        print('Already hacked!')
    end
end)

RegisterNetEvent('np-vaultrob:lower:fourthpindoor')
AddEventHandler('np-vaultrob:lower:fourthpindoor', function()
    if not fourthpindoor then
        exports['np-vault']:OpenVaultGame(function(success)
            if success then
                fourthpindoor = true
                TriggerEvent("np-vaultrob:lower:fourpincontrol")
            else
                fourthpindoor = false
            end
        end, 5, 5)
    else 
        print('Already hacked!')
    end
end)
