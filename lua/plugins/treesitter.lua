return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		local t = require 'nvim-treesitter.configs'
		local tc = require 'treesitter-context'

		t.setup {
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
			hightlight = { enable = true },
			indent = { enable = false },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		}

		tc.setup()
	end,
	dependencies = {
		-- 'JoosepAlviste/nvim-ts-context-commentstring',
		'nvim-treesitter/nvim-treesitter-context',
	},
}
