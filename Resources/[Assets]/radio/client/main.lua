-- Disable controls while GUI open

local GuiOpened = false
local pRadioChannel = false

function pChannelActive()
  return pRadioChannel
end

exports('pChannel', function()
  return pChannelActive()
end)

RegisterNetEvent('radioGui')
AddEventHandler('radioGui', function()
  openGui()
end)

RegisterNetEvent('ChannelSet')
AddEventHandler('ChannelSet', function(chan)
  pRadioChannel = true
  SendNUIMessage({set = true, setChannel = chan})
end)

local function formattedChannelNumber(number)
  local power = 10 ^ 1
  return math.floor(number * power) / power
end

RegisterNetEvent('radio:resetNuiCommand')
AddEventHandler('radio:resetNuiCommand', function()
    SendNUIMessage({reset = true})
end)

function openGui()
  local radio = hasRadio()
  local job = exports["isPed"]:isPed("myJob")
  local Emergency = false
  if job == "police" or job == "sheriff" or job == "state" then
    Emergency = true
  elseif job == "ems" then
    Emergency = true
  end
  
  if not GuiOpened and radio then
    GuiOpened = true
    SetNuiFocus(false,false)
    SetNuiFocus(true,true)
    SendNUIMessage({open = true, jobType = Emergency})
  else
    GuiOpened = false
    SetNuiFocus(false,false)
    SendNUIMessage({open = false, jobType = Emergency})
  end
  TriggerEvent("animation:radio",GuiOpened)
end

local function handleConnectionEvent(pChannel)
  local newChannel = formattedChannelNumber(pChannel)

  if newChannel < 1.0 then
    pRadioChannel = false
    exports['np-voice']:removePlayerFromRadio()
    exports["np-voice"]:setVoiceProperty("radioEnabled", false)
  else
    pRadioChannel = true
    exports["np-voice"]:setVoiceProperty("radioEnabled", true)
    exports['np-voice']:addPlayerToRadio(newChannel)
  end
end
local radioVolume = 0.5


function hasRadio()
    if exports["np-inventory"]:hasEnoughOfItem("radio",1,false) or exports["np-inventory"]:hasEnoughOfItem("civradio",1,false) or exports["np-inventory"]:hasEnoughOfItem("emsradio",1,false) then
      return true
    else
      return false
    end
end

RegisterNUICallback('click', function(data, cb)
  PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
end)

RegisterNUICallback('volumeUp', function(data, cb)
  radioVolume = radioVolume + 0.1
  if radioVolume >= 1.0 then
    radioVolume = 1.0
  end
  exports['np-voice']:setRadioVolume(radioVolume)
  exports['np-voice']:getRadioVolume()
  TriggerEvent('DoLongHudText', "New volume + "..radioVolume, 1)
end)

RegisterNUICallback('volumeDown', function(data, cb)
  radioVolume = radioVolume - 0.1
  if radioVolume < 0.1 then
    radioVolume = 0.0
  end
  exports['np-voice']:setRadioVolume(radioVolume)
  exports['np-voice']:getRadioVolume()
  TriggerEvent('DoLongHudText', "New volume - "..radioVolume, 2)
end)

RegisterNUICallback('cleanClose', function(data, cb)
  TriggerEvent("InteractSound_CL:PlayOnOne","radioclick",0.6)
  GuiOpened = false
  SetNuiFocus(false,false)
  SendNUIMessage({open = false})
  TriggerEvent("animation:radio",GuiOpened)
end)

RegisterNUICallback('poweredOn', function(data, cb)
  cb("ok")
end)

RegisterNUICallback('poweredOff', function(data, cb)
  pRadioChannel = false
  exports['np-voice']:removePlayerFromRadio()
  exports["np-voice"]:setVoiceProperty("radioEnabled", false)
end)

function closeGui()
  TriggerEvent("InteractSound_CL:PlayOnOne","radioclick",0.6)
  GuiOpened = false
  SetNuiFocus(false,false)
  SendNUIMessage({open = false})
  TriggerEvent("animation:radio",GuiOpened)
end

RegisterNetEvent('np-radio:ResetUI')
AddEventHandler('np-radio:ResetUI', function()
    GuiOpened = false
    SetNuiFocus(false,false)
    SendNUIMessage({open = false})
    TriggerEvent("animation:radio",GuiOpened)
end)

RegisterNUICallback('close', function(data, cb)
  handleConnectionEvent(data.channel)
  closeGui()
  cb('ok')
end)

RegisterNetEvent('animation:radio')
AddEventHandler('animation:radio', function(enable)
  TriggerEvent("destroyPropRadio")
  local lPed = PlayerPedId()
  inPhone = enable

  RequestAnimDict("cellphone@")
  while not HasAnimDictLoaded("cellphone@") do
    Citizen.Wait(0)
  end

  TaskPlayAnim(lPed, "cellphone@", "cellphone_text_in", 2.0, 3.0, -1, 49, 0, 0, 0, 0)

  Citizen.Wait(300)
  if inPhone then
    TriggerEvent("attachItemRadio","radio01")
    Citizen.Wait(150)
    while inPhone do

      local dead = exports['np-death']:GetDeathStatus()
      if dead then
        closeGui()
        inPhone = false
      end
      if not IsEntityPlayingAnim(lPed, "cellphone@", "cellphone_text_read_base", 3) and not IsEntityPlayingAnim(lPed, "cellphone@", "cellphone_swipe_screen", 3) then
        TaskPlayAnim(lPed, "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
      end    
      Citizen.Wait(1)
    end
    ClearPedTasks(PlayerPedId())
  else
      Citizen.Wait(100)
      ClearPedTasks(PlayerPedId())
      TaskPlayAnim(lPed, "cellphone@", "cellphone_text_out", 2.0, 1.0, 5.0, 49, 0, 0, 0, 0)
      Citizen.Wait(400)
      TriggerEvent("destroyPropRadio")
      Citizen.Wait(400)
      ClearPedTasks(PlayerPedId())
    end
    TriggerEvent("destroyPropRadio")
end)


Citizen.CreateThread(function()

  while true do
    if GuiOpened then
      Citizen.Wait(1)
      DisableControlAction(0, 1, GuiOpened) -- LookLeftRight
      DisableControlAction(0, 2, GuiOpened) -- LookUpDown
      DisableControlAction(0, 14, GuiOpened) -- INPUT_WEAPON_WHEEL_NEXT
      DisableControlAction(0, 15, GuiOpened) -- INPUT_WEAPON_WHEEL_PREV
      DisableControlAction(0, 16, GuiOpened) -- INPUT_SELECT_NEXT_WEAPON
      DisableControlAction(0, 17, GuiOpened) -- INPUT_SELECT_PREV_WEAPON
      DisableControlAction(0, 99, GuiOpened) -- INPUT_VEH_SELECT_NEXT_WEAPON
      DisableControlAction(0, 100, GuiOpened) -- INPUT_VEH_SELECT_PREV_WEAPON
      DisableControlAction(0, 115, GuiOpened) -- INPUT_VEH_FLY_SELECT_NEXT_WEAPON
      DisableControlAction(0, 116, GuiOpened) -- INPUT_VEH_FLY_SELECT_PREV_WEAPON
      DisableControlAction(0, 142, GuiOpened) -- MeleeAttackAlternate
      DisableControlAction(0, 106, GuiOpened) -- VehicleMouseControlOverride
    else
      Citizen.Wait(20)
    end    
  end
end)

RegisterNetEvent('radio:SetRadioStatus')
AddEventHandler('radio:SetRadioStatus', function(status)
    pRadioChannel = status
end)

RegisterCommand('+RadioVolumeUp', function()
  radioVolume = radioVolume + 0.1
  if radioVolume >= 1.0 then
    radioVolume = 1.0
  end
  exports['np-voice']:setRadioVolume(radioVolume)
  exports['np-voice']:getRadioVolume()
  TriggerEvent('DoLongHudText', "New volume + "..radioVolume, 1)
end, false)

RegisterCommand('-RadioVolumeDown', function() end, false)

Citizen.CreateThread(function()
  exports["np-binds"]:registerKeyMapping("", "Radio", "Radio Volume Up", "+RadioVolumeUp", "-RadioVolumeDown", "PAGEUP")

  exports["np-binds"]:registerKeyMapping("", "Radio", "Radio Volume Down", "+RadioVolumeDown", "-RadiopVolumeDown", "PAGEDOWN")
end)

RegisterCommand('+RadioVolumeDown', function()
  radioVolume = radioVolume - 0.1
  if radioVolume < 0.1 then
    radioVolume = 0.0
  end
  exports['np-voice']:setRadioVolume(radioVolume)
  exports['np-voice']:getRadioVolume()
  TriggerEvent('DoLongHudText', "New volume - "..radioVolume, 2)
end, false)

RegisterCommand('-RadiopVolumeDown', function() end, false)

RegisterNetEvent('np-radio:set_chan_1')
AddEventHandler('np-radio:set_chan_1', function()
  local job = exports["isPed"]:isPed("myJob")
  if job == "police" or job == "sheriff" or job == "state" then
    pRadioChannel = true
    SendNUIMessage({set = true, setChannel = chan})
    exports['np-voice']:addPlayerToRadio(1)
    exports["np-voice"]:setVoiceProperty("radioEnabled", true)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    TriggerEvent('DoLongHudText', 'New Frequency: 1')
  end
end)

RegisterNetEvent('np-radio:set_chan_2')
AddEventHandler('np-radio:set_chan_2', function()
  local job = exports["isPed"]:isPed("myJob")
  if job == "police" or job == "sheriff" or job == "state" then
    pRadioChannel = true
    SendNUIMessage({set = true, setChannel = chan})
    exports['np-voice']:addPlayerToRadio(2)
    exports["np-voice"]:setVoiceProperty("radioEnabled", true)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    TriggerEvent('DoLongHudText', 'New Frequency: 2')
  end
end)

RegisterNetEvent('np-radio:set_chan_3')
AddEventHandler('np-radio:set_chan_3', function()
  local job = exports["isPed"]:isPed("myJob")
  if job == "police" or job == "sheriff" or job == "state" then
    exports['np-voice']:addPlayerToRadio(3)
    exports["np-voice"]:setVoiceProperty("radioEnabled", true)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    TriggerEvent('DoLongHudText', 'New Frequency: 3')
  end
end)

RegisterNetEvent('np-radio:set_chan_4')
AddEventHandler('np-radio:set_chan_4', function()
  local job = exports["isPed"]:isPed("myJob")
  if job == "police" or job == "sheriff" or job == "state" then
    exports['np-voice']:addPlayerToRadio(4)
    exports["np-voice"]:setVoiceProperty("radioEnabled", true)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    TriggerEvent('DoLongHudText', 'New Frequency: 4')
  end
end)

RegisterNetEvent('np-radio:set_chan_5')
AddEventHandler('np-radio:set_chan_5', function()
  local job = exports["isPed"]:isPed("myJob")
  if job == "police" or job == "sheriff" or job == "state" then
    exports['np-voice']:addPlayerToRadio(5)
    exports["np-voice"]:setVoiceProperty("radioEnabled", true)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    TriggerEvent('DoLongHudText', 'New Frequency: 5')
  end
end)
