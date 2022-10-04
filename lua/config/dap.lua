require 'dap'
require('dap-go').setup()

local signs = { Breakpoint = '🔴' }

for type, icon in pairs(signs) do
	local hl = 'Dap' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = '', linehl = '', numhl = '' })
end

local wk = require 'which-key'
wk.register {
	['§'] = {
		name = 'DAP',
		['§'] = { '<cmd>lua require("dapui").toggle()<cr>', 'Toggle DAP UI' },
		['?'] = { '<cmd>WhichKey §<cr>', 'Show DAP Keys' },
		b = { '<cmd>lua require("dap").toggle_breakpoint()<cr>', 'Toggle Breakpoint' },
		B = {
			'<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>',
			'Add Conditional Breakpoint',
		},
		v = {
			'<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>',
			'Add Breakpoint with Message',
		},
		R = { '<cmd>lua require("dap").repl_open()<cr>', 'Open REPL' },
		l = { '<cmd>lua require("dap").run_last()<cr>', 'Run Last' },
		c = { '<cmd>lua require("dap").continue()<cr>', 'Continue' },
		C = { '<cmd>lua require("dap").reverse_continue()<cr>', 'Reverse Continue' },
		i = { '<cmd>lua require("dap").step_into()<cr>', 'Step In' },
		o = { '<cmd>lua require("dap").step_out()<cr>', 'Step Out' },
		u = { '<cmd>lua require("dap").step_over()<cr>', 'Step Over / Next' },
		n = { '<cmd>lua require("dap").step_over()<cr>', 'Step Over / Next' },
		h = { '<cmd>lua require("dap").step_back()<cr>', 'Step Back' },
		j = { '<cmd>lua require("dap").down()<cr>', 'Down' },
		k = { '<cmd>lua require("dap").up()<cr>', 'Up' },
		g = { '<cmd>lua require("dap").goto_(vim.fn.input("Line #: "))<cr>', 'Go to Line' },
		r = { '<cmd>lua require("dap").run_to_cursor()<cr>', 'Run to Cursor' },
		x = {
			'<cmd>lua require("dap").terminate(); print("Dubugger Terminated")<cr>',
			'Terminate',
		},
	},
}
