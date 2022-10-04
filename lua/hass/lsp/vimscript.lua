local lspconfig = require 'lspconfig'
local keymap = require 'hass.lsp.keymap'

lspconfig.vimls.setup {
	on_attach = keymap,
}
