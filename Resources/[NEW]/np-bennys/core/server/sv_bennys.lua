RegisterServerEvent('np-bennys:attemptPurchase')
AddEventHandler('np-bennys:attemptPurchase', function(type, upgradeLevel)
	local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    if type == "repair" then
        if user:getCash() >= 100 then
            user:removeMoney(100)
            TriggerClientEvent('np-bennys:purchaseSuccessful', src, 100)
        else
            TriggerClientEvent('np-bennys:purchaseFailed', src)
        end
    elseif type == "performance" then
        if user:getCash() >= vehicleCustomisationPrices[type].prices[upgradeLevel] then
            TriggerClientEvent('np-bennys:purchaseSuccessful', src, vehicleCustomisationPrices[type].prices[upgradeLevel])
            user:removeMoney(vehicleCustomisationPrices[type].prices[upgradeLevel])
        else
            TriggerClientEvent('np-bennys:purchaseFailed', src)
        end
    else
        if user:getCash() >= vehicleCustomisationPrices[type].price then
            TriggerClientEvent('np-bennys:purchaseSuccessful', src, vehicleCustomisationPrices[type].price)
            user:removeMoney(vehicleCustomisationPrices[type].price)
        else
            TriggerClientEvent('np-bennys:purchaseFailed', src)
        end
    end
end)

RegisterServerEvent('np-bennys:updateRepairCost')
AddEventHandler('np-bennys:updateRepairCost', function(cost)
    MechBennys = cost
end)

RegisterServerEvent('voidrp:bennys:pay1')
AddEventHandler('voidrp:bennys:pay1', function()
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)

    if user:getCash() >= 750 then
        user:removeMoney(750)
        TriggerClientEvent('bennys:civ:repair:cl', src)
        TriggerEvent('DoLongHudText', "You Have Been Charged For: $750!", 2)
    else
        TriggerClientEvent('DoLongHudText', src, 'You need $750', 2)
    end
end)
