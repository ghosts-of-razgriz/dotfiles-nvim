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

	if vim.fn.executable('rustfmt') == 1 then
		require('conform').formatters_by_ft.rust = { 'rustfmt' }
	end
end

return M
