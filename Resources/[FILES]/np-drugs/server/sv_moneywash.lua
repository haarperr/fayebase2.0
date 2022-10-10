
RegisterServerEvent('zyloz:payout')
AddEventHandler('zyloz:payout', function(money)
    local source = source
    local player = GetPlayerName(source)
    local user = exports["np-base"]:getModule("Player"):GetUser(source)
    if money ~= nil then
        user:addMoney(money)
        TriggerClientEvent('DoLongHudText', source, 'You got $'.. money .. '!', 1)
    end
end)