--Example

RegisterNUICallback("np-ui:test:input", function(data, cb)
    print("np-ui:test:input",json.encode(data))
    SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNUICallback("guccimanecancel", function(data, cb)
    print("np-ui:test:input",json.encode(data))
    SetNuiFocus(false)
    cb("ok")
end)