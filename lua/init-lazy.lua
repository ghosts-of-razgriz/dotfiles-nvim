local lazy_path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
local lazy_repo = 'https://github.com/folke/lazy.nvim.git'

if not vim.loop.fs_stat(lazy_path) then
	local out = vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		lazy_repo,
		'--branch=stable',
		lazy_path,
	}

	print(out)
	print 'Lazy.nvim downloaded, need to restart neovim'
	vim.fn.input 'Press ENTER to quit, and then start neovim'
	vim.cmd 'quit'
end

vim.opt.rtp:prepend(lazy_path)

local lazy = require 'lazy'

local opts = {}

lazy.setup({ spec = 'plugins', change_detection = { notify = false } }, opts)

vim.keymap.set('n', '<space><space>l', '<cmd>Lazy<cr>', { noremap = true })
