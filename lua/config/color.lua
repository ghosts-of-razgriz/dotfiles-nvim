local catppuccin = require 'catppuccin'

catppuccin.setup {
	transparent_background = false,
}

vim.g.catppuccin_flavour = 'mocha'

vim.cmd [[colorscheme catppuccin]]
