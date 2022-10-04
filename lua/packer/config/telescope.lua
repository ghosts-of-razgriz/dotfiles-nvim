require('telescope').setup {
	defaults = {
		prompt_prefix = "🔍 ",
		selection_caret = " ",
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
	},
	pickers = { find_files = { hidden = false } },
}

