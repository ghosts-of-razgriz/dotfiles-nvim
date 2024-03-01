return {
	'echasnovski/mini.nvim',
	config = function()
		require('mini.ai').setup({ n_lines = 500 })
		require('mini.pairs').setup()
		require('mini.surround').setup()
	end,
	event = 'VeryLazy',
}
