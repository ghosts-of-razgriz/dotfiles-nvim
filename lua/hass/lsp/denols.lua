local lspconfig = require 'lspconfig'
local keymap = require 'hass.lsp.keymap'

lspconfig.denols.setup {
	on_attach = keymap,
}
