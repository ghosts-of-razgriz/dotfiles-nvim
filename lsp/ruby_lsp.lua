return {
	cmd = { 'ruby_lsp' },
	filetypes = { 'rb', 'erb' },
	root_markers = { { '.luarc.json', 'luarc.jsonc' }, '.git' },
	init_options = {
		addonSettings = {
			['Ruby LSP Rails'] = {
				enablePendingMigrationsPrompt = false,
			},
		},
	},
}
