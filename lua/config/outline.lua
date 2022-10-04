vim.g.symbols_outline = {
	width = 20,
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { '<Esc>', 'q' },
		goto_location = '<Cr>',
		focus_location = 'o',
		hover_symbol = 's',
		toggle_preview = 'K',
		rename_symbol = 'r',
		code_actions = 'a',
	},
}
