fx_version 'bodacious'
games { 'rdr3', 'gta5' }

client_scripts {
    'client/*.lua',
    '@np-lib/client/cl_main.lua',
    'cl_deg.lua',
    'cl_polyzones.lua',
}


server_scripts {
    'server/*.lua',
    'sv_vehiclemod.lua',
    '@np-lib/server/sv_main.lua',
    'sv_deg.lua',
}