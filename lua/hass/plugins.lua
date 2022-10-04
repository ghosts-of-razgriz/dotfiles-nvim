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
end)
