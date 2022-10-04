local neovim_lsp = require 'lspconfig'
local keymap = require 'hass.lsp.keymap'

neovim_lsp.dockerls.setup {
	on_attach = keymap,
}
