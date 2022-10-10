fx_version 'cerulean'
game 'gta5'

author 'cool'
description 'GOV by cool'
version '1.0.0'

lua54 'yes'

client_script "@np-lib/client/cl_interface.lua"
client_script "@np-errorlog/client/cl_errorlog.lua"

client_scripts {
  '@np-lib/client/cl_rpc.lua',
  '@np-lib/client/cl_animTask.lua',
  '@np-sync/client/lib.lua',
  'client/cl_*.lua'
}

server_script '@np-lib/server/sv_infinity.lua'

server_scripts {
    '@np-lib/server/sv_rpc.lua',
    '@np-lib/server/sv_sql.lua',
    'server/sv_*.lua'
}