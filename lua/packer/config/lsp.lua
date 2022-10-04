local neovim_lsp = require('lspconfig')
local keybinding = require('lsp.keybinding')

neovim_lsp.gopls.setup{ on_attach = keybinding }
neovim_lsp.solargraph.setup{ on_attach = keybinding }
neovim_lsp.vimls.setup{ on_attach = keybinding }
require('lsp.sumneko')
require('lsp.eslint')
require('lsp.goimports')

