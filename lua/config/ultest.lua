vim.g.ultest_ues_pty = 1

local wk = require 'which-key'

wk.register({
	t = {
		name = 'Ultest',
		t = { '<cmd>Ultest<cr>', 'Test' },
		l = { '<cmd>UltestLast<cr>', 'Test Last' },
		n = { '<cmd>UltestNearest<cr>', 'Test Nearest' },
		a = { '<cmd>UltestAttach<cr>', 'Attach' },
		o = { '<cmd>UltestOutput<cr>', 'Output' },
		s = { '<cmd>UltestSummary<cr>', 'Summary' },
		c = { '<cmd>UltestClear<cr>', 'Clear' },
		x = { '<cmd>UltestStop<cr>', 'Stop' },
	},
}, { prefix = '<leader>' })

wk.register({
	t = {
		name = 'Ultest',
		s = { '<cmd>UltestSummary!<cr>', 'Summary!' },
		x = { '<cmd>UltestStopNearest<cr>', 'Stop Nearest' },
	},
}, { prefix = '<localleader>' })
