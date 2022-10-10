fx_version 'cerulean'
games {'gta5'}

description 'Weapon Meta Files'

files {
	'weapons_snspistol_mk2.meta',
}

data_file 'WEAPONINFO_FILE' 'weapons_snspistol_mk2.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons_snspistol_mk2.meta'

client_scripts {
    'client/cl_*.lua'
}

server_scripts {
    'server/sv_*.lua'
}