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

utils.set_keymaps({
	['<m-t>'] = {
		t = { '<cmd>TroubleToggle<cr>', 'Toggle Trouble' },
		['<m-t>'] = { '<cmd>TroubleToggle<cr>', 'Toggle Trouble' },
		q = { '<cmd>TroubleToggle quickfix<cr>', 'Toggle Trouble QuickFix' },
	},
}, {})

