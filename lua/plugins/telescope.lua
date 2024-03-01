return {
	'nvim-telescope/telescope.nvim',
	cmd = { 'Telescope' },
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable('make') == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },
	},
	config = function()
		require('telescope').setup({
			defaults = {
				prompt_prefix = ' ',
				selection_caret = ' ',
				color_devicons = true,
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
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},
		})

		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'ui-select')
	end,
	init = function()
		local leader = '<leader>'
		local lleader = '<localleader>'
		local nore = { noremap = true }

		vim.keymap.set('n', leader .. 'sh', '<cmd>Telescope help_tags<cr>', nore)
		vim.keymap.set('n', leader .. 'ss', '<cmd>Telescope find_files<cr>', nore)
		vim.keymap.set('n', leader .. 'sb', '<cmd>Telescope buffers<cr>', nore)
		vim.keymap.set('n', leader .. 'sc', '<cmd>Telescope commands<cr>', nore)
		vim.keymap.set('n', leader .. 'sk', '<cmd>Telescope keymaps<cr>', nore)
		vim.keymap.set('n', leader .. 'sr', '<cmd>Telescope resume<cr>', nore)
		vim.keymap.set('n', leader .. 'sg', '<cmd>Telescope live_grep<cr>', nore)
		vim.keymap.set('n', leader .. 'sd', '<cmd>Telescope diagnostics<cr>', nore)
		vim.keymap.set('n', leader .. 'sw', '<cmd>Telescope grep_string<cr>', nore)
		vim.keymap.set('n', leader .. 'sg', '<cmd>Telescope git_commits<cr>', nore)
		vim.keymap.set('n', leader .. 's<space>', '<cmd>Telescope builtin<cr>', nore)

		vim.keymap.set('n', lleader .. 'sf', '<cmd>Telescope git_files<cr>', nore)
	end,
}
