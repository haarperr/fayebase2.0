fx_version "cerulean"
games { "gta5" }


client_scripts {
    "@np-lib/client/cl_main.lua",
    "@np-lib/client/cl_ui.lua",
    "client/*",
}

server_scripts {
    "@np-lib/server/sv_main.lua",
    "server/*",
}


shared_scripts {
    "shared/*",
}
