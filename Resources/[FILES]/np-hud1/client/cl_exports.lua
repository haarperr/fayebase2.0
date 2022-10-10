function SendUIMessage(data)
    SendReactMessage('uiMessage', data)
  end
  
  exports('SendUIMessage', SendUIMessage)
  
  function sendAppEvent(app, data)
      local sentData = {
          app = app,
          data = data or {},
          source = "np-nui",
      }
      SendUIMessage(sentData)
  end
  
  exports("sendAppEvent", sendAppEvent)