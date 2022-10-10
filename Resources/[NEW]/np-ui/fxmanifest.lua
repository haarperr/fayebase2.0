fx_version 'cerulean'
games {'gta5'}
this_is_a_map 'yes'

ui_page "html/index.html"

files({
	"html/*",
	"html/img/*",
	"html/css/*",
	"html/font/*",
	"html/js/*"
})

client_scripts {
	"client/*.lua",
	'client/model/*.lua'
}

server_script "server/*"