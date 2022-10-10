AddEventHandler("explosionEvent", function(sender, ev)
    TriggerClientEvent('np-vaultrob:lower:vaultdoor', sender)
end)