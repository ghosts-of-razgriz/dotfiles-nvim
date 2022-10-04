local packer = require 'packer'

packer.startup(function(use)
	-- packer manage itself
	use { 'wbthomason/packer.nvim' }

	-- color schemes
	use { 'catppuccin/nvim', as =  'catppuccin', config = 'require "config.color"' }

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
			'folke/trouble.nvim',
		},
		config = 'require "config.telescope"',
		setup = 'require "setup.telescope"',
		cmd  = { 'Telescope' },
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

	-- auto closer
	use {
		'windwp/nvim-autopairs',
		config = 'require "config.autopairs"'
	}
end)
