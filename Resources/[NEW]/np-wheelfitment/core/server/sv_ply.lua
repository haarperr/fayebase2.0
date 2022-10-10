local wheelInUse = false

RPC.register("np-wheelfitment_sv:setIsWheelFitmentInUse", function(pSource, pBool)
    wheelInUse = pBool
end)

RPC.register("np-wheelfitment_sv:getIsWheelFitmentInUse", function(pSource)
    return wheelInUse
end)

RPC.register("np-wheelfitment_sv:checkIfWhitelisted", function(pSource)
    return true
end)

RPC.register("np-wheelfitment_sv:saveWheelfitment", function(pPlate, pData)
    local pSrc = source
    if pPlate == nil or pPlate == 0 or pPlate == "" then return end
    exports.oxmysql:execute("UPDATE characters_cars SET wheelfitment = @wheelfitment WHERE license_plate = @license_plate", {
        ['@wheelfitment'] = json.encode(pData),
        ['@license_plate'] = pPlate
    })
    return true
end)

RPC.register("police:getMeta", function(pSource)
	local src = pSource
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local cid = user:getCurrentCharacter().id
	--print("cid: " .. cid)
	local data = Await(SQL.execute("SELECT * FROM characters WHERE id = @cid", {
		["cid"] = cid
	}))
	if not data then return false end
	--print("got meta", data[1].metaData)
	return json.decode(data[1].metaData)
end)

RPC.register("police:getStress", function(pSource)
	local src = pSource
	local user = exports["np-base"]:getModule("Player"):GetUser(src)
	local cid = user:getCurrentCharacter().id
	--print("cid: " .. cid)
	local data = Await(SQL.execute("SELECT * FROM characters WHERE id = @cid", {
		["cid"] = cid
	}))
	if not data then return false end
	--print("got stress", data[1].stress_level)
	return data[1].stress_level
end)

RegisterNetEvent("np-wheelfitment:GetVehicleStatus", function(plate,pVehicle)
    local src = source
    exports.oxmysql:execute("SELECT `wheelfitment` FROM characters_cars WHERE license_plate = @license_plate", {['license_plate'] = plate}, function(result)

        if result[1] ~= nil then
			if result[1].wheelfitment ~= nil then
                TriggerClientEvent('np-wheelfitment_cl:applySavedWheelFitment',src,pVehicle,result[1].wheelfitment)
			else
                return
			end
		end
    end)
end)