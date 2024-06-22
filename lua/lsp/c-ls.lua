local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('ccls') == 1 then
		require('lspconfig').ccls.setup({
			capabilities = capabilities,
		})
	end
end

return M
