local function set_keymap(...)
	vim.api.nvim_set_keymap(...)
end
local opts = { noremap = true, silent = true }

set_keymap('n', '<c-h>', ':TmuxNavigateLeft<cr>', opts)
set_keymap('n', '<c-j>', ':TmuxNavigateDown<cr>', opts)
set_keymap('n', '<c-k>', ':TmuxNavigateUp<cr>', opts)
set_keymap('n', '<c-l>', ':TmuxNavigateRight<cr>', opts)
