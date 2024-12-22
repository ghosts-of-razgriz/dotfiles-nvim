return {
	'mistricky/codesnap.nvim',
	enabled = function()
		local neovim_build = os.getenv('NEOVIM_BUILD')
		if neovim_build then
			return false
		else
			return true
		end
	end,
	build = 'make build_generator',
	keys = {
		{ '<leader>cc', '<cmd>CodeSnap<cr>', mode = 'x' },
		{ '<leader>cs', '<cmd>CodeSnapSave<cr>', mode = 'x' },
	},
	cmd = { 'CodeSnap', 'CodeSnapSave' },
	opts = {
		mac_window_bar = false,
		save_path = '~/Desktop',
		has_breadcrumbs = false,
		bg_padding = 0,
		bg_theme = 'bamboo',
		code_font_family = 'Nerd Operator',
		watermark = '',
	},
}
