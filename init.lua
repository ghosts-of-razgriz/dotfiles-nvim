require 'laughingman'

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
	dev = {
		path = vim.loop.os_homedir() .. '/code/neovim-plugins',
		fallback = false,
	},
}, opts)

vim.keymap.set('n', '<space><space>l', '<cmd>Lazy<cr>', { silent = true, noremap = true })
