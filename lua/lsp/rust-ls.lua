local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('rust-analyzer') == 1 then
		require('lspconfig').rust_analyzer.setup({
			capabilities = capabilities,
			filetypes = { 'rust' },
			root_dir = require('lspconfig.util').root_pattern('Cargo.toml'),
			settings = {
				['rust-analyzer'] = {
					cargo = {
						allFeatures = true,
					},
				},
			},
		})
	end
end

return M
