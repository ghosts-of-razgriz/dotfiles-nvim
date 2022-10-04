local telescope = require 'telescope'
local trouble_provider = require 'trouble.providers.telescope'

telescope.setup {
	defaults = {
		prompt_prefix = '🔍 ',
		selection_caret = ' ',
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
			i = { ['<c-t>'] = trouble_provider.open_with_trouble },
			n = { ['<c-t>'] = trouble_provider.open_with_trouble },
		},
	},
	pickers = { find_files = { hidden = false } },
}
