return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	branch = 'main',
	opts = {
		highlight = {
			enable = true,
		},
	},
	config = function()
		vim.opt.foldmethod = 'expr'
		vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

		vim.bo.indentexpr = 'v:lua.require"nvim-treesitter".indentexpr()'

		require('nvim-treesitter.install').prefer_git = true
	end,
	dependencies = {
		{
			'lewis6991/ts-install.nvim',
			config = function()
				require('ts-install').setup({
					auto_install = true,
					ignore_install = { 'NeogitStatus' },
				})
			end,
		},
		{ 'tree-sitter/tree-sitter-embedded-template' },
	},
}
