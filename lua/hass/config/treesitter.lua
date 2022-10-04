require('nvim-treesitter.configs').setup {
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
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gji',
			node_incremental = 'gjj',
			scope_incremental = 'gjg',
			node_decremental = 'gjk',
		},
	},
}
