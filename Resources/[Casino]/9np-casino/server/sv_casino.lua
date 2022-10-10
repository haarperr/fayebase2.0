RPC.register("np-casino:purchaseChips", function(amount)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id
    local cash = exports["np-financials"]:getCash(src) 
    local accountId = user:getBankId()
    local bank = exports["np-financials"]:getBalance(accountId)
    local groupBank = exports["np-groups"]:groupBank("casino")
    local CurrentChips = ChipCount(src)

    if cash > tonumber(amount) then
        exports["np-financials"]:updateCash(src, "-", tonumber(amount))
    elseif bank > tonumber(amount) then
        return false, TriggerClientEvent("DoLongHudText", src, "You do not have $" .. cost .. "in your bank account.", 2)
    end

    local affectedRows = MySQL.update.await([[
        UPDATE characters
        SET casino = ?
        WHERE id = ?
    ]],

    { CurrentChips + amount, cid })

    if not affectedRows or affectedRows < 1 then
        return false
    end

    local comment = "Bought Casino chips $" .. tonumber(amount)
    exports["np-financials"]:transaction(accountId, groupBank, tonumber(amount), comment, cid, 5)

    local info = {
        data = "$".. amount .. " added!",
        handle = "Casino"
    }
    TriggerClientEvent("np-phone:client:sendInfo", src, info)
end)

RPC.register("np-casino:purchaseChipsDirty", function(amount)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id 

    exports.ghmattimysql:execute("SELECT * FROM characters WHERE `id` = @cid",{["@cid"] = cid},function(lsl)
        if lsl[1] ~= nil then
            local lslIsTrash = lsl[1].casino + tonumber(amount)
            exports.ghmattimysql:execute("UPDATE characters SET casino=@amount WHERE id=@cid", {
                ["cid"] = cid,
                ["amount"] = lslIsTrash
            })
        end
    end)
end)

RPC.register("np-casino:withdrawChips", function(Type)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id 
    local accountId = user:getBankId() 
    local groupBank = exports["np-groups"]:groupBank("casino")

    exports.ghmattimysql:execute("SELECT * FROM characters WHERE `id` = @cid",{["@cid"] = cid},function(lsl)
        if lsl[1] ~= nil then
            local lslIsTrash = lsl[1].casino 
            if lslIsTrash > 0 then 
                local comment = "withdraw Casino chips $" .. lslIsTrash
                if Type == "bank" then
                    exports["np-financials"]:transaction(accountId, groupBank, amount, comment, cid, 5)
                else
                    exports["np-financials"]:updateCash(src, "+", lslIsTrash)
                end
                exports.ghmattimysql:execute("UPDATE characters SET casino=@amount WHERE id=@cid", {
                    ["cid"] = cid,
                    ["amount"] = lslIsTrash
                })
            end
        end
    end)
end)

RPC.register("np-casino:HasMemberShip", function()
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id 
    local result = false   

    exports.ghmattimysql:execute("SELECT * FROM character_passes WHERE `cid` = @cid",{["@cid"] = cid},function(moon)
        if moon[1] ~= nil then
            result = true
        end
    end)

    Citizen.Wait(100)
    return result, cid
end)

RPC.register("np-casino:transferChips", function(tId, amount)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id 

    TargetId = TargetId ~= nil and tonumber(TargetId) or nil
    if not TargetId or TargetId <= 0 or TargetId == src then
        return print("fuck off")
    end

    local TargetId = exports["np-base"]:getModule("Player"):GetUser(tId)
    local TargetCid = TargetId:getCurrentCharacter().id 

    if not TargetId or TargetId == -1 then
        return print("trgt not online")
    end
    
    if (TargetId == src) then
        return print("trgt=id")
    end
    
    if (not amount or amount <= 0) then
        return print("amt less than 0")
    end

    exports.ghmattimysql:execute("SELECT * FROM characters WHERE `cid` = @cid",{["@cid"] = cid},function(moon)
        if moon[1] ~= nil then
            local lslIsTrash = lsl[1].casino 
            if lslIsTrash >= amount then
                local finalAmount = amount - lslIsTrash
                if finalAmount >= 0 and finalAmount <= 0 then
                    finalAmount = 0 
                end
                exports.ghmattimysql:execute("UPDATE characters SET casino=@amount WHERE id=@cid", {
                    ["cid"] = cid,
                    ["amount"] = finalAmount
                })

                exports.ghmattimysql:execute("UPDATE characters SET casino=@amount WHERE id=@cid", {
                    ["cid"] = TargetCid,
                    ["amount"] = amount
                })
            else
                TriggerClientEvent("DoLongHudText", "Insufficient Funds")
            end
        end
    end)
end)

RPC.register("np-casino:purchaseMembershipCard", function()
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id 
    local fn = user:getCurrentCharacter().first_name
    local fl = user:getCurrentCharacter().last_name
    local name = fn .. " " .. fl
    
    exports.ghmattimysql:execute("SELECT * FROM character_passes WHERE `cid` = @id",{["@cid"] = cid},function(passes)
        if passes[1] ~= nil then
            return TriggerClientEvent("DoLongHudText", "you Already Have Membership")
        else
            exports.ghmattimysql:execute("INSERT INTO character_passes (cid, rank, name, giver, pass_type, business_name, bank) VALUES (@cid, @rank, @name, @giver, @pass_type, @business_name, @bank)",{
                ["cid"] = cid,
                ["rank"] = 0,
                ["name"] = fln,
                ["giver"] = "Casino",
                ["pass_type"] = "member",
                ["business_name"] = "casino",
                ["bank"] = 0,
            })
            TriggerClientEvent("player:receiveItem", src, "casinomember", 1, false, { 
            ["cid"] = cid,
            ["rank"] = 0,
            ["name"] = name,
            ["giver"] = "Casino",
            ["pass_type"] = "member",
            ["business_name"] = "casino",
            ["bank"] = 0, 
            })
        end
    end)
end)

RPC.register("np-casino:getGoldCoinForRoom", function(room)

end)

RPC.register("np-casino:useChips", function(currentBetAmount)
    local src = source
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id 
    local CurrentChips = ChipCount(src)

    if currentBetAmount <= CurrentChips then
        RemoveChips(src, currentBetAmount)
        return true
    else
        return false
    end
end)

RPC.register("np-casino:getCurrentChipCount", function()
    local src = source
    local Chips = ChipCount(src)
    return Chips
end)

function ChipCount(src)
    local user = exports["np-base"]:getModule("Player"):GetUser(src) 
    local cid = user:getCurrentCharacter().id
    local Casino = 0

    exports.ghmattimysql:execute("SELECT casino FROM characters WHERE id = @cid", {["cid"] = tonumber(cid)}, function(result)
        if result[1] ~= nil then
            Casino = result[1].casino
        end
    end)

    Citizen.Wait(150)
    return Casino
end

function giveChips(src, amount)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id
    local current = ChipCount(src)
    local finalAmount = current + amount

    local affectedRows = MySQL.update.await([[
        UPDATE characters
        SET casino = ?
        WHERE id = ?
    ]],

    { finalAmount, cid })

    if not affectedRows or affectedRows < 1 then
        return false
    end
end

function RemoveChips(src, amount)
    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id
    local current = ChipCount(src)
    local finalAmount = current - amount

    if finalAmount <= 0 then
        finalAmount = 0
    end

    local affectedRows = MySQL.update.await([[
        UPDATE characters
        SET casino = ?
        WHERE id = ?
    ]],

    { finalAmount, cid })

    if not affectedRows or affectedRows < 1 then
        return false
    end
end

exports("ChipCount", ChipCount)
exports("RemoveChips", RemoveChips)
exports("giveChips", giveChips)
