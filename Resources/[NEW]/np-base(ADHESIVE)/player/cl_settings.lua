Void.SettingsData = Void.SettingsData or {}
Void.Settings = Void.Settings or {}

Void.Settings.Current = {}
-- Current bind name and keys
Void.Settings.Default = {
  ["tokovoip"] = {
    ["stereoAudio"] = true,
    ["localClickOn"] = true,
    ["localClickOff"] = true,
    ["remoteClickOn"] = true,
    ["remoteClickOff"] = true,
    ["clickVolume"] = 0.8,
    ["radioVolume"] = 0.8,
    ["phoneVolume"] = 0.8,
    ["releaseDelay"] = 200
  },
  ["hud"] = {

  }

}


function Void.SettingsData.setSettingsTable(settingsTable, shouldSend)
  if settingsTable == nil then
    Void.Settings.Current = Void.Settings.Default
    TriggerServerEvent('np-base:sv:player_settings_set',Void.Settings.Current)
    Void.SettingsData.checkForMissing()
  else
    if shouldSend then
      Void.Settings.Current = settingsTable
      TriggerServerEvent('np-base:sv:player_settings_set',Void.Settings.Current)
      Void.SettingsData.checkForMissing()
    else
       Void.Settings.Current = settingsTable
       Void.SettingsData.checkForMissing()
    end
  end

  TriggerEvent("event:settings:update",Void.Settings.Current)

end

function Void.SettingsData.setSettingsTableGlobal(self, settingsTable)
  Void.SettingsData.setSettingsTable(settingsTable,true);
end

function Void.SettingsData.getSettingsTable()
    return Void.Settings.Current
end

function Void.SettingsData.setVarible(self,tablename,atrr,val)
  Void.Settings.Current[tablename][atrr] = val
  TriggerServerEvent('np-base:sv:player_settings_set',Void.Settings.Current)
end

function Void.SettingsData.getVarible(self,tablename,atrr)
  return Void.Settings.Current[tablename][atrr]
end

function Void.SettingsData.checkForMissing()
  local isMissing = false

  for j,h in pairs(Void.Settings.Default) do
    if Void.Settings.Current[j] == nil then
      isMissing = true
      Void.Settings.Current[j] = h
    else
      for k,v in pairs(h) do
        if  Void.Settings.Current[j][k] == nil then
           Void.Settings.Current[j][k] = v
           isMissing = true
        end
      end
    end
  end
  

  if isMissing then
    TriggerServerEvent('np-base:sv:player_settings_set',Void.Settings.Current)
  end


end

RegisterNetEvent("np-base:cl:player_settings")
AddEventHandler("np-base:cl:player_settings", function(settingsTable)
  Void.SettingsData.setSettingsTable(settingsTable,false)
end)


RegisterNetEvent("np-base:cl:player_reset")
AddEventHandler("np-base:cl:player_reset", function(tableName)
  if Void.Settings.Default[tableName] then
      if Void.Settings.Current[tableName] then
        Void.Settings.Current[tableName] = Void.Settings.Default[tableName]
        Void.SettingsData.setSettingsTable(Void.Settings.Current,true)
      end
  end
end)