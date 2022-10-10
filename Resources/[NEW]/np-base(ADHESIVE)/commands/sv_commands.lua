Void.Commands = Void.Commands or {}
Void.Commands.Registered = Void.Commands.Registered or {}

AddEventHandler("np-base:exportsReady", function()
    addModule("Commands", Void.Commands)
end)
