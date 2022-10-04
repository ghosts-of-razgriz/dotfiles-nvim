local wk = require 'which-key'

wk.register {
	['<leader>'] = {
		name = 'Defx',
		e = { '<cmd>Defx -buffer-name=defx -show-ignored-files<cr>', 'Defx' },
	},
	['<localleader>'] = {
		name = 'Defx at current working directory',
		e = { "<cmd>Defx -buffer-name=defx -show-ignored-files `expand('%:p:h')`<cr>", 'Defx' },
	},
}

function DefxKeymap()
	local current_buffer = 0
	local opts = { buffer = current_buffer }

	wk.register({
		name = 'Defx',
		['*'] = { 'defx#do_action("toggle_select_all")', 'Select All', expr = true },
		['<cr>'] = { 'defx#async_action("drop")', 'Open', expr = true },
		['<tab>'] = { 'defx#async_action("toggle_select") . "j"', 'Select Current', expr = true },
		['K'] = { 'defx#do_action("new_directory")', 'Make Directory', expr = true },
		['N'] = { 'defx#do_action("new_file")', 'New File', expr = true },
		['<c-p>'] = { 'defx#do_action("preview")', 'Preview', expr = true },
		['h'] = { 'defx#async_action("cd", [".."])', 'Go to parent directory', expr = true },
		['j'] = { 'line(".") == line("$") ? "gg" : "j"', 'Move down', expr = true },
		['k'] = { 'line(".") == 1 ? "G" : "k"', 'Move Up', expr = true },
		['l'] = { 'defx#async_action("open")', 'Open', expr = true },
		['d'] = { 'defx#do_action("remove")', 'Delete', expr = true },
		['c'] = { 'defx#do_action("copy")', 'Copy', expr = true },
		['m'] = { 'defx#do_action("move")', 'Move', expr = true },
		['p'] = { 'defx#do_action("paste")', 'Paste', expr = true },
		['r'] = { 'defx#do_action("rename")', 'Remove', expr = true },
		['q'] = { 'defx#do_action("quit")', 'Quit', expr = true },
		['o'] = { 'defx#do_action("open_or_close_tree")', 'Toggle Directory Tree', expr = true },
		['O'] = {
			'defx#do_action("open_tree_recursive")',
			'Toggle Directory Tree Recursively',
			expr = true,
		},
		['<c-l>'] = { 'defx#do_action("redraw")', 'Refresh', expr = true },
		['<c-x>'] = {
			'defx#async_action("multi", ["quit", ["drop", "split"]])',
			'Open in Horizontal Split',
			expr = true,
		},
		['<c-v>'] = {
			'defx#async_action("multi", ["quit", ["drop", "vsplit"]])',
			'Open in Vertical Split',
			expr = true,
		},
	}, opts)
end
