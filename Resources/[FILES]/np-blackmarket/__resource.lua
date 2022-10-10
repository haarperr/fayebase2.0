resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page 'html/laptop.html'

client_scripts {
    '@np-lib/client/cl_main.lua',
    'client/main.lua',
}

server_scripts {
    '@np-lib/server/sv_main.lua',
    'server/main.lua',
}

files {
    'html/laptop.html',
    'html/style.css',
    'html/reset.css',
    'html/ui.js',
    'html/browse.js',
}