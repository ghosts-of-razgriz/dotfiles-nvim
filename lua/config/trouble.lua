local utils = require 'utils'

local trouble = require 'trouble'

trouble.setup {
	position = 'bottom',
	height = 8,
	-- action_keys
	auto_open = false,
	auto_close = false,
	use_daignostic_signs = true,
}

utils.set_keymap('n', '<m-t>t', '<cmd>TroubleToggle<cr>', utils.noresilent)
utils.set_keymap('n', '<m-t><m-t>', '<cmd>TroubleToggle<cr>', utils.noresilent)
utils.set_keymap('n', '<m-t>q', '<cmd>TroubleToggle quickfix<cr>', utils.noresilent)
