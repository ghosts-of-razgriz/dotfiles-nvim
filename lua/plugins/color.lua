return {
	{
		'rebelot/kanagawa.nvim',
		priority = 1001,
		opts = { theme = 'lotus' },
		config = function()
			vim.cmd.colorscheme([[kanagawa]])
		end,
	}
}
