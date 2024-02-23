vim.g.mapleader = ' '
vim.cmd([[let g:maplocalleader = "\<c-space>"]])

local leader = '<leader>'
local localleader = '<localleader>'
local opts = { silent = true, noremap = true }

vim.keymap.set('n', leader .. 'q', '<cmd>quit<cr>', opts)
vim.keymap.set('n', leader .. 'w', '<cmd>write<cr>', opts)
vim.keymap.set('n', leader .. 'h', '<cmd>set hlsearch!<cr>', opts)
vim.keymap.set('n', leader .. '-', '<cmd>wincmd _<cr>' .. '<cmd>wincmd |<cr>', opts)
vim.keymap.set('n', leader .. leader .. 'f', '<cmd>luafile %<cr>', opts)

vim.keymap.set('n', localleader .. 'q', '<cmd>quit!<cr>', opts)
vim.keymap.set('n', localleader .. 'a', '<cmd>quitall!<cr>', opts)
vim.keymap.set('n', localleader .. '\\', '<cmd>vsplit<cr>', opts)
vim.keymap.set('n', localleader .. '-', '<cmd>split<cr>', opts)
vim.keymap.set('n', localleader .. '<tab>', '<cmd>tabnew<cr>', opts)
vim.keymap.set('n', localleader .. 'h', '<cmd>tabprevious<cr>', opts)
vim.keymap.set('n', localleader .. 'l', '<cmd>tabnext<cr>', opts)

vim.keymap.set('i', 'jk', '<esc>', opts)
