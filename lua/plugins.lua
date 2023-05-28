local packer = require 'packer'

packer.startup(function(use)
	-- packer manage itself
	use { 'wbthomason/packer.nvim' }

	-- color schemes
	use { 'catppuccin/nvim', as = 'catppuccin', config = 'require "config.color"' }

	-- language server
	use {
		'neovim/nvim-lspconfig',
		config = 'require "config.lsp"',
		requires = {
			'folke/lsp-colors.nvim',
			{ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' },
			'hrsh7th/cmp-nvim-lsp',
		},
	}

	-- diagnostic
	use {
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = 'require "config.trouble"',
	}

	use {
		'L3MON4D3/LuaSnip',
		before = 'nvim-cmp',
		config = 'require "config.luasnip"',
	}

	-- auto-complete
	use {
		'hrsh7th/nvim-cmp',
		config = 'require "config.cmp"',
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-nvim-lsp',
			'onsails/lspkind-nvim',
			'saadparwaiz1/cmp_luasnip',
		},
	}

	-- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
			'folke/trouble.nvim',
		},
		config = 'require "config.telescope"',
		setup = 'require "setup.telescope"',
		cmd = { 'Telescope' },
	}

	-- syntax
	use {
		'sheerun/vim-polyglot',
		setup = function()
			vim.g.polyglot_disabled = { 'autoindent', 'ftdetect' }
		end,
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		config = 'require "config.treesitter"',
		-- requires = { 'nvim-treesitter/nvim-treesitter-textobjects' },
	}

	-- file explorer
	use {
		'Shougo/defx.nvim',
		cmd = 'Defx',
		config = 'require "config.defx"',
		setup = 'require "setup.defx"',
		requires = {
			{ 'kristijanhusak/defx-icons', config = 'require "config.defx-icons"' },
		},
	}

	-- auto closer
	use {
		'windwp/nvim-autopairs',
		config = 'require "config.autopairs"',
	}

	-- status line
	use { 'nvim-lualine/lualine.nvim', config = 'require "config.lualine"' }

	-- git
	use {
		'tpope/vim-fugitive',
		setup = 'require "setup.fugitive"',
		cmd = { 'Git', 'Gedit', 'Gdiff', 'Gwrite' },
	}

	-- general
	use {
		'https://gitlab.razgriz.io/neovim/traverse.nvim',
		config = 'require "config.traverse"',
	}

	use { 'tpope/vim-repeat' }
	use { 'tpope/vim-surround' }
	use { 'christoomey/vim-system-copy', keys = { 'cp', 'cP' } }
	use { 'b3nj5m1n/kommentary', keys = 'gc', config = 'require "config.kommentary"' }
	use { 'AndrewRadev/splitjoin.vim', keys = { 'gJ', 'gS' } }
end)
