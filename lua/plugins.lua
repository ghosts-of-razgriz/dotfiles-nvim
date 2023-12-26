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

	-- fuzzy finder
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			'folke/trouble.nvim',
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

	-- general
	{
		'neovim/traverse.nvim',
		config = function()
			require 'config.traverse'
		end,
		keys = { '<c-h>', '<c-j>', '<c-k>', '<c-l>' },
		url = 'https://gitlab.razgriz.io/neovim/traverse.nvim',
	},
}
