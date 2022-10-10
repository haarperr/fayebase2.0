fx_version 'cerulean'
games { 'gta5' }

shared_script "@mka-array/Array.lua"

client_scripts {
    '@np-lib/client/cl_rpc.lua',
    '@np-lib/client/cl_ui.lua',
	'@np-lib/client/cl_interface.lua',
    '@np-errorlog/client/cl_errorlog.lua',
    'client/cl_*.lua',
}

shared_script {
    '@np-lib/shared/sh_util.lua',
}

server_scripts {
    '@np-lib/server/sv_rpc.lua',
    '@np-lib/server/sv_sql.lua',
    'server/sv_*.lua',
}