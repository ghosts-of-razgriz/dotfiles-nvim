require('trouble').setup {
	height = 8,
	auto_open = false,
	auto_close = true,
	use_lsp_diagnostic_signs = true,
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', 'gt', '<cmd>TroubleToggle<cr>', opts)
vim.api.nvim_set_keymap('n', 'ge', '<cmd>Trouble lsp_document_diagnostics<cr>', opts)
vim.api.nvim_set_keymap('n', 'gE', '<cmd>Trouble lsp_workspace_diagnostics<cr>', opts)
