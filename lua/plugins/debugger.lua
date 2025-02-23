return {
	'mfussenegger/nvim-dap',
	event = 'VeryLazy',
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
		'jbyuki/one-small-step-for-vimkind',
	},
	config = function()
		local dap = require('dap')
		local dapui = require('dapui')

		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		dap.configurations.lua = {
			{
				type = 'nlua',
				request = 'attach',
				name = 'Attach to running Neovim instance',
			},
		}

		dap.adapters.nlua = function(callback, config)
			callback({
				type = 'server',
				host = config.host or '127.0.0.1',
				port = config.port or 8086,
			})
		end
	end,
	init = function()
		local nore = { noremap = true }
		local dap = require('dap')
		local osv = require('osv')

		vim.keymap.set('n', ',b', dap.toggle_breakpoint, nore)
		vim.keymap.set('n', ',c', dap.continue, nore)
		vim.keymap.set('n', ',o', dap.step_over, nore)
		vim.keymap.set('n', ',i', dap.step_into, nore)

		vim.keymap.set('n', ',l', function()
			osv.launch({ port = 8086 })
		end, nore)
	end,
}
