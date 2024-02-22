vim.g.mapleader = ' '
vim.cmd([[let g:maplocalleader = "\<c-space>"]])

local leader = '<leader>'
local localleader = '<localleader>'
local noresilent = { noremap = true, silent = true }
local mapcmd = function(cmd)
	return '<cmd>' .. cmd .. '<cr>'
end

vim.keymap.set('n', leader .. 'q', mapcmd('quit'), noresilent)
vim.keymap.set('n', leader .. 'w', mapcmd('write'), noresilent)
vim.keymap.set('n', leader .. 'h', mapcmd('set hlsearch!'), noresilent)
vim.keymap.set('n', leader .. '-', mapcmd('wincmd _') .. mapcmd('wincmd |'), noresilent)
vim.keymap.set('n', leader .. leader .. 'f', mapcmd('luafile %'), noresilent)

vim.keymap.set('n', localleader .. 'q', mapcmd('quit!'), noresilent)
vim.keymap.set('n', localleader .. 'a', mapcmd('quitall!'), noresilent)
vim.keymap.set('n', localleader .. '\\', mapcmd('vsplit'), noresilent)
vim.keymap.set('n', localleader .. '-', mapcmd('split'), noresilent)
vim.keymap.set('n', localleader .. '<tab>', mapcmd('tabnew'), noresilent)
vim.keymap.set('n', localleader .. 'h', mapcmd('tabprevious'), noresilent)
vim.keymap.set('n', localleader .. 'l', mapcmd('tabnext'), noresilent)

vim.keymap.set('i', 'jk', '<esc>', noresilent)
