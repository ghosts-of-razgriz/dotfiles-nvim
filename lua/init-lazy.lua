local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
local lazyrepo = 'https://github.com/folke/lazy.nvim.git'

if not vim.loop.fs_stat(lazypath) then
	local out = vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		lazyrepo,
		'--branch=stable',
		lazypath,
	}

	print(out)
	print 'Lazy.nvim downloaded, need to restart neovim'
	vim.fn.input 'Press ENTER to quit, and then start neovim'
	vim.cmd 'quit'
end

vim.opt.rtp:prepend(lazypath)

local lazy = require 'lazy'

local plugins = require 'plugins'
local opts = { defaults = { lazy = true } }

lazy.setup(plugins, opts)

vim.keymap.set('n', '<localleader>l', '<cmd>Lazy<cr>', { noremap = true })
