local M = {}

M.nore = { noremap = true }
M.noresilent = { noremap = true, silent = true }

function M.run(...)
	local cmd = string.format('!%s', ...)
	vim.api.nvim_command(cmd)
end

function M.set_keymaps(mappings, options)
	local opts = options
	opts['noremap'] = opts['noremap'] or true

	local mode = opts['mode'] or 'n'
	local prefix = options['prefix'] or ''

	opts['silent'] = options['silent'] or true

	for k, cmd in pairs(mappings) do
		if cmd[1] == nil then
			opts['prefix'] = prefix .. k
			M.set_keymaps(cmd, options)
		else
			opts['prefix'] = nil
			opts['mode'] = nil

			opts['expr'] = cmd['expr']

			if opts['buffer'] ~= nil then
				local buffer = opts['buffer']
				opts['buffer'] = nil

				vim.api.nvim_buf_set_keymap(buffer, mode, prefix .. k, cmd[1], opts)
				-- DEBUG
				if cmd['debug'] then
					print(
						'BUFFER: ',
						buffer,
						'MODE: ',
						mode,
						'LHS: ',
						prefix .. k,
						'RHS: ',
						cmd[1],
						'OPTS: ',
						vim.inspect(opts)
					)
				end
			else
				vim.api.nvim_set_keymap(mode, prefix .. k, cmd[1], opts)
				-- DEBUG
				if cmd['debug'] then
					print(
						'MODE: ',
						mode,
						'LHS: ',
						prefix .. k,
						'RHS: ',
						cmd[1],
						'OPTS: ',
						vim.inspect(opts)
					)
				end
			end
		end
	end
end

return M
