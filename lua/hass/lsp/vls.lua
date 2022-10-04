local lspconfig = require 'lspconfig'
local keymap = require 'hass.lsp.keymap'

lspconfig.vuels.setup {
	on_attach = keymap,
}
