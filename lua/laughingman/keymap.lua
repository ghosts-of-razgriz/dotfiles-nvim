vim.g.mapleader = ' '
vim.cmd([[let g:maplocalleader = "\<c-space>"]])

local leader = '<leader>'
local localleader = '<localleader>'
local opts = { silent = true, noremap = true }

vim.keymap.set('n', leader .. 'q', '<cmd>quit<cr>', opts)
vim.keymap.set('n', leader .. 'w', '<cmd>write<cr>', opts)
vim.keymap.set('n', leader .. 'h', '<cmd>set hlsearch!<cr>', opts)
vim.keymap.set('n', leader .. '-', '<cmd>wincmd _<cr>' .. '<cmd>wincmd |<cr>', opts)
vim.keymap.set('n', leader .. '=', '<cmd>wincmd =<cr>', opts)
vim.keymap.set('n', leader .. leader .. 'f', '<cmd>luafile %<cr>', opts)

vim.keymap.set('n', localleader .. 'q', '<cmd>quit!<cr>', opts)
vim.keymap.set('n', localleader .. 'a', '<cmd>quitall!<cr>', opts)
vim.keymap.set('n', localleader .. 'w', '<cmd>edit!<cr>', opts)
vim.keymap.set('n', localleader .. '\\', '<cmd>vsplit<cr>', opts)
vim.keymap.set('n', localleader .. '-', '<cmd>split<cr>', opts)
vim.keymap.set('n', localleader .. '<tab>', '<cmd>tabnew<cr>', opts)
vim.keymap.set('n', localleader .. 'h', '<cmd>tabprevious<cr>', opts)
vim.keymap.set('n', localleader .. 'l', '<cmd>tabnext<cr>', opts)

vim.keymap.set('i', 'jk', '<esc>', opts)

vim.keymap.set('i', '<Left>', '<Nop>', opts)
vim.keymap.set('i', '<Right>', '<Nop>', opts)
vim.keymap.set('i', '<Up>', '<Nop>', opts)
vim.keymap.set('i', '<Down>', '<Nop>', opts)
vim.keymap.set('i', '<S-Left>', '<Nop>', opts)
vim.keymap.set('i', '<S-Right>', '<Nop>', opts)
vim.keymap.set('i', '<S-Up>', '<Nop>', opts)
vim.keymap.set('i', '<S-Down>', '<Nop>', opts)

vim.keymap.set('n', '<c-h>', '<c-w>h', opts)
vim.keymap.set('n', '<c-j>', '<c-w>j', opts)
vim.keymap.set('n', '<c-k>', '<c-w>k', opts)
vim.keymap.set('n', '<c-l>', '<c-w>l', opts)
