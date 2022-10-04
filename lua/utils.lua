local M = {}

M.nore = { noremap = true }
M.noresilent = { noremap = true, silent = true }

function M.run(...)
	local cmd = string.format('!%s', ...)
	vim.api.nvim_command(cmd)
end

return M
