-- =========================================================================
-- ARQUIVO: fxmanifest.lua (MOCHILA EXTRA)
-- =========================================================================

fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'Trinity Aya By Tombstone Studio'
description 'Script para item consumivel que aumenta a capacidade de carga.'
version '1.8.0'

lua54 'yes'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}

client_scripts {
    'config.lua',
    'client.lua'
}

dependencies {
    'vorp_core',
    'vorp_inventory'
}

