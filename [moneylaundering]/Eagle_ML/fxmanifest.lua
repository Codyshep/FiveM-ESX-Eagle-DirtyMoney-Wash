fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'EagleDev'
description 'None'
version '1.0.0'

server_scripts {
    'server/*'
}

client_scripts {
    'client/*'
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
}