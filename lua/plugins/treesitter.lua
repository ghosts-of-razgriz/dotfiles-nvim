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
				'go',
				'gomod',
				'html',
				'javascript',
				'json',
				'lua',
				'markdown',
				'markdown_inline',
				'scss',
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
