local t = require 'nvim-treesitter.configs'

t.setup {
	autopairs = { enable = true },
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
