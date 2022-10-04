local function set_keymap(...)
	vim.api.nvim_set_keymap(...)
end
local opts = { noremap = true }

set_keymap('n', '<leader>gv', ':GV<cr>', opts)
