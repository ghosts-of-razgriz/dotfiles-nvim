local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('typst-lsp') == 1 then
		require('lspconfig').typst_lsp.setup({
			capabilities = capabilities,
			settings = {
				exportPdf = 'never',
			},
		})
	end
end

return M
