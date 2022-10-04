local utils = require 'utils'
local set_keymap = utils.set_keymap
local nore = utils.nore

set_keymap('n', '<leader>ga', '<cmd>Git add --patch<cr>', nore)
set_keymap('n', '<leader>gb', '<cmd>Git blame<cr>', nore)
set_keymap('n', '<leader>gc', '<cmd>Git commit<cr>', nore)
set_keymap('n', '<leader>gd', '<cmd>Gdiff<cr>', nore)
set_keymap('n', '<leader>gf', '<cmd>Git fetch<cr>', nore)
set_keymap('n', '<leader>gg', '<cmd>Git<space>', nore)
set_keymap('n', '<leader>gk', ':Git checkout<space>', nore)
set_keymap('n', '<leader>gl', '<cmd>Git pull<cr>', nore)
set_keymap('n', '<leader>gp', '<cmd>Git push<cr>', nore)
set_keymap('n', '<leader>gs', '<cmd>Git<cr><c-w><s-h>', nore)
set_keymap('n', '<leader>gw', '<cmd>Gwrite<cr>', nore)
set_keymap('n', '<localleader>gc', '<cmd>Git commit --amend<cr>', nore)
set_keymap('n', '<localleader>gw', '<cmd>Git add --patch %<cr>', nore)
set_keymap('n', '<leader>ge', ':Gedit<space>', nore)
