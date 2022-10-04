local utils = require 'utils'
local set_keymap = utils.set_keymap
local noresilent = utils.noresilent

set_keymap('n', '<leader>u<space>', ':Telescope ', utils.nore)
set_keymap('n', '<leader>uu', '<cmd>Telescope find_files<cr>', noresilent)
set_keymap('n', '<localleader>uu', '<cmd>Telescope git_files<cr>', noresilent)
set_keymap('n', '<leader>ut', '<cmd>Telescope<cr>', noresilent)
set_keymap('n', '<leader>ub', '<cmd>Telescope buffers<cr>', noresilent)
set_keymap('n', '<leader>ub', '<cmd>Telescope buffers<cr>', noresilent)
set_keymap('n', '<leader>ug', '<cmd>Telescope live_grep<cr>', noresilent)
set_keymap('n', '<leader>uc', '<cmd>Telescope commands<cr>', noresilent)
set_keymap('n', '<leader>uk', '<cmd>Telescope keymaps<cr>', noresilent)
