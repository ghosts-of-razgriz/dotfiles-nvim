return {
	'mfussenegger/nvim-lint',
	event = 'VeryLazy',
	config = function()
		local l = require('lint')

		vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
			callback = function()
				l.try_lint(nil, { ignore_errors = true })
			end,
		})

		l.linters_by_ft = {
			javascript = { 'eslint' },
			javascriptreact = { 'eslint' },
			typescript = { 'eslint' },
			typescriptreact = { 'eslint' },
		}
	end,
}
