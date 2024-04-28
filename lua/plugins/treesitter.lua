return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	branch = 'main',
	config = function()
		require('nvim-treesitter').setup({
			auto_install = true,
			highlight = {
				enable = true,
			},
		})

		vim.opt.foldmethod = 'expr'
		vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

		vim.bo.indentexpr = 'v:lua.require"nvim-treesitter".indentexpr()'

		require('nvim-treesitter.install').prefer_git = true
	end,
	dependencies = {
		{ 'nvim-treesitter/nvim-treesitter-context', opt = {} },
	},
}
