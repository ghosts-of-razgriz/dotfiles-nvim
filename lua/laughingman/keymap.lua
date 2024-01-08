vim.g.mapleader = ' '
vim.cmd [[let g:maplocalleader = "\<c-space>"]]

local leader = '<leader>'
local localleader = '<localleader>'

local noresilent = { noremap = true, silent = true }

vim.keymap.set('n', leader .. 'q', '<cmd>quit<cr>', noresilent) -- quit
vim.keymap.set('n', leader .. 'w', '<cmd>write<cr>', noresilent) -- write
vim.keymap.set('n', leader .. 'h', '<cmd>set hlsearch!<cr>', noresilent) -- toggle search highlight
vim.keymap.set('n', leader .. '-', '<cmd>wincmd _<cr><cmd>wincmd |<cr>', noresilent) -- zoom in
vim.keymap.set('n', leader .. '=', '<cmd>wincmd =<cr>', noresilent) -- zoom out
vim.keymap.set('n', leader .. leader .. 'f', '<cmd>luafile %<cr>', noresilent) -- reload current luafile

vim.keymap.set('n', localleader .. 'q', '<cmd>quit!<cr>', noresilent) -- force quit
vim.keymap.set('n', localleader .. 'a', '<cmd>quitall!<cr>', noresilent) -- force quit all
vim.keymap.set('n', localleader .. '\\', '<cmd>vsplit<cr>', noresilent) -- vertical split
vim.keymap.set('n', localleader .. '-', '<cmd>split<cr>', noresilent) -- horizontal split
vim.keymap.set('n', localleader .. '<tab>', '<cmd>tabnew<cr>', noresilent) -- new tab
vim.keymap.set('n', localleader .. 'h', '<cmd>tabprevious<cr>', noresilent) -- new tab
vim.keymap.set('n', localleader .. 'l', '<cmd>tabnext<cr>', noresilent) -- new tab

vim.keymap.set('i', 'jk', '<esc>', noresilent) -- exit insert mode

vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', 'K', ":m '>-2<cr>gv=gv")
