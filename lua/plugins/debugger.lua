local data_path = tostring(vim.fn.stdpath 'data')

local function install_debugpy()
	vim.system({ 'rm', '-rf', data_path .. '/debugpy' }):wait()
	vim.system({ 'python', '-m', 'venv', 'debugpy' }, { cwd = data_path, text = true }):wait()
	vim.system(
		{ 'debugpy/bin/python', '-m', 'pip', 'install', 'debugpy' },
		{ cwd = data_path, text = true }
	)
		:wait()
end

return {
	'rcarriga/nvim-dap-ui',
	event = 'VeryLazy',
	dependencies = {
		'mfussenegger/nvim-dap',
		{
			'mfussenegger/nvim-dap-python',
			build = install_debugpy,
			config = function()
				local dapp = require 'dap-python'

				dapp.setup(data_path .. '/debugpy/bin/python')
			end,
		},
	},
}
