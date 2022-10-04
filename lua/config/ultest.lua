vim.g.ultest_attach_width = 180
vim.g.ultest_virtual_text = 0
vim.g.ultest_output_cols = 120
vim.g.ultest_max_threads = 4
vim.g.ultest_use_pty = 1
vim.g.ultest_pass_sign = ' '
vim.g.ultest_fail_sign = ' '
vim.g.ultest_running_sign = ' '
vim.g.ultest_output_on_run = 0
vim.g.ultest_output_on_line = 1

vim.g['test#go#gotest#options'] = '-v'

local utils = require 'utils'

utils.set_keymaps({
	t = {
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

utils.set_keymaps({
	t = {
		s = { '<cmd>UltestSummary!<cr>', 'Summary!' },
		x = { '<cmd>UltestStopNearest<cr>', 'Stop Nearest' },
	},
}, { prefix = '<localleader>' })
