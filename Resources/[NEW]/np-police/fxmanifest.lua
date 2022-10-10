fx_version 'bodacious'
game 'gta5'

resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

client_script "@np-errorlog/client/cl_errorlog.lua"

-- General
client_scripts {
  '@np-lib/client/cl_interface.lua',
  '@np-lib/client/cl_ui.lua',
  'client.lua',
  'client_trunk.lua',
  'cl_spikes.lua',
  'client_trunk.lua',
  'cl_doc.lua',
  'cl_whiteboard.lua',
  'cl_vehicleimpound.lua',
  'beatmode.lua',
  --'cl_policegarage.lua',
}

server_scripts {
  'server.lua',
  'sv_whiteboard.lua',
  --'sv_policegarage.lua',
}

exports {
	'getIsInService',
	'getIsCop',
	'getIsCuffed'
}