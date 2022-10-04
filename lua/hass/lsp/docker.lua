local lspconfig = require 'lspconfig'
local keymap = require 'hass.lsp.keymap'

lspconfig.dockerls.setup {
	on_attach = keymap,
}
