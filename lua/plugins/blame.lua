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
		cond = false, -- disabled for in favour of tine-inline-diagnostic
		event = 'VeryLazy',
		opts = {
			enabled = true,
		},
	},
}
