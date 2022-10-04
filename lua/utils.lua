local M = {}

M.nore = { noremap = true }
M.noresilent = { noremap = true, silent = true }

function M.set_keymap(...)
	vim.api.nvim_set_keymap(...)
end

return M
