cooldownglobal = 0
Available = true

RegisterServerEvent("np-fleeca:startcheck")
AddEventHandler("np-fleeca:startcheck", function(bank)
    local _source = source
    globalonaction = true
    TriggerClientEvent('inventory:removeItem', _source, 'hacklaptop', 1)
    TriggerClientEvent("np-fleeca:outcome", _source, true, bank)
end)

RegisterServerEvent("np-fleeca:TimePoggers")
AddEventHandler("np-fleeca:TimePoggers", function()
    local _source = source
    TriggerClientEvent("np-fleeca:outcome", _source, false, "A bank as been recently robbed. You need to wait "..math.floor((fleeca.cooldown - (os.time() - cooldownglobal)) / 60)..":"..math.fmod((fleeca.cooldown - (os.time() - cooldownglobal)), 60))
end)

RegisterServerEvent("np-fleeca:DoorAccessPoggers")
AddEventHandler("np-fleeca:DoorAccessPoggers", function()
    local _source = source
    TriggerClientEvent("np-fleeca:outcome", _source, false, "There is a bank currently being robbed.")
end)

RegisterServerEvent("np-fleeca:lootup")
AddEventHandler("np-fleeca:lootup", function(var, var2)
    TriggerClientEvent("np-fleeca:lootup_c", -1, var, var2)
end)

RegisterServerEvent("np-fleeca:openDoor")
AddEventHandler("np-fleeca:openDoor", function(coords, method)
    TriggerClientEvent("np-fleeca:openDoor_c", -1, coords, method)
end)

RegisterServerEvent("np-fleeca:startLoot")
AddEventHandler("np-fleeca:startLoot", function(data, name)
    TriggerClientEvent("np-fleeca:startLoot_c", -1, data, name)
end)

RegisterServerEvent("np-fleeca:stopHeist")
AddEventHandler("np-fleeca:stopHeist", function(name)
    TriggerClientEvent("np-fleeca:stopHeist_c", -1, name)
end)

RegisterServerEvent("np-fleeca:rewardCash")
AddEventHandler("np-fleeca:rewardCash", function()
    local reward = math.random(1, 2)
    local mathfunc = math.random(200)
    local rare = math.random(1,1)
    
    if mathfunc == 15 then
      TriggerClientEvent('np-user:receiveItem', source, 'heistusb4', 1)
    end
    TriggerClientEvent("np-user:receiveItem", source, "band", reward)
end)

RegisterServerEvent("np-fleeca:setCooldown")
AddEventHandler("np-fleeca:setCooldown", function(name)
    cooldownglobal = os.time()
    globalonaction = false
    TriggerClientEvent("np-fleeca:resetDoorState", -1, name)
end)

RegisterServerEvent("np-fleeca:getBanksSV")
AddEventHandler("np-fleeca:getBanksSV", function()
    local banks = fleeca.Banks
    TriggerClientEvent('np-fleeca:getBanks', -1, fleeca.Banks)
end)

local cooldownAttempts = 5

RegisterServerEvent("np-fleeca:getHitSV")
AddEventHandler("np-fleeca:getHitSV", function()
    TriggerClientEvent('np-fleeca:getHit', -1, cooldownAttempts)
end)

RegisterServerEvent("np-fleeca:getHitSVSV")
AddEventHandler("np-fleeca:getHitSVSV", function(fleecaBanksTimes)
    cooldownAttempts = fleecaBanksTimes
end)

local doorCheckFleeca = false

RegisterServerEvent("np-fleeca:getGetDoorStateSV")
AddEventHandler("np-fleeca:getGetDoorStateSV", function()
    TriggerClientEvent('np-fleeca:getDoorCheckCL', -1, doorCheckFleeca)
end)

RegisterServerEvent("np-fleeca:getGetDoorStateSVSV")
AddEventHandler("np-fleeca:getGetDoorStateSVSV", function(fleecaBanksDoors)
    doorCheckFleeca = fleecaBanksDoors
end)


RegisterServerEvent("np-fleeca:getTimeSV")
AddEventHandler("np-fleeca:getTimeSV", function()
    TriggerClientEvent('np-fleeca:GetTimeCL', -1, cooldownglobal)
end)

RegisterServerEvent("np-fleeca:getTime2SV")
AddEventHandler("np-fleeca:getTime2SV", function()
    TriggerClientEvent('np-fleeca:GetTime2CL', -1, (os.time() - fleeca.cooldown))
end)

RegisterServerEvent("np-fleeca:getDoorAccessSV")
AddEventHandler("np-fleeca:getDoorAccessSV", function()
    TriggerClientEvent('np-fleeca:GetDoorAccessCL', -1, globalonaction)
end)

RegisterServerEvent('charge:fleeca')
AddEventHandler('charge:fleeca', function(amount, bankname)
  local _source = source
  local user = exports["np-base"]:getModule("Player"):GetUser(source)

    if user:getCash() >= amount then
        user:removeMoney(amount)
        TriggerClientEvent('aspect:bankemail', source, bankname)
    else
        TriggerClientEvent('DoLongHudText', source, 'You dont have enough money!', 2)
    end
end)

RegisterServerEvent('np-robbery:server:setBankState')
AddEventHandler('np-robbery:server:setBankState', function(bankId, state)
    if bankId == "pacific" then
       print('[QUEER]')
    else
        if not robberyBusy then
            Config.SmallBanks[bankId]["isOpened"] = state
            TriggerClientEvent('np-robbery:client:setBankState', -1, bankId, state)
            TriggerEvent('np-robbery:server:SetSmallbankTimeout', bankId)
            TriggerEvent('aspect:bankstore', bankId, state)
        end
    end
    robberyBusy = true
end)

RegisterServerEvent('np-robbery:server:SetSmallbankTimeout')
 AddEventHandler('np-robbery:server:SetSmallbankTimeout', function(BankId)
     if not robberyBusy then
         SetTimeout(100 * (12 * 1000), function()
             Config.SmallBanks[BankId]["isOpened"] = false

             TriggerEvent('marv:bankstore', BankId, false)
			
            --  for k, v in pairs(Config.BigBanks["pacific"]["lockers"]) do
            --      Config.BigBanks["pacific"]["lockers"][k]["isBusy"] = false
            --      Config.BigBanks["pacific"]["lockers"][k]["isOpened"] = false
            --  end
			
             timeOut = false
             robberyBusy = false
             TriggerClientEvent('np-robbery:client:ResetFleecaLockers', -1, BankId)
             TriggerEvent('lh-banking:server:SetBankClosed', BankId, false)
         end)
     end
 end)


local Loot = false

RegisterServerEvent('np-fleeca:tut_tut')
AddEventHandler('np-fleeca:tut_tut', function()
    local src = source
    if not Loot then
        Loot = true
        TriggerClientEvent('np-fleeca:grab', src)
        Citizen.Wait(40000)
        Loot = false
    end
end)

RegisterServerEvent('voidrp-heists:availabilty')
AddEventHandler('voidrp-heists:availabilty', function()
    Available = false
    Citizen.Wait(3600000)
    Available = true
end)

RegisterServerEvent('voidrp-heists:fleeca_availability')
AddEventHandler('voidrp-heists:fleeca_availability', function()
    local src = source
    
    if Available then
        TriggerClientEvent('np-heists:fleeca_available', src)
    else
        TriggerClientEvent('np-heists:fleeca_unavailable', src)
    end
end)