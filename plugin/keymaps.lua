-- keymaps ----------------------------------------------------------------------------------------
local function set_keymap(...)
	vim.api.nvim_set_keymap(...)
end
local nore = { noremap = true }
local noresilent = { noremap = true, silent = true }

-- jk to esc
set_keymap('i', 'jk', '<esc>', nore)

-- quit
set_keymap('n', '<leader>q', ':quit<cr>', noresilent)
set_keymap('n', '<localleader>q', ':quit!<cr>', noresilent)

-- write
set_keymap('n', '<leader>w', ':write<cr>', nore)

-- split panes
set_keymap('n', '<localleader>\\', ':vsplit<cr>', noresilent)
set_keymap('n', '<localleader>-', ':split<cr>', noresilent)

-- tabs
set_keymap('n', '<localleader><tab>', ':tabnew<cr>', noresilent)
set_keymap('n', '<localleader>h', ':tabprevious<cr>', noresilent)
set_keymap('n', '<localleader>l', ':tabnext<cr>', noresilent)

-- search highlight
set_keymap('n', '<leader>h', ':set hlsearch!<cr>', noresilent)
