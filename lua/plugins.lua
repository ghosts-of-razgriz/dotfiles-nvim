local packer = require('packer')

packer.startup(function(use)
	-- packer manage itself
	use { 'wbthomason/packer.nvim', opt = true }

	-- color schemes
	use { 'folke/tokyonight.nvim', config = "require 'packer.config.tokyonight'" }

	-- syntax
	use { 'sheerun/vim-polyglot' }

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

	-- status bar
	use {
		'hoob3rt/lualine.nvim',
		config = "require 'packer.config.lualine'",
		requires = {
			'kyazdani42/nvim-web-devicons',
			opt = true
		}
	}

	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
		},
		config = "require 'packer.config.telescope'",
		setup = "require 'packer.setup.telescope'",
	}

	-- lsp
	use {
		'neovim/nvim-lspconfig',
		config = "require 'packer.config.lsp'",
		requires = {
			'folke/lsp-colors.nvim',
		}
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		ft = {
			'bash',
			'c',
			'css',
			'go',
			'javascript',
			'lua',
			'python',
			'ruby',
			'toml',
			'yaml',
		},
		config = "require 'packer.config.treesitter'",
	}
	use {
		'folke/trouble.nvim',
		config = "require 'packer.config.trouble'",
	}
	use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
	config = "require 'packer.config.todo-comments'",
  }

	-- autocomplete
	use {
		'cohama/lexima.vim',
		config = "require 'packer.config.lexima'",
	}
	use {
		'hrsh7th/nvim-compe',
		config = "require 'packer.config.compe'",
		setup = "require 'packer.setup.compe'",
	}

	use {
		'tpope/vim-fugitive',
		cmd = {
			'Gblame',
			'Gcommit',
			'Gdiff',
			'Gedit',
			'Gfetch',
			'Git',
			'Gpull',
			'Gpush',
			'Gstatus',
			'Gwrite',
		},
		requires = { 'junegunn/gv.vim' },
		setup = "require 'packer.setup.fugitive'",
	}
	use {
		'christoomey/vim-tmux-navigator',
		cmd = {
			'TmuxNavigateLeft',
			'TmuxNavigateDown',
			'TmuxNavigateUp',
			'TmuxNavigateRight',
			'TmuxNavigatePrevious'
		},
		setup = "require 'packer.setup.vim-tmux-navigator'"
	}

	use {
		'christoomey/vim-system-copy',
		keys = {'cp', 'cP'},
	}

	use { 'kana/vim-operator-user' }
	use { 'tpope/vim-repeat' }
	use { 'tpope/vim-commentary' }
	use { 'tpope/vim-surround' }
	use { 'AndrewRadev/splitjoin.vim' }
	use {
		'junegunn/vim-peekaboo',
		config = "require 'packer.config.peekaboo'",
	}
end)
