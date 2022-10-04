local opts = {  noremap = true }

vim.api.nvim_set_keymap('n', '<leader>tt', ':TestLast<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>tf', ':TestFile<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>tn', ':TestNearest<cr>', opts)
vim.api.nvim_set_keymap('n', '<leader>ta', ':TestSuite<cr>', opts)
