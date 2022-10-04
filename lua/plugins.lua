local packer = require 'packer'

packer.startup(function(use)
	-- packer manage itself
	use { 'wbthomason/packer.nvim' }

	-- color schemes
	use { 'folke/tokyonight.nvim', config = 'require "config.color"' }

	-- language server protocol
	use {
		'neovim/nvim-lspconfig',
		config = 'require "config.lsp"',
		requires = { 'folke/lsp-colors.nvim' },
	}
end)
