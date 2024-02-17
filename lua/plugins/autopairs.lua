-- return {
-- 	'windwp/nvim-autopairs',
-- 	config = function()
-- 		local a = require 'nvim-autopairs'

-- 		a.setup { check_ts = true }
-- 	end,
-- 	event = { 'InsertEnter' },
-- }

return {
	'echasnovski/mini.pairs',
	config = function()
		local p = require('mini.pairs')

		p.setup()
	end,
	event = { 'InsertEnter' },
}
