fx_version 'adamant'
games { 'gta5' }

client_scripts {
    '@np-lib/client/cl_rpc.lua',
    '@np-lib/client/cl_ui.lua',
    '@np-lib/client/cl_interface.lua',
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

client_script "@np-errorlog/client/cl_errorlog.lua"