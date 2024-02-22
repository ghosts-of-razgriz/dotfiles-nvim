return {
	'folke/tokyonight.nvim',
	priority = 1000,
	config = function()
		local t = require('tokyonight')

		t.setup({
			style = 'night',
			transparent = false,
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}
