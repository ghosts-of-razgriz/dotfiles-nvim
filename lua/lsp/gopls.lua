local lspconfig = require 'lspconfig'
local lsputils = require 'lsp.utils'

lspconfig.gopls.setup {
	capabilities = lsputils.make_capabilities(),
	on_attach = lsputils.disable_formatting,
	cmd = { 'gopls', 'serve' },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}
