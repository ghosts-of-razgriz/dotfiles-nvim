local telescope = require 'telescope'

telescope.setup {
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
telescope.load_extension 'fzf'
