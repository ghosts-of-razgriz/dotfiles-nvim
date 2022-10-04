local lspconfig = require 'lspconfig'
local keymap = require 'hass.lsp.keymap'

lspconfig.eslint.setup {
	on_attach = keymap,
}
