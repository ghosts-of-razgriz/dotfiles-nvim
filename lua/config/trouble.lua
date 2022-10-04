local wk = require 'which-key'

local trouble = require 'trouble'

trouble.setup {
	position = 'bottom',
	height = 8,
	-- action_keys
	auto_open = false,
	auto_close = false,
	use_daignostic_signs = true,
}

wk.register {
	['<m-t>'] = {
		name = 'Trouble',
		t = { '<cmd>TroubleToggle<cr>', 'Toggle Trouble' },
		['<m-t>'] = { '<cmd>TroubleToggle<cr>', 'Toggle Trouble' },
		q = { '<cmd>TroubleToggle quickfix<cr>', 'Toggle Trouble QuickFix' },
	},
}
