local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('typescript-language-server') == 0 then
		return
	end

	require('lspconfig').tsserver.setup({
		capabilities = capabilities,
	})

	if vim.fn.executable('prettierd') == 1 then
		local c = require('conform')

		c.formatters_by_ft.html = { 'prettierd' }
		c.formatters_by_ft.javascript = { 'prettierd' }
		c.formatters_by_ft.typescript = { 'prettierd' }
		c.formatters_by_ft.json = { 'prettierd' }
		c.formatters_by_ft.css = { 'prettierd' }
		c.formatters_by_ft.yaml = { 'prettierd' }
		c.formatters_by_ft.markdown = { 'prettierd' }
	end
end

return M
