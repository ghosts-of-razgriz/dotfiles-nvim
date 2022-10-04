local utils = require 'utils'
local set_keymap = utils.set_keymap

local leader = '<leader>'
local lleader = '<localleader>'

-- jk to esc insert mode
set_keymap('i', 'jk', '<esc>', utils.nore)

-- quit
set_keymap('n', leader .. 'q', '<cmd>quit<cr>', utils.noresilent)
set_keymap('n', lleader .. 'q', '<cmd>quit!<cr>', utils.noresilent)

-- write
set_keymap('n', leader .. 'w', '<cmd>write<cr>', utils.nore)

-- split panes
set_keymap('n', lleader .. '\\', '<cmd>vsplit<cr>', utils.noresilent)
set_keymap('n', lleader .. '-', '<cmd>split<cr>', utils.noresilent)

-- tabs
set_keymap('n', lleader .. '<tab>', '<cmd>tabnew<cr>', utils.noresilent)
set_keymap('n', lleader .. 'h', '<cmd>tabprevious<cr>', utils.noresilent)
set_keymap('n', lleader .. 'l', '<cmd>tabnext<cr>', utils.noresilent)

-- search highlight
set_keymap('n', leader .. 'h', '<cmd>set hlsearch!<cr>', utils.noresilent)

-- zoom
set_keymap('n', leader .. '-', '<cmd>wincmd _<cr><cmd>wincmd |<cr>', utils.noresilent)
set_keymap('n', leader .. '=', '<cmd>wincmd =<cr>', utils.noresilent)
