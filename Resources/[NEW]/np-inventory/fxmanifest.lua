fx_version 'cerulean'
games {'gta5'}


--[[ dependencies {
    "PolyZone"
} ]]--

client_script "@np-errorlog/client/cl_errorlog.lua"
client_script "@PolyZone/client.lua"

ui_page 'nui/ui.html'

files {
  "nui/ui.html",
  "nui/pricedown.ttf",
  "nui/default.png",
  "nui/background.png",
  "nui/weight-hanging-solid.png",
  "nui/hand-holding-solid.png",
  "nui/search-solid.png",
  "nui/invbg.png",
  "nui/styles.css",
  "nui/scripts.js",
  "nui/debounce.min.js",
  "nui/loading.gif",
  "nui/loading.svg",
  "nui/icons/*"
}

shared_script 'shared_list.js'
---shared_script '@np-lib/shared/sh_cacheable.js'

client_scripts {
  "@np-sync/client/lib.lua",
  "@np-lib/client/cl_ui.lua",
  "@np-lib/client/cl_rpc.js",
  "@np-lib/client/cl_rpc.lua",
  'client.js',
  'functions.lua',
  'cl_actionbar.lua',
  'cl_vehicleweights.js',
  'cl_craftingspots.js',
  'cl_attach.lua',
  'cl_modes.lua',
}

server_scripts {
  '@np-lib/server/sv_asyncExports.js',
  "@np-lib/server/sv_npx.js",
  "@np-lib/server/sv_rpc.js",
  "sv_config.js",
  "sv_clean.js",
  'sv_shops.lua',
  'server_degradation.js',
  'server_shops.js',
  'server.js',
  "sv_functions.js",
  'sv_craftingspots.js',
  'server.lua',
}

exports{
  'getFreeSpace',
  'hasEnoughOfItem',
  'getQuantity',
  'GetCurrentWeapons',
  'GetItemInfo',
  'GetInfoForFirstItemOfName',
  'getFullItemList',
  'getAmountOfItem',
}

-- dependency 'np-lib'
