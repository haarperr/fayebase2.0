
-- ibe1337 

fx_version 'cerulean'
games { 'gta5' }

dependencies {
  "mka-lasers"
}

client_scripts {
  '@np-lib/client/cl_rpc.lua',
  '@np-lib/client/cl_ui.lua',
  '@np-lib/client/cl_animTask.lua',
  'client/cl_*.lua',
  "@np-sync/client/cl_lib.lua",
}

shared_script {
  '@np-lib/shared/sh_util.lua',
}