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
	init = function()
		local ts = require('nvim-treesitter.config')

		vim.api.nvim_create_autocmd('FileType', {
			callback = function(args)
				local buf = args.buf
				local ft = vim.bo[buf].filetype
				local lang = vim.treesitter.language.get_lang(ft) or ft

				if vim.list_contains(ts.installed_parsers(), lang) then
					pcall(vim.treesitter.start, buf, lang)
				end
			end,
		})
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
