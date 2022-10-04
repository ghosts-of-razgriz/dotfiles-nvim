local neovim_lsp = require 'lspconfig'
local keymap = require 'hass.lsp.keymap'

neovim_lsp.vimls.setup {
	on_attach = keymap,
}
