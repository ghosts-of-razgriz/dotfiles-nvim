return {
	'chentoast/marks.nvim',
	event = 'VeryLazy',
	config = function()
		require('marks').setup({
			mappings = {
				toggle = 'm,',
				preview = 'm.',
			},
		})
	end,
}
