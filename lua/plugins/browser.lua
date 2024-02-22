return {
	'glacambre/firenvim',

	cond = not not vim.g.started_by_firenvim,
	module = false,
	build = function()
		require('lazy').load({ plugins = 'firenvim', wait = true })

		vim.fn['firenvim#install'](0)
	end,
	config = function()
		vim.g.firenvim_config = {
			localSettings = {
				['.*'] = { takeover = 'never' },
			},
		}

		local t = require('tokyonight')

		t.setup({
			style = 'day',
			transparent = false,
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}
