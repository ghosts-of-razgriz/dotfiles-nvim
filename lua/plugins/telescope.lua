local telescope_config = function()
	local t = require 'telescope'
	--local trouble = require 'trouble.providers.telescope'

	t.setup {
		defaults = {
			prompt_prefix = ' ',
			selection_caret = ' ',
			color_devicons = true,
			set_env = { ['COLORTERM'] = 'truecolor' },
			vimgrep_arguments = {
				'rg',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
			},
			winblend = 10,
			selection_strategy = 'reset',
			sorting_strategy = 'descending',
			scroll_strategy = 'cycle',
			-- mappings = {
			-- 	i = { ['<m-t>'] = trouble.open_with_trouble },
			-- 	n = { ['<m-t>'] = trouble.open_with_trouble },
			-- },
		},
		pickers = {
			find_files = {
				find_command = {
					'rg',
					'--files',
					'--iglob',
					'!.git',
					'--hidden',
				},
			},
		},
	}

	t.load_extension 'fzf'
end

local telescope_init = function()
	local leader = '<leader>'
	local localleader = '<localleader>'
	local nore = { noremap = true }

	vim.keymap.set('n', leader .. 'u<space>', ':Telescope ', nore) -- Telescope <prompt>
	vim.keymap.set('n', leader .. 'uu', '<cmd>Telescope find_files<cr>', nore) -- find files
	vim.keymap.set('n', leader .. 'ut', '<cmd>Telescope<cr>', nore) -- Telescope commands
	vim.keymap.set('n', leader .. 'ub', '<cmd>Telescope buffers<cr>', nore) -- buffers
	vim.keymap.set('n', leader .. 'ug', '<cmd>Telescope live_grep<cr>', nore) -- live grep
	vim.keymap.set('n', leader .. 'uc', '<cmd>Telescope commands<cr>', nore) -- commands
	vim.keymap.set('n', leader .. 'uk', '<cmd>Telescope keymaps<cr>', nore) -- keymaps
	vim.keymap.set('n', leader .. 'ur', '<cmd>Telescope resume<cr>', nore) -- resume

	vim.keymap.set('n', localleader .. 'uy', '<cmd>Telescope git_files<cr>', nore) -- git files
end

return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/popup.nvim',
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = telescope_config,
	init = telescope_init,
	cmd = { 'Telescope' },
}
