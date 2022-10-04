local function set_keymap(...)
	vim.api.nvim_set_keymap(...)
end
local opts = { noremap = true, silent = true }

set_keymap('n', '<c-h>', '<cmd>TmuxNavigateLeft<cr>', opts)
set_keymap('n', '<c-j>', '<cmd>TmuxNavigateDown<cr>', opts)
set_keymap('n', '<c-k>', '<cmd>TmuxNavigateUp<cr>', opts)
set_keymap('n', '<c-l>', '<cmd>TmuxNavigateRight<cr>', opts)
