vim.g.tmux_navigator_no_mappings = 1

local settings = {silent = true, noremap = true}
vim.api.nvim_set_keymap('n', '<c-h>', ':TmuxNavigateLeft<cr>', settings)
vim.api.nvim_set_keymap('n', '<c-j>', ':TmuxNavigateDown<cr>', settings)
vim.api.nvim_set_keymap('n', '<c-k>', ':TmuxNavigateUp<cr>', settings)
vim.api.nvim_set_keymap('n', '<c-l>', ':TmuxNavigateRight<cr>', settings)
