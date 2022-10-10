local scenes = {}

SQL = function(query, parameters, cb)
    local res = nil
    local IsBusy = true
	exports.oxmysql:execute(query, parameters, function(result)
		if cb then
			cb(result)
		else
			res = result
			IsBusy = false
		end
	end)
    while IsBusy do
        Citizen.Wait(0)
    end
    return res
end



RPC.register("np-scenes:getScenes", function(src)
    return scenes
end)

function UpdateAllScenes()
    scenes = {}

    local result = SQL([[
        SELECT *
        FROM scenes
    ]])

    for _, v in pairs(result) do
        local newCoords = json.decode(v.coords)
        scenes[#scenes+1] = {
            id = v.id,
            text = v.text,
            color = v.color,
            viewdistance = v.viewdistance,
            expiration = v.expiration,
            fontsize = v.fontsize,
            fontstyle = v.fontstyle,
            coords = vector3(newCoords.x, newCoords.y, newCoords.z),
        }
    end

    TriggerClientEvent("np-scenes:client:UpdateAllScenes", -1, scenes)
end

function DeleteExpiredScenes()
    SQL([[
        DELETE FROM scenes
        WHERE date_deletion < NOW()
    ]])

    UpdateAllScenes()
end

RegisterNetEvent("np-scenes:server:DeleteScene", function(id)
    SQL([[
        DELETE FROM scenes
        WHERE id = ?
    ]],
    { id })

    UpdateAllScenes()
end)

RegisterNetEvent("np-scenes:server:CreateScene", function(sceneData)
    local src = source

    local user = exports["np-base"]:getModule("Player"):GetUser(src)
    local characterId = user:getCurrentCharacter().id
    if not characterId then return end

    local insertId = SQL([[
        INSERT INTO scenes (creator, text, color, viewdistance, expiration, fontsize, fontstyle, coords, date_creation, date_deletion)
        VALUES (? ,?, ?, ?, ?, ?, ?, ?, NOW(), DATE_ADD(NOW(), INTERVAL ? HOUR))
    ]],
    { cid, sceneData.text, sceneData.color, sceneData.viewdistance, sceneData.expiration, sceneData.fontsize, sceneData.fontstyle, json.encode(sceneData.coords), sceneData.expiration })

    -- if not insertId or insertId < 1 then
    --     return false, "Database insert eror"
    -- end

    UpdateAllScenes()
end)

Citizen.CreateThread(function()
    UpdateAllScenes()

    while true do
        DeleteExpiredScenes()
        Wait(Config.AuditInterval)
    end
end)