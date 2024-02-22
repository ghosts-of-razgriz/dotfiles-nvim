return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		local t = require('nvim-treesitter.configs')
		local tc = require('treesitter-context')

		t.setup({
			autopairs = { enable = true },
			ensure_installed = {
				'bibtex',
				'css',
				'dockerfile',
				'fish',
				'git_config',
				'git_rebase',
				'go',
				'gomod',
				'gosum',
				'html',
				'javascript',
				'json',
				'kdl',
				'lua',
				'make',
				'markdown',
				'markdown_inline',
				'python',
				'scss',
				'sql',
				'terraform',
				'toml',
				'typescript',
				'vimdoc',
				'yaml',
			},
			auto_install = true,
			hightlight = { enable = true },
			indent = { enable = false },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<M-t><M-t>',
					node_incremental = '<M-t><M-t>',
					scope_incremental = '<M-t><M-s>',
					node_decremental = '<M-t><M-d>',
				},
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})

		tc.setup()

		vim.o.foldmethod = 'expr'
		vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
	end,
	dependencies = {
		'nvim-treesitter/nvim-treesitter-context',
	},
}
