local lspconfig = require 'lspconfig'
local lsputils = require 'lsp.utils'

lspconfig.ccls.setup {
	capabilities = lsputils.make_capabilities(),
	on_attach = function(client, bufnr)
		lsputils.disable_formatting(client)
		lsputils.set_lsp_keymap(bufnr)
	end,
}
