local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('emmet-ls') == 1 then
		require('lspconfig').emmet_ls.setup({
			capabilities = capabilities,
		})
	end
end

return M
