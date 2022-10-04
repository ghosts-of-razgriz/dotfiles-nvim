local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
	ensure_installed = {
		'css',
		'dockerfile',
		'fish',
		'go',
		'gomod',
		'html',
		'javascript',
		'json',
		'lua',
		'scss',
		'toml',
		'typescript',
		'yaml',
	},
	hightlight = { enable = true },
	indent = { enable = false },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
}
