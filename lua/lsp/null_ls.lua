local null_ls = require 'null-ls'
local b = null_ls.builtins
local utils = require 'utils'
local lsputils = require 'lspconfig.util'

vim.g.lsp_format = 1

null_ls.setup {
	sources = {
		b.formatting.stylua,
	},
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_autocmd('BufWritePre', {
				pattern = { '<buffer>' },
				callback = function()
					if vim.g.lsp_format == 1 then
						vim.lsp.buf.format()
					end
				end,
			})
		end
	end,
}
