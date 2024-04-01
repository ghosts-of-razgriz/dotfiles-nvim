local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('ccls') == 1 then
		require('lspconfig').ccls.setup({
			capabilities = capabilities,
		})
	end

	if vim.fn.executable('clang-format') == 1 then
		local c = require('conform')
		c.formatters_by_ft.c = { 'clang_format' }
		c.formatters_by_ft.cpp = { 'clang_format' }
	end
end

return M
