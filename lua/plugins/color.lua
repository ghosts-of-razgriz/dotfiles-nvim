return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1003,
		opts = {
			flavour = 'mocha',
			integrations = {
				notify = true,
				blink_cmp = { style = 'bordered' },
			},
			styles = {
				keywords = { 'italic' },
			},
		},
		config = function()
			vim.cmd.colorscheme([[catppuccin]])
		end,
	},
	{
		'folke/tokyonight.nvim',
		priority = 1000,
		-- init = function()
		-- 	vim.cmd.colorscheme([[tokyonight]])
		-- end,
		opts = {
			style = 'moon',
		},
	},
	{
		'scottmckendry/cyberdream.nvim',
		priority = 1000,
		-- init = function()
		-- 	vim.cmd.colorscheme([[cyberdream]])
		-- end,
		opts = {
			variant = 'dark',
			italic_comments = true,
			transparent = false,
		},
	},
}
