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

	if vim.fn.executable('typstfmt') == 1 then
		require('conform').formatters_by_ft.typst = { 'typstfmt' }
	end
end

return M
