require('laughingman')

local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazy_path) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--single-branch',
		'https://github.com/folke/lazy.nvim.git',
		lazy_path,
	})
end
vim.opt.rtp:prepend(lazy_path)

local opts = {}

require('lazy').setup({
	spec = 'plugins',
	change_detection = { notify = false },
}, opts)

local u = require('laughingman.utils')

u.nmap({ '<space><space>l', u.mapcmd('Lazy'), false })
