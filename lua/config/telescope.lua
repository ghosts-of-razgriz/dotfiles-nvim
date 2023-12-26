local t = require 'telescope'
local trouble = require 'trouble.providers.telescope'

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
		mappings = {
			i = { ['<m-t>'] = trouble.open_with_trouble },
			n = { ['<m-t>'] = trouble.open_with_trouble },
		},
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
