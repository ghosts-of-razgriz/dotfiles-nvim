return {
	'michaelrommel/nvim-silicon',
	cmd = 'Silicon',
	config = function()
		require('silicon').setup({
			font = 'Nerd Operator=40',
			theme = 'Catppuccin-latte',
			background = '#fff0',
			pad_horiz = 10,
			pad_vert = 10,
			-- line_offset = function(args)
			-- 	return args.line1
			-- end,
		})
	end,
}
