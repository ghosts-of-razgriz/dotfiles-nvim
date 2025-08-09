return {
	'igorlfs/nvim-dap-view',
	dependencies = {
		'nvim-neotest/nvim-nio',
		{
			'mfussenegger/nvim-dap',
			config = function()
				require('debuggers')

				vim.fn.sign_define(
					'DapBreakpoint',
					{ text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' }
				)
				vim.fn.sign_define(
					'DapBreakpointCondition',
					{ text = '', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' }
				)
				vim.fn.sign_define(
					'DapStopped',
					{ text = '', texthl = 'DapStopped', linehl = '', numhl = '' }
				)
			end,
		},
	},
	opts = {
		winbar = {
			sections = {
				'watches',
				'scopes',
				'exceptions',
				'breakpoints',
				'threads',
				'repl',
				'console',
			},
			controls = {
				enabled = true,
				position = 'left',
				buttons = {
					'play',
					'step_into',
					'step_over',
					'step_out',
					'run_last',
					'terminate',
					'disconnect',
				},
			},
		},
	},
	keys = {
		{ ',1', '<cmd>DapContinue<cr>' },
		{ ',2', '<cmd>DapStepIn<cr>' },
		{ ',3', '<cmd>DapStepOver<cr>' },
		{ ',4', '<cmd>DapStepOut<cr>' },
		{ ',5', '<cmd>DapRestartFrame<cr>' },
		{ ',6', '<cmd>DapTerminate<cr>' },
		{ ',7', '<cmd>DapDisconnect<cr>' },

		{ ',b', '<cmd>DapToggleBreakpoint<cr>' },
		{ ',,', '<cmd>DapViewToggle<cr>' },
	},
}
