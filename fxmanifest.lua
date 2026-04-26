fx_version 'cerulean'
game 'gta5'

name 'shadow_minigames'
description 'Minigame pack'
author 'Shadow Resources'
version '1.0.0'

use_experimental_fxv2_oal 'yes'
lua54 'yes'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/main.lua',
    'client/wordguess.lua',
    'client/pathfind.lua',
    'client/minesweeper.lua',
    'client/wavematch.lua',
    'client/untangle.lua',
    'client/pattern.lua',
    'client/wirecut.lua',
}

ui_page 'nui/index.html'

files {
    'nui/**/*',
}
