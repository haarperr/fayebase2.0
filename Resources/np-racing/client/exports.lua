--[[

    Functions

]]

function createPendingRace(id, options)
    if curRace then return end

    RPC.execute("np-racing:createPendingRace", id, options)
end

function previewRace(id)
    if previewEnabled then
        previewEnabled = false
        return
    end

    local race = races[id]
    if race == nil then return end

    previewEnabled = false
    SetWaypointOff()
    race.start.pos = tableToVector3(race.start.pos)

    for i=1, #race.checkpoints do
        race.checkpoints[i].pos = tableToVector3(race.checkpoints[i].pos)
    end

    local checkpoints = race.checkpoints
    for i=1, #checkpoints do
        addCheckpointBlip(checkpoints, i)
    end

    if race.type == "Point" then
        addBlip(race.start.pos, 0, true)
    end

    previewEnabled = true

    -- Thread to continously render the route
    Citizen.CreateThread(function()
        while previewEnabled do
            -- If a race has been started, or waypoint has been placed, preview is disabled and cleared
            if IsWaypointActive() or curRace then
                previewEnabled = false
            end
            Citizen.Wait(0)
        end

        clearBlips()
    end)
end

function locateRace(id)
    local race = races[id]
    if race == nil then return end

    previewEnabled = false
    local start = race.start.pos
    SetNewWaypoint(start.x, start.y, start.z)
end

function startRace(countdown)
    local characterId = getCharacterId()
    for k, v in pairs(pendingRaces) do
        if v.owner == characterId then
            RPC.execute("np-racing:startRace", v.id, countdown or v.countdown)
            TriggerEvent('DoShortHudText', 'Reace Is Starteing In:' ..countdown)
            return
        end
    end
end

function endRace()
    if curRace then
        RPC.execute("np-racing:endRace")
    else
        RPC.execute("np-racing:leaveRace")
    end
end


RegisterCommand('joinrace', function(source, args)
    local alias = exports["isPed"]:isPed("fullname")
    local characterId = exports["isPed"]:isPed("cid")
    joinRace(args[1], alias, characterId)
    SetLocalPlayerAsGhost(true)
    SetGhostedEntityAlpha(254)
end)


function joinRace(id, alias, characterId)
    RPC.execute("np-racing:joinRace", id, alias, characterId)
end

function leaveRace()
    SendNUIMessage({
        showHUD = false
    })

    if curRace then
        RPC.execute("np-racing:dnfRace", curRace.id)
        cleanupRace()
    else
        RPC.execute("np-racing:leaveRace")
    end
    SetLocalPlayerAsGhost(true)
    SetGhostedEntityAlpha(254)
end

function getAllRaces()
    if races then
        return {
            races = races,
            pendingRaces = pendingRaces,
            activeRaces = activeRaces,
            finishedRaces = finishedRaces,
        }
    end

    local res = RPC.execute("np-racing:getAllRaces")
    races = res.races
    pendingRaces = res.pendingRaces
    activeRaces = res.activeRaces
    finishedRaces = res.finishedRaces

    return res
end

--[[

    Exports

]]

exports("createPendingRace", createPendingRace)
exports("previewRace", previewRace)
exports("locateRace", locateRace)
exports("startRace", startRace)
exports("endRace", endRace)
exports("joinRace", joinRace)
exports("leaveRace", leaveRace)
exports("getAllRaces", getAllRaces)