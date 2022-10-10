fx_version "cerulean"

description "Void Admin"
author "cool"
version '0.0.1'

game "gta5"

server_script '@np-lib/server/sv_rpc.lua'
server_script '@np-lib/server/sv_rpc.js'
server_script '@np-lib/server/sv_sql.lua'
server_script '@np-lib/server/sv_sql.js'
server_script 'dist/server/*.js'
server_script 'server/sv_*.lua'

client_script '@np-lib/client/cl_rpc.js'
client_script '@np-lib/client/cl_poly.js'
client_script 'dist/client/*.js'
client_script 'client/cl_*.lua'