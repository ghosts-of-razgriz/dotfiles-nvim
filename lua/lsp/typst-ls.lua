local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('typst-lsp') == 0 then
		return
	end

	require('lspconfig').typst_lsp.setup({
		capabilities = capabilities,
		settings = {
			exportPdf = 'never',
		},
	})

	if vim.fn.executable('typstfmt') == 1 then
		require('conform').formatters_by_ft.typst = { 'typstfmt' }
	end
end

return M
