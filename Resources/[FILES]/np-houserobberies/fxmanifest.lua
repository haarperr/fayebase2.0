fx_version 'cerulean'
game 'gta5'
description 'warp Houserobberies'
version '1.0.0'
ui_page 'nui/index.html'

files {
  "nui/index.html",
  "nui/scripts.js",
  "nui/css/style.css",
}

client_scripts {
	'config.lua',
	'@np-lib/client/cl_rpc.lua',
	'client/*.lua'
}

server_scripts {
	'config.lua',
	'@np-lib/server/sv_rpc.lua',
	'server/*.lua'
}

shared_scripts { 
	'@np-lib/shared/sh_util.lua',
}