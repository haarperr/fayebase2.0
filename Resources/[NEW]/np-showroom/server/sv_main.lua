RPC.register("showroom:purchaseVehicle", function(source, cb, model, price, amount)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cash = user:getCash()
    local plate = GeneratePlate()
    local pPrice = price.param
    local pModel = model.param

    if tonumber(cash) >= pPrice then
        user:removeMoney(pPrice)
        PurchaseCar(src, model, plate)
        cb(true, model)
        return
    elseif tonumber(cash) >= pPrice then
        user:removeMoney(pPrice)
        PurchaseCar(src, model)
        cb(true, model)
        return
    end
end)

RegisterServerEvent("showroom:purchaseVehicle")
AddEventHandler("showroom:purchaseVehicle",function(model, price)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getCurrentCharacter().id
    local cash = user:getCash()
    local plate = GeneratePlate()
    local pPrice = price
    local pModel = model

    if tonumber(cash) >= pPrice then
        user:removeMoney(pPrice)
        TriggerClientEvent('np-showroom:SpawnVehicle', src, pModel, pPrice, plate)
    elseif tonumber(cash) <= pPrice then
        TriggerClientEvent('DoLongHudText', src, "You don't have enough money!", 2)
    end
end)

RegisterServerEvent("showroom:test_drive")
AddEventHandler("showroom:test_drive",function(model, price)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getCurrentCharacter().id
    local cash = user:getCash()
    local plate = GeneratePlate()
    local pPrice = price
    local pModel = model

    TriggerClientEvent('np-showroom:testDrive', src, pModel, pPrice, plate)
end)

RegisterServerEvent("np-showroom:purchaseVehicle")
AddEventHandler("np-showroom:purchaseVehicle",function(plate, name, vehicle, price, personalvehicle)
    print()
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local player = user:getVar("hexid")
    local char = user:getVar("character")
    exports.oxmysql:execute('INSERT INTO characters_cars (cid, license_plate, model, data, purchase_price, name, vehicle_state, current_garage, owner) VALUES (@cid, @license_plate, @model, @data, @purchase_price, @name, @vehicle_state, @current_garage, @owner)',{
        ['@owner'] = player,
        ['@cid']   = char.id,
        ['@license_plate']  = plate,
        ['@model'] = vehicle,
        ['@data'] = json.encode(personalvehicle),
        ['@name'] = vehicle,
        ['@purchase_price'] = price,
        ['@current_garage'] = "garaget",
        ['@vehicle_state'] = "Out",
    })
end)


function GeneratePlate()
    local plate = math.random(10, 99) .. "" .. GetRandomLetter(3) .. "" ..math.random(100, 999)
    local result = exports.oxmysql:scalarSync('SELECT license_plate FROM characters_cars WHERE license_plate=@license_plate', {['@license_plate'] = plate})
    if result then plate = tostring(GetRandomNumber(1)) .. GetRandomLetter(2) .. tostring(GetRandomNumber(3)) .. GetRandomLetter(2)
    end
    return plate:upper()
end

local NumberCharset = {}
local Charset = {}

for i = 48, 57 do table.insert(NumberCharset, string.char(i)) end
for i = 65, 90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GetRandomLetter(length)
    Citizen.Wait(1)
    math.randomseed(GetGameTimer())
    if length > 0 then
        return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
    else
        return ''
    end
end

-- Instance Shit --

RegisterServerEvent('np-showrooms:enter_instance')
AddEventHandler('np-showrooms:enter_instance', function(instanceId)
    local src = source
    SetPlayerRoutingBucket(src, instanceId)
end)

RegisterServerEvent('np-showrooms:exit_instance')
AddEventHandler('np-showrooms:exit_instance', function()
    local src = source
    SetPlayerRoutingBucket(src, 0)
end)