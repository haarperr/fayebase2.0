game 'common'
fx_version 'bodacious'

client_scripts {
    '@np-lib/client/cl_rpcother.lua',
    'client/*.lua',
    'shared/sh*.lua',
}

server_scripts {
    '@np-lib/server/sv_rpcother.lua',
    '@np-lib/server/sv_sql.lua',
    'server/*.lua',
    'shared/sh*.lua',
}
