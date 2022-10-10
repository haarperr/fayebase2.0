NP = {}
NP.isDead = false

myJob = "unemployed"
isJudge = false
isDoctor = false
isNews = false
isDoc = false
isPolice = false
isMedic = false
isDead = false
isInstructorMode = false

RegisterNetEvent('np-hud:settings', function(key, value)
    if key ~= 'np-preferences' then
        return
    end
    local newPhoneVolume = value['phone.volume'] * 10
    local newRadioVolume = value['radio.volume'] * 10

    if newPhoneVolume ~= PhoneVolume then
        SetPhoneVolume(value['phone.volume'] * 10)
    end

    if newRadioVolume ~= RadioVolume then
        SetRadioVolume(value['radio.volume'] * 10)
    end
end)

RegisterNetEvent('pd:deathcheck')
AddEventHandler('pd:deathcheck', function()
    if not NP.isDead then
        NP.isDead = true
        isDead = true
    else
        NP.isDead = false
        isDead = false
    end
end)

RegisterNetEvent("srp-jobmanager:playerBecameJob")
AddEventHandler("srp-jobmanager:playerBecameJob", function(job, name, notify)
    myJob = job

    if not CanUseFrequency(CurrentChannel, nil, myJob) then
        return SetRadioFrequency()
    end
end)

function IsEmergency(OverWrite)
    local currentJob = exports["isPed"]:isPed("myjob")
    if OverWrite ~= nil then currentJob = OverWrite end


    if currentJob == "police" then return true end
    if currentJob == "ems" then return true end
    if currentJob == "doctor" then return true end
    if currentJob == "doc" then return true end
    if currentJob == "therapist" then return true end

    return false
end

function CanUseFrequency(pFrequency, pNotify, jobOverWrite)
    if not pFrequency then return false end

    if pFrequency == 0 then return true end

    local hasPDRadio = exports["np-inventory"]:hasEnoughOfItem("radio", 1, false, true)
    local hasCivRadio = exports["np-inventory"]:hasEnoughOfItem("civradio", 1, false, true)

    local frequency = type(pFrequency) == 'table' and pFrequency.id or pFrequency
    if frequency <= 10 and (not hasPDRadio or not IsEmergency(jobOverWrite)) then
        if pNotify then TriggerEvent('DoLongHudText', 'This frequency is encrypted.', 2) end
        return false
    elseif frequency > 10 and not hasCivRadio then
        if pNotify then TriggerEvent('DoLongHudText', 'PD Walkie cannot operate in civ frequencies.', 2) end
        return false
    end

    return true
end

Citizen.CreateThread(function ()
    myJob = exports["isPed"]:isPed("myjob")
    local initialHudSettings = {}--exports["np-ui"]:GetPreferences()
    if initialHudSettings['radio.volume'] then
      SetRadioVolume(initialHudSettings['radio.volume'] * 10, true)
    end
    if initialHudSettings['phone.volume'] then
      SetPhoneVolume(initialHudSettings['phone.volume'] * 10)
    end
end)
