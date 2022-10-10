-- ######################################################
-- ### This Function Will Get All The Player Licenses ###
-- ######################################################

GetPlayerLicenses = function(identifier, type)

    if type == 'weapon' then
        local pWeapon = SQL('SELECT status FROM user_licenses WHERE cid = @cid AND type = @type', {['@cid'] = identifier, ['@type'] = 'weapon'})
        if pWeapon[1].status == 1 then
            return true
        else
            return false
        end
    end

    if type == 'drivers' then
        local pDrivers = SQL('SELECT status FROM user_licenses WHERE cid = @cid AND type = @type', {['@cid'] = identifier, ['@type'] = 'drivers'})
        if pDrivers[1].status == 1 then
            return true
        else
            return false
        end
    end

    if type == 'hunting' then
        local pHunting = SQL('SELECT status FROM user_licenses WHERE cid = @cid AND type = @type', {['@cid'] = identifier, ['@type'] = 'hunting'})
        if pHunting[1].status == 1 then
            return true
        else
            return false
        end
    end

    if type == 'fishing' then
        local pFishing = SQL('SELECT status FROM user_licenses WHERE cid = @cid AND type = @type', {['@cid'] = identifier, ['@type'] = 'fishing'})
        if pFishing[1].status == 1 then
            return true
        else
            return false
        end
    end

    if type == 'pilot' then
        local pPilot = SQL('SELECT status FROM user_licenses WHERE cid = @cid AND type = @type', {['@cid'] = identifier, ['@type'] = 'pilot'})
        if pPilot[1].status == 1 then
            return true
        else
            return false
        end
    end

    if type == 'bar' then
        local pBar = SQL('SELECT status FROM user_licenses WHERE cid = @cid AND type = @type', {['@cid'] = identifier, ['@type'] = 'bar'})
        if pBar[1].status == 1 then
            return true
        else
            return false
        end
    end

    if type == 'business' then
        local pBusiness = SQL('SELECT status FROM user_licenses WHERE cid = @cid AND type = @type', {['@cid'] = identifier, ['@type'] = 'business'})
        if pBusiness[1].status == 1 then
            return true
        else
            return false
        end
    end
end

-- #################################################
-- ### This Function Will Get Player Duty Status ###
-- #################################################

GetPlayerDutyStatus = function(src)
    return 1 -- Return 1 If Player On Duty Else Return 0
end

-- ###################################################
-- ### This Function Will Get Player Radio Channel ###
-- ###################################################

-- GetPlayerRadio = function(src)
--     return 1  -- Return The Player Radio Channel
-- end

-- ####################################################
-- ### This Function Will Update Player Duty Status ###
-- ####################################################

ChangePlayerDuty = function(identifier, status)
    -- TriggerEvent("police:updateDuty", identifier, status) Example
end

-- ######################################################
-- ### This Function Will Manage Player Duty Licenses ###
-- ######################################################

ManageLicenses = function(identifier, type, status)
    if status == "give" then
        -- Add License
    elseif status == "revoke" then
        -- Remove License
    end
end

-- ##############################################
-- ### This Function Will Send Player To Jail ###
-- ##############################################

JailPlayer = function(src, identifier, time)
    -- Example
    -- local Player = QBCore.Functions.GetPlayerByCitizenId(identifier)
    -- TriggerClientEvent("police:client:JailCommand", src, Player.PlayerData.source, time)
end

-- #######################################################
-- ### This Function Will Check Vehicle Impound Status ###
-- #######################################################

CheckImpoundStatus = function(plate)
    -- Return True If Vehicle Is Impounded Else Return False
    -- Example
    -- local result = SQL('SELECT * FROM player_vehicles WHERE plate = @plate', {['@plate'] = plate})
    -- if result[1] then
    --     if result[1].state == 1 then
    --         return false
    --     else
    --         return true
    --     end
    -- end
end