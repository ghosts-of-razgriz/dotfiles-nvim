local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('typescript-language-server') == 1 then
		require('lspconfig').tsserver.setup({
			capabilities = capabilities,
		})
	end

	require('lint').linters_by_ft = {
		javascript = { 'eslint' },
		javascriptreact = { 'eslint' },
		typescript = { 'eslint' },
		typescriptreact = { 'eslint' },
	}
end

return M
