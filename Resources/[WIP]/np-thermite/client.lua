RegisterNUICallback('callback', function(data, cb)
	SetNuiFocus(false, false)
    Callbackk(data.success)
    cb('ok')
end)

function OpenThermiteGame(callback, size, starttime, endtime)
  Callbackk = callback
  SetNuiFocus(true, true)
  SendNUIMessage({type = "open", size = (6), starttime = (2), endtime = (20)})
end

-- /thermite [size] [start time] [full time]
-- RegisterCommand("thermite",function(source, args, raw)
--   exports['np-thermite']:OpenThermiteGame(function(success)
--     if success then
--       print("SUCCESS")
--     else
--       print("FAILURE")
--     end
--   end, tonumber(args[1]), tonumber(args[2]), tonumber(args[3]))
-- end)