return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	config = function()
		local t = require 'nvim-treesitter.configs'

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
				'lua',
				'make',
				'markdown',
				'markdown_inline',
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
	end,
}
