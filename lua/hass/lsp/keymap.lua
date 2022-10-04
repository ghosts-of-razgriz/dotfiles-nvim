local keymap = function(_, bufnr)
	local set_keymap = function(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local set_option = function(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap = true, silent = true }

	-- set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	set_keymap('n', '<c-p>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
	set_keymap('n', '<c-n>', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
	set_keymap('n', 'gwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
	set_keymap('n', 'gwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
	set_keymap(
		'n',
		'gwl',
		'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
		opts
	)
end

return keymap
