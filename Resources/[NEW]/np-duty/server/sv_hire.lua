-- POLICE HIRE/FIRE --

RegisterServerEvent("np-duty:HireLaw")
AddEventHandler("np-duty:HireLaw", function(cid, job, rank)
    local src = source
    if job == 'state' or job == 'ranger' or job == 'police' or job == 'sheriff' or job == 'dispatcher' or job == 'doc' then
        exports.oxmysql:execute("INSERT INTO jobs_whitelist (cid, job, rank) VALUES (@cid, @job, @rank)", {['@cid'] = cid, ['@job'] = job, ['@rank'] = rank})
        exports.oxmysql:execute('SELECT * FROM characters WHERE id = @cid', {['@cid'] = cid}, function(result)
            if result[1] ~= nil then
                TriggerClientEvent('DoLongHudText', src, 'You hired '.. result[1].first_name ..' '.. result[1].last_name, 1)
            end
        end)
    else
        TriggerClientEvent('DoLongHudText', src, 'Please select one of these jobs! (police, state, sheriff, ranger, doc)', 2)
    end
end)

RegisterServerEvent("np-duty:FireLaw")
AddEventHandler("np-duty:FireLaw", function(cid)
    local src = source
    exports.oxmysql:execute('SELECT * FROM characters WHERE id = @cid', {['@cid'] = cid}, function(result)
        exports.oxmysql:execute('SELECT * FROM jobs_whitelist WHERE cid = @cid', {['@cid'] = cid}, function(result2)
            if result[1] ~= nil and result2[1] ~= nil then
                if result2[1].job == 'state' or result2[1].job == 'ranger' or result2[1].job == 'police' or result2[1].job == 'sheriff' or result2[1].job == 'doc' then
                    exports.oxmysql:execute("DELETE FROM jobs_whitelist WHERE `cid` = @cid AND `job` = @job", {['@cid'] = cid, ['@job'] = result2[1].job})
                    TriggerClientEvent('DoLongHudText', src, 'You fired '.. result[1].first_name ..' '.. result[1].last_name, 2)
                else
                    TriggerClientEvent('DoLongHudText', src, 'The person you are trying firing does not work for you!', 2)
                end
            end
        end) 
    end)
end)

-- END POLICE HIRE/FIRE --

-- EMS HIRE/FIRE --

RegisterServerEvent("np-duty:HireEMS")
AddEventHandler("np-duty:HireEMS", function(cid, rank)
    local src = source
    exports.oxmysql:execute("INSERT INTO jobs_whitelist (cid, job, rank) VALUES (@cid, @job, @rank)", {['@cid'] = cid, ['@job'] = 'ems', ['@rank'] = rank})
    exports.oxmysql:execute('SELECT * FROM characters WHERE id = @cid', {['@cid'] = cid}, function(result)
        if result[1] ~= nil then
            TriggerClientEvent('DoLongHudText', src, 'You hired '.. result[1].first_name ..' '.. result[1].last_name, 1)
        end
    end)
end)

RegisterServerEvent("np-duty:FireEMS")
AddEventHandler("np-duty:FireEMS", function(cid)
    local src = source
    exports.oxmysql:execute('SELECT * FROM characters WHERE id = @cid', {['@cid'] = cid}, function(result)
        exports.oxmysql:execute('SELECT * FROM jobs_whitelist WHERE cid = @cid AND job = "ems"', {['@cid'] = cid}, function(result2)
            if result[1] ~= nil and result2[1] ~= nil then
                if result2[1].job == 'ems' then
                    exports.oxmysql:execute("DELETE FROM jobs_whitelist WHERE `cid` = @cid AND `job` = @job", {['@cid'] = cid, ['@job'] = result2[1].job})
                    TriggerClientEvent('DoLongHudText', src, 'You fired '.. result[1].first_name ..' '.. result[1].last_name, 2)
                else
                    TriggerClientEvent('DoLongHudText', src, 'The person you are trying firing does not work for you!', 2)
                end
            end
        end) 
    end)
end)

-- END EMS HIRE/FIRE --