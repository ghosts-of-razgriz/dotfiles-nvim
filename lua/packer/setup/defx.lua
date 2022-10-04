local settings = {  noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>e', ':Defx -buffer-name=defx -show-ignored-files<cr>', settings)
vim.api.nvim_set_keymap('n', '<localleader>e', ":Defx -buffer-name=defx -show-ignored-files `expand('%:p:h')`<cr>", settings)
