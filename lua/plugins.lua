local packer = require 'packer'

packer.startup(function(use)
	local function use_local(plugin, opts)
		opts = opts or {}
		local path = '~/code/' .. plugin
		opts[1] = path

		use(opts)
	end

	-- packer manage itself
	use { 'wbthomason/packer.nvim' }

	-- color schemes
	use { 'catppuccin/nvim', as = 'catppuccin', config = 'require "config.color"' }
	-- language server protocol
	use {
		'neovim/nvim-lspconfig',
		config = 'require "config.lsp"',
		requires = {
			'folke/lsp-colors.nvim',
			{ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' },
			'Maan2003/lsp_lines.nvim',
			'hrsh7th/cmp-nvim-lsp',
		},
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

	use {
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = 'require "config.trouble"',
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
		requires = { 'nvim-treesitter/nvim-treesitter-textobjects' },
	}

	-- debugging
	use {
		'mfussenegger/nvim-dap',
		config = 'require "config.dap"',
		requires = { 'leoluz/nvim-dap-go' },
	}
	use {
		'rcarriga/nvim-dap-ui',
		config = 'require "config.dap_ui"',
		requires = 'mfussenegger/nvim-dap',
	}

	-- testing
	-- checkout neotest https://github.com/nvim-neotest/neotest

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

	-- status line
	use { 'nvim-lualine/lualine.nvim', config = 'require "config.lualine"' }

	-- general
	use_local('traverse.nvim', { config = 'require "config.traverse"' })

	use { 'tpope/vim-repeat' }
	use { 'tpope/vim-surround' }

	use { 'b3nj5m1n/kommentary', keys = 'gc', config = 'require "config.kommentary"' }
	use { 'AndrewRadev/splitjoin.vim', keys = { 'gJ', 'gS' } }
	use { 'christoomey/vim-system-copy', keys = { 'cp', 'cP' } }
	use { 'kyazdani42/nvim-web-devicons' }
	use { 'rafcamlet/nvim-luapad', cmd = { 'Luapad' }, config = 'require "config.luapad"' }

	use {
		'simrat39/symbols-outline.nvim',
		cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },
		setup = 'require "setup.outline"',
		config = 'require "config.outline"',
	}

	use {
		'anuvyklack/fold-preview.nvim',
		requires = { 'anuvyklack/nvim-keymap-amend' },
		config = 'require "config.fold-preview"',
	}
end)
