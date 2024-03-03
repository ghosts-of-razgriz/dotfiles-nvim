local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('gopls') == 1 then
		require('lspconfig').gopls.setup({
			capabilities = capabilities,
			cmd = { 'gopls', 'serve' },
			filetypes = { 'go', 'gomod', 'gowork', 'gotmpl', 'gohtmltmpl' },
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
				},
			},
		})
	end

	if vim.fn.executable('goimports') == 1 then
		require('conform').formatters_by_ft.go = { 'goimports' }
	end
end

return M
