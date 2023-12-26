return {
	-- color scheme
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false,
		config = function()
			require 'config.color'
		end,
	},

	-- language server
	{
		'neovim/nvim-lspconfig',
		name = 'lspconfig',
		lazy = false,
		config = function()
			require 'config.lsp'
		end,
		dependencies = {
			'stevearc/conform.nvim',
		},
	},

	-- syntax
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		config = function()
			require 'config.treesitter'
		end,
	},

	-- autopair
	{
		'windwp/nvim-autopairs',
		config = function()
			require 'config.autopairs'
		end,
		event = { 'InsertEnter' },
	},

	-- general
	{
		'neovim/traverse.nvim',
		config = function()
			require 'config.traverse'
		end,
		keys = { '<c-h>', '<c-j>', '<c-k>', '<c-l>' },
		url = 'https://gitlab.razgriz.io/neovim/traverse.nvim',
	},
}
