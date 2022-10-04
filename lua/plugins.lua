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

	use {
		'hrsh7th/nvim-cmp',
		config = 'require "config.cmp"',
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-nvim-lsp',
			'onsails/lspkind-nvim',
			'L3MON4D3/LuaSnip',
		},
	}

	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
		},
		config = 'require "config.telescope"',
		setup = 'require "setup.telescope"',
	}

	-- synctax
	use {
		'nvim-treesitter/nvim-treesitter',
		config = 'require "config.treesitter"',
	}

	-- auto closer
	use {
		'windwp/nvim-autopairs',
		config = 'require "config.autopairs"',
	}

	-- git
	use {
		'tpope/vim-fugitive',
		setup = 'require "setup.fugitive"',
		cmd = { 'Git', 'Gedit', 'Gdiff', 'Gwrite' },
	}

	-- general
	use {
		'git@github.com:laughingman-hass/traverse.nvim.git',
		config = 'require "config.traverse"',
	}

	use { 'christoomey/vim-system-copy', keys = { 'cp', 'cP' } }
	use { 'tpope/vim-repeat' }
	use { 'tpope/vim-surround' }
	use { 'b3nj5m1n/kommentary', keys = 'gc', config = 'require "config.kommentary"' }
end)
