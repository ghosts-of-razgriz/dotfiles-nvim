local utils = require 'utils'
local set_keymap = utils.set_keymap

set_keymap(
	'n',
	'<leader>e',
	'<cmd>Defx -buffer-name=defx -show-ignored-files<cr>',
	utils.noresilent
)
set_keymap(
	'n',
	'<localleader>e',
	"<cmd>Defx -buffer-name=defx -show-ignored-files `expand('%:p:h')`<cr>",
	utils.noresilent
)

function DefxKeymap()
	local settings = { noremap = true, expr = true, silent = true }

	vim.api.nvim_buf_set_keymap('0', 'n', '*', 'defx#do_action("toggle_select_all")', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', '<cr>', 'defx#async_action("drop")', settings)
	vim.api.nvim_buf_set_keymap(
		'0',
		'n',
		'<tab>',
		'defx#async_action("toggle_select") . "j"',
		settings
	)
	vim.api.nvim_buf_set_keymap('0', 'n', 'K', 'defx#do_action("new_directory")', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'N', 'defx#do_action("new_file")', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', '<c-p>', 'defx#do_action("preview")', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'h', 'defx#async_action("cd", [".."])', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'j', 'line(".") == line("$") ? "gg" : "j"', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'k', 'line(".") == 1 ? "G" : "k"', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'l', 'defx#async_action("open")', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'd', 'defx#do_action("remove")', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'c', 'defx#do_action("copy")', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'm', 'defx#do_action("move")', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'p', 'defx#do_action("paste")', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'r', 'defx#do_action("rename")', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'q', 'defx#do_action("quit")', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'o', 'defx#do_action("open_or_close_tree")', settings)
	vim.api.nvim_buf_set_keymap('0', 'n', 'O', 'defx#do_action("open_tree_recursive")', settings)

	vim.api.nvim_buf_set_keymap('0', 'n', '<c-l>', 'defx#do_action("redraw")', settings)
	--   nnoremap <silent><buffer><expr> - defx#async_action('multi', ['quit', ['drop', 'split']])
	--   nnoremap <silent><buffer><expr> \ defx#async_action('multi', ['quit', ['drop', 'vsplit']])
end
