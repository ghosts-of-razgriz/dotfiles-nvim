return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false,
		config = function()
			require 'config.color'
		end,
	},
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
}
