local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('typescript-language-server') == 1 then
		require('lspconfig').tsserver.setup({
			capabilities = capabilities,
		})
	end
end

return M
