return {
	'echasnovski/mini.splitjoin',
	config = function()
		local s = require 'mini.splitjoin'

		s.setup {
			mappings = {
				toggle = 'gs',
			},
		}
	end,
	keys = 'gs',
}
