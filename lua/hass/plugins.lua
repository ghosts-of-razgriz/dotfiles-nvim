local packer = require 'packer'

packer.startup(function(use)
	-- packer manage itself
	use { 'wbthomason/packer.nvim', opt = true }

	-- color schemes
	use { 'folke/tokyonight.nvim', config = "require 'hass.config.tokyonight'" }

	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
		config = "require 'hass.config.telescope'",
		setup = "require 'hass.setup.telescope'",
	}

	-- language server protocol
	use {
		'neovim/nvim-lspconfig',
		config = "require 'hass.config.lsp'",
		requires = { 'folke/lsp-colors.nvim' },
	}

	-- autocomplete
	use {
		'hrsh7th/nvim-compe',
		config = "require 'hass.config.compe'",
		setup = "require 'hass.setup.compe'",
	}

	-- syntax detection
	use { 'nvim-treesitter/nvim-treesitter', config = "require 'hass.config.treesitter'" }
end)
