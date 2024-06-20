local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('typescript-language-server') == 1 then
		require('lspconfig').tsserver.setup({
			capabilities = capabilities,
		})
	end

	if vim.fn.executable('prettierd') == 1 then
		require('conform').formatters_by_ft = {
			html = { 'prettierd' },
			javascript = { 'prettierd' },
			javascriptreact = { 'prettierd' },
			typescript = { 'prettierd' },
			typescriptreact = { 'prettierd' },
			json = { 'prettierd' },
			css = { 'prettierd' },
			yaml = { 'prettierd' },
			markdown = { 'prettierd' },
		}
	end

	require('lint').linters_by_ft = {
		javascript = { 'eslint' },
		javascriptreact = { 'eslint' },
		typescript = { 'eslint' },
		typescriptreact = { 'eslint' },
	}
end

return M
