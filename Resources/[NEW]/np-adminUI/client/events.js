let currentUI = null,
  controlUI = false,
  showingMenu = false,
  blockingActions = null
function setCommandUI(x, L, J) {
  !x && hideMenu()
  if (J == 1) {
    enableMenu(true, false)
  } else {
    ;(J == 2 || J == 3) && enableMenu(false, true)
  }
  currentUI = x
  if (currentUI == null) {
    showingMenu = false
  }
  if (J == 1) {
    SendNuiMessage(
      JSON.stringify({
        action: 'setCurrentInteractionMenu',
        commandUI: currentUI,
        headingData: L,
      })
    )
  } else {
    if (J == 2 || J == 3) {
      let P = getOptionState(x.options, 'toggleDefaultMenu')
      J == 2 && SetNuiFocus(true, true)
      J == 3 &&
        (SetNuiFocus(true, false),
        SetNuiFocusKeepInput(true),
        (P = getOptionState(x.options, 'expandedOnPass')))
      SendNuiMessage(
        JSON.stringify({
          action: 'setCurrentMainMenu',
          playerData: x.playerData,
          options: x.options,
          menuData: x.menuData,
          playerLogs: x.playerLogs,
          adminMode: x.adminMode,
          itemList: x.itemList,
          vehicleList: x.vehicleList,
          garageList: x.garageList,
          jobList: x.jobList,
          licenseList: x.licenseList,
          favCommands: x.favCommands,
          startExpanded: P,
          disconnectedPlayers: x.disconnectedPlayers,
          bannedList: x.bannedList,
        })
      )
    }
  }
}
global.exports('setCommandUI', setCommandUI)
function getOptionState(x, L) {
  let J = true,
    m = x.find((R) => R.optionName === L)
  if (m) {
    J = m.data
  }
  return J
}
function enableMenu(x, L) {
  showingMenu = true
  SendNuiMessage(
    JSON.stringify({
      action: 'show',
      selection: x,
      menu: L,
    })
  )
}
global.exports('enableMenu', enableMenu)
function hideMenu() {
  showingMenu = false
  SendNuiMessage(
    JSON.stringify({
      action: 'show',
      selection: false,
      menu: false,
    })
  )
}
global.exports('hideMenu', hideMenu)
function toggleNUI() {
  if (!showingMenu) {
    return
  }
  controlUI = !controlUI
  SetNuiFocus(controlUI, controlUI)
  SendNuiMessage(
    JSON.stringify({
      action: 'setKeyBinds',
      selectionMenu: global.exports['np-binds'].getKeyMapping(
        '+enableSelectionMenu'
      ),
      selectionKey:
        global.exports['np-binds'].getKeyMapping('+adminSelect'),
    })
  )
}
function exitNUI() {
  controlUI = false
  SetNuiFocus(false, false)
  SetNuiFocusKeepInput(false)
}
global.exports('exitNUI', exitNUI)
RegisterNuiCallbackType('closeMenu')
on('__cfx_nui:closeMenu', (x, L) => {
  controlUI = false
  SetNuiFocus(false, false)
  SetNuiFocusKeepInput(false)
  x.toSelect && global.exports['np-admin'].enterSelection()
  L()
})
RegisterNuiCallbackType('hideMenu')
on('__cfx_nui:hideMenu', (x, L) => {
  SetNuiFocus(false, false)
  SetNuiFocusKeepInput(false)
  L()
})
RegisterNuiCallbackType('changeInputFocus')
on('__cfx_nui:changeInputFocus', (x, L) => {
  SetNuiFocusKeepInput(x.focus)
  L()
})
RegisterNuiCallbackType('insideCommand')
on('__cfx_nui:insideCommand', (x, L) => {
  if (x.inside) {
    if (blockingActions) {
      return
    }
    emit('np-binds:should-execute', false)
    blockingActions = setTick(() => {
      DisableControlAction(0, 24, true)
      DisableControlAction(0, 142, true)
      DisableControlAction(1, 38, true)
      DisableControlAction(0, 44, true)
      DisableControlAction(1, 75, true)
      DisableControlAction(0, 22, true)
      DisableControlAction(1, 23, true)
      DisableControlAction(1, 37, true)
      DisableControlAction(0, 245, true)
      DisableControlAction(0, 245, true)
    })
  } else {
    emit('np-binds:should-execute', true)
    blockingActions && (clearTick(blockingActions), (blockingActions = null))
  }
  L()
})
setImmediate(() => {
  RegisterCommand('+enableSelectionMenu', () => toggleNUI(), false)
  RegisterCommand('-enableSelectionMenu', () => {}, false)
  global.exports['np-binds'].registerKeyMapping(
    'general',
    'zzAdmin',
    'Selection Menu',
    '+enableSelectionMenu',
    '-enableSelectionMenu',
    ''
  )
})
function updatePlayerLogs(x) {
  SendNuiMessage(
    JSON.stringify({
      action: 'updatePlayerLogs',
      playerLogs: x,
    })
  )
}
global.exports('updatePlayerLogs', updatePlayerLogs)
function updateMenuData(x) {
  SendNuiMessage(
    JSON.stringify({
      action: 'updateMenuData',
      menuData: x,
    })
  )
}
global.exports('updateMenuData', updateMenuData)
function updateDefinedNames(x) {
  SendNuiMessage(
    JSON.stringify({
      action: 'updateDefinedNames',
      data: x,
    })
  )
}
global.exports('updateDefinedNames', updateDefinedNames)
function updateAdminMode(x) {
  SendNuiMessage(
    JSON.stringify({
      action: 'updateAdminMode',
      adminMode: x,
    })
  )
}
global.exports('updateAdminMode', updateAdminMode)
