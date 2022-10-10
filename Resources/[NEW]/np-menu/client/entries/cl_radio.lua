local GeneralEntries, SubMenu = MenuEntries['general'], {}

local MenuOptions = {
  {
      id = 'radio:1',
      title = "1",
      icon = "#general-door-keyFob",
      event = "np-radio:set_chan_1",
  },
  {
      id = 'radio:2',
      title = "2",
      icon = "#general-door-keyFob",
      event = "np-radio:set_chan_2",
  },
  {
      id = 'radio:3',
      title = "3",
      icon = "#general-door-keyFob",
      event = "np-radio:set_chan_3",
  },
  {
      id = 'radio:4',
      title = "4",
      icon = "#general-door-keyFob",
      event = "np-radio:set_chan_4",
  },
  {
      id = 'radio:5',
      title = "5",
      icon = "#general-door-keyFob",
      event = "np-radio:set_chan_5",
  },
}

Citizen.CreateThread(function()
  for index, data in ipairs(MenuOptions) do
      SubMenu[index] = data.id
      MenuItems[data.id] = {data = data}
  end
  GeneralEntries[#GeneralEntries+1] = {
      data = {
          id = "radio:switchChannel",
          icon = "#general-door-keyFob",
          title = "Radio",
      },
      subMenus = SubMenu,
      isEnabled = function()
        if not exports['np-death']:GetDeathStatus() then
            return (exports["isPed"]:isPed("myJob") == 'dispatcher' or exports["isPed"]:isPed("myJob") == 'doc' or exports["isPed"]:isPed("myJob") == 'police' or exports["isPed"]:isPed("myJob") == 'sheriff' or exports["isPed"]:isPed("myJob") == 'ems' or exports["isPed"]:isPed("myJob") == 'state')
        end
    end,
  }
end)
