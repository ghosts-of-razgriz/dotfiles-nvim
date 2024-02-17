local data_path = tostring(vim.fn.stdpath('data'))

local install_debugpy = function()
	vim.system({ 'rm', '-rf', data_path .. '/debugpy' }):wait()
	vim.system({ 'python', '-m', 'venv', 'debugpy' }, { cwd = data_path, text = true }):wait()
	vim.system(
		{ 'debugpy/bin/python', '-m', 'pip', 'install', 'debugpy' },
		{ cwd = data_path, text = true }
	)
		:wait()
end

local dap_init = function()
	local dapui = require('dapui')
	local leader = '<leader>'
	local nore = { noremap = true }

	vim.keymap.set('n', leader .. 'db', '<cmd>DapToggleBreakpoint<cr>', nore) -- Telescope <prompt>
	vim.keymap.set('n', leader .. 'dd', function()
		dapui.toggle()
	end, nore) -- Telescope <prompt>
end

local dap_config = function()
	local dap = require('dap')
	local dapui = require('dapui')

	dapui.setup()
	dap.listeners.after.event_initialized['dapui_config'] = function()
		dapui.open()
	end
	dap.listeners.after.event_terminated['dapui_config'] = function()
		dapui.close()
	end
	dap.listeners.after.event_exited['dapui_config'] = function()
		dapui.close()
	end
end

return {
	'rcarriga/nvim-dap-ui',
	event = 'VeryLazy',
	init = dap_init,
	config = dap_config,
	dependencies = {
		'mfussenegger/nvim-dap',
		{
			'folke/neodev.nvim',
			config = function()
				local n = require('neodev')

				n.setup({
					library = { plugins = { 'nvim-dap-ui' }, types = true },
				})
			end,
		},
		{
			'mfussenegger/nvim-dap-python',
			build = install_debugpy,
			config = function()
				local dapp = require('dap-python')

				dapp.setup(data_path .. '/debugpy/bin/python')
			end,
		},
	},
}
