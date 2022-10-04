local lspconfig = require 'lspconfig'
local keymap = require 'hass.lsp.keymap'

lspconfig.tsserver.setup {
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		keymap()
	end,
}
