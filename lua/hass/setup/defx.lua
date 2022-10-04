local function set_keymap(...)
	vim.api.nvim_set_keymap(...)
end
local opts = { noremap = true, silent = true }

set_keymap('n', '<leader>e', '<cmd>Defx -buffer-name=defx -show-ignored-files<cr>', opts)
set_keymap(
	'n',
	'<localleader>e',
	"<cmd>Defx -buffer-name=defx -show-ignored-files `expand('%:p:h')`<cr>",
	opts
)
