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

local dap_init = function() end

return {
	'rcarriga/nvim-dap-ui',
	event = 'VeryLazy',
	init = dap_init,
	dependencies = {
		'mfussenegger/nvim-dap',
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
