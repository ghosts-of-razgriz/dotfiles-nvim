local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('vim-language-server') == 1 then
		require('lspconfig').vimls.setup({
			capabilities = capabilities,
		})
	end
end

return M
