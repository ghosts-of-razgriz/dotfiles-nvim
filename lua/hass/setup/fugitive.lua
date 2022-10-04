local function set_keymap(...)
	vim.api.nvim_set_keymap(...)
end
local opts = { noremap = true }

set_keymap('n', '<leader>ga', '<cmd>Git add --patch<cr>', opts)
set_keymap('n', '<leader>gb', '<cmd>Git blame<cr>', opts)
set_keymap('n', '<leader>gc', '<cmd>Git commit<cr>', opts)
set_keymap('n', '<leader>gd', '<cmd>Gdiff<cr>', opts)
set_keymap('n', '<leader>gf', '<cmd>Git fetch<cr>', opts)
set_keymap('n', '<leader>gg', '<cmd>Git<space>', opts)
set_keymap('n', '<leader>gk', ':Git checkout<space>', opts)
set_keymap('n', '<leader>gl', '<cmd>Git pull<cr>', opts)
set_keymap('n', '<leader>gp', '<cmd>Git push<cr>', opts)
set_keymap('n', '<leader>gs', '<cmd>Git<cr><c-w><s-h>', opts)
set_keymap('n', '<leader>gw', '<cmd>Gwrite<cr>', opts)
set_keymap('n', '<localleader>gc', '<cmd>Git commit --amend<cr>', opts)
set_keymap('n', '<localleader>gw', '<cmd>Git add --patch %<cr>', opts)
set_keymap('n', '<leader>ge', ':Gedit<space>', opts)
