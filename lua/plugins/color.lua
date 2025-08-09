return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1003,
	opts = {
		flavour = 'macchiato',
		integrations = {
			notify = true,
			blink_cmp = { style = 'bordered' },
		},
		styles = {
			keywords = { 'italic' },
		},
	},
	config = function()
		vim.cmd.colorscheme([[catppuccin]])
	end,
}
