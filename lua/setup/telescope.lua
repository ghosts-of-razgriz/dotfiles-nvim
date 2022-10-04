local wk = require 'which-key'

wk.register({
	u = {
		name = 'Telescope',
		['<space>'] = { ':Telescope ', 'Telescope <prompt>' },
		u = { '<cmd>Telescope find_files<cr>', 'Find Files' },
		t = { '<cmd>Telescope<cr>', 'Telescope' },
		b = { '<cmd>Telescope buffers<cr>', 'Buffers' },
		g = { '<cmd>Telescope live_grep<cr>', 'Live Grep' },
		c = { '<cmd>Telescope commands<cr>', 'Commands' },
		k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
		r = { '<cmd>Telescope resume<cr>', 'Resume' },
	},
}, { prefix = '<leader>' })

wk.register({
	u = {
		name = 'Telescope',
		u = { '<cmd>Telescope git_files<cr>', 'Find Git Files' },
	},
}, { prefix = '<localleader>' })
