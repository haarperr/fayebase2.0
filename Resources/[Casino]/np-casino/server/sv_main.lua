isRoll = false
amount = 500

RPC.register('np-casino:purchaseMembershipCard',function(pCid)
    local src = source
    if  exports['np-base']:getModule('GetCash')(src) >= 250 then
          exports['np-base']:getModule('RemoveCash')(src, 250)
          TriggerClientEvent('np-casino:purchaseMembership',src)
    end
end)

RegisterServerEvent('np-luckywheel:getLucky')
AddEventHandler('np-luckywheel:getLucky', function()
    print("should start spining")
    local src = source
    if not isRoll then
        isRoll = true
        -- local _priceIndex = math.random(1, 20)
        local _randomPrice = math.random(1, 100)
        if _randomPrice == 1 then
            -- Win car
            local _subRan = math.random(1,1000)
            if _subRan <= 1 then
                _priceIndex = 19
            else
                _priceIndex = 3
            end
        elseif _randomPrice > 1 and _randomPrice <= 6 then
            _priceIndex = 12
            local _subRan = math.random(1,20)
            if _subRan <= 2 then
                _priceIndex = 12
            else
                _priceIndex = 7
            end
        elseif _randomPrice > 6 and _randomPrice <= 15 then
            -- 4, 8, 11, 16
            local _sRan = math.random(1, 4)
            if _sRan == 1 then
                _priceIndex = 4
            elseif _sRan == 2 then
                _priceIndex = 8
            elseif _sRan == 3 then
                _priceIndex = 11
            else
                _priceIndex = 16
            end
        elseif _randomPrice > 15 and _randomPrice <= 25 then
            -- _priceIndex = 5
            local _subRan = math.random(1,20)
            if _subRan <= 2 then
                _priceIndex = 5
            else
                _priceIndex = 20
            end
        elseif _randomPrice > 25 and _randomPrice <= 40 then
            -- 1, 9, 13, 17
            local _sRan = math.random(1, 4)
            if _sRan == 1 then
                _priceIndex = 1
            elseif _sRan == 2 then
                _priceIndex = 9
            elseif _sRan == 3 then
                _priceIndex = 13
            else
                _priceIndex = 17
            end
        elseif _randomPrice > 40 and _randomPrice <= 60 then
            local _itemList = {}
            _itemList[1] = 2
            _itemList[2] = 6
            _itemList[3] = 10
            _itemList[4] = 14
            _itemList[5] = 18
            _priceIndex = _itemList[math.random(1, 5)]
        elseif _randomPrice > 60 and _randomPrice <= 100 then
            local _itemList = {}
            _itemList[1] = 3
            _itemList[2] = 7
            _itemList[3] = 15
            _itemList[4] = 20
            _priceIndex = _itemList[math.random(1, 4)]
        end
        -- print("Price " .. _priceIndex)
        SetTimeout(12000, function()
            isRoll = false
            -- Give Price
            if _priceIndex == 1 or _priceIndex == 9 or _priceIndex == 13 or _priceIndex == 17 then
            elseif _priceIndex == 2 or _priceIndex == 6 or _priceIndex == 10 or _priceIndex == 14 or _priceIndex == 18 then
            elseif _priceIndex == 3 or _priceIndex == 7 or _priceIndex == 15 or _priceIndex == 20 then
                local _money = 0
                if _priceIndex == 3 then
                    _money = 200
                elseif _priceIndex == 7 then
                    _money = 300
                elseif _priceIndex == 15 then
                    _money = 400
                elseif _priceIndex == 20 then
                    _money = 500
                end
            elseif _priceIndex == 5 then
            elseif _priceIndex == 19 then
            end
            TriggerClientEvent("np-luckywheel:rollFinished", -1)
        end)
        TriggerClientEvent("np-luckywheel:doRoll", -1, _priceIndex)
        --print(_priceIndex)
    end
end)


CasinoSpin = false
RegisterServerEvent("spin:toggle")
AddEventHandler('spin:toggle', function(pAuto)
    if not pAuto then
        local pSrc = source
        TriggerClientEvent("DoLongHudText", pSrc, ('Spin To Win has been %s!'):format(CasinoSpin and 'Disabled' or 'Enabled')) 
        CasinoSpin = not CasinoSpin
    else
        CasinoSpin = not CasinoSpin
    end
end)

RegisterServerEvent("attempt:spin", function()
    local pSrc = source
    if CasinoSpin then
        TriggerClientEvent("np-luckywheel:spinit", pSrc, true)
    else
        TriggerClientEvent("DoLongHudText", pSrc, "Spin to Win is disabled, please contact a Casino Dealer!", 2)
    end
end)
