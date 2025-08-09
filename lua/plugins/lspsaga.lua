return {
	'nvimdev/lspsaga.nvim',
	cond = true,
	opts = {
		lightbulb = { enable = false },
		beacon = { enable = false },
	},
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
}
