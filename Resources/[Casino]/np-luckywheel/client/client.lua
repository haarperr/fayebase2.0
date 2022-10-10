local _wheel = nil
local _lambo = nil
local _isShowCar = false
local _wheelPos = vector3(990.265, 42.830, 70.522)


local _baseWheelPos = vector3(990.265, 42.830, 70.522)

        local _isRolling = false
        local model = GetHashKey('vw_prop_vw_luckywheel_02a')
        local baseWheelModel = GetHashKey('vw_prop_vw_luckywheel_01a')
        local carmodel = GetHashKey('XA21')
        --print("I AM LOADING NOW!")

        Citizen.CreateThread(function()
            -- Base wheel
            --RequestModel(baseWheelModel)
            --while not HasModelLoaded(baseWheelModel) do
            --    Citizen.Wait(0)
            --end

            --_basewheel = CreateObject(baseWheelModel, _baseWheelPos.x, _baseWheelPos.y, _baseWheelPos.z, false, false, true)
            --SetEntityHeading(_basewheel, 0.0)
            --SetModelAsNoLongerNeeded(baseWheelModel)

            -- Wheel
            RequestModel(model)

            while not HasModelLoaded(model) do
                Citizen.Wait(0)
            end
            _wheel = CreateObject(model, 990.265, 42.830, 70.522, false, false, true)
            SetEntityHeading(_wheel, 328.466)
            SetModelAsNoLongerNeeded(model)
            
           
        end)

Citizen.CreateThread(function() 
    while true do
        if _lambo ~= nil then
            local _heading = GetEntityHeading(_lambo)
            local _z = _heading - 0.3
            SetEntityHeading(_lambo, _z)
        end
        Citizen.Wait(5)
    end
end)


RegisterNetEvent("np-luckywheel:doRoll")
AddEventHandler("np-luckywheel:doRoll", function(_priceIndex) 
    _isRolling = true
	SetEntityHeading(_wheel, 328.466)
    Citizen.CreateThread(function()
        local speedIntCnt = 30
        local rollspeed = 1.0
        local _winAngle = (_priceIndex - 1) * 18
        local _rollAngle = _winAngle + (360 * 3)
        local _midLength = (_rollAngle / 2)
        local intCnt = 0
        while speedIntCnt > 0 do
            local retval = GetEntityRotation(_wheel, 1)
            if _rollAngle > _midLength then
                speedIntCnt = speedIntCnt + 1
            else
                speedIntCnt = speedIntCnt - 1
                if speedIntCnt < 0 then
                    speedIntCnt = 0
                    
                end
            end
            intCnt = intCnt + 1
            rollspeed = speedIntCnt / 5
            local _y = retval.y - rollspeed
            _rollAngle = _rollAngle - rollspeed
			SetEntityHeading(_wheel, 328.466)
            SetEntityRotation(_wheel, 0.0, _y, 328.466, 2, true)
            Citizen.Wait(50)
        end
    end)
end)

RegisterNetEvent("np-luckywheel:doRoll2")
AddEventHandler("np-luckywheel:doRoll2", function(_priceIndex) 
    _isRolling = true
	SetEntityHeading(_wheel, 328.466)
    Citizen.CreateThread(function()
        local speedIntCnt = 30
        local rollspeed = 5.0
        local _winAngle = (_priceIndex - 1) * 18
        local _rollAngle = _winAngle + (360 * 3)
        local _midLength = (_rollAngle / 2)
        local intCnt = 0
        while speedIntCnt > 0 do
            local retval = GetEntityRotation(_wheel, 1)
            if _rollAngle > _midLength then
                speedIntCnt = speedIntCnt + 1
            else
                speedIntCnt = speedIntCnt - 1
                if speedIntCnt < 0 then
                    speedIntCnt = 0
                    
                end
            end
            intCnt = intCnt + 1
            rollspeed = speedIntCnt / 5
            local _y = retval.y - rollspeed
            _rollAngle = _rollAngle - rollspeed
			SetEntityHeading(_wheel, 328.466)
            SetEntityRotation(_wheel, 0.0, _y, 328.466, 2, true)
            Citizen.Wait(50)
        end
    end)
end)


RegisterNetEvent("np-luckywheel:rollFinished")
AddEventHandler("np-luckywheel:rollFinished", function() 
    _isRolling = false
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

function doRoll()
    if not _isRolling then
        _isRolling = true
        local playerPed = PlayerPedId()
        local _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@female'
        if IsPedMale(playerPed) then
            _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        end
        local lib, anim = _lib, 'enter_right_to_baseidle'
            loadAnimDict(lib)
            local _movePos = vector3(988.907, 42.865, 71.265)
            TaskGoStraightToCoord(playerPed,  _movePos.x,  _movePos.y,  _movePos.z,  1.0,  -1,  312.2,  0.0)
            local _isMoved = false
            while not _isMoved do
                local coords = GetEntityCoords(PlayerPedId())
                if coords.x >= (_movePos.x - 0.01) and coords.x <= (_movePos.x + 0.01) and coords.y >= (_movePos.y - 0.01) and coords.y <= (_movePos.y + 0.01) then
                    _isMoved = true
                end
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
                    Citizen.Wait(0)
                    DisableAllControlActions(0)
            end
            TaskPlayAnim(playerPed, lib, 'enter_to_armraisedidle', 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, lib, 'enter_to_armraisedidle', 3) do
                Citizen.Wait(0)
                DisableAllControlActions(0)
            end
            TriggerServerEvent("np-luckywheel:getLucky")
            TaskPlayAnim(playerPed, lib, 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
        
    end
end

function doRoll2()
    if not _isRolling then
        _isRolling = true
        local playerPed = PlayerPedId()
        local _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@female'
        if IsPedMale(playerPed) then
            _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        end
        local lib, anim = _lib, 'enter_right_to_baseidle'
            loadAnimDict(lib)
            local _movePos = vector3(988.907, 42.865, 71.265)
            TaskGoStraightToCoord(playerPed,  _movePos.x,  _movePos.y,  _movePos.z,  1.0,  -1,  312.2,  0.0)
            local _isMoved = false
            while not _isMoved do
                local coords = GetEntityCoords(PlayerPedId())
                if coords.x >= (_movePos.x - 0.01) and coords.x <= (_movePos.x + 0.01) and coords.y >= (_movePos.y - 0.01) and coords.y <= (_movePos.y + 0.01) then
                    _isMoved = true
                end
                Citizen.Wait(0)
            end
            TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
                    Citizen.Wait(0)
                    DisableAllControlActions(0)
            end
            TaskPlayAnim(playerPed, lib, 'enter_to_armraisedidle', 8.0, -8.0, -1, 0, 0, false, false, false)
            while IsEntityPlayingAnim(playerPed, lib, 'enter_to_armraisedidle', 3) do
                Citizen.Wait(0)
                DisableAllControlActions(0)
            end
            TriggerServerEvent("np-luckywheel:getLucky2")

            TaskPlayAnim(playerPed, lib, 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
        
    end
end

-- Menu Controls
-- Citizen.CreateThread(function()
-- 	while true do
--         Citizen.Wait(1)
--         local coords = GetEntityCoords(PlayerPedId())
--         if(GetDistanceBetweenCoords(coords, _wheelPos.x, _wheelPos.y, _wheelPos.z, true) < 1.5) and not _isRolling then
--             if IsControlJustReleased(0, 38) then
--                 doRoll()
--             end
--         end		
-- 	end
-- end)
-- local enabled = true
RegisterNetEvent("np-luckywheel:spinit")
AddEventHandler("np-luckywheel:spinit", function() 
    if not _isRolling  then
        doRoll()

    end		
end)

RegisterNetEvent("np-luckywheel:spinit2")
AddEventHandler("np-luckywheel:spinit2", function() 
    if not _isRolling  then
        doRoll2()

    end		
end)


 RegisterCommand("spintest", function()

         TriggerServerEvent("attempt:spin") 

 end)
RegisterNetEvent('attempt:spin-in', function()
    if exports["np-inventory"]:hasEnoughOfItem("casinomembership", 1) then
    TriggerServerEvent("attempt:spin")
    else
        TriggerEvent("DoLongHudText","You need a membership to spin the wheel!",2)
    end
end)

RegisterNetEvent('attempt:spin-in1', function()
    TriggerServerEvent("attempt:spin1")
end)


AddEventHandler("casinoshop", function()
    TriggerEvent("server-inventory-open", "701", "Shop")
end)

RegisterNetEvent("attempt:change:spin", function()
    local rank = exports["np-groups"]:GroupRank("casino")
    if rank > 0 then 
		TriggerServerEvent("spin:toggle")
	else
		TriggerEvent("DoLongHudText", "This is only for Casino Employees to use.", 2)
	end
end)
