--[[

    Variables

]]

local listening = false
local currentPrompt = nil

local currentClassRoomBoardUrl = "https://media.discordapp.net/attachments/989995424918151191/1009628870032494602/rebrand_new_color.png?width=1193&height=671"
local currentMeetingRoomBoardUrl = "https://media.discordapp.net/attachments/989995424918151191/1009628870032494602/rebrand_new_color.png"
local inClassRoom, inMeetingRoom = false, false


AddEventHandler("np-polyzone:enter", function(pZoneName, pZoneData)
    if pZoneName == "np-police:zone" then
        if exports["np-base"]:getChar("job") == pZoneData.job then
            currentPrompt = pZoneData.zone
            exports["np-interaction"]:showInteraction(zoneData[pZoneData.zone].promptText)
            listenForKeypress(pZoneData.zone, pZoneData.action)
        end
    elseif pZoneName == "mrpd_classroom" then
        if not dui then
            dui = exports["np-lib"]:getDui(currentClassRoomBoardUrl)
            AddReplaceTexture("prop_planning_b1", "prop_base_white_01b", dui.dictionary, dui.texture)
        else
            exports["np-lib"]:changeDuiUrl(dui.id, currentClassRoomBoardUrl)
        end
        inClassRoom = true
    elseif zone == "mrpd_meetingroom" then
        if not dui then
          dui = exports["np-lib"]:getDui(currentMeetingRoomBoardUrl)
          AddReplaceTexture("prop_planning_b1", "prop_base_white_01b", dui.dictionary, dui.texture)
        else
          exports["np-lib"]:changeDuiUrl(dui.id, currentMeetingRoomBoardUrl)
        end
        inMeetingRoom = true
    end
end)

AddEventHandler("np-polyzone:exit", function(pZoneName, pZoneData)
    if pZoneName == "np-police:zone" then
        exports["np-interaction"]:hideInteraction()
        listening = false
        currentPrompt = nil
    elseif pZoneName == "mrpd_classroom" then
        RemoveReplaceTexture("prop_planning_b1", "prop_base_white_01b")
        if dui ~= nil then
            exports["np-lib"]:releaseDui(dui.id)
            dui = nil
        end
        inClassRoom = false
    elseif zone == "mrpd_meetingroom" then
        RemoveReplaceTexture("prop_planning_b1", "prop_base_white_01b")
        if dui ~= nil then
            exports["np-lib"]:releaseDui(dui.id)
            dui = nil
        end
        inMeetingRoom = false
    end
end)

AddEventHandler("np-police:handler", function(eventData)
    local job = exports["np-base"]:getChar("job")

    local location = currentPrompt ~= nil and string.match(currentPrompt, "(.-)_") or ""

    if eventData == EVENTS.LOCKERS and exports["np-jobs"]:getJob(job, "is_police") then
        local cid = exports["np-base"]:getChar("id")
        TriggerEvent("server-inventory-open", "1", ("personalStorage-%s-%s"):format(location, cid))
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 3.0, "LockerOpen", 0.4)
    elseif eventData == EVENTS.CLOTHING then
        exports["np-interaction"]:hideInteraction()
        Wait(500)
        TriggerEvent("raid_clothes:openClothing", true, true)
    elseif eventData == EVENTS.SWITCHER then
        TriggerEvent("apartments:Logout")
    elseif eventData == EVENTS.EVIDENCE and exports["np-jobs"]:getJob(job, "is_police") then
        if job == "cid" then
            local input = exports["np-interface"]:openApplication({
                {
                    icon = "hashtag",
                    label = "Case ID",
                    name = "id",
                },
            })

            if input["id"] then
                TriggerEvent("server-inventory-open", "1", ("%s_evidence"):format(input["id"]))
            end
        else
            TriggerEvent("server-inventory-open", "1", ("%s_evidence"):format(location))
        end
    elseif eventData == EVENTS.TRASH and exports["np-jobs"]:getJob(job, "is_police") then
        TriggerEvent("server-inventory-open", "1", ("%s_trash"):format(location))
    elseif eventData == EVENTS.ARMORY and exports["np-jobs"]:getJob(job, "is_police") then
        if job == "cid" then
            TriggerEvent("server-inventory-open", "11", "Shop")
        else
            TriggerEvent("server-inventory-open", "10", "Shop")
        end
    end
end)

AddEventHandler("np-polce:changewhiteboardurl", function(pParams)
    exports["np-interface"]:openApplication('textbox', {
        callbackUrl = 'np-police:changewhiteboardurl',
        key = pParams.room,
        items = {
            { label = "URL", name = "url", icon = "link" }
        },
        show = true
    })
end)

RegisterInterfaceCallback("np-police:changewhiteboardurl", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "done" } })
    exports["np-interface"]:closeApplication("textbox")
    TriggerServerEvent("police:changewhiteboard", data.values.url, data.key)
end)


RegisterNetEvent("police:changewhiteboardcli")
AddEventHandler("police:changewhiteboardcli", function(pUrl, pRoom)
    if pRoom == "classroom" then
        currentClassRoomBoardUrl = pUrl

        if inClassRoom and dui then
            exports["np-lib"]:changeDuiUrl(dui.id, currentClassRoomBoardUrl)
        end
    elseif pRoom == "meetingroom" and inMeetingRoom and dui then
        currentMeetingRoomBoardUrl = pUrl

        if inMeetingRoom and dui then
            exports["np-lib"]:changeDuiUrl(dui.id, currentMeetingRoomBoardUrl)
        end
    end
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    -- MRPD Classroom
    exports["np-polyzone"]:AddPolyZone("mrpd_classroom", {
        vector2(448.41372680664, -990.47613525391),
        vector2(439.50704956055, -990.55731201172),
        vector2(439.43478393555, -981.08758544922),
        vector2(448.419921875, -981.26306152344),
        vector2(450.23190307617, -983.00885009766),
        vector2(450.25042724609, -988.77667236328)
    }, {
        gridDivisions = 25,
        minZ = 34.04,
        maxZ = 37.69,
    })

    exports["np-polyzone"]:AddBoxZone("mrpd_meetingroom", vector3(474.07, -995.08, 30.69), 10.2, 5.2, {
        heading=0,
        minZ=29.64,
        maxZ=32.84
    })


    -- MRPD Screen
    exports["np-polytarget"]:AddBoxZone("mrdp_change_picture", vector3(439.44, -985.89, 34.97), 1.0, 0.4, {
        heading=0,
        minZ=35.37,
        maxZ=36.17
    })

    exports["np-polytarget"]:AddBoxZone("mrpd_meetingroom_screen", vector3(474.02, -1000.06, 30.69), 0.05, 2.6, {
        heading=0,
        minZ=30.54,
        maxZ=32.49
    })

    exports["np-interact"]:AddPeekEntryByPolyTarget("mrdp_change_picture", {{
        event = "np-polce:changewhiteboardurl",
        id = "polcechangewhiteboardurlc",
        icon = "circle",
        label = "Change URL",
        parameters = {
            room = "classroom"
        }
    }}, { distance = { radius = 2.5 } })

    exports["np-interact"]:AddPeekEntryByPolyTarget("mrpd_meetingroom_screen", {{
        event = "np-polce:changewhiteboardurl",
        id = "polcechangewhiteboardurlm",
        icon = "circle",
        label = "Change URL",
        parameters = {
            room = "meetingroom"
        }
    }}, { distance = { radius = 2.5 } })
end)