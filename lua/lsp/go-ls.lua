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
end

return M
