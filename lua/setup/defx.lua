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
end
