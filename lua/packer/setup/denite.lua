local settings = {  noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>uu', ':Denite file/rec<cr>', settings)
vim.api.nvim_set_keymap('n', '<localleader>uu', ':Denite directory_rec<cr>', settings)
vim.api.nvim_set_keymap('n', '<leader>ub', ':Denite buffer<cr>', settings)
vim.api.nvim_set_keymap('n', '<leader>ur', ':Denite -resume<cr>', settings)
vim.api.nvim_set_keymap('n', '<leader>uh', ':Denite help<cr>', settings)
