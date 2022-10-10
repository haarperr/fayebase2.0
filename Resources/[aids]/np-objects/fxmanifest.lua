fx_version "cerulean"

description "Void Object System"
author "cool"
version '0.0.1'

game "gta5"

server_script '@lucityrp-lib/server/sv_rpc.js'
server_script '@lucityrp-lib/server/sv_sql.js'
server_script 'server/*.js'

client_script '@apx/client/lib.js'
client_script '@lucityrp-lib/client/cl_rpc.js'
client_script '@lucityrp-lib/client/cl_poly.js'
client_script 'client/*.js'