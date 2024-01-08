return {
	'catppuccin/nvim',
	name = 'catppuccin',
	config = function()
		local c = require 'catppuccin'

		c.setup { transparent_background = false }

		vim.g.catppuccin_flavour = 'mocha'
		vim.cmd [[colorscheme catppuccin]]
	end,
	priority = 1000,
}
