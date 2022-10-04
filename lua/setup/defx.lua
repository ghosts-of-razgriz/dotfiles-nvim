local utils = require 'utils'

utils.set_keymaps({
	['<leader>'] = {
		e = { '<cmd>Defx -buffer-name=defx -show-ignored-files<cr>', 'Defx' },
	},
	['<localleader>'] = {
		e = { "<cmd>Defx -buffer-name=defx -show-ignored-files `expand('%:p:h')`<cr>", 'Defx' },
	},
}, {})

function DefxKeymap()
	local opts = { noremap = true, expr = true, silent = true }

	vim.api.nvim_buf_set_keymap(0, 'n', '*', 'defx#do_action("toggle_select_all")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', '<cr>', 'defx#async_action("drop")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', '<tab>', 'defx#async_action("toggle_select") . "j"', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'K', 'defx#do_action("new_directory")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'N', 'defx#do_action("new_file")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', '<c-p>', 'defx#do_action("preview")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'h', 'defx#async_action("cd", [".."])', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'j', 'line(".") == line("$") ? "gg" : "j"', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'k', 'line(".") == 1 ? "G" : "k"', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'l', 'defx#async_action("open")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'd', 'defx#do_action("remove")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'c', 'defx#do_action("copy")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'm', 'defx#do_action("move")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'p', 'defx#do_action("paste")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'r', 'defx#do_action("rename")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'q', 'defx#do_action("quit")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'o', 'defx#do_action("open_or_close_tree")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', 'O', 'defx#do_action("open_tree_recursive")', opts)
	vim.api.nvim_buf_set_keymap(0, 'n', '<c-r>', 'defx#do_action("redraw")', opts)
	vim.api.nvim_buf_set_keymap(
		0,
		'n',
		'<c-x>',
		'defx#async_action("multi", ["quit", ["drop", "split"]])',
		opts
	)
	vim.api.nvim_buf_set_keymap(
		0,
		'n',
		'<c-v>',
		'defx#async_action("multi", ["quit", ["drop", "vsplit"]])',
		opts
	)

	-- local opts = { buffer = 0 }

	-- utils.set_keymaps({
	-- 	['*'] = { 'defx#do_action("toggle_select_all")', 'Select All', expr = true },
	-- 	['<cr>'] = { 'defx#async_action("drop")', 'Open', expr = true },
	-- 	['<tab>'] = {
	-- 		'defx#async_action("toggle_select") . "j"',
	-- 		'Select Current',
	-- 		expr = true,
	-- 	},
	-- ['K'] = { 'defx#do_action("new_directory")', 'Make Directory', expr = true },
	-- ['N'] = { 'defx#do_action("new_file")', 'New File', expr = true },
	-- ['<c-p>'] = { 'defx#do_action("preview")', 'Preview', expr = true },
	-- ['h'] = {
	-- 	'defx#async_action("cd", [".."])',
	-- 	'Go to parent directory',
	-- 	expr = true,
	-- },
	-- ['j'] = { 'line(".") == line("$") ? "gg" : "j"', 'Move down', expr = true },
	-- ['k'] = { 'line(".") == 1 ? "G" : "k"', 'Move Up', expr = true },
	-- ['l'] = { 'defx#async_action("open")', 'Open', expr = true },
	-- ['d'] = { 'defx#do_action("remove")', 'Delete', expr = true },
	-- ['c'] = { 'defx#do_action("copy")', 'Copy', expr = true },
	-- ['m'] = { 'defx#do_action("move")', 'Move', expr = true },
	-- ['p'] = { 'defx#do_action("paste")', 'Paste', expr = true },
	-- ['r'] = { 'defx#do_action("rename")', 'Remove', expr = true },
	-- ['q'] = { 'defx#do_action("quit")', 'Quit', expr = true },
	-- ['o'] = {
	-- 	'defx#do_action("open_or_close_tree")',
	-- 	'Toggle Directory Tree',
	-- 	expr = true,
	-- },
	-- ['O'] = {
	-- 	'defx#do_action("open_tree_recursive")',
	-- 	'Toggle Directory Tree Recursively',
	-- 	expr = true,
	-- },
	-- ['<c-l>'] = { 'defx#do_action("redraw")', 'Refresh', expr = true },
	-- ['<c-x>'] = {
	-- 	'defx#async_action("multi", ["quit", ["drop", "split"]])',
	-- 	'Open in Horizontal Split',
	-- 	expr = true,
	-- },
	-- ['<c-v>'] = {
	-- 	'defx#async_action("multi", ["quit", ["drop", "vsplit"]])',
	-- 	'Open in Vertical Split',
	-- 	expr = true,
	-- },
	-- }, opts)
end
