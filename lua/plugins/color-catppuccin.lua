return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	config = function()
		require('catppuccin').setup({
			flavour = 'macchiato',
			integrations = {
				notify = true,
			},
			styles = {
				keywords = { 'italic' },
			},
		})

		vim.cmd.colorscheme([[catppuccin]])
	end,
}
