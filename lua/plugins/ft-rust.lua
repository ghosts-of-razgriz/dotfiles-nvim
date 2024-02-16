return {
	'saecki/crates.nvim',
	ft = { 'rust', 'toml' },
	config = function()
		local c = require 'crates'

		c.setup()
	end,
}
