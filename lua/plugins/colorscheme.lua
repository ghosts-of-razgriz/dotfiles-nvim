return {
	'folke/tokyonight.nvim',
	priority = 1000,
	config = function()
		local t = require('tokyonight')

		t.setup({
			style = 'night',
			-- TODO: turn transparent on
			transparent = false,
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}
