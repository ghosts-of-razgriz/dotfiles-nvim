return {
	{
		'FabijanZulj/blame.nvim',
		lazy = false,
		opts = {},
		keys = {
			{ '<leader>gb', '<cmd>BlameToggle<cr>' },
		},
	},
	{
		'f-person/git-blame.nvim',
		event = 'VeryLazy',
		opts = {
			enabled = true,
		},
	},
}
