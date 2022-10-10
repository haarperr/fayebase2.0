local tabletModel = "prop_cs_tablet"
local tabletDict = "amb@world_human_seat_wall_tablet@female@base"
local tabletAnim = "base"
local display = false

function attachObject()
	if tabletEntity == nil then
		Citizen.Wait(580)
		RequestModel(tabletModel)
		while not HasModelLoaded(tabletModel) do
			Citizen.Wait(100)
		end
		tabletEntity = CreateObject(GetHashKey(tabletModel), 1.0, 1.0, 1.0, 1, 1, 0)
		AttachEntityToEntity(tabletEntity, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.12, 0.10, -0.13, 25.0, 170.0, 160.0, true, true, false, true, 1, true)
	end
end

function Animation()
	Citizen.CreateThread(function()
	  RequestAnimDict(tabletDict)
	  while not HasAnimDictLoaded(tabletDict) do
	    Citizen.Wait(100)
	  end
		attachObject()
		TaskPlayAnim(GetPlayerPed(-1), tabletDict, tabletAnim, 4.0, -4.0, -1, 50, 0, false, false, false)
	end)
end

function stopAnimation()
	if tabletEntity ~= nil then
		StopAnimTask(GetPlayerPed(-1), tabletDict, tabletAnim ,4.0, -4.0, -1, 50, 0, false, false, false)
		DeleteEntity(tabletEntity)
		tabletEntity = nil
	end
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNUICallback("order", function(data)
    print(data.item..  ": $ " ..data.price)
    TriggerServerEvent('np-blackmarket:makeorder', data)
end)

-- ITEM USABLE

RegisterNUICallback("exit", function(data)
    stopAnimation()
    open(false)
end)

function open(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end


RegisterNetEvent("np-blackmarket:open")
AddEventHandler("np-blackmarket:open",function()
    if exports['np-inventory']:hasEnoughOfItem('laptop', 1) then
        local finished = exports["np-taskbar"]:taskBar(5000,"Plugging in usb")
        Animation()
        open(true)
        TriggerEvent("inventory:DegenLastUsedItem", 25)
    else
        TriggerEvent("DoLongHudText", "find something to plug this into",2)
    end
end)

CreateThread(function()
    while display do
        Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

function knockDoorAnim()
    local knockAnimLib = "timetable@jimmy@doorknock@"
    local knockAnim = "knockdoor_idle"
    local PlayerPed = GetPlayerPed(-1)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "knock_door", 0.2)
    Wait(100)
    while (not HasAnimDictLoaded(knockAnimLib)) do
        RequestAnimDict(knockAnimLib)
        Wait(100)
    end
    TaskPlayAnim(PlayerPed, knockAnimLib, knockAnim, 3.0, 3.0, -1, 1, 0, false, false, false )
    Wait(3500)
    TaskPlayAnim(PlayerPed, knockAnimLib, "exit", 3.0, 3.0, -1, 1, 0, false, false, false)
    Wait(1000)
    open(true)
end

local ped = PlayerPedId()

DropOffsClose = {
    [1] =  { ['x'] = 508.90548706055,['y'] = 3099.7451171875,['z'] = 41.293823242188,['h'] = 218.2677154541, ['info'] = 'Pickup Location', ['apt'] = 1 },
}


local BlackMarketItems = false
local CurrentStep = 0
local waittime = 1000

RegisterNetEvent("stufmanidk")
AddEventHandler("stufmanidk", function(data)
    local toolong = 0
    BlackMarketItems = true
    while BlackMarketItems do
        Wait(1)
        if CurrentStep == 0 then
            pickthetingup = DropOffsClose[math.random(#DropOffsClose)]
            BlipCreation()
            CurrentStep = 1
        end
        local plyCoords = GetEntityCoords(PlayerPedId())
        local inVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
        local distance = Vdist(pickthetingup["x"],pickthetingup["y"],pickthetingup["z"],plyCoords)
        if distance < 5.0 and not inVehicle then
            waittime = 1
            DrawText3Ds(pickthetingup["x"],pickthetingup["y"],pickthetingup["z"],"[E] To pickup Package")
            if IsControlJustReleased(1,38) and distance < 1.5 then
                if exports['np-inventory']:hasEnoughOfItem('usbdevice', 1) and exports['np-inventory']:hasEnoughOfItem('laptop', 1) then
                    ClearBlips()  
                    TriggerEvent("player:receiveItem",data.item, data.amount)
                    TriggerEvent("susdropoof")
                    EndRuns()
                else
                    TriggerEvent('DoLongHudText', 'I need the laptop and usb you orderd this with to be able to trace your order.', 2)
                    end
                end
                toolong = toolong + 1
                if toolong > 180000 then
                TriggerEvent("DoLongHudText","Too Long Pick up cancelled !")
                EndRuns()
                DeleteCreatedPed()
            end
        end
    end
end)

function EndRuns()
    ClearBlips()
    SetVehicleHasBeenOwnedByPlayer(WeedVehicle,false)
    SetEntityAsNoLongerNeeded(WeedVehicle)

    BlackMarketItems = false
    waittime = 1000
    CurrentStep = 0
    DropOffCount = 0
    DropOffLocation =  { ['x'] = -10.81,['y'] = -1828.68,['z'] = 25.4,['h'] = 301.59, ['info'] = ' Grove shop' }
    Wait(1000)
    ClearBlips()
end

function ClearBlips()
    RemoveBlip(CurrentMarker)
    CurrentMarker = 0
    CurrentStep = 0
end

function BlipCreation()
    ClearBlips()
    CurrentMarker = AddBlipForCoord(pickthetingup["x"],pickthetingup["y"],pickthetingup["z"])
    SetBlipSprite(CurrentMarker, 586)
    SetBlipScale(CurrentMarker, 0.7)
    SetBlipAsShortRange(CurrentMarker, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Black Market Item")
    EndTextCommandSetBlipName(CurrentMarker)
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