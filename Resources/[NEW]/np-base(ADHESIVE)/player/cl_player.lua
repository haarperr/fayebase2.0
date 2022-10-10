Void.Player = Void.Player or {}
Void.LocalPlayer = Void.LocalPlayer or {}

local function GetUser()
    return Void.LocalPlayer
end

function Void.LocalPlayer.setVar(self, var, data)
    GetUser()[var] = data
end

function Void.LocalPlayer.getVar(self, var)
    return GetUser()[var]
end

function Void.LocalPlayer.setCurrentCharacter(self, data)
    if not data then return end
    GetUser():setVar("character", data)
end

function Void.LocalPlayer.getCurrentCharacter(self)
    return GetUser():getVar("character")
end

RegisterNetEvent("np-base:networkVar")
AddEventHandler("np-base:networkVar", function(var, val)
    Void.LocalPlayer:setVar(var, val)
end)

