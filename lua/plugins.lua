local packer = require('packer')

packer.startup(function(use)
	-- packer manage itself
	use { 'wbthomason/packer.nvim', opt = true }

	-- color schemes
	use { 'folke/tokyonight.nvim', config = "require 'packer.config.tokyonight'" }

	-- file explorer
	use {
		'Shougo/defx.nvim',
		cmd = 'Defx',
		config = "require 'packer.config.defx'",
		setup = "require 'packer.setup.defx'",
		requires = {
			'kristijanhusak/defx-git', 
			{
				'kristijanhusak/defx-icons',
				config = "require 'packer.config.defx-icons'",
			},
		}
	}
end)
