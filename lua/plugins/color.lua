return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1003,
	opts = {
		flavour = 'macchiato',
		integrations = {
			notify = true,
		},
		styles = {
			keywords = { 'italic' },
		},
	},
	config = function()
		vim.cmd.colorscheme([[catppuccin]])
	end,
}

