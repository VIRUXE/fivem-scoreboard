fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '1.0'

author 'slicedbrain'
description 'Simple Scoreboard using OX LIB'

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
	'config.lua',
	'shared.lua'
}

client_script 'client.lua'

server_script 'server.lua'