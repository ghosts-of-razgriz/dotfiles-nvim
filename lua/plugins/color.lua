return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1003,
		opts = {
			flavour = 'mocha',
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

			local inlay_hint_hlgroup = vim.api.nvim_get_hl(0, { name = 'LspInlayHint' })
			inlay_hint_hlgroup.italic = true
			vim.api.nvim_set_hl(0, 'LspInlayHint', inlay_hint_hlgroup)
		end,
	},
	{
		'folke/tokyonight.nvim',
		priority = 1000,
		-- init = function()
		-- 	vim.cmd.colorscheme([[tokyonight]])
		-- end,
		opts = {
			style = 'moon',
		},
	},
	{
		'scottmckendry/cyberdream.nvim',
		priority = 1000,
		-- init = function()
		-- 	vim.cmd.colorscheme([[cyberdream]])
		-- end,
		opts = {
			variant = 'dark',
			italic_comments = true,
			transparent = false,
		},
	},
}
