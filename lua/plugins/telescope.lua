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

		vim.keymap.set('n', leader .. 'uh', '<cmd>Telescope help_tags<cr>', nore)
		vim.keymap.set('n', leader .. 'uu', '<cmd>Telescope find_files<cr>', nore)
		vim.keymap.set('n', leader .. 'ub', '<cmd>Telescope buffers<cr>', nore)
		vim.keymap.set('n', leader .. 'uc', '<cmd>Telescope commands<cr>', nore)
		vim.keymap.set('n', leader .. 'uk', '<cmd>Telescope keymaps<cr>', nore)
		vim.keymap.set('n', leader .. 'ur', '<cmd>Telescope resume<cr>', nore)
		vim.keymap.set('n', leader .. 'ug', '<cmd>Telescope live_grep<cr>', nore)
		vim.keymap.set('n', leader .. 'ud', '<cmd>Telescope diagnostics<cr>', nore)
		vim.keymap.set('n', leader .. 'uw', '<cmd>Telescope grep_string<cr>', nore)
		vim.keymap.set('n', leader .. 'ug', '<cmd>Telescope git_commits<cr>', nore)
		vim.keymap.set('n', leader .. 'ut', '<cmd>Telescope builtin<cr>', nore)

		vim.keymap.set('n', lleader .. 'uf', '<cmd>Telescope git_files<cr>', nore)
	end,
}
