return {
	{
		'rebelot/kanagawa.nvim',
		priority = 1001,
		config = function()
			require('kanagawa').setup({
				theme = 'lotus',
			})
		end,
	},
	{
		'folke/tokyonight.nvim',
		priority = 1002,
		config = function()
			require('tokyonight').setup({
				style = 'storm',
			})
			vim.cmd.colorscheme([[tokyonight]])
		end,
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1003,
		config = function()
			require('catppuccin').setup({
				flavour = 'macchiato',
				integrations = {
					notify = true,
				},
				styles = {
					keywords = { 'italic' },
				},
			})
		end,
	},
}
