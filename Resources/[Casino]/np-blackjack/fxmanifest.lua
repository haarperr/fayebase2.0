fx_version 'adamant'

game "gta5"

client_scripts {
  "@np-lib/client/cl_ui.lua",
  '@np-lib/client/cl_rpc.lua',
  'client/cl_*.lua',
}

server_scripts {
  "@oxmysql/lib/MySQL.lua",
  "@np-lib/server/sv_rpc.lua",
  "@np-lib/server/sv_sql.lua",
  'server/sv_*.lua',
  'server/sv_*.js',
}
