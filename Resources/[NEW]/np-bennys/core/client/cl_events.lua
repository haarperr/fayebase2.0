RegisterNetEvent('enter:bennys:doc')
AddEventHandler('enter:bennys:doc', function()
    TriggerEvent('np-bennys:enter_location', 5)
    disabled = true
    disableControls()
end)

RegisterNetEvent('enter:benny')
AddEventHandler('enter:benny', function()
    TriggerEvent('np-bennys:enter_location', 1)
    disabled = true
    disableControls()
end)

RegisterNetEvent('enter:benny:pillbox')
AddEventHandler('enter:benny:pillbox', function()
    local job = exports['isPed']:isPed('myjob')
    if (job == 'ems') then
        TriggerEvent('np-bennys:enter_location', 10)
    end
end)

RegisterNetEvent('enter:benny:mrpd')
AddEventHandler('enter:benny:mrpd', function()
    local job = exports["isPed"]:isPed("myJob")
	if (job == "police" or job == "sheriff" or job == "state" or exports["isPed"]:isPed("myJob") == 'ems') then
    TriggerEvent('np-bennys:enter_location', 6)
    disabled = true
      disableControls()
    end 
end)

RegisterNetEvent('enter:benny:tunershop')
AddEventHandler('enter:benny:tunershop', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("tuner_shop")
    if isEmployed then 
    TriggerEvent('np-bennys:enter_location', 9)
    disabled = true
      disableControls()
    else
        TriggerEvent('DoLongHudText','You Need A TunerShop Worker To Help You', 2)
    end
end)

RegisterNetEvent('enter:benny:bennys')
AddEventHandler('enter:benny:bennys', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("hayes_autos")
    if isEmployed then 
    TriggerEvent('np-bennys:enter_location', 12)
    isPlyInBennys = true
    disabled = true
    disableControls()
    end
end)

RegisterNetEvent('enter:benny:bennys2')
AddEventHandler('enter:benny:bennys2', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("bennys")
    if isEmployed then 
    TriggerEvent('np-bennys:enter_location', 2)
    isPlyInBennys = true
    disabled = true
    disableControls()
    end
end)

RegisterNetEvent('enter:benny:illegal')
AddEventHandler('enter:benny:illegal', function()
    local job = exports["isPed"]:GroupRank("illegal_shop") -- idk?
    if job > 2 then
    TriggerEvent('np-bennys:enter_location', 15)
    isPlyInBennys = true
    disabled = true
    disableControls()
    end
end)

RegisterNetEvent('enter:benny:harmony')
AddEventHandler('enter:benny:harmony', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("harmony_repairs")
    if isEmployed then
    TriggerEvent('np-bennys:enter_location', 11)
    disabled = true
      disableControls()
    else
        TriggerEvent('DoLongHudText','You Need A Harmony Worker To Help You', 2)
    end
end)

RegisterNetEvent('enter:benny:harmony2')
AddEventHandler('enter:benny:harmony2', function()
    local isEmployed = exports["np-business"]:IsEmployedAt("harmony_repairs")
    if isEmployed then
    TriggerEvent('np-bennys:enter_location', 1)
    disabled = true
      disableControls()
    else
        TriggerEvent('DoLongHudText','You Need A Harmony Worker To Help You', 2)
    end
end)

RegisterNetEvent('np-public-bennys')
AddEventHandler('np-public-bennys', function()
    TriggerServerEvent('voidrp:bennys:pay1')
end)