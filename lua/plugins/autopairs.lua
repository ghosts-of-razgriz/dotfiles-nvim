return {
	'windwp/nvim-autopairs',
	config = function()
		local a = require 'nvim-autopairs'

		a.setup { check_ts = true }
	end,
	event = { 'InsertEnter' },
}
