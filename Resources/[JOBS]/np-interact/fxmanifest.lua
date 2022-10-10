fx_version "cerulean"

games {"gta5"}

description "AtlasRP Peek Interactions"

shared_script "@apx/shared/lib.lua"

shared_scripts {
	"shared/sh_*.lua",
}

server_scripts {
	"server/sv_*.lua",
}

client_script "@mka-array/Array.lua"
client_script "@np-lib/client/cl_ui.lua"

client_scripts {
	"client/cl_*.lua",
	'@np-lib/client/cl_rpc.lua',
	"client/entries/cl_*.lua",
}

exports {
	'NearGasFn'
}