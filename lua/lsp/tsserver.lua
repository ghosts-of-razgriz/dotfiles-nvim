local neovim_lsp = require('lspconfig')
local keybinding = require('lsp.keybinding')

neovim_lsp.tsserver.setup { on_attach = keybinding }
