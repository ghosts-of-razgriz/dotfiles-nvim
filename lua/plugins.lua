return {
	-- color scheme
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false,
		config = function()
			require 'config.color'
		end,
	},

	-- language server
	{
		'neovim/nvim-lspconfig',
		name = 'lspconfig',
		lazy = false,
		config = function()
			require 'config.lsp'
		end,
		dependencies = {
			'stevearc/conform.nvim',
		},
	},

	-- diagnostics
	{
		'folke/trouble.nvim',
		lazy = false,
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require 'config.trouble'
		end,
	},

	-- auto-complete
	{
		'hrsh7th/nvim-cmp',
		config = function()
			require 'config.cmp'
		end,
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-nvim-lsp',
			'onsails/lspkind-nvim',
			'saadparwaiz1/cmp_luasnip',
			'L3MON4D3/LuaSnip',
		},
		event = { 'InsertEnter' },
	},

	-- fuzzy finder
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			require 'config.telescope'
		end,
		init = function()
			require 'init.telescope'
		end,
		cmd = { 'Telescope' },
	},

	-- syntax
	{
		'sheerun/vim-polyglot',
		init = function()
			vim.g.polyglot_disabled = { 'autoindent', 'ftdetect' }
		end,
	},
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		config = function()
			require 'config.treesitter'
		end,
	},

	-- file explorer
	{
		'Shougo/defx.nvim',
		cmd = 'Defx',
		config = function()
			require 'config.defx'
		end,
		init = function()
			require 'init.defx'
		end,
		requires = {
			{
				'kristijanhusak/defx-icons',
				config = function()
					require 'config.defx-icons'
				end,
			},
		},
	},

	-- autopair
	{
		'windwp/nvim-autopairs',
		config = function()
			require 'config.autopairs'
		end,
		event = { 'InsertEnter' },
	},

	-- status line
	{
		'nvim-lualine/lualine.nvim',
		lazy = false,
		config = function()
			require 'config.lualine'
		end,
	},

	-- git
	{
		'tpope/vim-fugitive',
		init = function()
			require 'init.fugitive'
		end,
		cmd = { 'Git', 'Gedit', 'Gdiff', 'Gwrite' },
	},

	-- general
	{
		'neovim/traverse.nvim',
		config = function()
			require 'config.traverse'
		end,
		keys = { '<c-h>', '<c-j>', '<c-k>', '<c-l>' },
		url = 'https://gitlab.razgriz.io/neovim/traverse.nvim',
	},
	{ 'christoomey/vim-system-copy', keys = { 'cp', 'cP' } },
	{ 'AndrewRadev/splitjoin.vim', lazy = false },
	{
		'b3nj5m1n/kommentary',
		keys = 'gc',
		config = function()
			require 'config.kommentary'
		end,
	},
	{
		'kylechui/nvim-surround',
		event = 'VeryLazy',
		config = function()
			require('nvim-surround').setup {}
		end,
	},

	-- filetype specific
	-- typst
	{

		'chomosuke/typst-preview.nvim',
		ft = 'typst',
		build = function()
			require('typst-preview').update()
		end,
	},
	{ 'kaarmu/typst.vim', ft = { 'typst' } },
}
