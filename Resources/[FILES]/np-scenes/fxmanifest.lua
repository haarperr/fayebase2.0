fx_version "cerulean"
games { "gta5" }

lua54 "yes"

ui_page "html/index.html"

files {
	"html/*",
    "html/index.html",
	"html/app.js",
	"html/styles.css",
}

shared_scripts {
    "@np-lib/shared/sh_util.lua",
    "shared/*",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "@np-lib/server/sv_main.lua",
    "server/*",
}

client_scripts {
    "@np-lib/client/cl_main.lua",
    "client/*",
}