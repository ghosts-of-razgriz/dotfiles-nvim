local lspconfig = require 'lspconfig'
local keymap = require 'hass.lsp.keymap'

lspconfig.tsserver.setup {
	on_attach = keymap,
}
