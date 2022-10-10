fx_version 'adamant'
games { 'gta5' }

client_scripts {
	'@np-lib/client/cl_interface.lua',
	'@np-lib/client/cl_rpc.lua',
	'@mka-lasers/client/client.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'client/*.lua',
	'config.lua',
}

server_scripts {
	'@np-lib/server/sv_rpc.lua',
	'@np-lib/server/sv_sql.lua',
	'server/*.lua',
	'config.lua',
}

export 'GetVarStatus'