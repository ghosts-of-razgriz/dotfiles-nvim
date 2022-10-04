-- keymaps ----------------------------------------------------------------------------------------
local function set_keymap(...)
	vim.api.nvim_set_keymap(...)
end
local nore = { noremap = true }
local noresilent = { noremap = true, silent = true }

-- jk to esc
set_keymap('i', 'jk', '<esc>', nore)

-- quit
set_keymap('n', '<leader>q', '<cmd>quit<cr>', noresilent)
set_keymap('n', '<localleader>q', '<cmd>quit!<cr>', noresilent)

-- write
set_keymap('n', '<leader>w', '<cmd>write<cr>', nore)

-- split panes
set_keymap('n', '<localleader>\\', '<cmd>vsplit<cr>', noresilent)
set_keymap('n', '<localleader>-', '<cmd>split<cr>', noresilent)

-- tabs
set_keymap('n', '<localleader><tab>', '<cmd>tabnew<cr>', noresilent)
set_keymap('n', '<localleader>h', '<cmd>tabprevious<cr>', noresilent)
set_keymap('n', '<localleader>l', '<cmd>tabnext<cr>', noresilent)

-- search highlight
set_keymap('n', '<leader>h', '<cmd>set hlsearch!<cr>', noresilent)

-- zoom
set_keymap('n', '<leader>-', '<cmd>wincmd _<cr><cmd>wincmd |<cr>', noresilent)
set_keymap('n', '<leader>=', '<cmd>wincmd =<cr>', noresilent)
