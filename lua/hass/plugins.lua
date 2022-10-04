local packer = require 'packer'

packer.startup(function(use)
	-- packer manage itself
	use { 'wbthomason/packer.nvim' }

	-- color schemes
	use { 'folke/tokyonight.nvim', config = "require 'hass.config.color'" }
	use { 'EdenEast/nightfox.nvim' }

	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
		},
		config = "require 'hass.config.telescope'",
		setup = "require 'hass.setup.telescope'",
	}

	-- language server protocol
	use {
		'neovim/nvim-lspconfig',
		config = "require 'hass.config.lsp'",
		requires = { 'folke/lsp-colors.nvim' },
	}

	use { 'folke/trouble.nvim', config = "require 'hass.config.trouble'" }

	use {
		'hrsh7th/nvim-cmp',
		config = "require 'hass.config.cmp'",
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-nvim-lsp',
			'onsails/lspkind-nvim',
			'L3MON4D3/LuaSnip',
		},
	}

	-- syntax detection
	use {
		'nvim-treesitter/nvim-treesitter',
		config = "require 'hass.config.treesitter'",
	}
	use {
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = "require 'hass.config.todo'",
	}

	-- file explorer
	use {
		'Shougo/defx.nvim',
		cmd = 'Defx',
		config = "require 'hass.config.defx'",
		setup = "require 'hass.setup.defx'",
		requires = {
			{ 'kristijanhusak/defx-icons', config = "require 'hass.config.defx-icons'" },
		},
	}

	-- git integration
	use {
		'junegunn/gv.vim',
		cmd = { 'GV' },
		setup = "require 'hass.setup.gv'",
		requires = {
			{
				'tpope/vim-fugitive',
				setup = "require 'hass.setup.fugitive'",
				cmd = { 'Git', 'Gedit', 'Gdiff', 'Gwrite' },
			},
		},
	}

	-- auto closer
	use {
		'windwp/nvim-autopairs',
		config = "require 'hass.config.autopairs'",
	}

	use {
		'christoomey/vim-tmux-navigator',
		cmd = {
			'TmuxNavigateLeft',
			'TmuxNavigateDown',
			'TmuxNavigateUp',
			'TmuxNavigateRight',
			'TmuxNavigatePrevious',
		},
		setup = "require 'hass.setup.vim-tmux-navigator'",
	}

	-- clip board
	use { 'christoomey/vim-system-copy', keys = { 'cp', 'cP' } }

	use { 'kyazdani42/nvim-web-devicons' }

	use { 'AndrewRadev/splitjoin.vim' }
	use { 'tpope/vim-repeat' }
	use { 'b3nj5m1n/kommentary', keys = 'gc', config = "require 'hass.config.kommentary'" }
	use { 'tpope/vim-surround' }
	use { 'junegunn/vim-peekaboo', config = "require 'hass.config.peekaboo'" }
	use {
		'abecodes/tabout.nvim',
		config = "require 'hass.config.tabout'",
		wants = 'nvim-treesitter',
	}

	use {
		'mattn/emmet-vim',
		config = "require 'hass.config.emmet'",
		setup = "require 'hass.setup.emmet'",
		ft = { 'html', 'css' },
	}

	use {
		'rafcamlet/nvim-luapad',
		cmd = { 'Luapad', 'LuaRun' },
	}
end)
