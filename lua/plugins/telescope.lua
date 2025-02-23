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
		'jonarrien/telescope-cmdline.nvim',
	},
	config = function()
		local telescope = require('telescope')
		telescope.setup({
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
				cmdline = {
					-- Adjust telescope picker size and layout
					picker = {
						layout_config = {
							width = 120,
							height = 25,
						},
					},
					-- Adjust your mappings
					mappings = {
						complete = '<c-y>',
						run_selection = '<cr>',
						run_input = '<c-cr>',
					},
					-- Triggers any shell command using overseer.nvim (`:!`)
					overseer = {
						enabled = true,
					},
				},
			},
		})

		require('telescope._extensions.live_multigrep')

		pcall(telescope.load_extension, 'fzf')
		pcall(telescope.load_extension, 'ui-select')
		pcall(telescope.load_extension, 'cmdline')
		pcall(telescope.load_extension, 'live_multigrep')
	end,
	init = function()
		local leader = '<leader>'
		local lleader = '<localleader>'
		local nore = { noremap = true }

		vim.keymap.set('n', leader .. 'uh', '<cmd>Telescope help_tags<cr>', nore)
		vim.keymap.set('n', leader .. 'uu', '<cmd>Telescope find_files<cr>', nore)
		vim.keymap.set('n', leader .. 'ub', '<cmd>Telescope buffers<cr>', nore)
		vim.keymap.set('n', leader .. 'uc', '<cmd>Telescope cmdline<cr>', nore)
		vim.keymap.set('n', leader .. 'uk', '<cmd>Telescope keymaps<cr>', nore)
		vim.keymap.set('n', leader .. 'ur', '<cmd>Telescope resume<cr>', nore)
		vim.keymap.set('n', leader .. 'ug', '<cmd>Telescope live_multigrep<cr>', nore)
		vim.keymap.set('n', leader .. 'ud', '<cmd>Telescope diagnostics<cr>', nore)
		vim.keymap.set('n', leader .. 'ut', '<cmd>Telescope builtin<cr>', nore)
		vim.keymap.set('n', leader .. 'um', '<cmd>Telescope marks<cr>', nore)

		vim.keymap.set('n', lleader .. 'ug', '<cmd>Telescope grep_string<cr>', nore)
		vim.keymap.set('n', lleader .. 'ub', '<cmd>Telescope current_buffer_fuzzy_find<cr>', nore)
		vim.keymap.set('n', lleader .. 'uf', '<cmd>Telescope git_files<cr>', nore)
		vim.keymap.set('n', lleader .. 'uc', '<cmd>Telescope git_commits<cr>', nore)
	end,
}
