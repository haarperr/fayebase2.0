--[[

    Variables

]]

Races = {}
PendingRaces = {}
ActiveRaces = {}
FinishedRaces = {}

--[[

    Functions

]]

function formatRace(race)
    local id = tostring(race.id)

    local checkpoints = race.checkpoints
    if type(checkpoints) == "string" then
        checkpoints = json.decode(checkpoints)
    end

    local index = 0
    local start = {}
    if race.type == "Lap" then
        index = #checkpoints
        start = checkpoints[index]
    else
        index = 1
        start = checkpoints[index]
    end

    Races[id] = {
        id = id,
        name = race.name,
        creator = race.creator,
        distance = race.distance,
        type = race.type,
        thumbnail = race.thumbnail,
        start = start,
        checkpoints = checkpoints,
        fastest_time = race.fastest_time,
        fastest_name = race.fastest_name,
        races = race.races,
    }
end

--[[

    RPCs

]]

RPC.register("np-racing:getAllRaces", function(src)
    local allRaces = {
        races = Races,
        pendingRaces = PendingRaces,
        activeRaces = ActiveRaces,
        finishedRaces = FinishedRaces,
    }

    return allRaces
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    local races = MySQL.query.await([[
        SELECT *
        FROM racing_races
    ]])

    for i, v in ipairs(races) do
        formatRace(v)
    end
end)