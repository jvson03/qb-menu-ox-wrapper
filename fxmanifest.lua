fx_version 'cerulean'
game 'gta5'

name 'qb-menu-ox-wrapper'
description 'A wrapper that maps qb-menu calls to ox_lib'
author 'Jvson03/jasontheman'
version '1.0.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua'
}

client_scripts {
    'client.lua',
}

dependencies {
    'ox_lib',
}

provide 'qb-menu'