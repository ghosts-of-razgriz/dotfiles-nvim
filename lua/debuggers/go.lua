local dap = require('dap')

dap.adapters.delve = function(callback, config)
	if config.mode == 'remote' and config.request == 'attach' then
		callback({
			type = 'server',
			host = config.host or '127.0.0.1',
			port = config.port or '38697',
		})
	else
		callback({
			type = 'server',
			port = '${port}',
			executable = {
				command = 'dlv',
				args = {
					'dap',
					'-l',
					'127.0.0.1:${port}',
					'--log',
					'--log-output=dap',
				},
				detached = vim.fn.has('win32') == 0,
			},
		})
	end
end

dap.configurations.go = {
	{
		type = 'delve',
		name = 'Debug',
		request = 'launch',
		program = '${file}',
	},
	{
		type = 'delve',
		name = 'Debug Test',
		request = 'launch',
		mode = 'test',
		program = '${workspaceFolder}',
	},
	{
		type = 'delve',
		name = 'Debug (with prompt)',
		request = 'launch',
		program = function()
			local default_path = _G.last_go_entry_point or (vim.fn.getcwd() .. '/')
			local entry_point = vim.fn.input('Path to main.go: ', default_path, 'file')

			-- Save to global variable if user didn't cancel (empty string means cancelled)
			if entry_point ~= '' then
				_G.last_go_entry_point = entry_point
				return entry_point
			else
				-- If user cancelled, return ABORT to cancel the debug session
				return dap.ABORT
			end
		end,
	},
	{
		type = 'delve',
		name = 'Debug (rerun)',
		request = 'launch',
		program = function()
			if _G.last_go_entry_point then
				-- Optional: Show a message about which file is being used
				vim.notify('Debugging: ' .. _G.last_go_entry_point, vim.log.levels.INFO)
				return _G.last_go_entry_point
			else
				vim.notify(
					'No previous entry point saved. Please use "Debug (Choose Entry)" first.',
					vim.log.levels.WARN
				)
				-- Fallback to prompting for input
				local entry_point =
					vim.fn.input('Path to main.go: ', vim.fn.getcwd() .. '/', 'file')
				if entry_point ~= '' then
					_G.last_go_entry_point = entry_point
					return entry_point
				else
					return dap.ABORT
				end
			end
		end,
	},
}
