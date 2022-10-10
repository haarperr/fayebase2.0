RPC.register('np-weed:deliverpackage', function()
    TriggerClientEvent('inventory:removeItem', source, 'weedpackage', 1)
end)