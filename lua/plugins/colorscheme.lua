-- return {
-- 	'catppuccin/nvim',
-- 	name = 'catppuccin',
-- 	config = function()
-- 		local c = require 'catppuccin'

-- 		c.setup { transparent_background = false }

-- 		vim.g.catppuccin_flavour = 'mocha'
-- 		vim.cmd [[colorscheme catppuccin]]
-- 	end,
-- 	priority = 1000,
-- }

return {
	'folke/tokyonight.nvim',
	priority = 1000,
	opts = {},
	config = function()
		local t = require 'tokyonight'

		t.setup {
			style = 'moon',
			transparent = true,
		}
		vim.cmd [[colorscheme tokyonight]]
	end,
}
