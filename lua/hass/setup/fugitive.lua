local function set_keymap(...)
	vim.api.nvim_set_keymap(...)
end
local opts = { noremap = true }

set_keymap('n', '<leader>ga', ':Git add --patch<cr>', opts)
set_keymap('n', '<leader>gb', ':Git blame<cr>', opts)
set_keymap('n', '<leader>gc', ':Git commit<cr>', opts)
set_keymap('n', '<leader>gd', ':Gdiff<cr>', opts)
set_keymap('n', '<leader>gf', ':Git fetch<cr>', opts)
set_keymap('n', '<leader>gg', ':Git<space>', opts)
set_keymap('n', '<leader>gk', ':Git checkout<space>', opts)
set_keymap('n', '<leader>gl', ':Git pull<cr>', opts)
set_keymap('n', '<leader>gp', ':Git push<cr>', opts)
set_keymap('n', '<leader>gs', ':Git<cr><c-w><s-h>', opts)
set_keymap('n', '<leader>gw', ':Gwrite<cr>', opts)
set_keymap('n', '<localleader>gc', ':Git commit --amend<cr>', opts)
set_keymap('n', '<localleader>gw', ':Git add --patch %<cr>', opts)
set_keymap('n', '<leader>ge', ':Gedit<space>', opts)
