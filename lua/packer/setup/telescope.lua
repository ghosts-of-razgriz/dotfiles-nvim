local settings = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>u<space>', ':Telescope ',
	{ noremap = true })
vim.api
	.nvim_set_keymap('n', '<leader>uu', ':Telescope find_files<cr>', settings)
vim.api.nvim_set_keymap('n', '<localleader>uu', ':Telescope<cr>', settings)
vim.api.nvim_set_keymap('n', '<leader>ub', ':Telescope buffers<cr>', settings)
vim.api.nvim_set_keymap('n', '<leader>ub', ':Telescope buffers<cr>', settings)
vim.api.nvim_set_keymap('n', '<leader>ug', ':Telescope live_grep<cr>', settings)
vim.api.nvim_set_keymap('n', '<leader>uc', ':Telescope commands<cr>', settings)
vim.api.nvim_set_keymap('n', '<leader>uk', ':Telescope keymaps<cr>', settings)
vim.api.nvim_set_keymap('n', '<leader>uo',
	':Telescope lsp_document_symbols<cr>', settings)
vim.api.nvim_set_keymap('n', '<localleader>uo',
	':Telescope lsp_workspace_symbols<cr>', settings)

vim.api.nvim_set_keymap('n', 'ge', ':Telescope lsp_document_diagnostics<cr>',
	settings)
vim.api.nvim_set_keymap('n', 'gE', ':Telescope lsp_workspace_diagnostics<cr>',
	settings)
vim.api.nvim_set_keymap('n', 'gd', ':Telescope lsp_definitions<cr>', settings)
vim.api.nvim_set_keymap('n', 'gi', ':Telescope lsp_implementations<cr>',
	settings)
vim.api.nvim_set_keymap('n', 'gk', ':Telescope lsp_references<cr>', settings)

vim.api.nvim_set_keymap('n', 'gK', ':Telescope grep_string<cr>', settings)
